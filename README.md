
# Crypto.cfc - Crypto / Security Methods For ColdFusion

by Ben Nadel 
([www.bennadel.com](http://www.bennadel.com))

[ColdFusion 10 introduced the hmac() function][1] for generating secure, hashed
message authentication codes (HMAC). This function makes dealing with 3rd-Party 
APIs much easier. Before ColdFusion 10, however, you would need to dip down into
the Java layer to access the security libraries. This ColdFusion component - 
Crypto.cfc - attempts to make access to such libraries easier and more concise.

## Currently Supported Methods

* hmacSha256( key, input [, encoding] )

[1]: http://www.bennadel.com/blog/2339-ColdFusion-10-Beta-Generating-Hash-Based-Message-Authentication-Codes-With-Hmac-.htm