﻿<!--- 
/**
********************************************************************************
ContentBox - A Modular Content Platform
Copyright 2012 by Luis Majano and Ortus Solutions, Corp
www.ortussolutions.com
********************************************************************************
Apache License, Version 2.0

Copyright Since [2012] [Luis Majano and Ortus Solutions,Corp] 

Licensed under the Apache License, Version 2.0 (the "License" );
you may not use this file except in compliance with the License. 
You may obtain a copy of the License at 

http://www.apache.org/licenses/LICENSE-2.0 

Unless required by applicable law or agreed to in writing, software 
distributed under the License is distributed on an "AS IS" BASIS, 
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. 
See the License for the specific language governing permissions and 
limitations under the License.
********************************************************************************
*/
--->
<cfoutput>

	<!--- ContentBoxEvent --->
	#cb.event( "cbui_preEntryDisplay" )#
	
	<!--- top gap --->
	<div class="post-top-gap"></div>
	
	<!--- Quickly reuse our entry template to build this one with some extra pizzaz --->
	#cb.quickEntry(args={addComments=true} )#
	
	<!--- Comment Form: I can build it or I can quick it? --->
	<div id="commentFormShell">
		#cb.quickCommentForm(prc.entry)#
	</div>
	
	<div class="clr"></div>
	
	<!--- Display Comments --->
	<cfif !cb.isPrintFormat()>
	<div id="comments">
		#cb.quickComments()#
	</div>
	</cfif>	
	<!--- ContentBoxEvent --->
	#cb.event( "cbui_postEntryDisplay" )#
	

<!--- Custom JS For Comments--->
<cfif cb.isCommentsEnabled() and !cb.isPrintFormat()>
<script type="text/javascript">
$(document).ready(function() {
	<cfif cb.isCommentFormError()>
	toggleCommentForm();
	</cfif>
} );
function toggleCommentForm(){
	$( "##commentForm" ).slideToggle();
}
</script>
</cfif>
</cfoutput>