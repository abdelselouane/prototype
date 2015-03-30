Imports Microsoft.VisualBasic

Public Class GetCheckedItems
	Public Shared Function GetCheckedItemValues(Items As CheckBoxList, Selected As ArrayList) As ArrayList

		For Each li As ListItem In Items.Items
			If li.Selected = True Then
				Selected.Add(li.Value)
			End If
		Next

		Return Selected
	End Function
End Class
