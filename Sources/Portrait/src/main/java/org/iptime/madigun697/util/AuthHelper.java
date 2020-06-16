package org.iptime.madigun697.util;

import java.io.IOException;
import java.security.SecureRandom;
import java.util.Arrays;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeRequestUrl;
import com.google.api.client.googleapis.auth.oauth2.GoogleTokenResponse;
import com.google.api.client.http.GenericUrl;
import com.google.api.client.http.HttpRequest;
import com.google.api.client.http.HttpRequestFactory;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson.JacksonFactory;
import com.google.gdata.client.http.AuthSubUtil;

public class AuthHelper {

	private static final String CLIENT_ID = "376770627633-alfd7mapmlif4s8i1aoca4l1a0l6jijr.apps.googleusercontent.com";
	private static final String CLIENT_SECRET = ""; // Client Secret
	private static final String CALLBACK_URI = "http://madigun697.iptime.org/Portrait/hello.do";
	
	private static final Iterable<String> SCOPE = Arrays.asList("https://picasaweb.google.com/data;https://www.googleapis.com/auth/drive;https://www.googleapis.com/auth/coordinate;https://www.googleapis.com/auth/mapsengine;https://www.googleapis.com/auth/plus.login;https://www.googleapis.com/auth/picasa;https://www.googleapis.com/auth/youtube;https://www.googleapis.com/auth/youtube.upload;".split(";"));
	private static final String USER_INFO_URL = "https://www.googleapis.com/oauth2/v1/userinfo";
	private static final JsonFactory JSON_FACTORY = new JacksonFactory();
	private static final HttpTransport HTTP_TRANSPORT = new NetHttpTransport();
	
	private String stateToken;
	
	private final GoogleAuthorizationCodeFlow flow;
	
	private static String hostedDomain = "madigun697.iptime.org";
	private static String nextUrl = "http://madigun697.iptime.org/PortraitAuth/auth.do";
	private static String scope = "https://picasaweb.google.com/data/";
	private static boolean secure = true; // set secure=true to request secure
	private static boolean session = true;

	public AuthHelper() {
		flow = new GoogleAuthorizationCodeFlow.Builder(HTTP_TRANSPORT,
				JSON_FACTORY, CLIENT_ID, CLIENT_SECRET, SCOPE).build();

		generateStateToken();
	}
	
	public String buildLoginUrl() {
		final GoogleAuthorizationCodeRequestUrl url = flow.newAuthorizationUrl();
		return url.setRedirectUri(CALLBACK_URI).setState(stateToken).build();
	}
	
	public String buildTokenUrl() {
		String authSubUrl = AuthSubUtil.getRequestUrl(hostedDomain, nextUrl, scope, secure, session);
		System.out.println(authSubUrl);
		return authSubUrl;
	}

	private void generateStateToken() {
		SecureRandom sr1 = new SecureRandom();
		stateToken = "google;" + sr1.nextInt();
	}
	
	public String getStateToken() {
		return stateToken;
	}

	public String authorizationUrl() {
		return AuthSubUtil.getRequestUrl(nextUrl, scope, secure, session);
	}
	
	public String getUserInfoJson(final String authCode) throws IOException {

		final GoogleTokenResponse response = flow.newTokenRequest(authCode).setRedirectUri(CALLBACK_URI).execute();
		final Credential credential = flow.createAndStoreCredential(response, null);
		final HttpRequestFactory requestFactory = HTTP_TRANSPORT.createRequestFactory(credential);
		final GenericUrl url = new GenericUrl(USER_INFO_URL);
		final HttpRequest request = requestFactory.buildGetRequest(url);
		System.out.println(request);
		request.getHeaders().setContentType("application/json");
		System.out.println(request.execute().toString());
		final String jsonIdentity = request.execute().parseAsString();

		return jsonIdentity;

	}

}