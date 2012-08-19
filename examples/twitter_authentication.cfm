<!---

	Twitter Post Authentication 

	This example is taken from : https://dev.twitter.com/docs/auth/creating-signature

--->

<cfoutput>

	<h1>
		Twitter Post Auth Signature
	</h1>

	<cfset crypto = new lib.Crypto() />

	<cfset key = "kAcSOqF21Fu85e7zjz7ZN2U4ZRhfV3WpwPAoE3Z7kBw&LswwdoUaIvS8ltyTt5jkRh4J50vUPVVHtR2YPi5kE" />

	<cfset input = "POST&https%3A%2F%2Fapi.twitter.com%2F1%2Fstatuses%2Fupdate.json&include_entities%3Dtrue%26oauth_consumer_key%3Dxvz1evFS4wEEPTGEFPHBog%26oauth_nonce%3DkYjzVBB8Y0ZFabxSWbWovY3uYSQ2pTgmZeNu2VS4cg%26oauth_signature_method%3DHMAC-SHA1%26oauth_timestamp%3D1318622958%26oauth_token%3D370773112-GmHxMAgYyLbNEtIKZeRNFsMKPR9EyMZeS9weJAEb%26oauth_version%3D1.0%26status%3DHello%2520Ladies%2520%252B%2520Gentlemen%252C%2520a%2520signed%2520OAuth%2520request%2521" />

	<!--- Our value. --->
	#crypto.hmacSha1( key, input, "base64" )#<br />

	<!--- Expected value. --->
	tnnArxj06cWHq44gCs1OSKk/jLY=<br />

</cfoutput>
