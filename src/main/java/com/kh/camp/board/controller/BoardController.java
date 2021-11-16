package com.kh.camp.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.camp.board.model.service.PsBoardService;
import com.kh.camp.common.Utils;





@Controller
public class BoardController {
		
	@Autowired
	PsBoardService PsBoardService;
	
	@RequestMapping("/board/PsBoardLst.do")
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
			
			return "board/boardList";
		}
	
	}
	
	
}
