VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.UserControl UIShell 
   ClientHeight    =   5055
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   5655
   ScaleHeight     =   5055
   ScaleWidth      =   5655
   Begin VB.Frame fraShortcut 
      Caption         =   "������ݷ�ʽ"
      ForeColor       =   &H00D54600&
      Height          =   2295
      Left            =   3480
      TabIndex        =   13
      Top             =   2760
      Width           =   2175
      Begin VB.PictureBox picShortCut 
         BorderStyle     =   0  'None
         HasDC           =   0   'False
         Height          =   1935
         Left            =   120
         ScaleHeight     =   1935
         ScaleWidth      =   1935
         TabIndex        =   14
         TabStop         =   0   'False
         Top             =   240
         Width           =   1935
         Begin VB.CommandButton cmdProgram 
            Caption         =   "������ļ���(&P)"
            Height          =   375
            Left            =   0
            TabIndex        =   18
            Top             =   1560
            Width           =   1935
         End
         Begin VB.CommandButton cmdStartMenu 
            Caption         =   "��ʼ�˵����ļ���(&M)"
            Height          =   375
            Left            =   0
            TabIndex        =   17
            Top             =   1040
            Width           =   1935
         End
         Begin VB.CommandButton cmdQuickLaunch 
            Caption         =   "����������(&Q)"
            Height          =   375
            Left            =   0
            TabIndex        =   16
            Top             =   520
            Width           =   1935
         End
         Begin VB.CommandButton cmdDesktop 
            Caption         =   "����(&D)"
            Height          =   375
            Left            =   0
            TabIndex        =   15
            Top             =   0
            Width           =   1935
         End
      End
   End
   Begin VB.Frame fraCopy 
      Caption         =   "�����ٶ�"
      ForeColor       =   &H00D54600&
      Height          =   2295
      Left            =   0
      TabIndex        =   8
      Top             =   2760
      Width           =   3375
      Begin MSComctlLib.Slider sldByte 
         Height          =   495
         Left            =   120
         TabIndex        =   10
         Top             =   600
         Width           =   3135
         _ExtentX        =   5530
         _ExtentY        =   873
         _Version        =   393216
         LargeChange     =   8
         Min             =   1
         Max             =   31
         SelStart        =   1
         Value           =   1
      End
      Begin VB.Label lblCopyInfo 
         Caption         =   "��Ҫ��ÿ�ζ�ȡ�����ݵ�ֵ����̫����Ϊ�����ĸ����ٶ�����Ӳ�������ġ�����һ�������²�Ҫ���ġ�"
         Height          =   615
         Left            =   120
         TabIndex        =   12
         Top             =   1560
         Width           =   3135
      End
      Begin VB.Label lblByte 
         AutoSize        =   -1  'True
         Caption         =   "1024 �ֽ�/��"
         Height          =   180
         Left            =   120
         TabIndex        =   11
         Top             =   1200
         Width           =   1080
      End
      Begin VB.Label lblCopySpeedLBL 
         AutoSize        =   -1  'True
         Caption         =   "ÿ�ζ�ȡ���ֽ���(&B):"
         Height          =   180
         Left            =   120
         TabIndex        =   9
         Top             =   240
         Width           =   1800
      End
   End
   Begin VB.Frame fraMP3Info 
      Caption         =   "MP3 ��Ϣ��ȡ"
      ForeColor       =   &H00D54600&
      Height          =   2655
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   5655
      Begin VB.PictureBox picInfo 
         BorderStyle     =   0  'None
         Height          =   1215
         Left            =   120
         ScaleHeight     =   1215
         ScaleWidth      =   5415
         TabIndex        =   19
         Top             =   1320
         Width           =   5415
         Begin VB.Frame fraInfo 
            Caption         =   "�߼�ѡ��"
            ForeColor       =   &H00D54600&
            Height          =   1215
            Left            =   0
            TabIndex        =   7
            Top             =   0
            Width           =   5415
            Begin VB.CheckBox chkNoDuration 
               Caption         =   "����ȡ�����ļ�����(&D)"
               Height          =   255
               Left            =   120
               TabIndex        =   22
               Top             =   840
               Width           =   5175
            End
            Begin VB.CheckBox chkNoTime 
               Caption         =   "����ȡ�ļ�ʱ��(&M)"
               Height          =   375
               Left            =   120
               TabIndex        =   21
               Top             =   480
               Width           =   5175
            End
            Begin VB.CheckBox chkInherit 
               Caption         =   "�̳в����б���ղؼ��е�������Ϣ(&I)"
               Height          =   255
               Left            =   120
               TabIndex        =   20
               Top             =   240
               Width           =   5175
            End
         End
      End
      Begin MSComctlLib.ImageList iltInfo 
         Left            =   1320
         Top             =   120
         _ExtentX        =   1005
         _ExtentY        =   1005
         BackColor       =   -2147483643
         ImageWidth      =   16
         ImageHeight     =   16
         MaskColor       =   12632256
         _Version        =   393216
         BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
            NumListImages   =   5
            BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "UIShell.ctx":0000
               Key             =   ""
            EndProperty
            BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "UIShell.ctx":059A
               Key             =   ""
            EndProperty
            BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "UIShell.ctx":0B34
               Key             =   ""
            EndProperty
            BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "UIShell.ctx":10CE
               Key             =   ""
            EndProperty
            BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
               Picture         =   "UIShell.ctx":1668
               Key             =   ""
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.ImageCombo icbFirst 
         Height          =   315
         Left            =   2160
         TabIndex        =   2
         Top             =   225
         Width           =   3375
         _ExtentX        =   5953
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         Locked          =   -1  'True
         Text            =   "ImageCombo1"
         ImageList       =   "iltInfo"
      End
      Begin MSComctlLib.ImageCombo icbThird 
         Height          =   315
         Left            =   2160
         TabIndex        =   6
         Top             =   945
         Width           =   3375
         _ExtentX        =   5953
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         Locked          =   -1  'True
         Text            =   "ImageCombo1"
         ImageList       =   "iltInfo"
      End
      Begin MSComctlLib.ImageCombo icbSecond 
         Height          =   315
         Left            =   2160
         TabIndex        =   4
         Top             =   585
         Width           =   3375
         _ExtentX        =   5953
         _ExtentY        =   556
         _Version        =   393216
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         Locked          =   -1  'True
         Text            =   "ImageCombo1"
         ImageList       =   "iltInfo"
      End
      Begin VB.Label lblThird 
         AutoSize        =   -1  'True
         Caption         =   "�����γ��Ի�ȡ��Ϣ(&T):"
         Height          =   180
         Left            =   120
         TabIndex        =   5
         Top             =   1027
         Width           =   1980
      End
      Begin VB.Label lblSecond 
         AutoSize        =   -1  'True
         Caption         =   "�ڶ��γ��Ի�ȡ��Ϣ(&S):"
         Height          =   180
         Left            =   120
         TabIndex        =   3
         Top             =   667
         Width           =   1980
      End
      Begin VB.Label lblFirst 
         AutoSize        =   -1  'True
         Caption         =   "��һ�γ��Ի�ȡ��Ϣ(&F):"
         Height          =   180
         Left            =   120
         TabIndex        =   1
         Top             =   307
         Width           =   1980
      End
   End
End
Attribute VB_Name = "UIShell"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private sInfo(1 To 5) As String

'ע�⣡��Ҫɾ�����޸����б�ע�͵��У�
'MappingInfo=UserControl,UserControl,-1,Enabled
Public Property Get Enabled() As Boolean
  Enabled = UserControl.Enabled
End Property

Public Property Let Enabled(ByVal New_Enabled As Boolean)
  UserControl.Enabled() = New_Enabled
  PropertyChanged "Enabled"
End Property

Private Sub cmdDesktop_Click()
  CreateShortcutDesktop App.Title, AppendPath(App.Path, App.EXEName) & ".EXE"
End Sub

Private Sub cmdProgram_Click()
  CreateShortcutStartMenu App.Title, AppendPath(App.Path, App.EXEName) & ".EXE"
End Sub

Private Sub cmdQuickLaunch_Click()
  CreateShortcutQuickLaunch App.Title, AppendPath(App.Path, App.EXEName) & ".EXE"
End Sub

Private Sub cmdStartMenu_Click()
  CreateShortcutStartRootMenu App.Title, AppendPath(App.Path, App.EXEName) & ".EXE"
End Sub

Private Sub icbFirst_Click()
  'ˢ��
  Dim SelIdx As Long
  Dim SelTxt As String
  Dim cb As MSComctlLib.ComboItem
  
  SelIdx = icbFirst.selectedItem.Image
  SelTxt = icbFirst.selectedItem.Text
  
  icbSecond.ComboItems.Clear
  
  For i = 1 To 5
    Set cb = icbFirst.ComboItems(i)
    
    If cb.Image <> SelIdx Then
      icbSecond.ComboItems.Add , , cb.Text, cb.Image
    End If
  Next i
  
  lblSecond.Visible = Not (SelIdx = 1)
  icbSecond.Visible = Not (SelIdx = 1)
  lblThird.Visible = Not (SelIdx = 1)
  icbThird.Visible = Not (SelIdx = 1)
  
  icbSecond.ComboItems(2).Selected = True
  
  If SelIdx <> 1 Then icbSecond_Click
  
  RefreshInfo icbFirst.Text, icbFirst.selectedItem.Image
End Sub

Private Sub icbFirst_GotFocus()
  'ˢ����Ϣ
  RefreshInfo icbFirst.Text, icbFirst.selectedItem.Image
End Sub

Private Sub icbSecond_Click()
  'ˢ��
  Dim SelIdx As Long
  Dim SelTxt As String
  Dim cb As MSComctlLib.ComboItem
  
  SelIdx = icbSecond.selectedItem.Image
  SelTxt = icbSecond.selectedItem.Text
  
  icbThird.ComboItems.Clear
  
  For i = 1 To 4
    Set cb = icbSecond.ComboItems(i)
    
    If cb.Image <> SelIdx Then
      icbThird.ComboItems.Add , , cb.Text, cb.Image
    End If
  Next i
  
  lblThird.Visible = Not (SelIdx = 1)
  icbThird.Visible = Not (SelIdx = 1)
  
  icbThird.ComboItems(2).Selected = True
  
  RefreshInfo icbSecond.Text, icbSecond.selectedItem.Image
End Sub

Private Sub icbSecond_GotFocus()
  RefreshInfo icbSecond.Text, icbSecond.selectedItem.Image
End Sub

Private Sub icbThird_Click()
  RefreshInfo icbThird.Text, icbThird.selectedItem.Image
End Sub

Private Sub icbThird_GotFocus()
  RefreshInfo icbThird.Text, icbThird.selectedItem.Image
End Sub

Private Sub sldByte_Change()
  sldByte_Click
End Sub

Private Sub sldByte_Click()
  lblByte.Caption = FormatNumber(sldByte.Value * 1024, 0, vbTrue, vbTrue, vbTrue) & " �ֽ�/��"
  
  Select Case sldByte.Value
  Case 1
    lblByte.Caption = lblByte.Caption & " (���ȶ�)"
  Case 2
    lblByte.Caption = lblByte.Caption & " (USB 1.0 �Ƽ�)"
  Case 3
    lblByte.Caption = lblByte.Caption & " (USB 1.1 �Ƽ�)"
  Case 18
    lblByte.Caption = lblByte.Caption & " (USB 2.0 �Ƽ�)"
  End Select
End Sub

Private Sub sldByte_Scroll()
  sldByte_Click
End Sub

Private Sub UserControl_Initialize()
  '������Ϣ
  sInfo(1) = "�����ļ��ж�ȡ�κ���Ϣ�����ַ�ʽ�����ģ����ǻ������ܶ����õĹ��ܡ�����ͳ�Ƹ������ȣ��鿴������Ϣ��Ϊ��������ȵȡ�"
  sInfo(2) = "ID3v1 �Ǽ�������õı�ǩ����ʹ�ø����� MP3 �ļ���� 128 �ֽ��ϣ���Ҳ�Ƕ�ȡ�ٶ����ı�ǩ�������� ANSI �ַ����ַ��洢�ģ��������ļ�������ã����ںܶ�� MP3 ������Ҳֻ�ܻ�� ID3v1 �ı�ǩ���������� 128 �ֽڵ����ƣ��п���ʹ�ù����ĸ��������޷�������ʾ�����Һ����ֿ��ܺ�С��"
  sInfo(3) = "ID3v2 ����㷺Ӧ�õı�ǩ�������Դ洢�κ���Ϣ������ÿ����Ϣû�й̶��Ĵ�С��Ҳ������ͬһ���ֶ��д洢��ͬ����Ŀ�����ı���һ���� ISO-8859-1 �� UTF-16(Unicode)���� ID3v1 ��ͬ���ǣ����洢�������ļ�ͷ����û�й̶��Ĵ�С������ ID3v2 ���볤�ȷǹ̶������Ի�ȡ����Ҫʱ��Ƚϳ���"
  sInfo(4) = "APETAG ���� Monkey's Audio(APE) ��ǩ�̳ж����ģ����� ID3v2 �кܶ���ʶ֮������ͬ�������洢���ļ���ĩβ������� ID3v1�����洢�� ID3v1 ��ǰ�档����ʹ�� UTF-8 ����ģ����Ծ��й㷺������֧���ԣ����������ʹ�� Foobar����Ӧ����ѡ������Ϊ���� Foobar ����Ĭ�ϵı�ǩ��"
  sInfo(5) = "�������֪�����ֱ�ǩ��ȡ���������ֱ��ͨ�� Windows Media Player ��ȡ��Ϣ����������ȡ��Ϣ�� Windows Media Player ��ȡ�Ľ����һ���ģ�����ͬʱ��Ҳ�������ķ�ʽ������ Windows Media Player ��֧�� APE ��ǩ��"

  '�������
  icbFirst.ComboItems.Add , , "����ȡ", 1
  icbFirst.ComboItems.Add , , "ID3v1", 2
  icbFirst.ComboItems.Add , , "ID3v2", 3
  icbFirst.ComboItems.Add , , "APE", 4
  icbFirst.ComboItems.Add , , "Windows Media Player", 5
  
  icbFirst.ComboItems(2).Selected = True
  icbFirst_Click
End Sub

'�Ӵ������м�������ֵ
Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
  UserControl.Enabled = PropBag.ReadProperty("Enabled", True)
End Sub

'������ֵд���洢��
Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
  Call PropBag.WriteProperty("Enabled", UserControl.Enabled, True)
End Sub

Private Sub RefreshInfo(ByVal Title As String, ByVal Index As Long)
  '�����Ϣ
  'lblInfoTitle.Caption = "���� " & Title
  'lblTagInfo.Caption = sInfo(Index)
End Sub

Public Sub Init()
  '�����Ϣ
  icbFirst.ComboItems(InfoReadIdx(0) + 1).Selected = True
  icbFirst_Click
  
  For i = 1 To icbSecond.ComboItems.Count
    If icbSecond.ComboItems(i).Image = InfoReadIdx(1) + 1 Then
      icbSecond.ComboItems(i).Selected = True
      Exit For
    End If
  Next i
  icbSecond_Click
    
  For i = 1 To icbThird.ComboItems.Count
    If icbThird.ComboItems(i).Image = InfoReadIdx(2) + 1 Then
      icbThird.ComboItems(i).Selected = True
      Exit For
    End If
  Next i
  icbThird_Click
  
  RefreshInfo icbFirst.Text, icbFirst.selectedItem.Image
  
  sldByte.Value = frmMain.uifCopying.CopySpeed
  chkInherit.Value = Abs(InheritInfo)
  chkNoDuration.Value = Abs(NoDuration)
  chkNoTime.Value = Abs(NoTime)
  
End Sub

Public Sub Update()
  InfoReadIdx(0) = CLng(icbFirst.selectedItem.Image - 1)
  InfoReadIdx(1) = CLng(icbSecond.selectedItem.Image - 1)
  InfoReadIdx(2) = CLng(icbThird.selectedItem.Image - 1)
  
  If InfoReadIdx(0) = 0 Then InfoReadIdx(1) = 0
  If InfoReadIdx(1) = 0 Then InfoReadIdx(2) = 0
  
  Set InfoReadObj(0) = Choose(InfoReadIdx(0) + 1, oReaderNone, oReaderID3v1, oReaderID3v2, oReaderAPETAG, oReaderWMPTAG)
  Set InfoReadObj(1) = Choose(InfoReadIdx(1) + 1, oReaderNone, oReaderID3v1, oReaderID3v2, oReaderAPETAG, oReaderWMPTAG)
  Set InfoReadObj(2) = Choose(InfoReadIdx(2) + 1, oReaderNone, oReaderID3v1, oReaderID3v2, oReaderAPETAG, oReaderWMPTAG)
  
  frmMain.uifCopying.CopySpeed = sldByte.Value
  InheritInfo = CBool(chkInherit.Value)
  NoDuration = CBool(chkNoDuration.Value)
  NoTime = CBool(chkNoTime.Value)
End Sub

