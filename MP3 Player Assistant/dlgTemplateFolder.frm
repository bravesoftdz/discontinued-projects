VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form dlgTemplateFolder 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Ӧ��ģ���ļ���"
   ClientHeight    =   4935
   ClientLeft      =   6270
   ClientTop       =   3975
   ClientWidth     =   6735
   Icon            =   "dlgTemplateFolder.frx":0000
   LinkTopic       =   "Form1"
   LockControls    =   -1  'True
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4935
   ScaleWidth      =   6735
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  '����������
   WhatsThisButton =   -1  'True
   WhatsThisHelp   =   -1  'True
   Begin MSComctlLib.ImageList iltTemplate 
      Left            =   720
      Top             =   4440
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   4
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgTemplateFolder.frx":058A
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgTemplateFolder.frx":0B24
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgTemplateFolder.frx":10BE
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgTemplateFolder.frx":1658
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.TreeView tvwFolder 
      Height          =   3975
      Left            =   2760
      TabIndex        =   5
      Top             =   360
      Width           =   3855
      _ExtentX        =   6800
      _ExtentY        =   7011
      _Version        =   393217
      HideSelection   =   0   'False
      Indentation     =   441
      LabelEdit       =   1
      Sorted          =   -1  'True
      Style           =   7
      ImageList       =   "iltTemplate"
      Appearance      =   1
   End
   Begin VB.CommandButton cmdCancel 
      Cancel          =   -1  'True
      Caption         =   "�ر�"
      Height          =   375
      Left            =   5640
      TabIndex        =   4
      Top             =   4440
      Width           =   975
   End
   Begin VB.CommandButton cmdApply 
      Caption         =   "Ӧ��(&A)"
      Default         =   -1  'True
      Height          =   375
      Left            =   4560
      TabIndex        =   3
      Top             =   4440
      Width           =   975
   End
   Begin MSComctlLib.Toolbar tbrTemplate 
      Height          =   330
      Left            =   90
      TabIndex        =   2
      Top             =   30
      Width           =   1095
      _ExtentX        =   1931
      _ExtentY        =   582
      ButtonWidth     =   609
      ButtonHeight    =   582
      Style           =   1
      ImageList       =   "iltToolbar"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   3
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "���ģ��"
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "ɾ��ģ��"
            ImageIndex      =   2
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "�༭ģ������"
            ImageIndex      =   3
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList iltToolbar 
      Left            =   120
      Top             =   4440
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   4
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgTemplateFolder.frx":1BF2
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgTemplateFolder.frx":218C
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgTemplateFolder.frx":2726
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgTemplateFolder.frx":2CC0
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.Toolbar tbrFolder 
      Height          =   330
      Left            =   5190
      TabIndex        =   1
      Top             =   30
      Width           =   1455
      _ExtentX        =   2566
      _ExtentY        =   582
      ButtonWidth     =   609
      ButtonHeight    =   582
      Style           =   1
      ImageList       =   "iltToolbar"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   4
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "���ͬ���ļ���"
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "������ļ���"
            ImageIndex      =   4
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "ɾ���ļ���"
            ImageIndex      =   2
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Object.ToolTipText     =   "�༭�ļ�������"
            ImageIndex      =   3
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView lvwTemplate 
      Height          =   3975
      Left            =   120
      TabIndex        =   0
      Top             =   360
      Width           =   2595
      _ExtentX        =   4577
      _ExtentY        =   7011
      View            =   3
      LabelEdit       =   1
      Sorted          =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      HideColumnHeaders=   -1  'True
      FullRowSelect   =   -1  'True
      _Version        =   393217
      SmallIcons      =   "iltTemplate"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      Appearance      =   1
      NumItems        =   1
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Object.Width           =   4366
      EndProperty
   End
End
Attribute VB_Name = "dlgTemplateFolder"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub cmdApply_Click()
  Template.ApplyTemplate lvwTemplate.selectedItem.Text
  Unload Me
End Sub

Private Sub cmdCancel_Click()
  Unload Me
End Sub

Private Sub Form_Load()
  '���ģ�������
  Dim i As Long
  
  For i = 1 To oNames.Count
    lvwTemplate.ListItems.Add , oNames(i), oNames(i), , 1
  Next i
  
  'ѡ��һ����Ŀ
  If lvwTemplate.ListItems.Count Then
    lvwTemplate.ListItems(1).Selected = True
    lvwTemplate_ItemClick lvwTemplate.selectedItem
  Else
    cmdApply.Enabled = False
  End If
End Sub

Private Sub lvwTemplate_DblClick()
  tbrTemplate_ButtonClick tbrTemplate.Buttons(3)
End Sub

Private Sub lvwTemplate_ItemClick(ByVal Item As MSComctlLib.ListItem)
  '������ʾ
  Dim sFolders() As String
  Dim sParent As String
  Dim sFolderName As String
  Dim sPath As String
  Dim lPos As Long
  Dim oFolders As New VBA.Collection
  Dim i As Long
  
  '���������ļ���
  Set oFolders = oTemplates(Item.Text)
  
  If oFolders.Count Then
    ReDim sFolders(oFolders.Count - 1)
    
    For i = 1 To oFolders.Count
      sFolders(i - 1) = oFolders(i)
    Next i
    
    QuickSort.QuickSort sFolders, 0, oFolders.Count - 1
    
    '��ӵ�����ͼ
    tvwFolder.Nodes.Clear
    tvwFolder.Nodes.Add , , "ROOT", "ROOT", 4, 4
    
    For i = 0 To UBound(sFolders)
      sPath = sFolders(i)
      lPos = InStrRev(sPath, "\")
      
      If lPos Then
        sParent = Left(sPath, lPos - 1)
        sFolderName = Right(sPath, Len(sPath) - lPos)
        
        If ItemExistOBJ(sParent, tvwFolder.Nodes) Then
          tvwFolder.Nodes.Add sParent, tvwChild, sPath, sFolderName, 2, 3
        End If
      End If
    Next i
  Else
    '��ӵ�����ͼ
    tvwFolder.Nodes.Clear
    tvwFolder.Nodes.Add , , "ROOT", "ROOT", 4, 4
  End If
  
  'ȫ��չ��
  For i = 1 To tvwFolder.Nodes.Count
    tvwFolder.Nodes(i).Expanded = True
    tvwFolder.Nodes(i).Sorted = True
  Next i
End Sub

Private Sub tbrFolder_ButtonClick(ByVal Button As MSComctlLib.Button)
  Dim sOld As String
  Dim sNew As String
  Dim sPath As String
  Dim nTemplate As New VBA.Collection
  Dim MSG As String
  Dim i As Long
  
  If tvwFolder.selectedItem Is Nothing Then Exit Sub
  
  Select Case Button.Index
  '======================
  ' ���һ��ͬ�����ļ���
  '======================
  Case 1
    If tvwFolder.selectedItem.Key = "ROOT" Then
      MsgBox "�����ܴ����� ROOT ͬ������ļ��С�", vbCritical, App.FileDescription
      Exit Sub
    End If
    
AddFolder:
    MSG = "������Ҫ���ͬ���ļ��е����ơ�"
    sNew = InputBox(MSG, App.FileDescription, "���ļ���")
    
    If Len(sNew) = 0 Then Exit Sub
    
    sPath = AppendPath(tvwFolder.selectedItem.Parent.Key, sNew)
    
    If ItemExistOBJ(sPath, tvwFolder.Nodes) Then
      MsgBox "�Ѿ������ļ��С�" & sNew & "������ѡ����������", vbInformation, App.FileDescription
      GoTo AddFolder
      Exit Sub
    End If
    
    If Not IsFileName(sNew) Then
      MsgBox "������ġ� " & sNew & "������һ���Ϸ���Ŀ¼���ơ�", vbInformation, App.FileDescription
      GoTo AddFolder
      Exit Sub
    End If
    
    '���һ����Ŀ
    tvwFolder.Nodes.Add tvwFolder.selectedItem.Index, tvwLast, sPath, sNew, 2, 3
  
  '======================
  ' ���һ���Ӽ����ļ���
  '======================
  Case 2
AddChildFolder:
    MSG = "������Ҫ����Ӽ��ļ��е����ơ�"
    sNew = InputBox(MSG, App.FileDescription, "���ļ���")
    
    If Len(sNew) = 0 Then Exit Sub
    
    sPath = AppendPath(tvwFolder.selectedItem.Key, sNew)
    
    If ItemExistOBJ(sPath, tvwFolder.Nodes) Then
      MsgBox "�Ѿ������ļ��С�" & sNew & "������ѡ����������", vbInformation, App.FileDescription
      GoTo AddChildFolder
      Exit Sub
    End If
    
    If Not IsFileName(sNew) Then
      MsgBox "������ġ� " & sNew & "������һ���Ϸ���Ŀ¼���ơ�", vbInformation, App.FileDescription
      GoTo AddChildFolder
      Exit Sub
    End If
    
    '���һ����Ŀ
    tvwFolder.Nodes.Add tvwFolder.selectedItem.Index, tvwChild, sPath, sNew, 2, 3
    
  '==================
  ' ɾ��ѡ����ļ���
  '==================
  Case 3
    If tvwFolder.selectedItem.Key = "ROOT" Then
      MsgBox "������ɾ�� ROOT �ļ��С�", vbCritical, App.FileDescription
      Exit Sub
    End If
    
    tvwFolder.Nodes.Remove tvwFolder.selectedItem.Key
    
  '==============
  ' �������ļ���
  '==============
  Case 4
    If tvwFolder.selectedItem.Key = "ROOT" Then
      MsgBox "������������ ROOT �ļ��С�", vbCritical, App.FileDescription
      Exit Sub
    End If

EditFolder:
    sOld = tvwFolder.selectedItem.Text
    MSG = "������Ҫ����Ӽ��ļ��е����ơ�"
    sNew = InputBox(MSG, App.FileDescription, "���ļ���")
    
    If Len(sNew) = 0 Then Exit Sub
    If sNew = sOld Then Exit Sub
    
    sPath = AppendPath(tvwFolder.selectedItem.Parent.Key, sNew)
    
    If ItemExistOBJ(sPath, tvwFolder.Nodes) Then
      MsgBox "�Ѿ������ļ��С�" & sNew & "������ѡ����������", vbInformation, App.FileDescription
      GoTo EditFolder
      Exit Sub
    End If
    
    If Not IsFileName(sNew) Then
      MsgBox "������ġ� " & sNew & "������һ���Ϸ���Ŀ¼���ơ�", vbInformation, App.FileDescription
      GoTo EditFolder
      Exit Sub
    End If
    
    tvwFolder.selectedItem.Key = sPath
    tvwFolder.selectedItem.Text = sNew
  End Select
  
  '������ѡ��Ŀ�ļ���
'  Set nTemplate = oTemplates.Item(lvwTemplate.selectedItem.Key)
'  Set nTemplate = New VBA.Collection
  If tvwFolder.Nodes.Count > 1 Then
    For i = 2 To tvwFolder.Nodes.Count
      nTemplate.Add tvwFolder.Nodes(i).FullPath
    Next i
  End If
  
  oTemplates.Remove lvwTemplate.selectedItem.Text
  oTemplates.Add nTemplate, lvwTemplate.selectedItem.Text
End Sub

Private Sub tbrTemplate_ButtonClick(ByVal Button As MSComctlLib.Button)
  Dim MSG As String
  Dim sOld As String
  Dim sNew As String
  Dim lIdx As Long
  Dim nTemplate As New VBA.Collection
  Dim nListItem As MSComctlLib.ListItem
  
  'ģ����ع�����
  Select Case Button.Index
  '==============
  ' ���һ��ģ��
  '==============
  Case 1
AddTemplate:
    MSG = "������Ҫ���ģ������ơ�"
    sNew = InputBox(MSG, App.FileDescription, "��ģ��")
    
    If Len(sNew) = 0 Then Exit Sub
    
    If ItemExistOBJ(sNew, lvwTemplate.ListItems) Then
      MsgBox "�Ѿ�����ģ�塰" & sNew & "������ѡ����������", vbInformation, App.FileDescription
      GoTo AddTemplate
      Exit Sub
    End If
    
    '�����ģ��
    oNames.Add sNew, sNew
    oTemplates.Add nTemplate, sNew
    Set nListItem = lvwTemplate.ListItems.Add(, sNew, sNew, , 1)
    nListItem.Selected = True
    lvwTemplate_ItemClick nListItem
    cmdApply.Enabled = True
    
  '==============
  ' ɾ��һ��ģ��
  '==============
  Case 2
    If lvwTemplate.selectedItem Is Nothing Then Exit Sub
    
    sNew = lvwTemplate.selectedItem.Text
    lIdx = lvwTemplate.selectedItem.Index
    Set nTemplate = oTemplates(sNew)
    Set nTemplate = Nothing
    oNames.Remove sNew
    oTemplates.Remove sNew
    lvwTemplate.ListItems.Remove lIdx
    
    '������ʾ
    If oNames.Count = 0 Then
      tvwFolder.Nodes.Clear
      cmdApply.Enabled = False
    ElseIf oNames.Count < lIdx Then
      lvwTemplate.ListItems(lIdx - 1).Selected = True
      lvwTemplate_ItemClick lvwTemplate.selectedItem
    Else
      lvwTemplate.ListItems(lIdx).Selected = True
      lvwTemplate_ItemClick lvwTemplate.selectedItem
    End If
  
  '==============
  ' ����һ��ģ��
  '==============
  Case 3
RenameTemplate:
    If lvwTemplate.selectedItem Is Nothing Then Exit Sub
    
    sOld = lvwTemplate.selectedItem.Text
    MSG = "��������ҪΪ��" & sOld & "����Ҫ���¸����������֡�"
    sNew = InputBox(MSG, App.FileDescription, "��ģ��")
    
    If Len(sNew) = 0 Then Exit Sub
    If sOld = sNew Then Exit Sub
    If ItemExistOBJ(sNew, lvwTemplate.ListItems) Then
      MsgBox "�Ѿ�����ģ�塰" & sNew & "������ѡ����������", vbInformation, App.FileDescription
      GoTo RenameTemplate
      Exit Sub
    End If
    
    '������
    Set nTemplate = oTemplates(sOld)
    oTemplates.Remove sOld
    oNames.Remove sOld
    lvwTemplate.ListItems.Remove sOld
    oNames.Add sNew, sNew
    oTemplates.Add nTemplate, sNew
    Set nListItem = lvwTemplate.ListItems.Add(, sNew, sNew, , 1)
    nListItem.Selected = True
  End Select
End Sub
