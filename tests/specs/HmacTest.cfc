<cfscript>

component
	extends = "mxunit.framework.TestCase"
	output = "false"
	hint = "I test the Hmac methods."
	{


	// I test the hmacMd5() method.
	function testHmacMd5(){

		// Create an instance of our crypto component.
		var crypto = new lib.Crypto();

		// ---
		// ---	

		// These test cases are taken from:
		// http://www.faqs.org/rfcs/rfc2202.html
		
		var key = toString( binaryDecode( "0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b", "hex" ) );
		var input = "Hi There";

		var output = crypto.hmacMd5( key, input );
		var expected = "9294727a3638bb1c13f48ef8158bfc9d";

		// Test result.
		assertEquals( expected, output, "hmacMd5() Failed" );
		
		// ---
		// ---

		var key = "Jefe";
		var input = "what do ya want for nothing?";

		var output = crypto.hmacMd5( key, input );
		var expected = "750c783e6ab0b503eaa86e310a5db738";

		// Test result.
		assertEquals( expected, output, "hmacSha1() Failed" );

		// ---
		// ---

		// These tests are taken from:
		// http://en.wikipedia.org/wiki/Hash-based_message_authentication_code

		var key = "key";
		var input = "The quick brown fox jumps over the lazy dog";

		var output = crypto.hmacMd5( key, input );
		var expected = "80070713463e7749b90c2dc24911e275";

		// Test result.
		assertEquals( expected, output, "hmacSha1() Failed" );

	}


	// I test the hmacSha1() method.
	function testHmacSha1(){

		// Create an instance of our crypto component.
		var crypto = new lib.Crypto();

		// ---
		// ---	

		// These test cases are taken from:
		// http://www.faqs.org/rfcs/rfc2202.html
		
		var key = toString( binaryDecode( "0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b0b", "hex" ) );
		var input = "Hi There";

		var output = crypto.hmacSha1( key, input );
		var expected = "b617318655057264e28bc0b6fb378c8ef146be00";

		// Test result.
		assertEquals( expected, output, "hmacSha1() Failed" );
		
		// ---
		// ---

		var key = "Jefe";
		var input = "what do ya want for nothing?";

		var output = crypto.hmacSha1( key, input );
		var expected = "effcdf6ae5eb2fa2d27416d5f184df9c259a7c79";

		// Test result.
		assertEquals( expected, output, "hmacSha1() Failed" );

		// ---
		// ---

		/* 
		NOTE: Cannot get repeat-based tests to work.
		
		var key = toString( binaryDecode( "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", "hex" ) );
		var input = repeatString( toString( binaryDecode( "dd", "hex" ) ), 50 );

		var output = crypto.hmacSha1( key, input );
		var expected = "125d7342b9ac11cd91a39af48aa17b4f63f175d3";

		// Test result.
		assertEquals( expected, output, "hmacSha1() Failed" );
		*/

		// ---
		// ---

		/*
		NOTE: Cannot get repeat-based tests to work.

		var key = repeatString( toString( binaryDecode( "aa", "hex" ) ), 80 );
		var input = "Test Using Larger Than Block-Size Key - Hash Key First";

		var output = crypto.hmacSha1( key, input );
		var expected = "aa4ae5e15272d00e95705637ce8a3b55ed402112";

		// Test result.
		assertEquals( expected, output, "hmacSha1() Failed" );
		*/

		// ---
		// ---

		// These tests are taken from:
		// https://dev.twitter.com/docs/auth/creating-signature

		var key = "kAcSOqF21Fu85e7zjz7ZN2U4ZRhfV3WpwPAoE3Z7kBw&LswwdoUaIvS8ltyTt5jkRh4J50vUPVVHtR2YPi5kE";
		var input = "POST&https%3A%2F%2Fapi.twitter.com%2F1%2Fstatuses%2Fupdate.json&include_entities%3Dtrue%26oauth_consumer_key%3Dxvz1evFS4wEEPTGEFPHBog%26oauth_nonce%3DkYjzVBB8Y0ZFabxSWbWovY3uYSQ2pTgmZeNu2VS4cg%26oauth_signature_method%3DHMAC-SHA1%26oauth_timestamp%3D1318622958%26oauth_token%3D370773112-GmHxMAgYyLbNEtIKZeRNFsMKPR9EyMZeS9weJAEb%26oauth_version%3D1.0%26status%3DHello%2520Ladies%2520%252B%2520Gentlemen%252C%2520a%2520signed%2520OAuth%2520request%2521";

		var output = crypto.hmacSha1( key, input );
		var expected = lcase( "B679C0AF18F4E9C587AB8E200ACD4E48A93F8CB6" );

		// Test result.
		assertEquals( expected, output, "hmacSha1() Failed" );

		// ---
		// ---

		var key = "kAcSOqF21Fu85e7zjz7ZN2U4ZRhfV3WpwPAoE3Z7kBw&LswwdoUaIvS8ltyTt5jkRh4J50vUPVVHtR2YPi5kE";
		var input = "POST&https%3A%2F%2Fapi.twitter.com%2F1%2Fstatuses%2Fupdate.json&include_entities%3Dtrue%26oauth_consumer_key%3Dxvz1evFS4wEEPTGEFPHBog%26oauth_nonce%3DkYjzVBB8Y0ZFabxSWbWovY3uYSQ2pTgmZeNu2VS4cg%26oauth_signature_method%3DHMAC-SHA1%26oauth_timestamp%3D1318622958%26oauth_token%3D370773112-GmHxMAgYyLbNEtIKZeRNFsMKPR9EyMZeS9weJAEb%26oauth_version%3D1.0%26status%3DHello%2520Ladies%2520%252B%2520Gentlemen%252C%2520a%2520signed%2520OAuth%2520request%2521";

		var output = crypto.hmacSha1( key, input, "base64" );
		var expected = "tnnArxj06cWHq44gCs1OSKk/jLY=";

		// Test result.
		assertEquals( expected, output, "hmacSha1() Failed" );

		// ---
		// ---

		// These tests are taken from:
		// http://en.wikipedia.org/wiki/Hash-based_message_authentication_code

		var key = "key";
		var input = "The quick brown fox jumps over the lazy dog";

		var output = crypto.hmacSha1( key, input );
		var expected = "de7c9b85b8b78aa6bc8a7a36f70a90701c9db4d9";

		// Test result.
		assertEquals( expected, output, "hmacSha1() Failed" );

	}


	// I test the hmacSha256() method.
	function testHmacSha256(){

		// Create an instance of our crypto component.
		var crypto = new lib.Crypto();

		// ---
		// ---

		// To test this, we'll use a known result for the Pusher API.
		// 
		// Known value from: https://gist.github.com/376898
		var key = "7ad3773142a6692b25b8";
		var input = "POST\n/apps/3/channels/test_channel/events\nauth_key=278d425bdf160c739803&auth_timestamp=1272044395&auth_version=1.0&body_md5=7b3d404f5cde4a0b9b8fb4789a0098cb&name=foo";

		// Replace with real new-line characters since ColdFusion doesn't recognize them 
		// as embedded string character. 
		input = replace( input, "\n", chr( 10 ), "all" );

		var output = crypto.hmacSha256( key, input );
		var expected = "309fc4be20f04e53e011b00744642d3fe66c2c7c5686f35ed6cd2af6f202e445";

		// Test result.
		assertEquals( expected, output, "hmacSha256() Failed" );

		// ---
		// ---

		// These tests are taken from:
		// http://en.wikipedia.org/wiki/Hash-based_message_authentication_code

		var key = "key";
		var input = "The quick brown fox jumps over the lazy dog";

		var output = crypto.hmacSha256( key, input );
		var expected = "f7bc83f430538424b13298e6aa6fb143ef4d59a14946175997479dbc2d1a3cd8";

		// Test result.
		assertEquals( expected, output, "hmacSha256() Failed" );

	}


}

</cfscript>