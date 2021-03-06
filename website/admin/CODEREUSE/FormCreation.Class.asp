<%
   Class GenerateForm
     '****************** PROPERTIES ********************
     Private strRedirect
     Private strCollection
     Private strFormAction
     Private objFormElementDict
     Private strFormName
     Private strSubmitTitle
     Private objValidationMsgDict
     Private strTableCssClass
     Private strLeftColumnWidth
     Private strTableWidth
     '**************************************************


     '************** INITIALIZE/TERMINATE **************
     Private Sub Class_Initialize()
        'Set the default property values
        strCollection = "FORM"
        strFormAction = "You did not specify a form action"	'original script sent user to a server side validation page. we are skipping.
        strFormName = "frmForm1"
        strRedirect = Request.ServerVariables("SCRIPT_NAME")
        strSubmitTitle = "Submit Query!"
		strTableWidth=600
		strLeftColumnWidth=150
        Set objFormElementDict = CreateObject("Scripting.Dictionary")
        Set objValidationMsgDict=CreateObject("Scripting.Dictionary")
     End Sub

     Private Sub Class_Terminate()
        Set objFormElementDict = Nothing    ' Clean up
        Set objValidationMsgDict=Nothing
     End Sub
     '**************************************************


     '************* PROPERTY LET STATMENTS *************
     Public Property Let Collection(str)
       'Set the strCollection private property, making sure it is
       'set to either QueryString or Form (default to Form)
       If Ucase(str) = "QUERYSTRING" then
         strCollection = "QueryString"
       Else
         strCollection = "Form"
       End If
     End Property

     Public Property Let Redirect(str)
       'Set the strRedirect private property; if trying to assign it
       'a blank string, assign it the value of the current ASP page
       If Len(str) = 0 then
         strRedirect = Request.ServerVariables("SCRIPT_NAME")
       Else
         strRedirect = str
       End If
     End Property

     Public Property Let FormAction(str)
       'Set the strFormAction private property
       strFormAction = str
     End Property

     Public Property Let FormName(str)
       'Set the strFormName private property
       strFormName = str
     End Property

     Public Property Let SubmitTitle(str)
       'Set the strSubmitTitle private property
       If Len(str) = 0 then
         strSubmitTitle = "Submit Query!"
       Else
         strSubmitTitle = str
       End If
     End Property
     
     Public Property Let TableCssClass(str)
     	strTableCssClass=str
     End Property
     
     Public Property Let LeftColumnWidth(str)
     	strLeftColumnWidth=str
     End Property
     Public Property Let TableWidth(str)
     	strTableWidth=str
     End Property
     '**************************************************


     '************* PROPERTY GET STATMENTS *************
     Public Property Get Collection()
        Collection = strCollection
     End Property

     Public Property Get Redirect()
        Redirect = strRedirect
     End Property

     Public Property Get FormAction()
        FormAction = strFormAction
     End Property

     Public Property Get FormName()
        FormName = strFormName
     End Property

     Public Property Get SubmitTitle()
        SubmitTitle = strSubmitTitle
     End Property
     
     Public Property Get TableCssClass()
     	TableCssClass=strTableCssClass
     End Property
     Public Property Get LeftColumnWidth()
     	leftColumnWidth=strLeftColumnWidth
     End Property
     
     Public Property Get TableWidth()
     	TableWidth=strTableWidth
     End Property
     '**************************************************


     '********************* METHODS ********************
     Public Function AddElement(objFormElement)
       
       'CREATE HTML FOR THE ROW OF THE TABLE THAT THIS FORM ELEMENT WILL BE IN
       'Add ROW HTML TO objFormElementDict object
       'Expects to be passed a valid objFormElement instance
       
       Dim strHTML

	   'OPEN THE ROW 
	   strHTML="<tr>"
	   
	   'SHOW RED ASTERIX IF REQUIRED else show empty cell
       strHTML=strHTML & "<td width=""10"">"
       if objFormElement.Required=true then
       		strHTML=strHTML & "<span class=""required"">*</span>"
	   else
	   	  strHTML = strHTML &"&nbsp;"
	   end if
	   strHTML=strHTML & "</td>"
	   
	   
	   'OPEN THE LABEL CELL
	   if objFormElement.MergeCells=true then
	   		strHTML=strHTML & "<td colspan=2 valign=top>"
	   	else
	   		strHTML=strHTML & "<td valign=""top"""
	   		if strLeftColumnWidth<>"" then strHTML=strHTML & " width=""" & strLeftColumnWidth & """"
	   		strHTML=strHTML & ">"
	   	end if
      


	   'ADD PREHTML
	    strHTML = strHTML & objFormElement.PreHTML & vbCrLf
       
       'CLOSE LABEL CELL AND OPEN CELL FOR FORM FIELD **UNLESS** MERGECELLS IS SET TO TRUE
       if objFormElement.MergeCells=true then
   			strHTML=strHTML & "<br>"
   	   else
   	   		strHTML=strHTML & "</td><td valign=top>" & vbcrlf
   	   end if
       
       
       'FIX FOR HIDDEN FIELDS - to prevent htem from taking up their own row
       'if this field type is hidden, then throw out above
       if objFormElement.ElementType="HIDDEN" then
       	strHTML=""
       end if
       
       
       'GO THROUGH FIELD TYPES AND ADD HTML
       If objFormElement.ElementType = "SELECT" then
       	  
          strHTML=strHTML & "<select name=""" & objFormElement.Name & """"

          If Len(objFormElement.Size) = 1 then
             strHTML = strHTML & " size=" & objFormElement.Size
          End If
		  'IF SELECT SIZE IS GREATER THAN 1, MAKE MULTIPLE
          If Len(objFormElement.Size) > 1 then
             strHTML = strHTML & " size=" & objFormElement.Size & " multiple "
          End If
          
          'close select tag, add post html options
          strHTML = strHTML & ">" & vbCrLf & _
                    objFormElement.PostHTML & _
                    vbCrLf & "</SELECT>" & vbCrLf & vbCrLf



       	Elseif objFormElement.ElementType = "TEXTAREA" then
                 			
          strHTML=strHTML & "<textarea name=""" & objFormElement.Name & """ id=""" & objFormElement.Name & """"

          If Len(objFormElement.Size) > 0 then
             strHTML = strHTML & " cols=""" & objFormElement.Size & _
                    """ rows=""" & objFormElement.Size / 4
          End If

          strHTML = strHTML & """>" & objFormElement.Value & "</textarea>" & _ 
		         vbCrLf & objFormElement.PostHTML & _
                   vbCrLf & vbCrLf
                   
                   
       Else 'must be one of the other types
          strHTML = strHTML &   "<INPUT NAME=""" & objFormElement.Name & """"

          If Len(objFormElement.Size) > 0 then
             strHTML = strHTML & " SIZE=" & objFormElement.Size
          End If

          If Len(objFormElement.Value) > 0 then
             strHTML = strHTML & " VALUE=""" & objFormElement.Value & """"
          End If


          strHTML = strHTML & " TYPE=" & objFormElement.ElementType & _
                    ">" & vbCrLf & objFormElement.PostHTML & _
                    vbCrLf & vbCrLf
       End If
       
       
       'Close out the row if this is not a hidden field
		if objFormElement.ElementType<>"HIDDEN" then
	       strHTML=strHTML & "</td></tr>"
		end if
		
       'Add the HTML to the FormElement dictionary
       
       objFormElementDict.Add objFormElement.Name, strHTML
       


		'THIS IS A HACK ADDITION TO THIS CODE.
		'A NEW ValNameString VALUE is the field name with AN * TACKED ON TO BEGINNING IF FIELD IS REQUIRED
		'AND THE REGULAR EXPRESSION TACKED ONTO THE END IF THERE IS ONE PRESENT
		'WE'RE DOING THIS BECAUSE WE WON'T HAVE ACCESS TO ALL THE ELEMENT FIELDS IN THE
		'VALIDATION FUNCTION. ONLY WHAT WE ADD TO THE VALIDATIONMESSAGE DICTIONARY OBJECT
       
       dim ValNameString
       ValNameString=objFormElement.Name
       
       dim ValidationMessage
       if objFormElement.ValidationMessage<>"" then
       		ValidationMessage=objFormElement.ValidationMessage
       	else
       		ValidationMessage=objFormElement.Name & " is not valid!"
       	end if
       	
       	'update valNameString to have validation info for us
       If Len(objFormElement.RegularExpression) > 0 then
          ValNameString= objFormElement.Name & "!" & _
                             objFormElement.RegularExpression
       End if
      
       If objFormElement.Required =True then
          ValNameString= "*" & ValNameString
       End if
       
       'Add Validation Message to other dictionary
       objValidationMsgDict.Add ValNameString, ValidationMessage



       
     End Function


     Public Function GenerateForm()
       'Iterates through the objFormElementDict collection and
       'generates the resulting form
       Dim strResultingForm

       strResultingForm = "<FORM NAME=""" & strFormName & _
                          """ METHOD="
       If strCollection = "QueryString" then
          strResultingForm = strResultingForm & "GET"
       Else
          strResultingForm = strResultingForm & "POST"
       End If

       strResultingForm = strResultingForm & " ACTION=""" & _
            strFormAction & """ ONSUBMIT=""return ValidateData();"">" & _
            vbCrLf

       'Add the HIDDEN form variables
       strResultingForm = strResultingForm & vbTab & "<INPUT TYPE=HIDDEN " & _
                "NAME=Collection VALUE=""" & strCollection & """>" & vbCrLf & _
                vbTab & "<INPUT TYPE=HIDDEN NAME=Redirect VALUE=""" & _
                strRedirect & """>" & vbCrLf

		'Start form table
		strResultingForm =strResultingForm  & "<table class=""" & strTableCssClass & """ "
		if strTableWidth<>"" then strResultingForm=strResultingForm & " width=""" & strTableWidth & """"
		strResultingForm=strResultingForm &">"

       'Iterate through the form element dictionary, outputting the
       'form field elements
       Dim strName
       For Each strName in objFormElementDict
         strResultingForm = strResultingForm & vbTab & objFormElementDict(strName)
       Next

	   'add submit button
       strResultingForm = strResultingForm & "<tr><td>&nbsp;</td><td colspan=""2""><INPUT Class=""submit"" TYPE=SUBMIT VALUE=""" & _
              strSubmitTitle & """></td>" & vbCrLf & vbCrLf
       'close the table
       strResultingForm =strResultingForm  & "</table>"
       'close the form
       strResultingForm = strResultingForm & "</FORM>" & vbCrLf & vbCrLf

       GenerateForm = strResultingForm
     End Function


     Public Function GenerateValidation()
     
       'Creates the client-side validation code
       Dim strCode
       strCode = "<SCRIPT LANGUAGE=""JavaScript"">" & vbCrLf & "<!--" & vbCrLf & _
                 "function ValidateData()" & vbCrLf & "{" & vbCrLf & _
                 vbTab & "var iLoop;" & vbCrLf & vbCrLf

       'Now, for each form element that contains regular expression code,
       'prepare it for validation!
       Dim strName, strRegExp,ErrorMsg,strNameWithoutValidation
       For Each strName in objValidationMsgDict
       
          'Get Validation Error Message
	       ErrorMsg=objValidationMsgDict(strName)
	       'fix for single quotes
	     	ErrorMsg=replace(ErrorMsg,"'","\'")
       
          'Get the Name without Validation
          
          if left(strName,1)="*" then
	          strNameWithoutValidation=right(strName,len(strName)-1)
	      else
	      	  strNameWithoutValidation=strName
	      end if
	      if instr(1,strName,"!") then
	      	  strNameWithoutValidation=left(strNameWithoutValidation,instr(strNameWithoutValidation,"!")-1)
	      end if
       
       	  'FIRST CHECK FOR EMPTY FIELDS
       	  
           If left(strName,1)="*" then
             'We have a required field!!  
             
             strCode = strCode & vbTab & "if (document.forms['" & strFormName & _
                      "'].elements['" & Replace(strNameWithoutValidation,"\","\\") & _
                      "'].value=='') {" & vbCrLf & _
                      vbTab & vbTab & "alert('" & ErrorMsg & "');" & _
                      vbCrLf & vbTab & vbTab & "return false;" & vbCrLf & vbTab & _
                      "}" & vbCrLf
          End If      	  
       	  
       	  
       	  'THEN CHECK FOR REGULAR EXPRESSIONS
          If InStr(1,strName,"!") then
             'We have form validation!!  Grab the regexp
             strRegExp = Right(strName, Len(strName) - InStr(1,strName,"!"))
             
             strCode = strCode & vbTab & "if (document.forms['" & strFormName & _
                      "'].elements['" & Replace(strNameWithoutValidation,"\","\\") & _
                      "'].value.search(/" & strRegExp & "/) == -1) {" & vbCrLf & _
                      vbTab & vbTab & "alert('" & ErrorMsg & "');" & _
                      vbCrLf & vbTab & vbTab & "return false;" & vbCrLf & vbTab & _
                      "}" & vbCrLf
          End If
       Next
       strCode = strCode & vbCrLf & vbTab & "return true;" & vbCrLf
       strCode = strCode & "}" & vbCrLf
       strCode = strCode & vbCrLf & "// -->" & vbCrLf & "</SCRIPT>" & vbCrLf

       GenerateValidation = strCode
     End Function     


     Public Function GenerateHTMLDocument(strTitleHTML)
       'This method generates the HTML/BODY tags, the form and client-side
       'form validation all in one call
       Dim strResultHTML
       strResultHTML = "<HTML><HEAD>" & vbCrLf & GenerateValidation() & _
                       "</HEAD>" & vbCrLf
       strResultHTML = strResultHTML & "<BODY>" & vbCrLf & strTitleHTML & _
               vbCrLf & GenerateForm() & vbCrLf & "</BODY></HTML>"

       GenerateHTMLDocument = strResultHTML
     End Function
     '**************************************************
   End Class


   Class FormElement
     '****************** PROPERTIES ********************
     Private strName
     Private strRegExp
     Private strType
     Private strPreHTML
     Private strPostHTML
     Private strSize
     Private strValue
     Private bRequired
     Private strValidationMessage
     Private bMergeCells
     '**************************************************


     '************* PROPERTY LET STATMENTS *************
     Public Property Let Name(str)
        strName = str
     End Property

     Public Property Let RegularExpression(str)
        strRegExp = str
     End Property

     Public Property Let ElementType(str)
        'Only one of six types possible: SELECT, TEXTAREA, TEXT,
        '    RADIO, HIDDEN, or CHECKBOX (TEXT is the default)
        If Ucase(str) = "TEXT" OR Ucase(str) = "SELECT" _
               OR Ucase(str) = "TEXTAREA" OR Ucase(str) = "RADIO" _
               OR Ucase(str) = "CHECKBOX" OR UCase(str) = "HIDDEN" then
          strType = str
        Else
          strType = "TEXT"      'TEXT is the default type
        End If
     End Property

     Public Property Let Size(str)
        strSize = str
     End Property

     Public Property Let PreHTML(str)
        strPreHTML = str
     End Property

     Public Property Let PostHTML(str)
        strPostHTML = str
     End Property

     Public Property Let Value(str)
        strValue = str
     End Property
     
     Public Property Let Required(bool)
     	if bool<>true then
	     	bRequired=false
	     else
	     	bRequired=true
	     end if
     End Property
     
     Public Property Let ValidationMessage(str)
     	strValidationMessage=str
     End Property
     
     Public Property Let MergeCells(bool)
     	if bool=true then
     		bMergeCells=true
     	else
     		bMergeCells=false
     	end if
     End Property
     
     '**************************************************


     '************* PROPERTY GET STATMENTS *************
     Public Property Get Name()
        Name = strName
     End Property

     Public Property Get RegularExpression()
        RegularExpression = strRegExp
     End Property

     Public Property Get ElementType()
        ElementType = strType
     End Property

     Public Property Get Size()
        Size = strSize
     End Property

     Public Property Get PreHTML()
        PreHTML = strPreHTML
     End Property

     Public Property Get PostHTML()
        PostHTML = strPostHTML
     End Property

     Public Property Get Value()
        Value = strValue
     End Property
     
     Public Property Get Required()
     	Required=bRequired
     End Property
     
     Public Property Get ValidationMessage()
     	ValidationMessage=strValidationMessage
     End Property
     
     Public Property Get MergeCells()
     	MergeCells=bMergeCells
     End Property
     '**************************************************


     '********************* METHODS ********************
     Public Sub Clear()
        strName = ""
        strRegExp = ""
        strType = ""
        strSize = ""
        strPreHTML = ""
        strPostHTML = ""
        strValue = ""
        bRequired=false
        strValidationMessage=""
        bMergeCells=false
     End Sub
     '**************************************************
   End Class
%>