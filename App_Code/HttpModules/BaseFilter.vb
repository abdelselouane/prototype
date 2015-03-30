﻿Imports System.IO

Public MustInherit Class BaseFilter
	Inherits System.IO.Stream

	Dim _stream As IO.Stream

	Public Overrides ReadOnly Property CanRead() As Boolean
		Get
			Return _stream.CanRead
		End Get
	End Property

	Public Overrides ReadOnly Property CanSeek() As Boolean
		Get
			Return _stream.CanSeek
		End Get
	End Property

	Public Overrides ReadOnly Property CanWrite() As Boolean
		Get
			Return _stream.CanWrite
		End Get
	End Property

	Public Overrides Sub Flush()
		_stream.Flush()
	End Sub

	Public Overrides ReadOnly Property Length() As Long
		Get
			Return _stream.Length
		End Get
	End Property

	Public Overrides Property Position() As Long
		Get
			Return _stream.Position
		End Get
		Set(ByVal value As Long)
			_stream.Position = value
		End Set
	End Property

	Public Overrides Function Read(ByVal buffer() As Byte, ByVal offset As Integer, ByVal count As Integer) As Integer
		Return _stream.Read(buffer, offset, count)
	End Function

	Public Overrides Function Seek(ByVal offset As Long, ByVal origin As System.IO.SeekOrigin) As Long
		Return _stream.Seek(offset, origin)
	End Function

	Public Overrides Sub SetLength(ByVal value As Long)
		_stream.SetLength(value)
	End Sub

	Public Overrides Sub Write(ByVal buffer() As Byte, ByVal offset As Integer, ByVal count As Integer)
		_stream.Write(buffer, offset, count)
	End Sub

	Protected Sub New(ByVal Stream As IO.Stream)
		_stream = Stream
	End Sub

	Protected ReadOnly Property InnerStream() As IO.Stream
		Get
			Return _stream
		End Get
	End Property
End Class