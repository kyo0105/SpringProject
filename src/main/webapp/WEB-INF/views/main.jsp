<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
$(document).ready(function(){
	
	getTodayLabel();
	
	//visual area
	var slideCount = $('.slide-count');
	$('.visual-slider').on('init reInit afterChange', function (event, slick, currentSlide, nextSlide) {
		var i = (currentSlide ? currentSlide : 0) + 1;
		$(this).find('.slide-count').html('<span class="current">' + i + '</span> ' + '/' + ' <span class="total">' + slick.slideCount + '</span>');
	});
	
	// play button
	$('.visual-area .btn-play').click(function() {
		var sw;
		if (sw == true) {
			$(this).addClass('on');
			$('.visual-slider').slick('slickPause');
		} else {
			$(this).removeClass('on');
			$('.visual-slider').slick('slickPlay');
		}
		sw = !sw;
	});
	
	var sw=true;
	$('.visual-slider').slick({
		slide: '.slider-item',
		autoplay: true,
		autoplaySpeed: 4500,
		infinite: true,
		slidesToShow: 1,
		slidesToScroll: 1,
		arrows: true,
		cssEase: 'ease-in-out',
		dots: false,
	});
	// play button
	$('.visual-area .btn-play').click(function() {
		if (sw == true) {
			$(this).addClass('on');
			$('.visual-slider').slick('slickPause');
		} else {
			$(this).removeClass('on');
			$('.visual-slider').slick('slickPlay');
		}

		sw = !sw;
	});
	
	//grade area
	$('.grade-slider').show();
	
	//grade area
	$('.grade-slider').slick({
		slidesToShow:3.5,
		slidesToScroll: 1.5,
		infinite:false,
		arrows: true,
	});
	
	$('.banner-slider').slick({
		slidesToShow: 3,
		slidesToScroll: 1,
		dots: false,
		arrows: true,
	});
	
	function getTodayLabel() {
		var t = new Date();
		var today = new Date().getDay(); // 0: 일요일, 1: 월요일, 2: 화요일, 3: 수요일, 4: 목요일, 5: 금요일 , 6: 토요일
		
		var day = String(t.getDate());
		var month = String(t.getMonth() + 1);
		var year = String(t.getUTCFullYear());

		if(("2020219"  == (year+month+day)) ||("202048"  == (year+month+day)) || ("2020415"  == (year+month+day)) || ("2020513"  == (year+month+day)) ||("2020729"  == (year+month+day)) ){
			$("#getTodayPrmt a").attr("href","/event/entry/435");
			$("#getTodayPrmt a img").attr("src","https://cdn.dominos.co.kr/domino/pc/images/main/main_card4-3.png");
			
			if(today != 2 && today !=4 ){
				$(".wrap_box").html("등급별 최대 40%");
			}
			
		} else {
			$(".wrap_box").html("등급별 최대 40%");
			$("#getTodayPrmt").remove();
		}
		
		if(("2020217"  == (year+month+day)) ||("2020218"  == (year+month+day)) ||("2020219"  == (year+month+day))  
					||("2020220"  == (year+month+day))||("2020221"  == (year+month+day)) ||("2020222"  == (year+month+day))	||("2020223"  == (year+month+day)))
		{
			$(".wrap_box").html("프리미엄+클래식 한판 더!");
		}

	}
	
});

</script>

<div class="floatingBanner">
	<a href="https://web.dominos.co.kr/event/viewHtml?seq=1225&gubun=E0200">
    	<img src="https://cdn.dominos.co.kr/renewal2018/w/images/banner-floating_200827.png">
    </a>
    <button class="btn-close"></button>
</div>
<script>
    $('.floatingBanner .btn-close').on('click', function(){
        $(this).parents('.floatingBanner').hide();
    });
</script>
<!-- //container -->
<div id="container">
	<section id="content">
		<div class="main">
			<!-- visual -->
			<article class="article visual-area">
				
				<div class="visual-slider">
				<div class='slider-item'><a href="https://web.dominos.co.kr/event/viewHtml?seq=1328&gubun=E0200" target="_self" style="background-image: url('https://cdn.dominos.co.kr/admin/upload/banner/20210901_3VJffg9G.jpg')" alt="20210902_목요일 한판더 포장 1+1" ></a></div>
								<div class='slider-item'><a href="https://web.dominos.co.kr/event/viewHtml?seq=1512&gubun=E0200" target="_self" style="background-image: url('https://cdn.dominos.co.kr/admin/upload/banner/20220110_t4cXUBl2.jpg')" alt="20220111_새해복만두피자 티징" ></a></div>
								<div class='slider-item'><a href="https://web.dominos.co.kr/event/viewHtml?seq=1490&gubun=E0300" target="_self" style="background-image: url('https://cdn.dominos.co.kr/admin/upload/banner/20220106_Fs5fY24H.jpg')" alt="20220110_1월 SKT T-WEEK" ></a></div>
								<div class='slider-item'><a href="https://web.dominos.co.kr/event/entry/1504" target="_self" style="background-image: url('https://cdn.dominos.co.kr/admin/upload/banner/20211231_CrEi1F1H.jpg')" alt="20220103_포춘굿즈페스타" ></a></div>
								<div class='slider-item'><a href="https://web.dominos.co.kr/event/viewHtml?seq=1506&gubun=E0200" target="_self" style="background-image: url('https://cdn.dominos.co.kr/admin/upload/banner/20211230_29e3xrl8.jpg')" alt="20220103_해피 뉴 이어 포춘 세트" ></a></div>
								<div class='slider-item'><a href="https://web.dominos.co.kr/event/entry/1509" target="_self" style="background-image: url('https://cdn.dominos.co.kr/admin/upload/banner/20220106_x3CN1e3v.jpg')" alt="20220110_도미노피자X29CM 할인 쿠폰 증정 이벤트" ></a></div>
					
					<div class="slide-count-wrap">
                        <span class="slide-count"></span>
                        <a href="javascript:;" class="btn-play">btnPlay</a>
                    </div>
                    </div>
			</article>
			<!-- //visual -->
			
			<!-- delivery -->
			<article class="article delivery-area">
				<div class="inner-box">
					<div class="item-wrap v2">
						<div class="item">
							<a href="#">
								<i class="ico-delivery"></i>
								<span class="text">배달 주문</span>
								<span class="arrow"></span>
							</a>
							<p>
								<!--  배달 40%<br/>-->
								등급별 최대 30%
							</p>
						</div>
						<div class="item">
							<a href="#">
								<i class="ico-takeout"></i>
								<span class="text">포장 주문</span>
								<span class="arrow"></span>
							</a>
							<p class="wrap_box">
							</p>
						</div>
						
						<div class="item">
							<a href="#" onMouseDown="eval('try{ _trk_clickTrace( \'EVT\', \'메인 화면 > 퀵오더 주문하기\' ); }catch(_e){ }');">
								<i class="ico-quick3"></i>
								<span class="text">퀵오더</span>
								<span class="arrow"></span>
							</a>
							<p>
								자주 이용하는 메뉴를<br>
								더 빠르게 주문해보세요!
							</p>
						</div>
					</div>
				</div>
			</article>
			<!-- //delivery -->
			
			<!-- my grade-->
			<article class="article grade-area">
				<div class="inner-box">
					<div class="grade-info">
					<!--로그인 전-->
					<c:if test="${ empty member and empty emp }">
						<div class="login-before">
							<div class="title-wrap">
								<div class="title-type2">도미노피자의<br><strong>특별한 매니아 혜택</strong><br>누려보세요!</div>
							</div>
							<div class="btn-wrap">
								<a href="/global/login" class="btn-type5">로그인</a>
							</div>
						</div>
					</c:if>
					<!--로그인 후: member-->
					<c:if test="${ not empty member }">
						<div class="user-info">
							<p><span>${ member.getName() }</span>님 현재 등급</p>
							<p class="grade"><span>${ member.getMania_rank() }</span></p>
							<div class="btn-wrap">
								<a href="#" class="btn-type5">혜택보기</a>
								<a href="#" class="btn-type5">주문내역</a>
							</div>
						</div>
					</c:if>
					<!--로그인 후: emp-->
					<c:if test="${ not empty emp }">
						<div class="user-info">
							<p><span>${ emp.getEmp_name() } 관리자 님이 로그인하셨습니다</span></p>
						</div>
					</c:if>
					</div>
					<div class="grade-slider" style="display:none;">
					<div>
								<a href="login"><img src="https://cdn.dominos.co.kr/domino/pc/images/main/main_card1.png"/></a>
							</div>
							<div>
								<a href="https://web.dominos.co.kr/event/mania"><img src="https://cdn.dominos.co.kr/domino/pc/images/main/main_card2.gif"/></a>
							</div>
						
							<!-- 요일별 프로모션 설정(상단 스크립트에서 수정) -->
							<div id="getTodayPrmt">
								<a href="/event/view?seq=1161&gubun=E0200"><img src="https://cdn.dominos.co.kr/domino/pc/images/main/main_card4-1.gif"/></a>
							</div>
							<!-- //요일별 프로모션 설정(상단 스크립트에서 수정) -->
																
							<div>
								<a href="https://web.dominos.co.kr/event/viewHtml?seq=1149&gubun=E0200"><img src="https://cdn.dominos.co.kr/domino/pc/images/main/main_card3.png"/></a>
							</div>
							
							<div>
								<a href="https://web.dominos.co.kr/goods/dominosMoment"><img src="https://cdn.dominos.co.kr/domino/pc/images/main/main_card5.png"/></a>
							</div>
						</div><!-- //grade-slider -->
						<!--
					<div class="grade-slider slick-initialized slick-slider" style=""><button type="button" data-role="none" class="slick-prev slick-arrow slick-disabled" aria-label="Previous" role="button" aria-disabled="true" style="">Previous</button>
					<div aria-live="polite" class="slick-list draggable"><div class="slick-track" style="opacity: 1; width: 864px; transform: translate3d(0px, 0px, 0px);" role="listbox"><div class="card-item-type slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false" style="width: 210px;" tabindex="-1" role="option" aria-describedby="slick-slide10">
								<a href="/mypage/myCoupon" tabindex="0">
									<div class="inner">
										<dl>
											<dt>보유쿠폰</dt>
											<dd>
												<strong id="myCouponCnt">0</strong>개
											</dd>
										</dl>
									</div>
								</a>
							</div><div class="card-item-type3 slick-slide slick-active" data-slick-index="1" aria-hidden="false" style="width: 210px;" tabindex="-1" role="option" aria-describedby="slick-slide11">
								<a href="/mypage/myLevel" tabindex="0">
									<div class="inner">
										<p id="requireAmount">2번만 더 주문하면 등급 UP</p>
									</div>
								</a>
							</div><div class="slick-slide slick-active" data-slick-index="2" aria-hidden="false" style="width: 210px;" tabindex="-1" role="option" aria-describedby="slick-slide12">
								<a href="/event/viewHtml?seq=1149&amp;gubun=E0200" tabindex="0"><img src="https://cdn.dominos.co.kr/domino/pc/images/main/main_card3.png"></a>
							</div><div class="slick-slide" data-slick-index="3" aria-hidden="true" style="width: 210px;" tabindex="-1" role="option" aria-describedby="slick-slide13">
								<a href="/goods/dominosMoment" tabindex="-1"><img src="https://cdn.dominos.co.kr/domino/pc/images/main/main_card5.png"></a>
							</div></div>
							
						<button type="button" data-role="none" class="slick-next slick-arrow" aria-label="Next" role="button" style="" aria-disabled="false">Next</button></div><!-- //grade-slider -->
					
			</div>
			</article>
			<!-- //my grade-->
			
			<!-- banner -->
			<article class="article banner-area">
				<div class="inner-box">
	                <div class="banner-slider" >
	                		<div class="slider-item">
									<a href="javascript:goBannerLink('https://web.dominos.co.kr/event/viewHtml?seq=1494&gubun=E0200');">
										<figure>
											<img src="https://cdn.dominos.co.kr/admin/upload/banner/20211202_O6T4x9na.jpg" alt="20211203_큐레이션_마스터트리플코스 ">
										</figure>
									</a>
							</div>
							<div class="slider-item">
									<a href="javascript:goBannerLink('https://web.dominos.co.kr/event/viewHtml?seq=1304&gubun=E0200');">
										<figure>
											<img src="https://cdn.dominos.co.kr/admin/upload/banner/20201127_0Bh97A50.jpg" alt="20201127_큐레이션_퀵오더&도미노페이">
										</figure>
									</a>
							</div>
							<div class="slider-item">
									<a href="javascript:goBannerLink('https://web.dominos.co.kr/event/dominoSpot');">
										<figure>
											<img src="https://cdn.dominos.co.kr/admin/upload/banner/20200626_9PFh173Q.jpg" alt="큐레이션_도미노스팟">
										</figure>
									</a>
							</div>
					</div>
				</div>
			</article>
			<!-- //banner -->
            
		</div><!-- //main -->
	</section>
</div>	
<!-- //container -->

<script type="text/javascript">
function goBannerLink(link) {
	location.href = link;
}
</script>