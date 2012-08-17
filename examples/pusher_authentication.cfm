<!---

	Pusher App Message Authentication 

	This example is taken from : https://gist.github.com/376898

--->

<cfoutput>

	<h1>
		Pusher App REST API Auth Signature
	</h1>

	<cfset crypto = new lib.Crypto() />

	<cfset key = "7ad3773142a6692b25b8" />

	<cfset input = "POST\n/apps/3/channels/test_channel/events\nauth_key=278d425bdf160c739803&auth_timestamp=1272044395&auth_version=1.0&body_md5=7b3d404f5cde4a0b9b8fb4789a0098cb&name=foo" />

	<!---
		Replace with real new-line characters since ColdFusion doesn't recognize them 
		as embedded string character. 
	--->
	<cfset input = replace( input, "\n", chr( 10 ), "all" ) />


	<!--- Our value. --->
	#crypto.hmacSha256( key, input )#<br />

	<!--- Expected value. --->
	309fc4be20f04e53e011b00744642d3fe66c2c7c5686f35ed6cd2af6f202e445

</cfoutput>