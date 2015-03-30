Imports Microsoft.VisualBasic
Imports System.Web

Public Class FilterModule
	Implements IHttpModule

	Dim App As HttpApplication

	Public Sub Init(context As HttpApplication) Implements IHttpModule.Init
		App = context
		AddHandler context.BeginRequest, AddressOf Application_BeginRequest
		AddHandler context.EndRequest, AddressOf Application_EndRequest
	End Sub

	Private Sub Application_BeginRequest(ByVal source As Object, ByVal e As EventArgs)
		Dim path As String = App.Request.Path.ToLower
		Dim bOK As Boolean = False

		If path.EndsWith("/") Then
			bOK = True
		Else
			Dim r As Regex = New Regex(ConfigurationManager.AppSettings("extension.types"))
			bOK = r.IsMatch(path)
		End If

		If bOK Then App.Response.Filter = New ReplaceRegisterSymbol(App.Response.Filter, "", "</html>")
	End Sub

	Private Sub Application_EndRequest(ByVal source As Object, ByVal e As EventArgs)
	End Sub

	Public Sub Dispose() Implements IHttpModule.Dispose

	End Sub
End Class
