package com.domino.oauth;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

@Service
public class NaverLoginBO {
	
    private static final String CLIENT_ID = "YOUR_CLIENT_ID";
    private static final String CLIENT_SECRET = "YOUR_CLIENT_SECRET";
    private static final String REDIRECT_URI = "http://localhost/global/callbackNaver";
    private static final String SESSION_STATE = "naver_oauth_state";
    
    private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
    
    /* 네아로 인증 URL 생성 */
    public String getAuthorizationUrl(HttpSession session) {
  
       String state = generateRandomString();
       
       setSession(session, state);
  
       OAuth20Service oauthService = getOAuthServiceUrl();
  
       return oauthService.getAuthorizationUrl(state);
    }
    
    /* 네아로 Callback 처리 및 AccessToken 획득 */
    public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws Exception {
  
       String sessionState = getSession(session);
       
       // Callback으로 전달받은 세선검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인
       if (StringUtils.pathEquals(sessionState, state)) {
    	   
    	   OAuth20Service oauthService = getOAuthServiceUrl();
    	   
    	   // Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득
    	   OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
          
    	   return accessToken;
       }
       return null;
    }
    
    /* 세션 유효성 검증을 위한 난수 생성기 */
    private String generateRandomString() {
    	return UUID.randomUUID().toString();
    }
    
    /* http session에 데이터 저장 */
    private void setSession(HttpSession session, String state) {
    	session.setAttribute(SESSION_STATE, state);
    }
    
    /* http session에서 데이터 가져오기 */
    private String getSession(HttpSession session) {
    	return (String) session.getAttribute(SESSION_STATE);
    }
    
    /* Access Token을 이용하여 네이버 사용자 프로필 API를 호출 */
    public String getUserProfile(OAuth2AccessToken oauthToken) throws Exception {
  
    	OAuth20Service oauthService = getOAuthServiceUrl();
    	OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL);
    	
    	oauthService.signRequest(oauthToken, request);
    	Response response = oauthService.execute(request);
       
    	return response.getBody();
    }
    
    /* Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 네아로 인증 URL 생성 */
    public OAuth20Service getOAuthServiceUrl() {
    	
    	OAuth20Service oauthService = new ServiceBuilder(CLIENT_ID)
    			.apiSecret(CLIENT_SECRET)
    			.callback(REDIRECT_URI)
    			.build(NaverLoginApi.instance());
    	
    	return oauthService;

    }
   
}
