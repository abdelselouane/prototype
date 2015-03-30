Imports System.IO
Imports System.Text
Imports System.Text.RegularExpressions

Public Class ReplaceRegisterSymbol
	Inherits BaseFilter

	Dim _elementOpen, _elementClose As String
	Dim _buffer As StringBuilder = New StringBuilder

	Public Sub New(ByVal stream As IO.Stream, ByVal elementOpen As String, ByVal elementClose As String)
		MyBase.New(stream)
		_elementOpen = elementOpen
		_elementClose = elementClose
	End Sub

	Public Overrides Sub Write(ByVal buffer() As Byte, ByVal offset As Integer, ByVal count As Integer)
		Try
			_buffer.Append(UTF8Encoding.UTF8.GetString(buffer, offset, count))

			Dim match As Match = New Regex(_elementClose, RegexOptions.IgnoreCase).Match(_buffer.ToString())

			If match.Success Then
				Dim data As Byte() = UTF8Encoding.UTF8.GetBytes(_buffer.ToString().Replace("(sm)", "<small><sup>SM</sup></small>").Replace("(c)", "&copy;"))
				InnerStream.Write(data, 0, data.Length)
			End If

		Catch ex As Exception
			Throw New Exception(ex.Message)
		Finally

		End Try

	End Sub

End Class