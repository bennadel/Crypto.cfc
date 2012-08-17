<cfscript>

	
	// Set up our test suite.
	testSuite = new mxunit.framework.TestSuite()
		.TestSuite()
	;

	// Add the Hashed Message Authentication Code spec (ie. test specification).
	testSuite.addAll( "specs.HmacTest" );

	// Run the tests that have been added. This will include all the methods of the all the 
	// components that we added above.
	results = testSuite.run();

	// Output the results. Pass in the web-root of the MXUnit folder so that the rendering can
	// properly set up the CSS and JavaScript URLs.
	writeOutput(
		results.getHtmlResults( "mxunit/" )
	);


</cfscript>

