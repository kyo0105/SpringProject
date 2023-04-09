<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<!--1. header 부분-->
<tiles:insertAttribute name="head" />
<body>
<div id="wrap">
   <!--2. header 부분-->
   <tiles:insertAttribute name="header" />
   <!--3. container 부분-->
   <tiles:insertAttribute name="container" />
   <!-- 페이지에서만 사용하는 스크립트 -->
<!--4. footer 부분-->
<tiles:insertAttribute name="footer" />
</div><!-- //wrap -->
</body>
</html>
<!-- </html> 이후 페이지별 스크립트 코딩 부분 추가하기 -->