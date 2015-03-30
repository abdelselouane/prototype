
Partial Class Contact_Us
    Inherits System.Web.UI.Page

	Protected Sub SubmitForm1Button_Click(sender As Object, e As EventArgs) Handles SubmitForm1Button.Click

		Dim _selection As New ArrayList
		Dim _talkAbout1 As ArrayList = GetCheckedItems.GetCheckedItemValues(talkAbout1, _selection)
		Dim _talkAbout2 As ArrayList = GetCheckedItems.GetCheckedItemValues(talkAbout2, _selection)
		Dim _talkAbout3 As ArrayList = GetCheckedItems.GetCheckedItemValues(talkAbout3, _selection)
		Dim _talkAbout As String = String.Join(", ", _selection.ToArray())
		Dim _talkAboutOther As String = talkAboutOther.Value.Trim()
		Dim _firstName As String = firstName.Value.Trim()
		Dim _lastName As String = lastName.Value.Trim()
		Dim _email As String = email.Value.Trim()
		Dim _phone As String = phone.Value.Trim()
		Dim _title As String = title.Value.Trim()
		Dim _company As String = company.Value.Trim()
		Dim _city As String = city.Value.Trim()
		Dim _state As String = state.SelectedValue.Trim()
		Dim _zipcode As String = zipcode.Value.Trim()
		Dim _country As String = country.Value.Trim()
		Dim _comments As String = comments.Value.Trim()
		Dim _captchaResponse As String = captchaResponse.Value.Trim()

		Dim formValues As New Dictionary(Of String, String)
		formValues.Add("First name", _firstName)
		formValues.Add("Last name", _lastName)
		formValues.Add("Email", _email)
		formValues.Add("Company", _company)
		formValues.Add("City", _city)
		formValues.Add("State", _state)
		formValues.Add("Zip", _zipcode)

		For Each k As KeyValuePair(Of String, String) In formValues
			If String.IsNullOrEmpty(k.Value) Then
				sok_ErrorMessage.Text = "<br />" + k.Key + " is a required field."
				Exit Sub
			End If
		Next

		If Not Regex.Match(_email, "([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})").Success Then
			sok_ErrorMessage.Text = "<br />Email is not in a valid format"
			Exit Sub
		End If

		If Not Utilities.Captcha.ValidateCaptcha(_captchaResponse).success Then
			sok_ErrorMessage.Text = "<br />The reCaptcha response is missing."
			Exit Sub
		End If

		Dim emailTemplate As String = ConfigurationManager.AppSettings("contact.layout")
		Dim emailTo As String = ConfigurationManager.AppSettings("contact.email.to")
		Dim emailFrom As String = _email
		Dim redirect As String = ConfigurationManager.AppSettings("contact.redirect")

		emailTemplate = Server.MapPath(emailTemplate)
		Dim message As String = IO.File.ReadAllText(emailTemplate)

		message = message.Replace("$TALKABOUT$", _talkAbout)
		message = message.Replace("$TALKABOUTOTHER$", _talkAboutOther)
		message = message.Replace("$FIRSTNAME$", _firstName)
		message = message.Replace("$LASTNAME$", _lastName)
		message = message.Replace("$EMAIL$", _email)
		message = message.Replace("$PHONE$", _phone)
		message = message.Replace("$TITLE$", _title)
		message = message.Replace("$COMPANY$", _company)
		message = message.Replace("$CITY$", _city)
		message = message.Replace("$STATE$", _state)
		message = message.Replace("$ZIP$", _zipcode)
		message = message.Replace("$COUNTRY$", _country)
		message = message.Replace("$COMMENTS$", _comments)

		Utilities.Mail.SendMail(emailFrom, emailTo, "Phototype Contact Us Form - " & _firstName & " " & _lastName, message)
		Response.Redirect(redirect)
	End Sub
End Class
