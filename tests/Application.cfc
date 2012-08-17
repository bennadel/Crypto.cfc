<cfscript>

component 
	output = "false"
	hint = "I define the unit-testing application settings."
	{


	// Define the application settings. For testing, these are pretty minimal.
	this.name = hash( getCurrentTemplatePath() );
	this.applicationTimeout = createTimeSpan( 0, 0, 1, 0 );
	this.sessionManagement = false;

	// Get the tests directory - we'll be setting up mappings for directories relative to our 
	// testing directory. 
	this.testsDirectory = getDirectoryFromPath( getCurrentTemplatePath() );

	// Get the root directory for our project.
	this.projectDirectory = (this.testsDirectory & "../");

	// Get our MXUnit directory - we'll need this in order to run the test suties from our 
	// tests directory.
	this.mxunitDirectory = (this.testsDirectory & "mxunit/");
	
	// ***** MX UNIT FRAMEWORK *****
	// Set up a mapping to the MXUnit framework; this is requied for the framework installation 
	// to run without a global mapping. 
	this.mappings[ "/mxunit" ] = this.mxunitDirectory;

	// ***** TEST SPECIFICATIONS *****
	// Map the spec folder so that our local tests can be located from within the MXUnit framework 
	// components. 
	this.mappings[ "/specs" ] = (this.testsDirectory & "specs/");

	// ***** PROJECT COMPONENTS *****
	// Map the Lib directory so we can include our projects components for unit testing. 
	this.mappings[ "/lib" ] = (this.projectDirectory & "lib/");


}

</cfscript>