VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form dlgAddFavFolder 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "�½��ղؼ�Ŀ¼"
   ClientHeight    =   6630
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5670
   Icon            =   "dlgAddFavFolder.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   6630
   ScaleWidth      =   5670
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  '��Ļ����
   WhatsThisButton =   -1  'True
   WhatsThisHelp   =   -1  'True
   Begin VB.CommandButton OKButton 
      Caption         =   "ȷ��"
      Default         =   -1  'True
      Height          =   375
      Left            =   2760
      TabIndex        =   6
      Top             =   6120
      Width           =   1335
   End
   Begin VB.CommandButton CancelButton 
      Cancel          =   -1  'True
      Caption         =   "ȡ��"
      Height          =   375
      Left            =   4200
      TabIndex        =   7
      Top             =   6120
      Width           =   1335
   End
   Begin VB.Frame fraParent 
      Caption         =   "���ղؼ�Ŀ¼"
      ForeColor       =   &H00D54600&
      Height          =   3735
      Left            =   120
      TabIndex        =   3
      Top             =   2280
      Width           =   5415
      Begin MSComctlLib.TreeView tvwParent 
         Height          =   3135
         Left            =   120
         TabIndex        =   5
         Top             =   480
         Width           =   5175
         _ExtentX        =   9128
         _ExtentY        =   5530
         _Version        =   393217
         HideSelection   =   0   'False
         Indentation     =   441
         LabelEdit       =   1
         Sorted          =   -1  'True
         Style           =   7
         ImageList       =   "iltFavourite"
         Appearance      =   1
      End
      Begin VB.Label lblParent 
         AutoSize        =   -1  'True
         Caption         =   "��ѡ��һ���Ѵ��ڵ�Ŀ¼����Ŀ¼�ĸ�(&P):"
         Height          =   180
         Left            =   120
         TabIndex        =   4
         Top             =   240
         Width           =   3420
      End
   End
   Begin VB.Frame fraType 
      Caption         =   "�ղؼ�����"
      ForeColor       =   &H00D54600&
      Height          =   1695
      Left            =   120
      TabIndex        =   2
      Top             =   480
      Width           =   5415
      Begin VB.PictureBox picFrame 
         BorderStyle     =   0  'None
         HasDC           =   0   'False
         Height          =   1335
         Left            =   120
         ScaleHeight     =   1335
         ScaleWidth      =   5175
         TabIndex        =   8
         TabStop         =   0   'False
         Top             =   240
         Width           =   5175
         Begin VB.OptionButton optType 
            Caption         =   "��׼Ŀ¼(&N)"
            ForeColor       =   &H00D54600&
            Height          =   255
            Index           =   0
            Left            =   360
            TabIndex        =   10
            Top             =   0
            Width           =   4815
         End
         Begin VB.OptionButton optType 
            Caption         =   "�����ļ�Ŀ¼(&M)"
            ForeColor       =   &H00D54600&
            Height          =   255
            Index           =   1
            Left            =   360
            TabIndex        =   9
            Top             =   720
            Value           =   -1  'True
            Width           =   4815
         End
         Begin VB.Image imgType 
            Height          =   240
            Index           =   0
            Left            =   0
            Picture         =   "dlgAddFavFolder.frx":058A
            Top             =   7
            Width           =   240
         End
         Begin VB.Label lblTypeInfo 
            Caption         =   "��ͨĿ¼�����ڷ������ļ����������ڲ鿴��ʱ����ʾ�ļ����ͣ��޸�ʱ�����Ϣ��Ҳ����Ϊ�����һЩע�͡�"
            Height          =   375
            Index           =   0
            Left            =   360
            TabIndex        =   12
            Top             =   262
            Width           =   4815
         End
         Begin VB.Image imgType 
            Height          =   240
            Index           =   1
            Left            =   0
            Picture         =   "dlgAddFavFolder.frx":0B14
            Top             =   727
            Width           =   240
         End
         Begin VB.Label lblTypeInfo 
            Caption         =   "�����ļ��ղؼп��Դ���һЩ���ֵ���Ϣ�����У��������Ժܷ���ز鿴�����ҡ����⡢ר������Ϣ��"
            Height          =   375
            Index           =   1
            Left            =   360
            TabIndex        =   11
            Top             =   982
            Width           =   4815
         End
      End
   End
   Begin VB.TextBox txtName 
      Height          =   270
      Left            =   960
      TabIndex        =   1
      Text            =   "�½�Ŀ¼"
      Top             =   120
      Width           =   4575
   End
   Begin MSComctlLib.ImageList iltFavourite 
      Left            =   120
      Top             =   6120
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   3
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgAddFavFolder.frx":109E
            Key             =   "FAV_ROOT"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgAddFavFolder.frx":1638
            Key             =   "FAV_MUSIC"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgAddFavFolder.frx":1BD2
            Key             =   "FAV_NORMAL"
         EndProperty
      EndProperty
   End
   Begin VB.Label lblName 
      AutoSize        =   -1  'True
      Caption         =   "����(&A):"
      Height          =   180
      Left            =   120
      TabIndex        =   0
      Top             =   165
      Width           =   720
   End
End
Attribute VB_Name = "dlgAddFavFolder"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub CancelButton_Click()
  Unload Me
End Sub

Private Sub Form_Load()
  Dim nND As MSComctlLib.Node
  Dim nNS As MSComctlLib.Node
  
  'ˢ���ļ�����Ϣ
  tvwParent.Nodes.Clear
  tvwParent.Nodes.Add , , "Favourite", "�ղؼ�", 1
  tvwParent.Nodes(1).Selected = True
  tvwParent.Nodes(1).Expanded = True
  
  For i = 2 To frmMain.tvwFavourite.Nodes.Count
    Set nNS = frmMain.tvwFavourite.Nodes(i)
    Set nND = tvwParent.Nodes.Add(nNS.Parent.Key, tvwChild, nNS.Key, nNS.Text, nNS.Image)
    nND.Expanded = True
  Next i
End Sub

Public Sub ShowDialog(Optional ByVal CurrentDir As String = "Favourite")
  '��ʾ�Ի���
  tvwParent.Nodes(CurrentDir).Selected = True
  Me.Show 1
End Sub

Private Sub OKButton_Click()
  '���һ��Ŀ¼
  Dim nText As String
  Dim nPath As String
  Dim oFF As MP3PA.FAVFolder
  Dim oNFF As MP3PA.FAVFolder
  Dim oND As MSComctlLib.Node
  
  '��ӵ�������
  nText = txtName.Text
  Set oFF = oFavCol(tvwParent.selectedItem.Key)
  nPath = AppendPath(oFF.Key, nText)
  Set oNFF = oFF.FavouriteSubFolders.Add(nPath, New MP3PA.FAVItems, nPath)
  oNFF.MusicType = optType(1).Value
  oFavCol.Add oNFF, nPath
  
  'ˢ����
  With frmMain.tvwFavourite.Nodes
    If optType(1).Value Then
      Set oND = .Add(oFF.Key, tvwChild, nPath, nText, 2)
    Else
      Set oND = .Add(oFF.Key, tvwChild, nPath, nText, 3)
    End If
  End With
  
  'ѡ����
  oND.Selected = True
  oND.EnsureVisible
  frmMain.tvwFavourite_NodeClick oND
  
  'ж�ش���
  Unload Me
End Sub

Private Sub txtName_Validate(Cancel As Boolean)
  '��֤����
  Dim nText As String
  Dim oFF As MP3PA.FAVFolder
  
  nText = txtName.Text
  SelAllText txtName
  
  If Len(nText) = 0 Then
    Cancel = True
    MsgBox "û��������ȷ�����ơ�", vbCritical
    Exit Sub
  End If
  
  If CBool(InStr(1, nText, "\")) Or _
     CBool(InStr(1, nText, "/")) Or _
     CBool(InStr(1, nText, ":")) Or _
     CBool(InStr(1, nText, Chr(34))) Or _
     CBool(InStr(1, nText, "|")) Or _
     CBool(InStr(1, nText, "?")) Or _
     CBool(InStr(1, nText, "<")) Or _
     CBool(InStr(1, nText, "*")) Or _
     CBool(InStr(1, nText, ">")) Then
    Cancel = True
    MsgBox "Ŀ¼���ܰ����������֡�" & vbCrLf & "\ / : * ? " & Chr(34) & " < > |", vbCritical
    Exit Sub
  End If
  
  '��֤�����Ƿ��Ѿ�����
  Set oFF = oFavCol(tvwParent.selectedItem.Key)
  
  If oFF.FavouriteSubFolders.Exist(nText) Then
    Cancel = True
    MsgBox "�Ѿ��������Ŀ¼����", vbCritical
    Exit Sub
  End If
End Sub
