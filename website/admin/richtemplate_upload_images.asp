<html>
<head>
<script language="javascript" src="../../config/international.js"></script>
<script language="javascript">



<%
'CREATE A JAVASCRIPT ARRAY OF ALL IMAGE FILES IN THE DATA/IMAGES 
      
	strPath = "/data/images/"

	Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
	Set objFolder = objFSO.GetFolder(Server.MapPath(strPath))
	set files_collection = objFolder.Files
	filecount = files_collection.Count

	'response.write filecount
%>
var fileArray=new Array(<%=filecount%>)

<%
	x=0
	for each objItem in objFolder.Files
		tempname=objItem.name
		tempname=replace(tempname,chr(34),"&#34;")
		tempname=replace(tempname,chr(39),"&#39;")
%>
	fileArray[<%=x%>]="<%=tempname%>"
<%
	x=x+1
	next
	
	' All done!  Kill off our object variables.
	Set objItem = Nothing
	Set objFolder = Nothing
	Set objFSO = Nothing
%>
</script>

<title>Upload Images</title>
<STYLE>
BODY {
	MARGIN-TOP: 15px; FONT-SIZE: 11px; MARGIN-LEFT: 15px; MARGIN-RIGHT: 15px; FONT-FAMILY: arial; BACKGROUND-COLOR: #ece9d8
}
.maintable {
	BORDER-RIGHT: #919b9c 1px solid; BORDER-TOP: #919b9c 1px solid; FONT-SIZE: 11px; BORDER-LEFT: #919b9c 1px solid; BORDER-BOTTOM: #919b9c 1px solid; FONT-FAMILY: arial; BACKGROUND-COLOR: #f8f7f6
}
.head {
	PADDING-RIGHT: 3px; PADDING-LEFT: 3px; COLOR: blue; BACKGROUND-COLOR: #f8f7f6
}
</STYLE>

<script>
var language = "";
var urlabs   = "";
var pathabs  = "";
var tech     = "";
var insert   = "";

function load()
{
	// process parameters
	var param = "";
	try {
		param = window.location.search;
	} catch(Error) {}

	if(param.length > 0) {
		param = param.substring(1,param.length);
		var aArray = param.split("&");
		for(var i=0;i<aArray.length;i++) {
			var aParam = aArray[i].split("=");
			for(var j=0;j<aParam.length-1;j++) {
				if(aParam[0].toUpperCase() == "LANGUAGE") {
					language = aParam[1];
				}
				if(aParam[0].toUpperCase() == "TECH") {
					tech = aParam[1];
				}
				if(aParam[0].toUpperCase() == "URLABS") {
					urlabs = aParam[1];
				}
				if(aParam[0].toUpperCase() == "PATHABS") {
					pathabs = aParam[1];
				}
				if(aParam[0].toUpperCase() == "INSERT") {
					insert = aParam[1];
				}
			}
		}
	}
  // set labels
//  document.getElementById("lblUpload").value = getLanguageString(language,3201);
//  document.getElementById("lblCancel").value = getLanguageString(language,900);
 // document.getElementById("lblUploadFile").innerHTML = getLanguageString(language,3202);
  //document.getElementById("lblPath").innerHTML = getLanguageString(language,3203);
  //document.getElementById("lblFile").innerHTML = getLanguageString(language,3204);
  // set path
  document.getElementById('txtPath').innerHTML = urlabs;

	// parameter check
	if(pathabs == "")
		alert("pinEdit Warning (Parameter Check):\n" + "Please specify the globalRootPath parameter in config.js or the cp parameter !");
}

function beforeSubmit()
{
 
  if(document.getElementById('file').value == "") {
    //alert(getLanguageString(language,3311));
    alert("You must specify a file. Click the browse button to locate one.")
    return;
  }
  
  //all this just checks to see if the file is already there
  var i
  var nameoffile=document.getElementById('file').value
  lastslash=nameoffile.lastIndexOf("\\")
  nameoffile=nameoffile.substring(lastslash+1,(nameoffile.length));
  //alert(nameoffile);
  
  for (i=0 ; i < fileArray.length; i++) {
  	if (fileArray[i]==nameoffile) {
  		var existing=1
  		break
  	}
  }
  if (existing==1) {
  	replacefile= confirm("A file with that name already exists. Do you want to replace it?");
  	if (!replacefile) {
   		return;
  	}
  }
  
  
  // set the selected path
  document.frmUpload.lblUpload.disabled = true;
  document.frmUpload.lblCancel.disabled = true;
  // set the selected path
  document.frmUpload.action = "richtemplate_uploadProcess2." + tech + "?path=" + pathabs + "&insert=" + insert;
  // submit document
  document.frmUpload.submit();
}

</script>
</HEAD>

<BODY onload="load()" style="background-color: #FFFFFF">
<form name="frmUpload" enctype="multipart/form-data" method="post" action="">
<DIV class=maintable style="Z-INDEX: 1005; LEFT: 8px; WIDTH: 461px; POSITION: absolute; TOP: 9px; HEIGHT: 123px; BACKGROUND-COLOR: #f8f7f6"></DIV>
<DIV class=maintable style="Z-INDEX: 1006; LEFT: 23px; WIDTH: 430px; POSITION: absolute; TOP: 33px; HEIGHT: 80px; BACKGROUND-COLOR: #f8f7f6"></DIV>
<P id='lblUploadFile' class=head style="PADDING-LEFT: 3px; Z-INDEX: 1007; LEFT: 33px; WIDTH: 70px; POSITION: absolute; TOP: 26px; HEIGHT: 15px">
<font color="#3054A9"><b>Upload file</b></font></P><INPUT id='lblUpload' style="LEFT: 310px; WIDTH: 81px; POSITION: absolute; TOP: 138px; HEIGHT: 24px" onclick=beforeSubmit() type=button size=108 value=Upload> <INPUT id='lblCancel' style="LEFT: 394px; WIDTH: 77px; POSITION: absolute; TOP: 138px; HEIGHT: 24px" onclick=window.close() type=button size=97 value=Cancel>
<P id='lblFile' style="PADDING-LEFT: 3px; Z-INDEX: 1008; LEFT: 34px; WIDTH: 24px; POSITION: absolute; TOP: 78px; HEIGHT: 15px">File:</P>
<INPUT id=file style="Z-INDEX: 1021; LEFT: 101px; WIDTH: 337px; POSITION: absolute; TOP: 74px; HEIGHT: 23px" type=file name=file size="20">
<P id='lblPath' style="PADDING-LEFT: 3px; Z-INDEX: 1008; LEFT: 33px; WIDTH: 66px; POSITION: absolute; TOP: 49px; HEIGHT: 14px">Server path:</P>
<P id=txtPath style="PADDING-LEFT: 3px; Z-INDEX: 1009; LEFT: 105px; WIDTH: 245px; POSITION: absolute; TOP: 49px; HEIGHT: 14px"></P><INPUT id=btnSelect onclick="javascript:onSelect();" style="visibility:hidden;Z-INDEX: 1022; LEFT: 356px; WIDTH: 81px; POSITION: absolute; TOP: 45px; HEIGHT: 24px" type=button size=108 value=...>
</FORM>
</BODY>
</html>