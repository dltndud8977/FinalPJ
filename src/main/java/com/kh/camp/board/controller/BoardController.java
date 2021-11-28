package com.kh.camp.board.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.camp.board.model.service.PsBoardService;
import com.kh.camp.board.model.vo.Attachment;
import com.kh.camp.board.model.vo.PsBoard;
import com.kh.camp.member.model.vo.Member;
import com.kh.camp.common.Utils;






@Controller
public class BoardController {
		
	@Autowired
	PsBoardService PsBoardService;
	
	@RequestMapping("/board/PsBoardList.do")
	public String selectBoardList(
			@RequestParam(value="cPage", required=false, defaultValue="1") int cPage, Model model
			) {
			// 페이지의 게시글 수
			int numPerPage = 10;
			
			// 현 페이지의 게시글 수
			List<Map<String, String>> list = PsBoardService.selectBoardList(cPage, numPerPage);
		
			// 전체 게시글 수
			
			int totalContents = PsBoardService.selectBoardTotalContents();
			
			// 페이지 처리 Utils 사용하기
			String pageBar = Utils.getPageBar(totalContents, cPage, numPerPage, "PsBoardList.do");

			System.out.println("list : " + list);
			System.out.println("pageBar : " + pageBar);
			
			model.addAttribute("list", list);
			model.addAttribute("totalContents", totalContents);
			model.addAttribute("numPerPage", numPerPage);
			model.addAttribute("pageBar", pageBar);
			
			return "board/PsBoardList";
		}
	// 글 작성
	@RequestMapping("/board/PsBoardForm.do")
	public String PsBoardForm() { 
		
		return "board/PsBoardForm";
	}
	
	// 글 저장
	@RequestMapping("/board/PsBoardFormEnd.do")
	public String insertBoard(PsBoard psboard, Model model, HttpServletRequest req,
							@RequestParam(value="upFile", required=false)MultipartFile[] upFiles) {
		// 1. 파일 저장 경로 or 정보 객체
		String savePath = req.getServletContext().getRealPath("/resources/boardUpload");
		List<Attachment> attachList = new ArrayList<Attachment>();
		
		System.out.println("psboard :" + psboard );
		// 2. 파일 업로드
		for(MultipartFile f : upFiles) {
			if(f.isEmpty() == false) {
				// 3. 파일 이름 변경
				String oldName = f.getOriginalFilename(); //원본
				String newName = fileNameChanger(oldName);
			
				try {
					f.transferTo(new File(savePath + "/" + newName));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				Attachment a = new Attachment();

				a.setOldName(oldName);
				a.setNewName(newName);
			}
		}
		
		// DB 등록
		int result = PsBoardService.insertBoard(psboard, attachList);
		String loc = "/board/PsBoardList.do";
		String msg = "";
		
		
		if(result > 0) {
			msg = "게시글이 등록되었습니다";
		}else {
			msg = "게시글이 등록이 실패하였습니다";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		return "common/msg";
		
	}
	// 단순 파일 이름변경 
	public String fileNameChanger(String oldName) {
		String ext=oldName.substring(oldName.indexOf(".")+1);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
		int rnd = (int)(Math.random() * 1000);
		
		return sdf.format(new Date(System.currentTimeMillis()))+ "_" + rnd + "." + ext;
	}
	
	@RequestMapping("/board/PsBoardView.do")
	public String boardView(@RequestParam int nNo, Model model) {
		
		PsBoard psboard = PsBoardService.selectOneBoard(nNo);
		List<Attachment> attachmentList = PsBoardService.selectAttachmentList(nNo);
		
		model.addAttribute("PsBoard", psboard);
		model.addAttribute("attachmentList", attachmentList);
		
		return "board/PsBoardView";
	}
	
	@RequestMapping("/board/fileDownload.do")
	public void fileDownload(@RequestParam String oldName,
							 @RequestParam String newName,
							 HttpServletRequest request,
							 HttpServletResponse response) {
		// 파일 저장 디렉토리
		String saveDirectory = request.getServletContext().getRealPath("/resources/boardUpload");
		
		BufferedInputStream bis = null;
		ServletOutputStream sos = null;
		
		try {
			sos = response.getOutputStream();
			
			File saveFile = new File(saveDirectory + "/" + newName);
			response.setContentType("application/octet-stream; charset=utf=8");
			
			String responseFileName = "";
			boolean isMSIE = request.getHeader("user-agent").indexOf("MSIE") != -1 || request.getHeader("user-agent").indexOf("Trident") != -1;
			
			if(isMSIE == true) {
				//올바른 문자표기로 변환
				responseFileName =URLEncoder.encode(oldName,"UTF-8"); 
				
				responseFileName = responseFileName.replaceAll("\\+", "%20");
			}else {
				responseFileName = new String(oldName.getBytes("UTF-8"), "ISO-8859-1");
			}
			
			response.addHeader("Content-Disposition", "attachment; filename=\"" + responseFileName + "\"");
			
			// 파일 크기에 따라 전송
			response.setContentLength((int)saveFile.length());
			
			FileInputStream fis = new FileInputStream(saveFile);
			bis = new BufferedInputStream(fis);
			int read = 0;
			
			while((read = bis.read()) != -1) {
				sos.write(read);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
			sos.close();
			bis.close();
			} catch(IOException e) {
				e.printStackTrace();
			}
		}
	}
	@RequestMapping("/board/boardUpdateView.do")
	public String boardUpdateView(@RequestParam int nNo, Model model) {
		
		PsBoard psboard = PsBoardService.updateView(nNo);
		
		List<Attachment> attachmentList = PsBoardService.selectAttachmentList(nNo);
		
		model.addAttribute("psboard", psboard);
		model.addAttribute("attachmentList", attachmentList);
		
		return "board/PsBoardUpdateView";		
	}
	
	@RequestMapping("/board/boardUpdate.do")
	public String boardUpdate(PsBoard psboard, HttpServletRequest request, Model model, 
							  @RequestParam(value="upFile", required=false) MultipartFile[] upFiles) {
		// 1. 원본 게시글 불러와 수정하기
		int nNo = psboard.getNNo();
		
		PsBoard originBoard = PsBoardService.updateView(nNo);

		originBoard.setNTitle( psboard.getNTitle() );
		originBoard.setNContent( psboard.getNContent() );
		 
		
		// 2. 첨부파일 수정하기
		String savePath = request.getServletContext().getRealPath("/resources/boardUpload");
		
		List<Attachment> attachList = PsBoardService.selectAttachmentList(nNo);
		if( attachList == null ) attachList = new ArrayList<Attachment>();
		
		int idx = 0;
		for(MultipartFile f : upFiles) {
			Attachment temp = null;
			
			if( f.isEmpty() == false ) {
				
				if(attachList.size() > idx) { // 파일이 있다면
					File oldFile = new File(savePath + "/" + attachList.get(idx).getNewName());
					System.out.println("변경 전 파일 삭제 : " + oldFile.delete());
					
					temp = attachList.get(idx);
				} else {
					temp = new Attachment();
					temp.setNNo(nNo);
					
					attachList.add(temp);
				}
				
				// 파일 저장용 이름 바꾸기
				String originName = f.getOriginalFilename();
				String changeName = fileNameChanger(originName);
				
				// 파일 저장
				try {
					f.transferTo(new File(savePath + "/" + changeName));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				temp.setOldName(originName);
				temp.setNewName(changeName);
				
				attachList.set(idx, temp);
			}
			idx++;
		}
		
		int result = PsBoardService.updateBoard(originBoard, attachList);  // 서비스 찾아가서 마저 구현해주기
		
		String loc = "/board/PsBoardList.do";
		String msg = "";
		
		if( result > 0 ) {
			msg = "게시글 수정 성공!";
		} else {
			msg = "게시글 수정 실패!";
		}
		
		model.addAttribute("loc", loc);	
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	@RequestMapping("/board/fileDelete.do")
	@ResponseBody
	public boolean fileDelete(@RequestParam int afNo,
							  @RequestParam String newName,
							  HttpServletRequest request) {
		
		String savePath = request.getServletContext().getRealPath("/resources/boardUpload");
		
		// 1. DB에서 첨부파일 삭제
		int result = PsBoardService.deleteFile(afNo);
		
		if( result == 1 ) {
			File goodbye = new File(savePath + "/" + newName);
			
			goodbye.delete();
			
			return true;
		} else {
			return false;
		}
	}
	
	@RequestMapping("/board/boardDelete.do")
	public String boardDelete(@RequestParam int nNo,
							  HttpServletRequest request,
							  Model model) {
		
		String savePath = request.getServletContext().getRealPath("/resources/boardUpload");
		
		// 첨부파일삭제 명단
		List<Attachment> delList = PsBoardService.selectAttachmentList(nNo);
		
		// 게시글 삭제
		int result = PsBoardService.deleteBoard(nNo); // 서비스 이동~!
		
		String loc = "/board/PsBoardList.do";
		String msg = "";
		
		if( result > 0 ) {
			msg = "삭제 완료!";
			
			for(Attachment a : delList) {
				new File(savePath + "/" + a.getNewName()).delete();
			}
		} else {
			msg = "삭제 실패!";
		}
		
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		
		return "common/msg";
	}
	
	
}
	
	
	
	
	

