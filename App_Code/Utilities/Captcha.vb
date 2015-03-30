Imports Microsoft.VisualBasic
Imports System.Runtime.Serialization
Imports System.Runtime.Serialization.Json

Namespace Utilities

	Public Class Captcha
		Public Shared Function ValidateCaptcha(ByVal response As String) As recaptchaResponse
			Dim secretKey As String = System.Configuration.ConfigurationManager.AppSettings("recaptcha.secretKey")
			Dim wc As Net.WebClient = New Net.WebClient

			Dim url As String = "https://www.google.com/recaptcha/api/siteverify?secret={0}&response={1}&remoteip={2}"

			Dim resp As String = wc.DownloadString(String.Format(url, secretKey, response, HttpContext.Current.Request.ServerVariables("remote_host")))
			wc.Dispose()

			Dim validation As recaptchaResponse = JsonHelper.JsonDeserialize(Of recaptchaResponse)(resp)

			Return validation
		End Function
	End Class

	Public Class recaptchaResponse
		Public Property success As Boolean
	End Class
End Namespace