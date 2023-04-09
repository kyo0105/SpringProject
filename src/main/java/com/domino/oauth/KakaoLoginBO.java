package com.domino.oauth;

import org.springframework.stereotype.Service;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.AccessTokenRequestParams;
import com.github.scribejava.core.oauth.OAuth20Service;

@Service
public class KakaoLoginBO {
	
    private static final String CLIENT_ID = "YOUR_CLIENT_ID";
    private static final String CLIENT_SECRET = "YOUR_CLIENT_SECRET";
    private static final String REDIRECT_URI = "http://localhost/global/callbackKakao";
    
    private final static String PROFILE_API_URL = "https://kapi.kakao.com/v2/user/me";
    
    /* 카카오 로그인 인증 URL 생성 */
    public String getAuthorizationUrl() {

       OAuth20Service oauthService = getOAuthServiceUrl();
  
       return oauthService.getAuthorizationUrl();
    }
    
    /* 카카오 로그인 Callback 처리 및 AccessToken 획득 */
    public OAuth2AccessToken getAccessToken(String code) throws Exception {
    	
    	OAuth20Service oauthService = new ServiceBuilder(CLIENT_ID).build(KakaoLoginApi.instance());
    			
    	AccessTokenRequestParams params = new AccessTokenRequestParams(code);
    	params.addExtraParameter("client_id", CLIENT_ID);
    	params.addExtraParameter("client_secret", CLIENT_SECRET);
    	
    	return oauthService.getAccessToken(params);
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
    			.build(KakaoLoginApi.instance());
    		
    	return oauthService;
    }
   
}
