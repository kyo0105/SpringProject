<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
   <meta charset="euc-kr">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" id="viewport" content="width=1119, user-scalable=yes">
   <meta http-equiv='cache-control' content='no-cache'>
   <meta http-equiv='expires' content='0'>
   <meta http-equiv='pragma' content='no-cache'>
   <meta http-equiv='Cache-Control' content='no-cache'>
   <!-- 사용자지정 태그 -->
   <meta name="description" content="당신의 인생에 완벽한 한끼! Life Food, Domino's" />
   <meta name="title" content="도미노피자 - 당신의 인생에 완벽한 한끼! Life Food, Domino's" />
   <meta name="keyword" content="도미노피자, 맛있는 피자, 피자 배달 전문점 브랜드, 피자 방문 포장, 도미노 피자 할인, 도미노피자 온라인 주문, 도미노 방문포장, 도미노 1+1, 도미노 화목한 데이, 도미노피자 이벤트, 도미챗, 도미노 야외배달, 배달맛집, 배달음식, 1577-3082" />
   <title>도미노피자 - 당신의 인생에 완벽한 한끼! Life Food, Domino's</title>
   <meta property="og:type" content="website" />
   <meta property="og:title" content="도미노피자 - 당신의 인생에 완벽한 한끼! Life Food, Domino's" />
   <meta property="og:site_name" content="도미노피자" />
   <meta property="og:image" content="https://cdn.dominos.co.kr/renewal2018/w/img/sns_pre.png" />
   <meta property="og:image:width" content="270" />
   <meta property="og:image:height" content="270" />
   <meta property="og:description" content="당신의 인생에 완벽한 한끼! Life Food, Domino's" />
   <meta property="og:url" content="/main" />
   <meta property="al:web:url" content="https://web.dominos.co.kr" />

   <link rel="shortcut icon" href="https://cdn.dominos.co.kr/renewal2018/w/img/favicon.ico"/>
   
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
   
   <script type="text/javascript" src="https://cdn.dominos.co.kr/renewal2018/w/js/jquery.flexslider.js"></script>
   <script type="text/javascript" src="https://web.dominos.co.kr/resources/js/selectbox.js"></script>
   <script type="text/javascript" src="https://web.dominos.co.kr/resources/js/d2CommonUtil.js?ver=1.5"></script>
   <script type="text/javascript" src="https://web.dominos.co.kr/resources/js/Cookie.js"></script>
   <script type="text/javascript" src="https://cdn.dominos.co.kr/renewal2018/w/js/basket_w.js"></script>
      
   <link rel="stylesheet" type="text/css" href="https://cdn.dominos.co.kr/domino/asset/css/font.css"> 
   <link rel="stylesheet" type="text/css" href="https://cdn.dominos.co.kr/domino/pc/css/common.css">
   <link rel="stylesheet" type="text/css" href="https://web.dominos.co.kr/resources/css/ol.css">   
   <link rel="stylesheet" type="text/css" href="https://cdn.dominos.co.kr/domino/pc/css/sub.css">
   
   <script src="https://cdn.dominos.co.kr/domino/asset/js/slick.js"></script>
   <script src="https://cdn.dominos.co.kr/domino/asset/js/TweenMax.min.js"></script>
   <script src="https://cdn.dominos.co.kr/domino/asset/js/lazyload.js"></script>
   
   <script src="https://cdn.dominos.co.kr/domino/pc/js/ui.js"></script>
   <script type="text/javascript" src="https://web.dominos.co.kr/resources/js/gcenmaps/gcenmap.js"></script>

   <style>
   #card_add .pop_wrap{position:fixed;top:50%;width:490px;margin-left:-245px;margin-top:-35px;}
   #card_add .pop_wrap .pop_content p{font-size:18px;color:#fff;text-align:center}
   .pop_toast {display: block;position:absolute;top:0;left:0;width:100%;height:100%;z-index:100;}
   .pop_toast.open {display:block}
   
   .pop_toast .bg {position:fixed; width:100%; height:100%;}
   .pop_toast .pop_wrap {overflow:hidden;position:absolute; top:100px; left:50%; min-width:400px;min-height:70px; margin-left:-200px; padding:20px; background:url(https://cdn.dominos.co.kr/renewal2018/w/img/bg/bg_color_navy.png) repeat 0 0;border-radius:12px;}
   .pop_toast .pop_wrap .btn_close3 {position:absolute; top:15px; right:20px;}
   .pop_toast .pop_header {position:absolute;top:0;left:0;width:100%;height:66px;padding:0 40px;background-color:#eeece9;line-height:66px;}
   .pop_toast .pop_header h2 {font-size:30px;font-weight:500;color:#38474f;}
   .pop_toast .pop_content {position:relative;width:100%;padding: 0;}
   .pop_type2 .pop_wrap .btn_close3 {position:absolute; top:15px; right:20px;}
  
   </style>
   <script type="text/javascript">
   
   /*gps lsm 전역변수 */
   var lat;
   var lon;
   var xdot;
   var ydot;
   var address;
   var gps_yn;
   
   var CON_DOMAIN_URL = "http://web.dominos.co.kr";
   var CON_SSL_URL = "https://web.dominos.co.kr";
   var CON_STATIC_URL = "https://cdn.dominos.co.kr/renewal2018/w";
   function goLink(menuCode, link) {
      location.href = link;
   }

   $(document).ready(function() {
      $.ajaxSetup({cache:false});
       
         //메인화면일 경우만 내위치 표시
         geo.init();
   });

   function appendLocation(paramArr) {
      var simpleAddress;
      
      gps_yn = 'Y';
      
      if (paramArr == null || paramArr.length == 0){
         return;
      }
      
      $.ajax({
          type: "GET",
          url: "/gis/getXyAddressAjax",
          data: paramArr.join('&'),
          
          success:function(data) {
              $('#myloc').html("");
              
              if(data.resultData.result.length > 0) {
                 var html = '';
               html += '<div class="tip-box center" id="tip-box">';
               html += '<p>주변 매장의 프로모션을 확인해보세요!</p>';
               html += '</div>';
               
               $("#tip-box-top").append(html);
               $("#tip-box").delay(2000).fadeOut(1000);
               
                   $.each(data.resultData.result, function(i, v) {
                      if(v.roadaddr === ''){
                         simpleAddress = v.sggname+' '+v.bemdname+' '+v.jbmain+(v.jbsub=='0'?'':'-'+v.jbsub);
                         $('#myloc').html(simpleAddress);
                         lat = v.lat;
                         lon = v.lon;
                         xdot = v.kx;
                         ydot = v.ky;
                         address = simpleAddress;
                         
                      }else{
                         simpleAddress = v.roadname+' '+v.bdmain+(v.bdsub=='0'?'':'-'+v.bdsub);
                         $('#myloc').html(simpleAddress);
                         lat = v.lat;
                         lon = v.lon;
                         xdot = v.kx;
                         ydot = v.ky;
                         address = simpleAddress;
                      }
                   });
                }else {
                    $('#myloc').html("주변 매장의 프로모션이 궁금하시면, 위치 서비스를 허용해주세요.");
             }
          },
          error: function (error){
              alert("다시 시도해주세요.");
          }
          
      });
   }
   
   //현재 위치 받아오기
   var geo = {
      init : function() { 
         
         if ('geolocation' in navigator) {
            /* 지오로케이션 사용 가능 */
            navigator.geolocation.getCurrentPosition(geo.success, geo.error);
            
         } else {
            /* 지오로케이션 사용 불가능 */
            alert('geolocationx');
            alert('사용자의 브라우저는 지오로케이션을 지원하지 않습니다.');
         }
      },
      success : function(position) {

         var latitude  = position.coords.latitude;
          var longitude = position.coords.longitude;

          findLocation(latitude, longitude);
      },
      error : function(err) {
         
         var userAgent = navigator.userAgent.toString();

         if(/iPad|iPhone|iPod/.test(userAgent) && !window.MSStream){ // iOS
            alert('아이폰 > 설정 >개인정보보호 > 위치서비스 > 도미노피자 항목의 위치접근허용을 체크해주세요.');
            return;
         } else {
            //alert('위치접근허용을 승인해주세요.');
            $('#myloc').html('주변 매장의 프로모션을 확인해보세요!');
            return;
         }
      }
   }

   function findLocation(lat,lon) {
      //if (!!!optn) return;

      // 검색 파라미터 설정
      var paramArr = [];   
      paramArr[0] = 'lat=' + lat;
      paramArr[1] = 'lon=' + lon;
      
      appendLocation(paramArr);
   }
   
   function gpsLsm(gps_yn){
      if(gps_yn == 'Y'){
         address = encodeURIComponent(address);
         UI.layerPopUp({selId:'#pop-lsm', url:'/branch/gpsLsm', data:{lon:lon, lat:lat, xdot:xdot, ydot:ydot, address:address}});
         address = decodeURIComponent(address);
         _trk_call();
      }else{
         alert('위치접근허용을 승인해주세요.');   
      }
   }
   
   var _trk_call = function () {
       // 트래킹
      var _trk_url = document.baseURI + '&_TRK_PI=WP_1P&_TRK_CP=LSM 팝업';
       try {
             _trk_code_base = _trk_code_base.replace(/(du=).*?(&)/,'$1' + escape(_trk_url) + '$2');
           _trk_flashEnvView("_TRK_PI=WP_1P","_TRK_CP=LSM 팝업");
       } catch (e) {
          console.log(e.message);
       }
      
   }
</script>
   
</head>