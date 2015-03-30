Imports Microsoft.VisualBasic
Imports System
Imports System.Web
Imports System.Net.Mail

Namespace Utilities

	Public Class Mail
		Public Shared Function SendMail(ByVal emailFrom As String, ByVal emailTo As String, ByVal subject As String, ByVal body As String, Optional ByVal isBodyHtml As Boolean = False) As Boolean

			Dim smtp As New SmtpClient()

			Dim message As New MailMessage

			message.From = New MailAddress(emailFrom)
			message.To.Add(emailTo)
			message.Subject = subject
			message.IsBodyHtml = isBodyHtml
			message.Body = body

			If HttpContext.Current.Request.Files.Count > 0 Then
				Dim f As HttpPostedFile
				Dim s As String
				Dim a As Net.Mail.Attachment
				For Each s In HttpContext.Current.Request.Files
					f = HttpContext.Current.Request.Files(s)
					If f.ContentLength = 0 Then Continue For
					a = New Net.Mail.Attachment(f.InputStream, f.FileName)
					message.Attachments.Add(a)
				Next
			End If

			Try
				smtp.Send(message)
				message.Dispose()

			Catch ex As SmtpException
				Return False
			End Try

			Return True

		End Function
	End Class

End Namespace