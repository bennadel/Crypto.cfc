<cfscript>

component
	extends = "mxunit.framework.TestCase"
	output = "false"
	hint = "I test the Hmac methods."
	{


	// I test the hmacSha256() method.
	function testHmacSha256(){

		// Create an instance of our crypto component.
		var crypto = new lib.Crypto();

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

	}


}

</cfscript>