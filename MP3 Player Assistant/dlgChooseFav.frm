VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MsComCtl.ocx"
Begin VB.Form dlgChooseFav 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "ѡ���ղؼ�Ŀ¼"
   ClientHeight    =   6630
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   5670
   Icon            =   "dlgChooseFav.frx":0000
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
      Left            =   3000
      TabIndex        =   15
      Top             =   6120
      Width           =   1215
   End
   Begin VB.CommandButton CancelButton 
      Cancel          =   -1  'True
      Caption         =   "ȡ��"
      Height          =   375
      Left            =   4320
      TabIndex        =   14
      Top             =   6120
      Width           =   1215
   End
   Begin VB.Frame fraInfo 
      Caption         =   "�ղؼ�Ŀ¼��Ϣ"
      ForeColor       =   &H00D54600&
      Height          =   1575
      Left            =   120
      TabIndex        =   5
      Top             =   4440
      Width           =   3255
      Begin VB.Label lblSubFolder 
         AutoSize        =   -1  'True
         Caption         =   "��Ŀ¼��Ŀ:"
         Height          =   180
         Left            =   480
         TabIndex        =   13
         Top             =   270
         Width           =   990
      End
      Begin VB.Label ldtSubFolder 
         AutoSize        =   -1  'True
         Height          =   180
         Left            =   1560
         TabIndex        =   12
         Top             =   270
         Width           =   90
      End
      Begin VB.Image imgSubFolder 
         Height          =   240
         Left            =   120
         Picture         =   "dlgChooseFav.frx":058A
         Top             =   240
         Width           =   240
      End
      Begin VB.Label lblSubFile 
         AutoSize        =   -1  'True
         Caption         =   "�ļ���Ŀ:"
         Height          =   180
         Left            =   480
         TabIndex        =   11
         Top             =   590
         Width           =   810
      End
      Begin VB.Label ldtSubFile 
         AutoSize        =   -1  'True
         Height          =   180
         Left            =   1560
         TabIndex        =   10
         Top             =   585
         Width           =   90
      End
      Begin VB.Image imgSubFile 
         Height          =   240
         Left            =   120
         Picture         =   "dlgChooseFav.frx":0B14
         Top             =   560
         Width           =   240
      End
      Begin VB.Label lblParent 
         AutoSize        =   -1  'True
         Caption         =   "��Ŀ¼:"
         Height          =   180
         Left            =   480
         TabIndex        =   9
         Top             =   910
         Width           =   630
      End
      Begin VB.Label ldtParent 
         AutoSize        =   -1  'True
         Height          =   180
         Left            =   1560
         TabIndex        =   8
         Top             =   915
         Width           =   90
      End
      Begin VB.Image imgParent 
         Height          =   240
         Left            =   120
         Picture         =   "dlgChooseFav.frx":109E
         Top             =   880
         Width           =   240
      End
      Begin VB.Label lblType 
         AutoSize        =   -1  'True
         Caption         =   "Ŀ¼����:"
         Height          =   180
         Left            =   480
         TabIndex        =   7
         Top             =   1230
         Width           =   810
      End
      Begin VB.Label ldtType 
         AutoSize        =   -1  'True
         Height          =   180
         Left            =   1560
         TabIndex        =   6
         Top             =   1230
         Width           =   90
      End
      Begin VB.Image imgType 
         Height          =   240
         Left            =   120
         Picture         =   "dlgChooseFav.frx":1628
         Top             =   1200
         Width           =   240
      End
   End
   Begin VB.Frame fraType 
      Caption         =   "����Ŀ¼����"
      ForeColor       =   &H00D54600&
      Height          =   1575
      Left            =   3480
      TabIndex        =   2
      Top             =   4440
      Width           =   2055
      Begin VB.Image imgInfo 
         Height          =   240
         Left            =   120
         Picture         =   "dlgChooseFav.frx":1BB2
         Top             =   240
         Width           =   240
      End
      Begin VB.Label lblInfo 
         AutoSize        =   -1  'True
         Caption         =   "�����ļ�Ŀ¼"
         Height          =   180
         Index           =   1
         Left            =   420
         TabIndex        =   4
         Top             =   270
         Width           =   1080
      End
      Begin VB.Label ldtInfo 
         Height          =   900
         Left            =   120
         TabIndex        =   3
         Top             =   555
         Width           =   1815
      End
   End
   Begin MSComctlLib.TreeView tvwDirectory 
      Height          =   3975
      Left            =   120
      TabIndex        =   1
      Top             =   360
      Width           =   5415
      _ExtentX        =   9551
      _ExtentY        =   7011
      _Version        =   393217
      HideSelection   =   0   'False
      Indentation     =   441
      LabelEdit       =   1
      Style           =   7
      ImageList       =   "iltFavourite"
      Appearance      =   1
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
            Picture         =   "dlgChooseFav.frx":213C
            Key             =   "FAV_ROOT"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgChooseFav.frx":26D6
            Key             =   "FAV_MUSIC"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "dlgChooseFav.frx":2C70
            Key             =   "FAV_NORMAL"
         EndProperty
      EndProperty
   End
   Begin VB.Label lblInfo 
      AutoSize        =   -1  'True
      Caption         =   "��ѡ����Ҫ�������ղؼ�Ŀ¼(&D):"
      Height          =   180
      Index           =   0
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   2700
   End
End
Attribute VB_Name = "dlgChooseFav"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

'һЩ��Ϣ
Private Const INFO_DIR_MUSIC As String = "�����ļ��ղؼп��Դ���һЩ���ֵ���Ϣ�����У��������Ժܷ���ز鿴�����ҡ����⡢ר������Ϣ��"
Private Const INFO_DIR_NORMAL As String = "��ͨĿ¼�����ڷ������ļ����������ڲ鿴��ʱ����ʾ�ļ����ͣ��޸�ʱ�����Ϣ��Ҳ����Ϊ�����һЩע�͡�"

Private Canceled As Boolean
Private SelKey As String

Private Sub CancelButton_Click()
  Canceled = True
  SelKey = vbNullString
  Unload Me
End Sub

Private Sub Form_Load()
  Dim nND As MSComctlLib.Node
  Dim nNS As MSComctlLib.Node
  
  'ˢ���ļ�����Ϣ
  tvwDirectory.Nodes.Clear
  tvwDirectory.Nodes.Add , , "Favourite", "�ղؼ�", 1
  tvwDirectory.Nodes(1).Selected = True
  tvwDirectory.Nodes(1).Expanded = True
  
  For i = 2 To frmMain.tvwFavourite.Nodes.Count
    Set nNS = frmMain.tvwFavourite.Nodes(i)
    Set nND = tvwDirectory.Nodes.Add(nNS.Parent.Key, tvwChild, nNS.Key, nNS.Text, nNS.Image)
    nND.Expanded = True
  Next i
End Sub

Private Sub OKButton_Click()
  Canceled = False
  SelKey = tvwDirectory.selectedItem.Key
  Unload Me
End Sub

Private Sub tvwDirectory_NodeClick(ByVal Node As MSComctlLib.Node)
  '������Ŀ
  Dim oFF As MP3PA.FAVFolder
  
  Set oFF = oFavCol(Node.Key)
  ldtSubFile.Caption = oFF.FavouriteItems.Count
  ldtSubFolder.Caption = oFF.FavouriteSubFolders.Count
  If Node.Index = 1 Then ldtParent.Caption = vbNullString Else ldtParent.Caption = Node.Parent.Text
  
  If oFF.MusicType Then
    ldtType.Caption = "�����ļ�Ŀ¼"
    lblInfo(1).Caption = "�����ļ�Ŀ¼"
    ldtInfo.Caption = INFO_DIR_MUSIC
  Else
    ldtType.Caption = "��ͨĿ¼"
    lblInfo(1).Caption = "��ͨĿ¼"
    ldtInfo.Caption = INFO_DIR_NORMAL
  End If
End Sub

Public Function GetFavouriteDirectory(ByRef ReturnDir As String, Optional ByVal Default As String = "Favourite") As Boolean
  '�����ղؼ�Ŀ¼
  Load Me
  tvwDirectory.Nodes(Default).Selected = True
  tvwDirectory_NodeClick tvwDirectory.selectedItem
  Me.Show 1
  ReturnDir = SelKey
  GetFavouriteDirectory = Not Canceled
End Function
