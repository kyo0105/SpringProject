<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- container -->
 <div id="container">
    <section id="content">
        <div class="sub-type member">
            <div class="inner-box">
                <div class="page-title-wrap v2">
                    <h2 class="page-title"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">회원가입</font></font></h2>
                    <div class="depth-area">
                        <ol>
                            <li><a href="/">홈</a></li>
                            <li><strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">회원가입</font></font></strong></li>
                        </ol>
                    </div>
                </div>
                <article class="join-area">
                    <div class="join-step2">
                        <div class="step-list">
                            <ul>
                                <li>01 본인인증</li>
                                <li class="active">02 개인정보입력</li>
                                <li>03 가입완료</li>
                            </ul>
                        </div>
                        <div class="myinfo-wrap">
                            <div class="form">
                            <form name="frm" id="frm" action="/member/regStepSns" method="post">
								<input type="hidden" name="dm_fl" id="dm_fl" value="0">
								<input type="hidden" name="o_dm_fl" id="o_dm_fl" value="0">
								<input type="hidden" name="ds_fl" id="ds_fl" value="0">
                                <dl>
                                    <dt class="center">이름</dt>
                                    <dd>
                                        <div class="form-item name">
                                            <input type="text" placeholder="" id="name" name="name" value="${ snsUser.getName() }" disabled="disabled">
                                        </div>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt class="top">아이디</dt>
                                    <dd>
                                        <div class="form-item name">
                                            <input type="text" name="member_id" id="id" maxlength="16" readonly="readonly" value="${ snsUser.getMember_id() }">
                                        </div>
                                        <div class="text-type4" id="id_alert" style="display:none;"></div>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt class="center">생년월일</dt>
                                    <dd>
                                        <div class="form-group v2">
                                            <div class="form-item birth">
                                                <div class="chk-wrap">
                                                    <div class="chk-box selected">
                                                        <input type="radio" name="birth_type" id="birth_s" value="1" checked="checked">
                                                        <label class="checkbox" for="birth_s"></label>
                                                        <label for="birth_s">양력</label>
                                                    </div>
                                                    <div class="chk-box">
                                                        <input type="radio" name="birth_type" id="birth_m" value="0">
                                                        <label class="checkbox" for="birth_m"></label>
                                                        <label for="birth_m">음력</label>
                                                    </div>
                                                </div>
                                                <div class="select-type2">
                                                    <select name="byear" id="byear" class="selected" disabled="" ></select>
                                                </div>
                                                <div class="select-type2">
                                                    <select name="bmonth" id="bmonth" class="selected" disabled="" ></select>
                                                </div>
                                                <div class="select-type2">
                                                    <select name="bday" id="bday" class="selected" disabled=""></select>
                                                </div> <br>
                                                <div class="text-type4" id="birth_alert" style="display:none;"></div>
                                            </div>
                                        </div>

                                    </dd>
                                </dl>
                                
                                <dl>
                                    <dt class="top">휴대전화</dt>
                                    <dd>
                                        <div class="form-group v2">
                                            <div class="form-item">
                                                <div class="select-type2">
                                                    <select name="tel1" id="tel1" disabled="" class="selected" title="휴대전화번호" >
														<option value="${ fn:substring(snsUser.getTel(),0,3) }" selected="">${ fn:substring(snsUser.getTel(),0,3) }</option>
													</select>
                                                </div>
                                                <input type="text" name="tel2" id="tel2" maxlength="4" value="${ fn:substring(snsUser.getTel(),4,8) }" disabled="" class="i_text" onkeyup="checkNum($(this), '숫자만 입력해주세요.');" title="휴대전화번호">
                                                <input type="text" name="tel3" id="tel3" maxlength="4" value="${ fn:substring(snsUser.getTel(),9,13) }" disabled="" class="i_text" onkeyup="checkNum($(this), '숫자만 입력해주세요.');" title="휴대전화번호">
                                                <br>
                                            </div> <!-- //form-item -->
                                            <div class="text-type4" id="tel_alert" style="display:none;"></div>
                                        </div>
                                    </dd> 
                                </dl>
                               
                               <dl>
                                    <dt class="center">이메일</dt>
                                    <dd>
                                        <div class="form-group v2">
                                            <div class="form-item e-mail">
                                                <input type="text" name="email1" id="email1" value="${ fn:split(snsUser.getEmail(), '@')[0] }" disabled="">
                                                <span>@</span>
                                                <input type="text" name="email2" id="email2" value="${ fn:split(snsUser.getEmail(), '@')[1] }" disabled="">
                                                <div class="select-type2">
                                                    <select name="email3" id="email3" onchange="checkEmailState($('#email3'),$('#email2'))" disabled="">
                                                        <option value="naver.com">네이버</option>
														<option value="hanmail.net">한메일</option>
														<option value="gmail.com">지메일</option>
														<option value="hotmail.com">핫메일</option>
														<option value="nate.com">네이트</option>
														<option value="WRITE" selected="">직접입력</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="text-type4" id="email_alert" style="display:none;"></div>
                                        </div>
                                    </dd>
                                </dl>
                                
                                <dl>
                                    <dt>개인정보 유효기간 선택</dt>
                                    <dd>
                                        <div class="chk-wrap">
                                            <div class="chk-box selected">
                                                <input type="radio" name="info_date" id="info_years1" value="1" checked="checked">
                                                <label class="checkbox" for="info_years1"></label>
                                                <label for="info_years1">1년</label>
                                            </div>
                                            <div class="chk-box">
                                                <input type="radio" name="info_date" id="info_years3" value="3">
                                                <label class="checkbox" for="info_years3"></label>
                                                <label for="info_years3">3년</label>
                                            </div>
                                            <div class="chk-box">
                                                <input type="radio" name="info_date" id="info_years5" value="5">
                                                <label class="checkbox" for="info_years5"></label>
                                                <label for="info_years5">5년</label>
                                            </div>
                                        </div>
                                        <div class="text-type">
                                            - 설정하신 기간동안 로그인/주문 등의 서비스 이용이 없을 시, 휴면계정으로 처리되어 각종 이벤트/쿠폰혜택을 받아보실 수 없습니다.
                                        </div>
                                    </dd>
                                </dl>
                                
                                <dl>
                                    <dt class="center">성별(선택)</dt>
                                    <dd>
                                        <div class="form-group v2">
                                            <div class="form-item gender">
                                                <div class="chk-wrap">
                                                	<div class="chk-box selected">
														<input type="radio" name="gender" id="sex_n" value="없" checked="checked">
														<label class="checkbox" for="sex_n"></label> 
														<label for="sex_n">정보제공 안함</label>
													</div>
                                                    <div class="chk-box">
                                                        <input type="radio" name="gender" id="sex_m" value="남">
                                                        <label class="checkbox" for="sex_m"></label>
                                                        <label for="sex_m">남성</label>
                                                    </div>
                                                    <div class="chk-box">
                                                        <input type="radio" name="gender" id="sex_f" value="여">
                                                        <label class="checkbox" for="sex_f"></label>
                                                        <label for="sex_f">여성</label>
                                                    </div>
                                                </div>
                                                <div class="text-type4" id="gender_alert" style="display:none;"></div>
                                            </div>
                                        </div>

                                    </dd>
                                </dl>
                                <dl>
                                	<dt>약관 및 광고성 정보 수신<br>전체 동의</dt>
                                    <dd>
										<div class="form agree">
                                        	<div class="chk-box v4">
                                            	<input type="checkbox" id="all3" name="agreeType3" class="all-check-agree">
                                                <label class="checkbox" for="all3"></label>
                                                <label for="all3">전체 동의하기</label>
                                            </div>
                                        </div>
                                        <div class="text-type">
                                        	- 위 항목에는 필수 및 선택정보에 대한 동의를 모두 포함하고 있으며, 개별적으로도 동의 여부를 선택하실 수 있습니다.<br>
                                        	- 선택항목에 대한 동의를 거부하시는 경우에도 서비스 이용이 가능합니다.<br>
                                        	<span style="color: #ff143c;">이메일, 문자(SMS 등) 모두 수신 동의 시 피자 방문포장 40% 할인 쿠폰을 드립니다.</span>
                                        </div>
                                    </dd>
                                </dl>
                                <dl>
                                    <dt>약관 전체동의</dt>
                                    <dd>
                                        <div class="form agree">
                                            <div class="chk-box v4">
                                                <input type="checkbox" id="agree_all" name="agree_chk" value="Y" class="all-check">
                                                <label class="checkbox" for="agree_all"></label>
                                                <label for="agree_all">전체 동의하기</label>
                                            </div>
                                            <ul>
                                                <li>
                                                    <div class="chk-box v4">
                                                        <input type="checkbox" name="agree_2" id="agree_2" value="Y">
                                                        <label class="checkbox" for="agree_2"></label>
                                                        <label for="agree_2">개인정보 수집 및 이용 동의(필수)</label>
                                                        <a href="javascript:UI.layerPopUp({selId:'#pop-terms-p2'})" class="btn-link">보기</a>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="chk-box v4">
                                                        <input type="checkbox" name="agree_1" id="agree_1" value="Y">
                                                        <label class="checkbox" for="agree_1"></label>
                                                        <label for="agree_1">이용약관 동의(필수)</label>
                                                        <a href="javascript:UI.layerPopUp({selId:'#pop-terms'})" class="btn-link">보기</a>
                                                    </div>
                                                </li>
                                                <li>
                                                        <div class="chk-box v4">
                                                            <input type="checkbox" id="location_yn" name="location_yn" value="Y">
                                                            <label class="checkbox" for="location_yn"></label>
                                                            <label for="location_yn">위치기반 서비스 약관 동의(필수)</label>
                                                            <a href="javascript:UI.layerPopUp({selId:'#pop-terms-p4'})" class="btn-link">보기</a>
                                                        </div>
                                                 </li>
                                            </ul>
                                        </div>

                                    </dd>
                                </dl>
                                <dl>
                                    <dt>광고성 정보 수신 전체 동의</dt>
                                    <dd>
                                        <div class="form agree">
                                            <div class="chk-box v4">
                                                <input type="checkbox" id="agree_all2" name="agreeType1" class="all-check">
                                                <label class="checkbox" for="agree_all2"></label>
                                                <label for="agree_all2"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">전체 동의하기</font></font></label>
                                            </div>
                                            <ul>
                                                <li>
                                                    <div class="chk-box v4">
                                                        <input type="checkbox" id="chk_ds_fl" name="chk_ds_fl" value="0">
                                                        <label class="checkbox" for="chk_ds_fl"></label>
                                                        <label for="chk_ds_fl">문자메세지(선택)</label>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="chk-box v4">
                                                        <input type="checkbox" id="chk_dm_fl" name="chk_dm_fl" value="0">
                                                        <label class="checkbox" for="chk_dm_fl"></label>
                                                        <label for="chk_dm_fl">이메일(선택)</label>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="chk-box v4">
                                                        <input type="checkbox" id="chk_o_dm_fl" name="chk_o_dm_fl" value="0">
                                                        <label class="checkbox" for="chk_o_dm_fl"></label>
                                                        <label for="chk_o_dm_fl">DM 우편(최근 배달주소로 배송)(선택)</label>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>

                                    </dd>
                                </dl>
                            </form></div>
                            <div class="btn-wrap">
                                <a href="javascript:goInsert();" class="btn-type v6">가입하기</a>
                            </div>
                        </div>
                    </div>
                </article>
            </div>
        </div>
        
<!-- s_이용 약관 -->
<!-- 팝업-메인 빅배너 -->
<div class="pop-layer type2" id="pop-terms">
    <div class="dim"></div>
    <div class="pop-wrap">
        <div class="pop-title-wrap">
            <h2 class="pop-title v2">이용약관 동의</h2>
        </div>
        <div class="pop-content">
            <div class="terms-wrap">
                <div class="terms-box">
                    <ol>
                        <li>
                            <strong><em>제1조</em> 목적</strong>
                            <p>이 약관은 청오디피케이㈜(이하’회사’)에서 운영하는 도미노피자 웹사이트 &lt; www.dominos.co.kr &gt;와 스마트폰 및 이동통신기기를 통해
                                제공되는 모바일웹사이트 &lt; m.dominos.co.kr &gt; 및 애플리케이션을 통해 제공되는 서비스의 이용에 관련하여 권리 의무 및 관련 절차 등을
                                규정하고 상호 발전을 도모하는 것을 그 목적으로 합니다.</p>
                        </li>
                        <li>
                            <strong><em>제2조</em> 정의</strong>
                            <p>이 약관에서 사용하는 용어의 정의는 다음과 같습니다. </p>
                            <ol>
                                <li>
                                    <strong>(1) “회원”이란 도미노피자 웹/모바일에 접속하여 본 약관에 따라 회사에서 제공하는 서비스를 이용하는 고객을 말합니다.</strong>
                                </li>
                                <li>
                                    <strong>(2) "아이디(ID)" 란 “회원”의 식별과 사이트에서 제공하는 서비스를 이용하고, 회사가 회원을 구분, 식별할 수 있도록, 회원이
                                        정하고 회사가 승인하는 문자와 숫자의 조합을 의미합니다.</strong>
                                </li>
                                <li>
                                    <strong>(3) ”비밀번호” 란 회원이 부여 받은 아이디(ID)와 동일한 회원임을 확인하고 비밀보호를 위해 회원 자신이 정한 문자 또는 숫자의
                                        조합을 의미합니다.</strong>
                                </li>
                            </ol>
                        </li>
                        <li>
                            <strong><em>제3조</em> 약관의 게시와 개정</strong>
                            <ol>
                                <li>
                                    <strong>(1) 이 약관은 웹사이트(<a href="http://www.dominos.co.kr" target="_blank" title="새창열림">www.dominos.co.kr</a>)와 모바일웹사이트(<a href="http://m.dominos.co.kr" target="_blank" title="새창열림">m.dominos.co.kr</a>)에 그 내용을 이용자가 알 수 있도록 게시함으로써 효력을 발생하며 "회사"는
                                        약관의 규제 등에 관한 법률, 전자거래 기본법, 전자서명법, 정보통신망 이용촉진 등에 관한 법률, 소비자 보호법 등 관련법을 위배하지 않는
                                        범위에서 개정할 수 있습니다.</strong>
                                </li>
                                <li>
                                    <strong>(2) 회사는 이 약관의 내용을 “회원”이 쉽게 알 수 있도록 서비스 초기 화면에 상호, 소재지, 대표자의 성명, 사업자등록번호, 연락처
                                        등과 함께 게시합니다.</strong>
                                </li>
                                <li>
                                    <strong>(3) "회사" 는 약관을 개정할 경우, 적용일자 및 개정 사유를 명시하며 약관에 동의하는 것은 정기적으로 웹을 방문하여 약관의
                                        변경사항을 확인하는 것에 동의함을 의미합니다.</strong>
                                </li>
                            </ol>
                        </li>
                        <li>
                            <strong><em>제4조</em> 약관의 해석</strong>
                            <ol>
                                <li><strong>(1) 해당 약관에서 정하지 아니한 사항 및 이 약관의 해석에 대해서는 전자거래소비자보호지침 및 관계법령 또는 상관계에
                                    따릅니다.</strong></li>
                                <li><strong>(2) 회사는 “약관의 규제에 관한 법률”, “정보통신망 이용촉진 및 정보보호 등에 관한 법률”(이하 “정보통신망법”) 등 관련법에
                                    위배하지 않는 법위에서 이 약관을 개정할 수 있습니다. </strong></li>
                                <li><strong>(3) 회사가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행 약관과 함께 사이트의 초기화면에 적용일자 30일 이전부터
                                    적용일자 전일까지 공지합니다.</strong></li>
                            </ol>
                        </li>
                        <li>
                            <strong><em>제5조</em> 이용계약 성립</strong>
                            <ol>
                                <li>
                                    <strong>(1) 이용계약은 “회원”이 되고자 본 약관에 동의한 후 회사가 정한 양식에 따라 회원정보를 기입하여 회원가입신청을 하고 회사가 이러한
                                        신청에 대하여 승낙함으로써 체결됩니다.</strong>
                                </li>
                                <li>
                                    <strong>(2) 회사는 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하는 신청에 대하여는 서비스 제공을 거부하거나
                                        제한할 수 있습니다.</strong>
                                    <ul>
                                        <li>- 실명이 아니거나 타인의 명의를 도용하여 신청하였을 경우</li>
                                        <li>- 허위 정보를 기재하거나, 회사가 제시하는 내용을 기재하지 않은 경우</li>
                                        <li>- 관계법령에 위배되거나 미풍양속을 저해하고자 하는 목적으로 회원가입 신청을 할 경우</li>
                                        <li>- 이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하여 신청하는 경우</li>
                                    </ul>
                                </li>
                            </ol>
                        </li>
                        <li>
                            <strong><em>제6조</em> 회원정보의 변경</strong>
                            <ol>
                                <li>
                                    <strong>(1) 회원은 개인정보관리화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다.</strong>
                                </li>
                                <li>
                                    <strong>(2) "회원"은 회원가입신청 시 기재한 사항이 변경되었을 경우 온라인으로 수정을 하거나 전자우편 기타 방법으로 "회사"에 대하여 그
                                        변경사항을 알려야 합니다.</strong>
                                </li>
                                <li>
                                    <strong>(3) 제2항의 변경사항을 "회사"에 알리지 않아 발생한 불이익에 대하여 "회사"는 책임지지 않습니다.</strong>
                                </li>
                            </ol>
                        </li>
                        <li>
                            <strong><em>제7조</em> 개인정보보호 의무</strong>
                            <p>"회사"는 "정보통신망법" 등 관계 법령이 정하는 바에 따라 "회원"의 개인정보를 보호하기 위해 노력합니다. 개인정보의 보호 및 사용에 대해서는 관련법 및
                                "회사"의 개인정보처리방침이 적용됩니다. 다만, "회사"의 공식 사이트 이외의 링크된 사이트에서는 "회사"의 개인정보처리방침이 적용되지 않습니다.</p>
                        </li>
                        <li>
                            <strong><em>제8조</em> 회원의 아이디 및 비밀번호의 관리에 대한 의무</strong>
                            <ol>
                                <li>
                                    <strong>(1) "ID"와 "비밀번호"에 관한 관리책임은 "회원"에게 있으며, 이를 제3자가 이용하도록 하여서는 안되며 관리소홀로 인해 발생되는
                                        모든 결과의 책임은 회원 본인에게 있습니다.</strong>
                                </li>
                                <li>
                                    <strong>(2) "회원"은 "ID" 및 "비밀번호"가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 "회사"에 통지하고 "회사"의
                                        안내에 따라야 합니다.</strong>
                                </li>
                                <li>
                                    <strong>(3) 제2항의 경우에 해당 "회원"이 "회사"에 그 사실을 통지하지 않거나, 통지한 경우에도 "회사"의 안내에 따르지 않아 발생한
                                        불이익에 대하여 "회사"는 책임지지 않습니다.</strong>
                                </li>
                            </ol>
                        </li>
                        <li>
                            <strong><em>제9조</em> 회원의 의무</strong>
                            <ol>
                                <li>
                                    <strong>(1) 회원은 다음 행위를 하여서는 안됩니다. </strong>
                                    <ul>
                                        <li>- 신청 또는 변경 시 허위내용의 등록</li>
                                        <li>- 타인의 정보 도용 / 타회원의 ID 및 비밀번호를 사용하는 행위</li>
                                        <li>- 회사가 게시한 정보의 변경</li>
                                        <li>- 회사가 제공하는 서비스를 통하여 얻은 정보를 회사의 사전 승낙 없이 허가용도 이외의 목적으로 사용하거나 복제, 유통, 상업적으로
                                            이용하려는 행위
                                        </li>
                                        <li>- 회사와 기타 제3자의 저작권 등 지적재산권에 대한 침해</li>
                                        <li>- 회사 및 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위</li>
                                        <li>- 사회질서에 위배되는 외설/폭력적 메시지 유포/범죄행위를 목적으로 하거나 범죄를 교사하는 행위</li>
                                        <li>- 관계법령에 위배되거나 미풍양속을 저해하고자 하는 목적으로 회원가입 신청을 할 경우</li>
                                        <li>- 회사의 동의 없이 영리를 목적으로 서비스를 사용하는 행위</li>
                                        <li>- 기타 불법적이거나 부당한 행위</li>
                                        <li>- 정보 서비스를 위해 하거나, 혼란을 일으키는 해킹, 컴퓨터 바이러스 전염, 유포하는 행위</li>
                                        <li>- 회사의 동의 없이 영리를 목적으로 서비스를 사용하는 행위</li>
                                        <li>- 기타 불법적이거나 부당한 행위</li>
                                    </ul>
                                </li>
                            </ol>
                        </li>
                        <li>
                            <strong><em>제10조</em> 회사의 의무</strong>
                            <ol>
                                <li>
                                    <strong>(1) 회사는 관계법령 및 이 약관에서 금지하는 행위를 하지 않습니다. </strong>
                                </li>
                                <li>
                                    <strong>(2) 회사는 지속적이고 안정적인 서비스를 제공하기 위해 노력합니다. </strong>
                                </li>
                                <li>
                                    <strong>(3) 회사는 서비스를 이용하는 회원이 제기하는 의견이나 불만사항이 정당하다고 인정되면 즉시 처리합니다. 다만 즉시 처리가 불가능한
                                        경우에는 회원에게 그 사유와 처리되는 일정을 통지합니다.</strong>
                                </li>
                            </ol>
                        </li>
                        <li>
                            <strong><em>제11조</em> 개인정보 수집</strong>
                            <ol>
                                <li>
                                    <strong>(1) "회사"는 적법하고 공정한 수단에 의하여 서비스이용계약의 성립 및 이행에 필요한 최소한의 개인정보를 수집합니다. </strong>
                                </li>
                                <li>
                                    <strong>(2) 회사는 회원가입 신청 시 기본적인 서비스 제공을 위해 성명, 생년월일, 성별, 아이디, 비밀번호, 이메일, 휴대전화번호 등에 대한 개인정보를 수집합니다. </strong>
                                </li>
                                <li>
                                    <strong>(3) 회사는 회원의 기본적 인권을 침해할 우려가 있는 내용은 수집하지 않습니다.</strong>
                                </li>
                            </ol>
                        </li>
                        <li>
                            <strong><em>제12조</em> 회원탈퇴 및 자격 상실 등</strong>
                            <ol>
                                <li>
                                    <strong>(1) 회원"은 언제든지 서비스초기화면의 고객센터 또는 내 정보 관리 메뉴 등을 통하여 이용계약 해지 신청을 할 수 있으며, "회사"는
                                        관련법 등이 정하는 바에 따라 이를 즉시 처리하여야 합니다. </strong>
                                </li>
                                <li>
                                    <strong>(2) 회원"이 계약을 해지할 경우, 관련법 및 개인정보처리방침에 따라 "회사"가 회원정보를 보유하는 경우를 제외하고는 해지 즉시
                                        "회원"의 모든 데이터는 소멸됩니다.</strong>
                                </li>
                                <li>
                                    <strong>(3) 회사는 회원이 다음 각 호에 해당하는 행위를 하였을 경우 사전 통지 없이 자격을 제한/정지할 수 있습니다. </strong>
                                    <ul>
                                        <li>- 타인의 ID및 비밀번호를 도용할 경우</li>
                                        <li>- 이용 가입 시 이용계약에 위반되는 허위사실을 기입하였을 경우</li>
                                        <li>- 다른 회원이 본 사이트를 이용하는 것을 방해하거나 그 정보를 도용하는 등 거래질서를 위협하는 경우</li>
                                        <li>- 본 사이트를 이용하여 기타 관련 법률과 이 약관이 금지하는 행위를 하거나 미풍양속에 반하는 행위를 하는 경우</li>
                                    </ul>
                                </li>
                            </ol>
                        </li>
                        <li>
                            <strong><em>제13조</em> 개인정보 파기 및 제3자 제공의 금지</strong>
                            <p>"회사"는 회원이 탈퇴하거나 제16조에 따라 동의를 철회하는 경우, 지체 없이 수집된 회원정보를 파기하는 등 필요한 조치를 취합니다. </p>
                            <ol>
                                <li>
                                    <strong>(1) 회사는 관련 법령에 특별한 규정이 있는 경우를 제외하고, 개인정보를 제3자에게 제공하지 않습니다.</strong>
                                </li>
                                <li>
                                    <strong>(2) 고객이 서비스 가입 등을 위해 기재한 개인정보는 회원 탈퇴 등 이용목적이 달성된 후 내부 방침에 따라 지체 없이
                                        파기합니다. </strong>
                                </li>
                                <li>
                                    <strong>(3) 파기방법</strong>
                                    <p>종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기한다.<br>전자적 파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적
                                        조치를 통하여 삭제한다.</p>
                                </li>
                                <li>
                                    <strong>(4)개인정보 유효기간 제도 도입</strong>
                                    <ul>
                                        <li>- 당사는 장기간(1년 이상) 서비스 미이용자의 개인정보보호를 위하여 2015년 8월 18일부로 다른 이용자의 개인정보와 분리하여 저장,
                                            관리합니다.
                                        </li>
                                        <li>- 미이용의 기간은 최종 로그인 일자 및 주문이력으로 산정하며 법령에서 정의한 기간 동안 서비스 미이용자에 대하여 분리, 저장,
                                            관리합니다.
                                        </li>
                                        <li>- 당사는 미이용자 개인정보 분리/저장시점 도래 1개월 이전에 이메일 등을 통해 해당 이용자에게 관련내용을 공지합니다.</li>
                                        <li>- 분리 저장된 미이용자 개인정보는 관련 법령에 따라 일정기간 동안 보유하며, 해당 기간 종료 후 파기됩니다. 파기되지 않은 개인정보는
                                            해당 이용자의 요청에 따라 서비스 이용을 재개하는 시점에 다시 제공됩니다
                                        </li>
                                    </ul>
                                </li>
                            </ol>
                        </li>
                        <li>
                            <strong><em>제14조</em> 개인정보 동의 철회, 열람 또는 정정</strong>
                            <ol>
                                <li>
                                    <strong>(1) 회원 또는 회원의 법정대리인은 언제든지 개인정보의 수집 및 이용, 목적 외의 사용에 대한 동의를 철회할 수
                                        있습니다. </strong>
                                </li>
                                <li>
                                    <strong>(2) 회원 또는 회원의 법정대리인은 언제든지 자신의 개인정보를 열람할 수 있으며, 스스로 정보 및 오류를 수정할 수 있습니다. 그
                                        자세한 방법은 본 사이트의 공지, 서비스이용안내에서 정한 바에 따릅니다.</strong>
                                </li>
                            </ol>
                        </li>
                        <li>
                            <strong><em>제15조</em> 서비스의 제공 및 변경</strong>
                            <ol>
                                <li>
                                    <strong>(1) 회사는 업무상/운영상/기술상 필요에 따라 제공하고 있는 전부 또는 일부 서비스를 변경할 수 있습니다. </strong>
                                </li>
                                <li>
                                    <strong>(2) 서비스는 연중무휴, 1일 24시간 서비스를 제공함을 원칙으로 합니다. </strong>
                                </li>
                                <li>
                                    <strong>(3) 회사"는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 운영상 상당한 이유가 있는 경우 "서비스"의 제공을
                                        일시적으로 중단할 수 있습니다. "회사"가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다. </strong>
                                </li>
                                <li>
                                    <strong>(4) "회사"는 서비스의 제공에 필요한 경우 정기점검을 실시할 수 있으며, 정기점검시간은 서비스제공화면에 공지한 바에
                                        따릅니다.</strong>
                                </li>
                            </ol>
                        </li>
                        <li>
                            <strong><em>제16조</em> 정보의 제공</strong>
                            <ol>
                                <li>
                                    <strong>(1) 회사"는 "회원"이 "서비스" 이용 중 필요하다고 인정되는 다양한 정보를 공지사항이나 전자우편 등의 방법으로 "회원"에게 제공할
                                        수 있습니다. 다만, "회원"은 관련법에 따른 거래관련 정보 및 고객문의 등에 대한 답변 등을 제외하고는 언제든지 전자우편에 대해서 수신 거절을
                                        할 수 있습니다.</strong>
                                </li>
                            </ol>
                        </li>
                        <li>
                            <strong><em>제17조</em> 게시물 삭제</strong>
                            <p>회사는 회원이 게시하거나 제공하는 서비스 내용이 다음 각 호에 해당한다고 판단될 경우 사전 통지 없이 삭제할 수 있습니다. </p>
                            <ul>
                                <li>- 다른 회원 또는 제3자를 비방하거나 명예를 손상시키는 내용인 경우</li>
                                <li>- 다량의 정보를 전송하여 서비스의 안정적 운영을 방해하는 경우</li>
                                <li>- 허위 사실 유포 및 수신자의 의사에 반하는 광고성 정보를 전송하는 경우</li>
                                <li>- 공공질서 및 미풍양속에 위반되는 내용인 경우</li>
                                <li>- 제3자의 지적재산권에 침해하는 내용인 경우</li>
                            </ul>
                        </li>
                        <li>
                            <strong><em>제18조</em> 회원에 대한 통지</strong>
                            <ol>
                                <li>
                                    <strong>(1) 회사"가 "회원"에 대한 통지를 하는 경우 회원의 전자우편주소로 발송할 수 있습니다. </strong>
                                </li>
                                <li>
                                    <strong>(2) 회사의 불특정다수 회원에 대하여 통지를 하는 경우, 1주일 이상 회사의 게시판에 게시함으로써 개별 통지에 갈음할 수
                                        있습니다. </strong>
                                </li>
                                <li>
                                    <strong>(3) 회사"는 컴퓨터 등 정보통신설비의 보수점검, 교체 및 고장, 통신두절 또는 운영상 상당한 이유가 있는 경우 "서비스"의 제공을
                                        일시적으로 중단할 수 있습니다. "회사"가 사전에 통지할 수 없는 부득이한 사유가 있는 경우 사후에 통지할 수 있습니다. </strong>
                                </li>
                                <li>
                                    <strong>&lt;(4) "회사"는 서비스의 제공에 필요한 경우 정기점검을 실시할 수 있으며, 정기점검시간은 서비스제공화면에 공지한 바에
                                        따릅니다.</strong>
                                </li>
                            </ol>
                        </li>
                        <li>
                            <strong><em>제19조</em> 권리의 귀속</strong>
                            <ol>
                                <li>
                                    <strong>(1) 서비스와 관련된 저작권 등 일체의 지적재산권은 회사에 귀속됩니다. </strong>
                                </li>
                                <li>
                                    <strong>(2) 회원은 서비스를 이용함으로써 얻은 정보를 회사의 사전 승낙 없이 복제, 송신, 배포, 방송, 기타 방법에 의하여 영리목적으로
                                        이용하거나 제3자에게 이용하게 하여서는 안됩니다. </strong>
                                </li>
                                <li>
                                    <strong>(3) 본 사이트에 회원이 게재한 자료와 게시물에 대한 권리와 책임은 게시 당사자에게 있으며 회사는 회원의 동의 없이 이를 영리적인
                                        목적으로 사용하지 않습니다.</strong>
                                </li>
                            </ol>
                        </li>
                        <li>
                            <strong><em>제20조</em> 책임제한</strong>
                            <ol>
                                <li>
                                    <strong>(1) "회사"는 천재지변 또는 이에 준하는 불가항력으로 인하여 "서비스"를 제공할 수 없는 경우에는 "서비스" 제공에 관한 책임이
                                        면제됩니다. </strong>
                                </li>
                                <li>
                                    <strong>(2) "회사"는 "회원"의 귀책사유로 인한 "서비스" 이용의 장애에 대하여는 책임을 지지 않습니다. </strong>
                                </li>
                                <li>
                                    <strong>(3) "회사"는 "회원"이 "서비스"와 관련하여 게재한 정보, 자료, 사실의 신뢰도, 정확성 등의 내용에 관하여는 책임을 지지
                                        않습니다. </strong>
                                </li>
                                <li>
                                    <strong>(4) "회사"는 "회원" 간 또는 "회원"과 제3자 상호간에 "서비스"를 매개로 하여 거래 등을 한 경우에는 책임이
                                        면제됩니다.</strong>
                                </li>
                                <li>
                                    <strong>(5) "회사"는 무료로 제공되는 서비스 이용과 관련하여 관련법에 특별한 규정이 없는 한 책임을 지지 않습니다.</strong>
                                </li>
                            </ol>
                        </li>
                        <li>
                            <strong><em>제21조</em> 분쟁 시 준거법과 관할법원</strong>
                            <p></p>
                            <ol>
                                <li>
                                    <strong>(1) 회사와 회원은 서비스와 관련하여 발생한 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 한다. </strong>
                                </li>
                                <li>
                                    <strong>(2) 전항의 경우에도 불구하고 분쟁으로 인한 소송이 제기될 경우 서울중앙지방법원을 관할법원으로 하여 해결한다. </strong>
                                </li>
                                <li>
                                    <strong>(3) 회사와 이용자간에 발생하는 분쟁에 관하여는 한국법을 적용한다.</strong>
                                </li>
                            </ol>
                        </li>
                        <li>
                            <strong>부칙</strong>
                            <ul>
                                <li>(시행일) 2009년 5월 20일부터 시행되던 종전의 약관은 본 약관으로 대체합니다.</li>
                                <li>(시행일) 2009년 5월 20일부터 시행되던 종전의 약관은 2011년 6월 16일 본 약관으로 대체합니다.</li>
                                <li>(시행일) 2011년 6월 16일부터 시행되던 종전의 약관은 2011년 10월 31일 본 약관으로 대체합니다.</li>
                                <li>(시행일) 2011년 10월 31일부터 시행되던 종전의 약관은 2015년 7월 28일 본 약관으로 대체합니다.</li>
                                <li>(시행일) 2015년 7월 28일부터 시행되던 종전의 약관은 2015년 12월 1일 본 약관으로 대체합니다.</li>
                                <li>(시행일) 2015년 12월 1일부터 시행되던 종전의 약관은 2019년 11월 18일 본 약관으로 대체합니다.</li>
                                <li>(시행일) 2019년 11월 18일부터 시행되던 종전의 약관은 2020년 7월 8일 본 약관으로 대체합니다.</li>
                            </ul>
                        </li>
                    </ol>
                </div>
            </div>
        </div>
        <a href="#" class="btn-close"></a>
    </div>
</div>
<!-- //팝업-메인 빅배너 -->
<!-- 팝업-메인 빅배너 -->
<div class="pop-layer type2" id="pop-terms-p2">
	<div class="dim"></div>
	<div class="pop-wrap">
		<div class="pop-title-wrap">
			<h2 class="pop-title">개인정보 수집 및 이용 동의</h2>
		</div>
		<div class="pop-content">
            <div class="terms-wrap">
                <p class="sub-text">
                	청오디피케이㈜(이하 회사)는 도미노피자 홈페이지 및 모바일 애플리케이션 (도미노피자, 도미노마이키친 포함) 회원가입 및 원활한 주문서비스 제공을 위해 고객님으로부터 아래와 같은 개인정보를 수집하고 있습니다.<br><br>
                	개인정보 처리에 대한 상세한 사항은 도미노피자 홈페이지에 공개한 회사의 '개인정보 처리방침'을 참조하십시오. 도미노피자는 고객님들의 개인정보를 소중히 다루고 있습니다.
        		</p>
                <div class="terms-box">
                    <div class="table-type6">
                        <p class="sub-text" style="text-align:right;color:#238ECE;">
                            (회원가입시)
                        </p>
                        <table>
                            <colgroup>
                                <col style="width:90px">
                                <col style="width:65px">
                                <col style="width:150px">
                                <col style="width:170px">
                            </colgroup>
                            <thead>
                            <tr>
                            	<th>가입경로</th>
                                <th>구분</th>
                                <th>수집정보</th>
                                <th>수집목적</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                            	<td rowspan="2">일반회원</td>
                                <td>필수</td>
                                <td style="text-align:left; color:#238ECE;">성명, 생년월일, 아이디(ID), 비밀번호, 휴대전화번호, 이메일, 본인인증정보[아이핀 번호(아이핀 인증시), 중복가입 확인정보(DI), 암호화된 동일인 식별정보(CI)]</td>
                                <td rowspan="12" style="text-align:left;">
                                	(필수정보)<br>
									- 회원제 서비스 이용에 따른 본인확인<br>
									- 도미노피자 주문 서비스제공<br>
									- 부정 이용방지와 비인가 사용방지<br>
									- 이용자의 식별 등<br><br>
									
									(선택정보)<br>
									- 마케팅 및 광고의 활용<br>
									- 이벤트 등 광고 정보 전달<br>
									- 고객맞춤 서비스의 제공
                                </td>
                            </tr>
                            <tr>
                                <td>선택</td>
                                <td style="text-align:left; color:#238ECE;">성별</td>
                            </tr>
                            <tr>
                            	<td rowspan="2">네이버</td>
                                <td>필수</td>
                                <td style="text-align:left; color:#238ECE;">성명, 이메일, 출생년도, 생일, 암호화된 동일인 식별정보(CI)</td>
                            </tr>
                            <tr>
                                <td>선택</td>
                                <td style="text-align:left; color:#238ECE;">성별, 생년월일</td>
                            </tr>
                            <tr>
                            	<td rowspan="2">SKT</td>
                                <td>필수</td>
                                <td style="text-align:left; color:#238ECE;">성명, 이메일, 생년월일, 휴대전화번호, 암호화된 동일인 식별정보(CI), 멤버십등급, 멤버십번호</td>
                            </tr>
                            <tr>
                                <td>선택</td>
                                <td style="text-align:left; color:#238ECE;">성별</td>
                            </tr>
                            <tr>
                            	<td>애플</td>
                                <td>필수</td>
                                <td style="text-align:left; color:#238ECE;">이메일</td>
                            </tr>
                            <tr>
                            	<td rowspan="2">카카오</td>
                                <td>필수</td>
                                <td style="text-align:left; color:#238ECE;">카카오계정(전화번호), 카카오계정(이메일), 출생년도, 생일, 암호화된 동일인 식별정보(CI)</td>
                            </tr>
                            <tr>
                                <td>선택</td>
                                <td style="text-align:left; color:#238ECE;">광고 수신 여부 (카카오톡)</td>
                            </tr>
                            <tr>
                            	<td>공통</td>
                                <td>선택</td>
                                <td style="text-align:left; color:#238ECE;">광고성 수신여부(이메일, SMS, 우편)</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <br>
                    <p class="sub-text">
                    	※ 개인정보 수집 및 이용 동의에 거부할 수 있으나 일부 서비스가 제한될 수 있습니다.
                    </p>
                </div>
            </div>
        </div>
		<a href="#" class="btn-close"></a>
	</div>
</div>
</section>
<!-- //팝업-메인 빅배너 -->
<!-- 팝업-메인 빅배너 -->
<div class="pop-layer pop-terms" id="pop-terms-p3">
    <div class="dim"></div>
    <div class="pop-wrap">
        <div class="pop-title-wrap">
            <h2 class="pop-title">개인정보 제 3자 제공 동의</h2>
        </div>
        <div class="pop-content">
            <div class="terms-wrap">
                <p class="sub-text">
                    당사가 회원가입 후 위탁업무 이외의 목적으로 제 3자에게
                    개인정보를 제공할 경우, 개인정보를 제공받는 자, 수집 및 이용
                    목적, 제공하는 개인정보의 항목, 개인정보 보유 및 이용기간에
                    대해 별도의 동의를 득한 후 제공하고 있습니다.

                </p>
                <div class="terms-box">
                    <div class="table-type6">
                        <table>
                            <caption>피자 영양성분</caption>
                            <colgroup>
                                <col style="width:25%">
                                <col style="width:25%">
                                <col style="width:25%">
                                <col style="width:25%">
                            </colgroup>
                            <thead>
                            <tr>
                                <th>제공업체</th>
                                <th>이용목적</th>
                                <th>제공하는 개인정보 항목</th>
                                <th>보유 및 이용기간</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td class="middle">드림라인(주)</td>
                                <td class="middle">문자메세지 발송 서비스</td>
                                <td class="middle">핸드폰 번호</td>
                                <td class="middle" rowspan="3">목적 달성 후 즉시 파기</td>
                            </tr>
                            <tr>
                                <td class="middle">(주)엠트웰브</td>
                                <td class="middle">모바일 쿠폰 발송</td>
                                <td class="middle">핸드폰 번호</td>
                            </tr>
                            <tr>
                                <td class="middle">(주)신화위드컴</td>
                                <td class="middle">DM 발송</td>
                                <td class="middle">주소</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <p class="sub-type4">
                        ※ 개인정보의 수집 및 이용 동의에 대해 거부할 수 있으나 동의 거부 시 서비스가 제한될 수 있습니다.
                    </p>
                </div>
            </div>
        </div>
        <a href="#" class="btn-close"></a>
    </div>
</div>
<!-- //팝업-메인 빅배너 -->
<!-- 팝업-메인 빅배너 -->
<div class="pop-layer pop-terms" id="pop-terms-p4">
    <div class="dim"></div>
    <div class="pop-wrap">
        <div class="pop-title-wrap">
            <h2 class="pop-title v2">위치기반 서비스 약관</h2>
        </div>
        <div class="pop-content">
            <div class="terms-wrap">
                <div class="terms-box">
                    <ol>
                        <li>
                            <p class="sub-type-text"></p>
                        </li>
                        <li>
                        	<strong><em>제1조 목적</em> </strong>
							<p>이 약관은 청오디피케이㈜(이하 “회사”)가 제공하는 위치기반서비스(이하 “서비스”)를 이용함에 있어 회사와 이용자의 권리, 의무 및 책임사항, 기타 필요한 사항에 따른 이용 조건 및 절차 등 기본적인 사항을 규정함을 목적으로 합니다.</p>
                         </li>
                         
                        <li><strong><em>제2조</em> 이용약관의 효력 및 변경</strong>
                            <ol>
                                <li><strong>(1) 본 약관은 서비스를 신청한 이용자 또는 개인위치정보주체가 본 약관을 확인하고 회사가 정한 소정의 절차에 따라 동의해야 효력이 발생합니다.</strong></li>
                                <li><strong>(2) 이용자가 온라인에서 본 약관의 "동의하기" 버튼을 클릭하였을 경우 본 약관의 내용을 모두 읽고 이를 충분히 이해하였으며, 적용에 동의한 것으로 봅니다.</strong></li>
                                <li><strong>(3) 회사는 서비스에 새로운 업무 적용, 정부에 의한 시정명령의 이행 및 기타 회사의 업무상 약관을 변경해야 할 중요한 사유가 있다고 판단될 경우 본 약관을 변경할 수 있습니다.</strong></li>
                                <li><strong>(4) 이용자와 계약을 체결한 서비스가 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 수단으로 즉시 통지합니다.</strong></li>
                                <li><strong>(5) 회사는 본 약관을 변경할 경우에는 변경된 약관과 사유를 적용일자 1주일 전까지 홈페이지에 게시하거나 이용자에게 전자적 형태(전자우편, SMS, 앱 푸시 등)로 공지하며, 이용자가 그 기간 안에 이의제기가 없거나, 본 서비스를 이용할 경우 이를 승인한 것으로 봅니다.</strong></li>
                            </ol>
                        </li>
                        
                        <li>
                        	<strong><em>제3조</em> 관계법령의 적용</strong>
                            <p>본 약관은 신의성실의 원칙에 따라 공정하게 적용하며, 본 약관에 명시되지 아니한 사항에 대하여는 관계법령 또는 상관례에 따릅니다.</p>
                        </li>

                        <li>
                        	<strong><em>제4조</em> 서비스 내용 및 위치정보 수집방법 등</strong>
                            <ol>
                                <li><strong>(1) 회사가 제공하는 위치기반 서비스를 이용하기 위한 통신 비용은 기본적으로 무료이며 이용자가 이동통신사업자에 지불하는 통신요금 외의 요금은 추가적으로 없습니다. </strong></li>
                                <li><strong>(2) 회사는 다음과 같이 위치정보를 수집합니다.</strong>
                                    <ul class="list-text-v2">
                                        <li> 휴대폰 등 모바일기기가 사용하는 이동통신사업자 기지국 기반의 실시간 위치정보 수집</li>
                                        <li> GPS가 포함된 모바일기기의 GPS정보를 통한 위치정보 수집</li>
                                        <li> 인터넷망을 통해 접속 시 인터넷서비스사업자로부터 제공받는 위치정보 수집  </li>
                                    </ul>
                                </li>
                                <li> <br><strong>(3) 회사는 제공받은 위치정보, 상태정보를 이용하여 다음의 내용을 서비스 합니다.</strong> <br></li>
                            
                                <li class="privacy-box">
                                	<strong></strong>
                                    <div class="table-type5">
                                        <table>
                                            <caption>서비스 내용</caption>
                                            <colgroup>
                                                <col>
                                                <col>
                                                <col style="width: 263px">
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th scope="col">서비스 내용</th>
                                                    <th scope="col">서비스 대상</th>
                                                    <th scope="col">비고</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td><strong>* 주변 매장 찾기/현 위치로 매장 검색</strong><br>(인근 매장정보 제공)</td>
                                                    <td>온라인 주문 <br>(웹사이트 및 모바일App)</td>
                                                    <td>회원 및 비회원</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>* 현위치로 배달주소 설정</strong></td>
                                                    <td>온라인 주문 <br>(웹사이트 및 모바일App)</td>
                                                    <td>회원 및 비회원</td>
                                                </tr>
                                                <tr>
                                                    <td><strong>* 드라이빙 픽업 서비스</strong><br>(픽업서비스를 원하는 이용자 위치를 매장에 <br> 전송하여 픽업위치로 주문한 제품 배송)</td>
                                                    <td>온라인 주문 <br> (웹사이트 및 모바일App) <br>방문포장만 적용</td>
                                                    <td>회원만 제공<br>(단, 모바일App에서 위치접근 권한을 <br> 허용한 회원에 한해 제공)</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </li>
                            </ol>
                        </li>

                        <li>
                        	<strong><em>제5조</em> 이용자의 이용제한</strong>
                            <ol>
                                <li><strong>(1) 이용자의 악의적인 개인위치정보 도용 및 결제사기를 목적으로 할 경우 거절될 수 있습니다.</strong></li>
                                <li><strong>(2) 이용자가 법률, 공공질서나 도덕에 위반하는 목적으로 서비스를 이용할 경우에 거절될 수 있습니다.</strong></li>
                                <li><strong>(3) 기타 관계법령 및 해당 약관을 위반한 경우에 거절될 수 있습니다.</strong></li>
                                <li><strong>(4) 이용자가 회사 서비스 운영을 고의 또는 방해하는 경우에 거절될 수 있습니다.</strong></li>
                            </ol>
                        </li>

                        <li>
                        	<strong><em>제6조</em> 서비스 이용의 제한 및 중지</strong>
                            <ol>
                                <li>
                                    <strong>(1) 회사는 아래에 해당하는 사유가 발생한 경우에는 서비스 이용을 제한하거나 중지시킬 수 있습니다.</strong>
                                    <ul class="list-text-v2">
                                       <li> 서비스용 설비 점검, 보수 또는 공사로 인하여 부득이한 경우</li>
                                        <li> 전기통신사업법에 규정된 기간통신사업자가 전기통신서비스를 중지했을 경우</li>
                                        <li> 국가비상사태, 서비스 설비의 장애 또는 서비스 이용의 폭주 등으로 서비스 이용에 지장이 있는 때</li>
                                        <li> 기타 중대한 사유로 인하여 회사가 서비스 제공을 지속하는 것이 부적당하다고 인정하는 경우</li>
                                    </ul>
                                </li>
                                <li>
                                    <br>
                                    <strong>(2) 회사는 전항의 규정에 의하여 서비스의 이용을 제한하거나 중지한 때에는 그 사유 및 제한기간 등을 이용자에게 알려야 합니다.</strong>
                                </li>
                            </ol>
                        </li>

                        <li>
                        	<strong><em>제7조</em> 개인위치정보의 이용 또는 제공</strong>
                            <ol>
                                <li><strong>(1) 회사는 개인위치정보를 이용하여 서비스를 제공하고자 하는 경우에는 미리 이용약관에 명시한 후 개인위치정보주체의 동의를 얻어야 합니다.</strong></li>
                                <li><strong>(2) 이용자 및 법정대리인의 권리와 그 행사 방법은 제소 당시의 이용자의 주소에 의하며, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할 법원에 제기합니다.</strong></li>
                                <li><strong>(3) 회사는 타사업자 또는 이용 고객과의 요금정산 및 민원처리를 위해 위치정보 이용·제공·사실 확인 자료를 자동 기록·보존하며, 해당 자료는 관련 법령에 따라 보관합니다.</strong></li>
                            </ol>
                        </li>

                        <li>
                        	<strong><em>제8조</em> 개인위치정보 처리 업무의 위탁</strong>
                            <p>회사는 서비스 향상을 위하여 위치정보 서비스를 아래와 같이 위탁하고 있으며 위탁계약 시 개인위치정보가 안전하게 관리되도록 하고 있습니다. 제공정보는 서비스를 위한 최소한의 필요정보로 국한됩니다.  </p>
                            <ol>
                                <li class="privacy-box"><strong></strong>
                                    <div class="table-type5">
                                        <table>
                                            <caption></caption>
                                            <colgroup>
                                                <col style="width: 263px">
                                                <col>
                                                <col>
                                            </colgroup>
                                            <thead>
                                                <tr>
                                                    <th scope="col">수탁자</th>
                                                    <th scope="col">위탁범위</th>
                                                    <th scope="col">제공정보</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td class="td_center">㈜청오NF</td>
                                                    <td>- 가까운 매장 찾기 <br> - 현재 위치 배달주소 등록 </td>
                                                    <td>위치정보</td>
                                                </tr>
                                                <tr>
                                                    <td class="td_center">㈜스파코사</td>
                                                    <td>- 드라이빙 픽업 이용시 이용자의 매장 도착정보 알림</td>
                                                    <td>위치정보,휴대전화번호, 고객이 입력한 차량정보 (차종설명, 차량번호 등)</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </li>
                            </ol>
                        </li>

                        <li>
                        	<strong><em>제9조</em> 개인위치정보주체의 권리</strong>
                            <ol>
                                <li><strong>(1) 이용자는 회사에 대하여 언제든지 개인위치정보를 이용한 서비스 제공 및 개인위치 정보의 위탁 제공에 대한 동의의 전부 또는 일부를 철회할 수 있습니다. 이 경우 회사는 수집한 개인위치정보 및 위치정보 이용, 제공사실 확인자료를 파기합니다.</strong></li>
                                <li><strong>(2) 이용자는 회사에 대하여 언제든지 개인위치정보의 수집, 이용 또는 제공의 일시적인 중지를 요구할 수 있으며, 회사는 이를 거절할 수 없고 이를 위한 기술적 수단을 갖추고 있습니다.</strong></li>
                                <li><strong>(3) 이용자는 회사에 대하여 아래 항목의 자료에 대한 열람 또는 고지를 요구할 수 있고, 당해 자료에 오류가 있는 경우에는 그 정정을 요구할 수 있습니다. 이 경우 회사는 정당한 사유 없이 이용자의 요구를 거절할 수 없습니다.</strong>
                                    <ul class="list-text-v2">
                                        <li> 본인에 대한 위치정보 수집, 이용, 제공사실 확인자료</li>
                                        <li> 본인의 개인위치 정보가 위치정보의 보호 및 이용 등에 관한 법률 또는 다른 법률 규정에 의하여 제3자에게 제공된 이유 및 내용</li>
                                    </ul>
                                </li>
                                <li><br><strong>(4) 이용자는 제 1호 내지 제 3호의 권리행사를 위해 회사에 소정의 절차를 통해 요구할 수 있습니다.</strong></li>
                            </ol>
                        </li>

                        <li>
                        	<strong><em>제10조</em> 위치정보관리책임자의 지정</strong>
                            <p>회사는 개인위치정보를 적절히 관리·보호하고 개인위치정보주체의 불만을 원활히 처리할 수 있도록 위치정보관리책임자를 지정해 운영합니다.</p>
                            <ol>
                                <li>
                                    <ul class="list-text-v2">
                                        <li> 관리책임자 : 개인정보보호책임자 겸직</li>
                                        <li> 전화 : <strong>02-6954-3082</strong></li>
                                        <li> 이메일 : <strong>infosec@dominos.co.kr</strong></li>
                                    </ul>
                                </li>
                            </ol>
                        </li>

                        <li>
                        	<strong><em>제11조</em> 손해배상</strong>
                            <ol>
                                <li><strong>(1) 회사가 위치정보의 보호 및 이용 등에 관한 법률 제15조 내지 제26조의 규정을 위반한 행위로 이용자에게 손해가 발생한 경우 이용자는 회사에 대하여 손해배상 청구를 할 수 있습니다. 이 경우 회사는 고의, 과실이 없음을 입증하지 못하는 경우 책임을 면할 수 없습니다. </strong></li>
                                <li><strong>(2) 이용자가 본 약관의 규정을 위반하여 회사에 손해가 발생한 경우 회사는 이용자에 대하여 손해배상을 청구할 수 있습니다. 이 경우 이용자는 고의, 과실이 없음을 입증하지 못하는 경우 책임을 면할 수 없습니다.</strong></li>
                                <li><strong><strong>(3) 전항에도 불구하고 천재지변, 전쟁 등과 같은 불가항력의 상태가 있는 경우 발생한 손해에 대해서는 책임을 부담하지 않습니다.</strong></strong></li>
                            </ol>
                        </li>

                        <li>
                        	<strong><em>제12조</em> 분쟁의 조정</strong>
                            <ol>
                                <li><strong>(1) 회사는 위치정보와 관련된 분쟁에 대해 당사자간 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 위치정보의 보호 및 이용 등에 관한 법률 제28조의 규정에 의한 방송통신 위원회에 재정을 신청할 수 있습니다.</strong>
                                </li>
                                <li><strong>(2) 회사 또는 고객은 위치정보와 관련된 분쟁에 대해 당사자간 협의가 이루어지지 아니하거나 협의를 할 수 없는 경우에는 개인정보보호법 제43조의 규정에 의한 개인정보분쟁조정위원회에 조정을 신청할 수 있습니다.</strong></li>
                            </ol>
                        </li>

                        <li>
                        	<strong><em>제13조</em> 회사의 주소 및 연락처</strong>
                            <ol>
                                <li><strong>회사의 상호, 주소, 전화번호 그 밖의 연락처는 다음과 같습니다.</strong>
                                </li>
                                <li><strong>상호: 청오디피케이㈜</strong></li>
                                <li><strong>주소: 서울특별시 강남구 역삼로25길 35(역삼동, 청오큐브타워)</strong></li>
                                <li><strong>전화번호: 1588-3082</strong></li>
                                <li><strong>사업자정보 이메일 주소: webmaster@dominos.co.kr</strong>
                                </li>
                            </ol>
                        </li>

                        <li>
                        	<strong><em>부칙</em></strong>
                            <ol>
                                <li><strong>제 1 조 시행일</strong></li>
                                <li><strong>본 약관은 2021년 8월 6일부터 적용됩니다.</strong></li>
                                
                            </ol>
                        </li>
                    </ol>
                </div>
            </div>
        </div>
        <a href="#" class="btn-close"></a>
    </div>
</div>
<!-- //팝업-메인 빅배너 -->
<!-- e_이용 약관 -->
</div>
<!-- //container -->

<script type="text/javascript">

// 생년월일
var birth = '${ snsUser.getBirth() }';

var bYear = birth.substring(0, 4);
var bMonth = birth.substring(5, 7);
var bDay = birth.substring(8, 10);

//생년월일 자동 추가
$("#byear").append("<option value='"+bYear+"'>"+bYear+"</option>"); 
$("#bmonth").append("<option value='"+bMonth+"'>"+bMonth+"</option>");
$("#bday").append("<option value='"+bDay+"'>"+bDay+"</option>");

// 만나이 체크
var today = new Date();
var tYear = today.getFullYear(); 
var tMonth = today.getMonth() + 1
var tDate = today.getDate(); 
var age = tYear - parseInt(birth);

if(age <= 14) {          //              			  오늘월                     			  오늘월                      오늘일
   if((age < 14) || (age == 14 && (parseInt(bMonth) > tMonth || (parseInt(bMonth) == parseInt(tMonth) && parseInt(bDay) > tDate)))){
      alert('만 14세 미만 아동의 개인정보 보호를 위해 \n회원가입은 만 14세 이상만 가능 합니다.');
      window.history.back();
   }
}

// 약관 전체동의 , 광고성 정보 수신 전체 동의
$("#agree_all ,#agree_all2").click(function(){
    if ($(this).is(":checked") == true) {
    	$(this).parents(".agree").find("input").prop("checked",this.checked);
    	$(this).parents(".agree").find(".chk-box").addClass("selected");
    }
    else {
    	$(this).parents(".agree").find("input").prop("checked",this.checked);
    	$(this).parents(".agree").find(".chk-box").removeClass("selected");
    }
});

// 약관 및 광고성 정보 수신 전체 동의
$('input.all-check-agree').click(function(){
	var state = $('.all-check-agree').is(':checked');
	if(state){		
    	$("#agree_all").parents(".agree").find("input").prop("checked",this.checked);
    	$("#agree_all").parents(".agree").find(".chk-box").addClass("selected");
    	$("#agree_all2").parents(".agree").find("input").prop("checked",this.checked);
    	$("#agree_all2").parents(".agree").find(".chk-box").addClass("selected");
	}else{
    	$("#agree_all").parents(".agree").find("input").prop("checked",this.checked);
    	$("#agree_all").parents(".agree").find(".chk-box").removeClass("selected");
    	$("#agree_all2").parents(".agree").find("input").prop("checked",this.checked);
    	$("#agree_all2").parents(".agree").find(".chk-box").removeClass("selected");
	}
});

//회원가입
function goInsert() {
	
	$("#gender_alert").text("");
	$("#gender_alert").hide();

	if ($("#chk_dm_fl").prop("checked")) $("#dm_fl").val("1");
	if ($("#chk_o_dm_fl").prop("checked")) $("#o_dm_fl").val("1");
	if ($("#chk_ds_fl").prop("checked")) $("#ds_fl").val("1");
	
	var agreeOption1 = $("input[name=agree_1]:checked").val();
	var agreeOption2 = $("input[name=agree_2]:checked").val();
	var locationOption = $("input[name=location_yn]:checked").val();
	if (agreeOption1 != "Y"  || agreeOption2 != "Y" || locationOption != "Y" ) {
		alert('회원가입은 개인정보 수집, 이용약관, 위치기반 서비스 약관에 동의하셔야 가능합니다.');
		return;
	}
	
	//공백제거
	$("#frm :input").prop("disabled", false);
	$('#frm').submit();
}

</script>