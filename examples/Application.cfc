<cfscript>

component
	output = "false"
	hint = "I define the application setttings and event handlers."
	{


	// Define the application settings.
	this.name = hash( getCurrentTemplatePath() );
	this.applicationTimeout = createTimeSpan( 0, 0, 1, 0 );
	this.sessionManagement = false;

	// Get the examples (current) directory
	this.examplesDirectory = getDirectoryFromPath( getCurrentTemplatePath() );

	// Get the root directory for our project.
	this.projectDirectory = (this.examplesDirectory & "../");

	// Map the Lib directory so we can instantiate our project components.
	this.mappings[ "/lib" ] = (this.projectDirectory & "lib/");

	
}

</cfscript>
