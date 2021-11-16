<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
<script src="../resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/camp/resources/css/style.css" />

<style>
.content img{
	opacity : 0.3;
}
</style>

</head>
<body>
	<%@ include file="../common/header.jsp" %>
	
	<div class="content">
		<img src="/camp/resources/images/tent3.jpg" alt="#" />
	</div>
	
	<div module="member_join">
    <!--@css(/css/module/member/join.css)-->
    <!--
        $returnUrl = /member/join_result.html
        $checkIdUrl = /member/check_id.html
        $personalName = 이름
        $companyName = 법인명
        $companySsn = 법인번호
        $foreignerSsn1 = 외국인 등록번호
        $foreignerSsn2 = 여권번호
        $foreignerSsn3 = 국제운전면허증번호
     -->
    <div class="boardWrite type">
        <table border="1" summary="">
        <caption>회원가입</caption>
        <tbody>
            <tr>
                <th scope="row">회원구분 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" alt="필수" /></th>
                <td>{$form.member_type}</td>
            </tr>
            <tr id="companyWrap">
                <th scope="row">사업자구분 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" alt="필수" /></th>
                <td>{$form.company_type}</td>
            </tr>
            <tr id="authMember">
                <th scope="row">회원인증 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" alt="필수" /></th>
                <td>
                    <div id="authWrap" style="display:none;">
                        <!-- 개인 회원 인증 -->
                        <div id="personAuth">
                            <div id="personalTypeWrap">{$form.personal_type}</div>
                            <!-- 아이핀인증 -->
                            <div id="ipinWrap">
                                <a href="#none" onclick="{$action_ipin_open}"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_certification_ipin.gif" alt="아이핀인증" /></a><br />아이핀이란, 회원님의 개인정보 보호를 위해 웹사이트에 주민등록번호를 제공하지 않고 본인임을 확인하는 인터넷상의 개인식별번호 서비스입니다. 아이핀을 통한 가입을 원하시면 아이핀 인증 버튼을 눌러 진행해 주십시오.
                            </div>
                            <!-- 휴대폰인증 -->
                            <div id="mobileWrap">
                                <a href="#none" onclick="{$action_mobile_open}"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_certification_mobile.gif" alt="휴대폰인증" /></a><br />본인 명의의 휴대폰으로 본인인증을 진행합니다.
                            </div>
                            <!-- 이메일인증 -->
                            <div id="emailWrap">
                                <ul>
                                    <li>기본정보 &gt; 이메일 항목에 입력하신 정보로 본인인증을 진행합니다.</li>
                                    <li>회원가입 후에 입력하신 이메일 주소로 인증 메일이 발송되오니, 확인해 주시기 바랍니다.</li>
                                 </ul>
                           </div>
                        </div>
                        <!-- 법인 사업자 인증 -->
                        <div id="businessAuth">
                            <ul class="grid">
                                <li>법인명<br />{$form.bname}</li>
                                <li>법인번호<br />{$form.bssn1} - {$form.bssn2} <a href="#none" onclick="{$action_business_dupl}"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_check2.gif" alt="중복확인" /></a></li>
                            </ul>
                        </div>
                        <!-- 외국인 회원 인증 -->
                        <div id="foreignerAuth">
                            <ul class="grid">
                                <li>이름(Name) {$form.foreigner_name}</li>
                                <li>{$form.foreigner_type} {$form.foreigner_ssn} <a href="#none" onclick="{$action_foreigner_check}"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_check2.gif" alt="중복확인" /></a></li>
                            </ul>
                            <div id="foreignerPersonWrap">
                                <p class="grid">회사는 회원의 본인확인 및 서비스제공을 위하여 고유식별정보를 수집하여 보관하며 개인정보취급방침에 따라 <br />보유 및 이용합니다. 고유식별정보 제공을 거부하는 경우 서비스 이용이 제한됩니다.</p>
                                <p>{$form.f_identification_check}</p>
                            </div>
                            <!-- 이메일인증 -->
                            <div id="foreignerEmailWrap">
                                <ul>
                                    <li>기본정보 &gt; 이메일 항목에 입력하신 정보로 본인인증을 진행합니다.</li>
                                    <li>회원가입 후에 입력하신 이메일 주소로 인증 메일이 발송되오니, 확인해 주시기 바랍니다.</li>
                                 </ul>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </tbody>
        </table>
    </div>
    <h3>기본정보</h3>
    <p class="required"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" alt="필수" /> 필수입력사항</p>
    <div class="boardWrite">
        <table border="1" summary="">
        <caption>회원 기본정보</caption>
        <tbody>
            <tr>
                <th scope="row">아이디 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" alt="필수" /></th>
                <td>{$form.member_id} <a href="#none" title="새창 열기" onclick="{$action_check_id_layer}"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_overlap_id.gif" alt="아이디 중복확인" /></a> (영문소문자/숫자, 4~16자)</td>
            </tr>
            <tr>
                <th scope="row">비밀번호 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" alt="필수" /></th>
                <td>{$form.passwd} {$passwd_type_desc}</td>
            </tr>
            <tr>
                <th scope="row">비밀번호 확인 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" alt="필수" /></th>
                <td>{$form.user_passwd_confirm}</td>
            </tr>
            <tr>
                <th scope="row">비밀번호 확인 질문 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" alt="필수" /></th>
                <td>{$form.hint}</td>
            </tr>
            <tr>
                <th scope="row">비밀번호 확인 답변 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" alt="필수" /></th>
                <td>{$form.hint_answer}</td>
            </tr>
            <tr>
                <th scope="row" id="{$name_title}">이름 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" alt="필수" /></th>
                <td>
                    <span id="{$name_contents}">{$form.name}</span>
                    <span id="under14Msg" class="displaynone">14세 미만 사용자는 법정대리인 동의가 필요합니다.</span>
                </td>
            </tr>
            <tr class="{$display_eng_name|display}">
                <th scope="row">이름(영문) <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_name_en|display}" alt="필수" /></th>
                <td>{$form.name_en} (이름 - 성 형식으로 입력해 주세요.)</td>
            </tr>
            <!-- 외국인 회원 정보 -->
            <tr>
                <th scope="row" id="ssnTitle"></th>
                <td id="ssnContents"></td>
            </tr><!-- //외국인 회원 정보 -->
            <tr id="{$companyRow}">
                <th scope="row">상호명 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" alt="필수" /></th>
                <td id="companyName">{$form.cname}</td>
            </tr>
            <tr id="{$companyNoRow}">
                <th scope="row">사업자번호 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" alt="필수" /></th>
                <td id="companySsn">{$form.cssn}</td>
            </tr>
            <tr id="nation">
                <th>국적 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" alt="필수" /></th>
                <td>{$form.citizenship}</td>
            </tr>
            <tr>
                <th scope="row">주소 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_address|display}" alt="필수" /></th>
                <td>
                    {$form.postcode1} - {$form.postcode2}
                    <a href="#none" onclick="{$action_find_address}" id="{$btn_find_post}"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_zipcode.gif" alt="우편번호" /></a><br />
                    {$form.addr1} 기본주소<br />
                    {$form.addr2} 나머지주소
                </td>
            </tr>
            <tr>
                <th scope="row">일반전화 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_phone|display}" alt="필수" /></th>
                <td>{$form.phone}</td>
            </tr>
            <tr>
                <th scope="row">휴대전화 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_cell|display}" alt="필수" /></th>
                <td>{$form.mobile}</td>
            </tr>
            <tr class="{$display_is_sms|display}">
                <th scope="row">SMS 수신여부 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" alt="필수" /></th>
                <td>{$form.is_sms}<p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다.</p>
                </td>
            </tr>
            <tr>
                <th scope="row">이메일 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" alt="필수" /></th>
                <td>{$form.email}</td>
            </tr>
            <tr class="{$display_is_news_mail|display}">
                <th scope="row">이메일 수신여부 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" alt="필수" /></th>
                <td>{$form.is_news_mail}<p>쇼핑몰에서 제공하는 유익한 이벤트 소식을 이메일로 받으실 수 있습니다.</p>
                </td>
            </tr>
        </tbody>
        </table>
    </div>
    <h3 class="{$display_add_title|display}">추가정보</h3>
    <div class="boardWrite typeAddinfo">
        <table border="1" summary="">
        <caption>회원 추가정보</caption>
        <tbody>
            <tr class="{$display_nick|display}">
                <th scope="row">별명 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_nick_name_flag|display}" alt="필수" /></th>
                <td>{$form.nick_name} <p id="{$nick_msg}"></p></td>
            </tr>
            <tr class="{$display_is_sex|display}">
                <th scope="row">성별 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_sex|display}" alt="필수" /></th>
                <td>{$form.is_sex}</td>
            </tr>
            <tr class="{$display_birthday|display}">
                <th scope="row">생년월일 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_is_birthday|display}" alt="필수" /></th>
                <td>{$form.birth_year} 년 {$form.birth_month} 월 {$form.birth_day} 일 <span class="birth {$display_calendar_type|display}">{$form.is_solar_calendar}</span></td>
            </tr>
            <tr class="{$display_marry|display}">
                <th scope="row">결혼기념일 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_is_wedding_anniversary|display}" alt="필수" /></th>
                <td>{$form.marry_year} 년 {$form.marry_month} 월 {$form.marry_day} 일</td>
            </tr>
            <tr class="{$display_partner|display}">
                <th scope="row">배우자생일 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_is_life_partner|display}" alt="필수" /></th>
                <td>{$form.partner_year} 년 {$form.partner_month} 월 {$form.partner_day} 일</td>
            </tr>
            <tr class="{$display_child|display}">
                <th scope="row">자녀 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_child|display}" alt="필수" /></th>
                <td>{$form.child}</td>
            </tr>
            <tr class="{$display_school|display}">
                <th scope="row">최종학력 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_school|display}" alt="필수" /></th>
                <td>{$form.school}</td>
            </tr>
            <tr class="{$display_job_class|display}">
                <th scope="row">직종 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_job_class|display}" alt="필수" /></th>
                <td>{$form.job_class}</td>
            </tr>
            <tr class="{$display_job|display}">
                <th scope="row">직업 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_job|display}" alt="필수" /></th>
                <td>{$form.job}</td>
            </tr>
            <tr class="{$display_earning|display}">
                <th scope="row">연소득 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_earning|display}" alt="필수" /></th>
                <td>{$form.earning}</td>
            </tr>
            <tr class="{$display_car|display}">
                <th scope="row">자동차 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_car|display}" alt="필수" /></th>
                <td>{$form.car}</td>
            </tr>
            <tr class="{$display_region|display}">
                <th scope="row">지역 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_region|display}" alt="필수" /></th>
                <td>{$form.region}</td>
            </tr>
            <tr class="{$display_internet|display}">
                <th scope="row">인터넷 이용장소 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_internet|display}" alt="필수" /></th>
                <td>{$form.internet}</td>
            </tr>
            <tr class="{$display_inter|display}">
                <th scope="row">관심분야 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_interest|display}" alt="필수" /></th>
                <td>
                    <div class="interest">{$form.inter_check}</div>
                </td>
            </tr>
            <tr class="{$display_add1|display}">
                <th scope="row">{$title_add1} <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_add1|display}" alt="필수" /></th>
                <td>{$form.add1}</td>
            </tr>
            <tr class="{$display_add2|display}">
                <th scope="row">{$title_add2} <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_add2|display}" alt="필수" /></th>
                <td>{$form.add2}</td>
            </tr>
            <tr class="{$display_add3|display}">
                <th scope="row">{$title_add3} <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_add3|display}" alt="필수" /></th>
                <td>{$form.add3}</td>
            </tr>
            <tr class="{$display_add4|display}">
                <th scope="row">{$title_add4} <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_add4|display}" alt="필수" /></th>
                <td>{$form.add4}</td>
            </tr>
            <tr class="{$display_add5|display}">
                <th scope="row">{$title_add5} <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_add5|display}" alt="필수" /></th>
                <td>{$form.add5}</td>
            </tr>
            <tr class="{$display_add6|display}">
                <th scope="row">{$title_add6} <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_add6|display}" alt="필수" /></th>
                <td>{$form.add6}</td>
            </tr>
            <tr class="{$display_add7|display}">
                <th scope="row">{$title_add7} <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_add7|display}" alt="필수" /></th>
                <td>{$form.add7}</td>
            </tr>
            <tr class="{$display_add8|display}">
                <th scope="row">{$title_add8} <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_add8|display}" alt="필수" /></th>
                <td>{$form.add8}</td>
            </tr>
            <tr class="{$display_add9|display}">
                <th scope="row">{$title_add9} <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_add9|display}" alt="필수" /></th>
                <td>{$form.add9}</td>
            </tr>
            <tr class="{$display_add10|display}">
                <th scope="row">{$title_add10} <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_add10|display}" alt="필수" /></th>
                <td>{$form.add10}</td>
            </tr>
            <tr class="{$display_add11|display}">
                <th scope="row">{$title_add11} <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_add11|display}" alt="필수" /></th>
                <td>{$form.add11}</td>
            </tr>
            <tr class="{$display_add12|display}">
                <th scope="row">{$title_add12} <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_add12|display}" alt="필수" /></th>
                <td>{$form.add12}</td>
            </tr>
            <tr class="{$display_add13|display}">
                <th scope="row">{$title_add13} <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_add13|display}" alt="필수" /></th>
                <td>{$form.add13}</td>
            </tr>
            <tr class="{$display_add14|display}">
                <th scope="row">{$title_add14} <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_add14|display}" alt="필수" /></th>
                <td>{$form.add14}</td>
            </tr>
            <tr class="{$display_add15|display}">
                <th scope="row">{$title_add15} <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_add15|display}" alt="필수" /></th>
                <td>{$form.add15}</td>
            </tr>
            <tr class="{$display_reco_id|display}">
                <th scope="row">추천인 아이디 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_reco_id|display}" alt="필수" /></th>
                <td>{$form.reco_id}</td>
            </tr>
            <tr class="{$display_bank|display}">
                <th scope="row">환불계좌 정보 <img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/ico_required.gif" class="{$display_required_bank_account_no|display}" alt="필수" /></th>
                <td>
                    <ul class="account">
                        <li>
                            <strong>예금주</strong>
                            {$form.bank_account_owner}
                        </li>
                        <li>
                            <strong>은행명</strong>
                            {$form.refund_bank_code}
                        </li>
                        <li>
                            <strong>계좌번호</strong>
                            {$form.bank_account_no}
                            ('-'와 숫자만 입력해주세요.)
                        </li>
                    </ul>
                </td>
            </tr>
        </tbody>
        </table>
    </div>
    <h3>이용약관 동의</h3>
    <div class="agreeArea">
        <div class="agree">
            {$service_desc}
        </div>
        <p class="check"><span>이용약관에 동의하십니까?</span> {$form.agree_service_check}</p>
    </div>
    <h3>개인정보 수집 및 이용 동의</h3>
    <div class="agreeArea">
        <div class="agree">
            {$privacy_desc}
        </div>
        <p class="check"><span>개인정보 수집 및 이용에 동의하십니까?</span> {$form.agree_privacy_check}</p>
    </div>
    <div class="{$display_information|display}">
        <h3>개인정보 제3자 제공 동의(선택)</h3>
        <div class="agreeArea">
            <div class="agree">
                {$information_desc}
            </div>
            <p class="check"><span>개인정보 제3자 제공에 동의하십니까?</span> {$form.agree_information_check}</p>
        </div>
    </div>
    <div class="{$display_consignment|display}">
        <h3>개인정보 취급 위탁 동의(선택)</h3>
        <div class="agreeArea">
            <div class="agree">
                {$consignment_desc}
            </div>
            <p class="check"><span>개인정보 취급 위탁에 동의하십니까?</span> {$form.agree_consignment_check}</p>
        </div>
    </div>
    <div class="btnArea center">
        <a href="#none" onclick="{$action_func_join}"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_member_join1.gif" alt="회원가입" /></a>
        <a href="/index.html"><img src="http://img.echosting.cafe24.com/skin/base_ko_KR/member/btn_member_join_cancel.gif" alt="회원가입취소" /></a>
    </div>
</div>
	
	</div>
	
	
	
	
	<%@ include file="../common/footer.jsp" %>
</body>
</html>