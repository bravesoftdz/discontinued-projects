VERSION 5.00
Begin VB.Form frmConvert 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "����ת��Ϊ Microsoft Word ��ʽ"
   ClientHeight    =   5295
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   7215
   ControlBox      =   0   'False
   Icon            =   "frmConvert.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5295
   ScaleWidth      =   7215
   StartUpPosition =   2  '��Ļ����
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   4080
      Top             =   4800
   End
   Begin VB.PictureBox picTray 
      BorderStyle     =   0  'None
      Height          =   240
      Left            =   3360
      Picture         =   "frmConvert.frx":628A
      ScaleHeight     =   240
      ScaleWidth      =   240
      TabIndex        =   20
      TabStop         =   0   'False
      Top             =   4920
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.CommandButton cmdShowHide 
      Caption         =   "��ʾ���� &Word"
      Enabled         =   0   'False
      Height          =   375
      Left            =   5520
      TabIndex        =   19
      Top             =   4800
      Width           =   1575
   End
   Begin VB.CommandButton cmdCancel 
      Caption         =   "ȡ��(&C)"
      Height          =   375
      Left            =   1560
      TabIndex        =   18
      Top             =   4800
      Width           =   1215
   End
   Begin VB.CommandButton cmdMinimized 
      Caption         =   "��С��(&M)"
      Height          =   375
      Left            =   120
      TabIndex        =   17
      Top             =   4800
      Width           =   1335
   End
   Begin VB.Frame fraStep 
      Caption         =   "����"
      Height          =   1695
      Left            =   120
      TabIndex        =   8
      Top             =   1560
      Width           =   6975
      Begin VB.Image imgInfo 
         Height          =   240
         Index           =   3
         Left            =   120
         Top             =   1320
         Width           =   240
      End
      Begin VB.Label lblInfo 
         AutoSize        =   -1  'True
         Caption         =   "�ر� Microsoft Word ����������"
         Height          =   180
         Index           =   3
         Left            =   480
         TabIndex        =   12
         Top             =   1350
         Width           =   2700
      End
      Begin VB.Image imgInfo 
         Height          =   240
         Index           =   2
         Left            =   120
         Top             =   960
         Width           =   240
      End
      Begin VB.Label lblInfo 
         AutoSize        =   -1  'True
         Caption         =   "ת����Ŀ����"
         Height          =   180
         Index           =   2
         Left            =   480
         TabIndex        =   11
         Top             =   990
         Width           =   1080
      End
      Begin VB.Image imgInfo 
         Height          =   240
         Index           =   1
         Left            =   120
         Top             =   600
         Width           =   240
      End
      Begin VB.Label lblInfo 
         AutoSize        =   -1  'True
         Caption         =   "���ӵ� Microsoft Word ���ļ�������ģ���ļ�"
         Height          =   180
         Index           =   1
         Left            =   480
         TabIndex        =   10
         Top             =   630
         Width           =   3960
      End
      Begin VB.Image imgInfo 
         Height          =   240
         Index           =   0
         Left            =   120
         Top             =   240
         Width           =   240
      End
      Begin VB.Label lblInfo 
         AutoSize        =   -1  'True
         Caption         =   "��ȡԴ�ļ���Ϣ"
         Height          =   180
         Index           =   0
         Left            =   480
         TabIndex        =   9
         Top             =   270
         Width           =   1260
      End
   End
   Begin BIN2DOC.ProgressBarEx pgeTotal 
      Height          =   375
      Left            =   120
      TabIndex        =   7
      Top             =   4320
      Width           =   6975
      _ExtentX        =   12303
      _ExtentY        =   661
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "System"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BarForeColor    =   11796408
      BackForeColor   =   49152
      BarColor        =   16744576
      BarColor2       =   10231583
      Value           =   0
      BarFillStyle    =   1
   End
   Begin VB.Frame fraInfo 
      Caption         =   "��Ϣ"
      Height          =   1335
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   6975
      Begin VB.TextBox txtOut 
         BackColor       =   &H8000000F&
         Height          =   270
         Left            =   1320
         Locked          =   -1  'True
         TabIndex        =   6
         Top             =   960
         Width           =   5535
      End
      Begin VB.TextBox txtTemplate 
         BackColor       =   &H8000000F&
         Height          =   270
         Left            =   1320
         Locked          =   -1  'True
         TabIndex        =   4
         Top             =   600
         Width           =   5535
      End
      Begin VB.TextBox txtSource 
         BackColor       =   &H8000000F&
         Height          =   270
         Left            =   1320
         Locked          =   -1  'True
         TabIndex        =   2
         Top             =   240
         Width           =   5535
      End
      Begin VB.Image imgOut 
         Height          =   240
         Left            =   120
         Picture         =   "frmConvert.frx":6814
         Top             =   960
         Width           =   240
      End
      Begin VB.Image imgTemplate 
         Height          =   240
         Left            =   120
         Picture         =   "frmConvert.frx":6D9E
         Top             =   600
         Width           =   240
      End
      Begin VB.Image imgSource 
         Height          =   240
         Left            =   120
         Picture         =   "frmConvert.frx":7328
         Top             =   240
         Width           =   240
      End
      Begin VB.Label lblOut 
         AutoSize        =   -1  'True
         Caption         =   "����ļ�:"
         Height          =   180
         Left            =   480
         TabIndex        =   5
         Top             =   1005
         Width           =   810
      End
      Begin VB.Label lblTemplate 
         AutoSize        =   -1  'True
         Caption         =   "�ļ�ģ��:"
         Height          =   180
         Left            =   480
         TabIndex        =   3
         Top             =   645
         Width           =   810
      End
      Begin VB.Label lblSource 
         AutoSize        =   -1  'True
         Caption         =   "Դ�ļ�:"
         Height          =   180
         Left            =   480
         TabIndex        =   1
         Top             =   285
         Width           =   630
      End
   End
   Begin BIN2DOC.ProgressBarEx pgeCurrent 
      Height          =   375
      Left            =   120
      TabIndex        =   13
      Top             =   3600
      Width           =   6975
      _ExtentX        =   12303
      _ExtentY        =   661
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "System"
         Size            =   9.75
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BarForeColor    =   11796408
      BackForeColor   =   49152
      BarColor        =   16744576
      BarColor2       =   10231583
      Value           =   0
      BarFillStyle    =   1
   End
   Begin VB.Image imgConvert 
      Height          =   240
      Index           =   1
      Left            =   5280
      Picture         =   "frmConvert.frx":78B2
      Top             =   4080
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Image imgConvert 
      Height          =   240
      Index           =   0
      Left            =   4920
      Picture         =   "frmConvert.frx":7E3C
      Top             =   4080
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Image imgCurrent 
      Height          =   240
      Left            =   6840
      Picture         =   "frmConvert.frx":83C6
      Top             =   4080
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Image imgOK 
      Height          =   240
      Left            =   5760
      Picture         =   "frmConvert.frx":8950
      Top             =   4080
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Image imgError 
      Height          =   240
      Left            =   6120
      Picture         =   "frmConvert.frx":8EDA
      Top             =   4080
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Image imgWating 
      Height          =   240
      Left            =   6480
      Picture         =   "frmConvert.frx":9464
      Top             =   4080
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Label lblPrecent 
      Alignment       =   1  'Right Justify
      Caption         =   "0/0"
      Height          =   180
      Left            =   3600
      TabIndex        =   16
      Top             =   3360
      Width           =   3420
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      Caption         =   "�������:"
      Height          =   180
      Left            =   120
      TabIndex        =   15
      Top             =   4080
      Width           =   810
   End
   Begin VB.Label lblCurPos 
      AutoSize        =   -1  'True
      Caption         =   "��ǰ����:"
      Height          =   180
      Left            =   120
      TabIndex        =   14
      Top             =   3360
      Width           =   810
   End
End
Attribute VB_Name = "frmConvert"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' �����и�ʽ
' ==========
' BIN2DOC.EXE SourceFile WordTemplate OutFile
' SourceFile   Դ�ļ�
' WordTemplate Word ģ��
' OutFile      ����ļ�

Option Explicit
Option Base 1

Private SMSCol As New VBA.Collection

' �� Word ���
Const wdReplaceAll = 2
Const wdCollapseEnd = 0

Dim WordApp As Object ' Word.Application
Dim WordTemplate As Object ' Word.Document
Dim WordEditor As Object ' Word.Document
Dim WordOut As Object ' Word.Document

Dim BeforeSection As Object ' Word.Range
Dim AfterSection As Object ' Word.Range
Dim BeforeMessage As Object ' Word.Range
Dim AfterMessage As Object ' Word.Range
Dim MessageMain As Object ' Word.Range

Dim SecStart As Boolean
Dim SecEnd As Boolean

Dim DocStart As Boolean
Dim DocEnd As Boolean

Dim CurrentTask As Integer
Dim iLastState As Integer

Public Cancing As Boolean

' XPMAINFEST
Private Type tagInitCommonControlsEx
   lngSize As Long
   lngICC As Long
End Type

Private Declare Function InitCommonControlsEx Lib "comctl32.dll" _
   (iccex As tagInitCommonControlsEx) As Boolean
Private Const ICC_USEREX_CLASSES = &H200


'ʹ������ǰ��
Private Declare Function SetWindowPos Lib "user32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal x As Long, ByVal y As Long, ByVal cx As Long, ByVal cy As Long, ByVal wFlags As Long) As Long

Private Const HWND_BOTTOM = 1
Private Const HWND_TOP = 0
Private Const HWND_TOPMOST = -1
Private Const HWND_NOTOPMOST = -2

Private Const SWP_DRAWFRAME = &H20
Private Const SWP_FRAMECHANGED = &H20
Private Const SWP_HIDEWINDOW = &H80
Private Const SWP_NOACTIVATE = &H10
Private Const SWP_NOCOPYBITS = &H100
Private Const SWP_NOMOVE = &H2
Private Const SWP_NOOWNERZORDER = &H200
Private Const SWP_NOREDRAW = &H8
Private Const SWP_NOREPOSITION = 512
Private Const SWP_NOSIZE = &H1
Private Const SWP_NOZORDER = &H4
Private Const SWP_SHOWWINDOW = &H40

'ϵͳ����ͼ��
Private Type NOTIFYICONDATA
    cbSize As Long
    hWnd As Long
    uId As Long
    uFlags As Long
    ucallbackMessage As Long
    hIcon As Long
    szTip As String * 64
End Type

Private Const NIM_ADD = &H0
Private Const NIM_MODIFY = &H1
Private Const NIM_DELETE = &H2
Private Const NIF_MESSAGE = &H1
Private Const NIF_ICON = &H2
Private Const NIF_TIP = &H4

Private Const WM_LBUTTONDBLCLK = &H203
Private Const WM_LBUTTONDOWN = &H201
Private Const WM_RBUTTONUP = &H205

Private Declare Function Shell_NotifyIcon Lib "shell32" Alias "Shell_NotifyIconA" (ByVal dwMessage As Long, pnid As NOTIFYICONDATA) As Boolean
Dim TrayI As NOTIFYICONDATA

' ɾ���ļ�
Private Declare Function DeleteFile Lib "kernel32.dll" Alias "DeleteFileA" (ByVal lpFileName As String) As Long

Private Sub cmdCancel_Click()
  Cancing = True
End Sub

Private Sub cmdMinimized_Click()
  '��С��
  '======
  iLastState = Me.WindowState
  Me.WindowState = 1
  Me.Hide
  App.TaskVisible = False
  
  '����֪ͨ����
  '============
  '���ô��ڵľ�����⽫��ҹ���ָ���Ĵ��ڣ�
  TrayI.hWnd = picTray.hWnd
  'Ϊ�����������ض��ı�ʶ��
  TrayI.uId = 1&
  '���ñ�־
  TrayI.uFlags = NIF_ICON Or NIF_TIP Or NIF_MESSAGE
  '���ûص���Ϣ
  TrayI.ucallbackMessage = WM_LBUTTONDOWN
  '����ͼƬ������Ϊͼ��
  TrayI.hIcon = picTray.Picture.Handle
  '���ù�����ʾ
  TrayI.cbSize = Len(TrayI)
  'Create the icon
  Shell_NotifyIcon NIM_ADD, TrayI
  
  Timer1.Enabled = True
End Sub

Private Sub cmdShowHide_Click()
  WordApp.Visible = Not WordApp.Visible
  
  If WordApp.Visible Then
    Move 0, 0
    BringToFront True
  Else
    Move (Screen.Width - Me.Width) / 2, (Screen.Height - Me.Height) / 2
    BringToFront False
  End If
End Sub

Private Sub Form_Load()
  ' ���������
  Dim CmdLine() As Variant
  
  CmdLine = GetCommandLine(3)
  txtSource.Text = CmdLine(1)
  txtTemplate.Text = CmdLine(2)
  txtOut.Text = CmdLine(3)
  
  ' ����������
  If Len(CmdLine(1)) = 0 Or Len(CmdLine(2)) = 0 Or Len(CmdLine(3)) = 0 Then
    MsgBox "�������������ת�� Ultra SMS ���ɵĶ������ݵ� Word �ļ��Ĺ��ߣ���ʹ��֮ǰ��������ȷ��ϵͳ�а�װ�� Word 2000 ���߸��ߵİ汾��" _
      + vbCrLf + vbCrLf + "�÷�: " + vbCrLf + vbCrLf + "BIN2DOC.EXE SourceFile WordTemplate OutFile", vbInformation, App.Title
    End
  End If
  
  If (Len(Dir(CmdLine(1))) = 0) Or (Len(Dir(CmdLine(2))) = 0) Then
    MsgBox "һ������������ļ�δ�ҵ���" _
      + vbCrLf + vbCrLf + "�÷�: " + vbCrLf + vbCrLf + "BIN2DOC.EXE SourceFile WordTemplate OutFile", vbInformation, App.Title
    End
  End If
  
  ' ��ʾͼ��
  Dim i As Long
  
  For i = imgInfo.LBound To imgInfo.UBound
    Set imgInfo(i).Picture = imgWating.Picture
  Next i
  
  ' ��ʾ������
  Me.Show
  
  ' ��ʼ����
  ReadSourceFile
  OpenApp
  WriteDoc
  SaveFile
  
  ' ����
  WordApp.Visible = True
  Call DeleteFile(txtSource.Text)
  Unload Me
End Sub

Private Function GetCommandLine(Optional MaxArgs As Long = 0)
  Dim Result() As Variant
  Dim iBegin As Long
  Dim bInQuoted As Boolean
  Dim bInArgv As Boolean
  Dim i As Long
  Dim a As Long
  Dim CmdLen As Long
  Dim ch As String
  
  ' ��������еĳ���
  CmdLen = Len(Command)
  
  ' ����ÿһ���ַ�
  iBegin = 1
  a = 0
  
  For i = 1 To CmdLen
    ' ����ÿһ���ַ��Թ�����
    ch = Mid(Command, i, 1)
    
    ' ���������������͵���һ������
    If ch = Chr(34) Then
      If bInArgv Then
        ' ����ǲ���
        a = a + 1
        ReDim Preserve Result(a) As Variant
        Result(a) = Mid(Command, iBegin + 1, i - iBegin - 1)
        bInArgv = False
      Else
        ' ������ǲ��� ���������Χ
        bInArgv = True
        bInQuoted = True
        iBegin = i
      End If
      
    ElseIf ch = vbTab Or ch = " " Then
      ' ��������ŷ�Χ���Կո�
      If Not bInQuoted Then
        If bInArgv Then
          ' ����������־
          a = a + 1
          ReDim Preserve Result(a) As Variant
          Result(a) = Mid(Command, iBegin, i - iBegin)
          bInArgv = False
        End If
      End If
      
    Else
      ' ������ʼ��־
      If Not bInArgv Then
        bInArgv = True
        iBegin = i
      End If
    End If
  Next i
  
  If MaxArgs > 1 Then
    ReDim Preserve Result(MaxArgs) As Variant
  End If
  
  GetCommandLine = Result
End Function

Public Sub BringToFront(ByVal Top As Boolean)
  If Top Then
    Call SetWindowPos(Me.hWnd, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE)
  Else
    Call SetWindowPos(Me.hWnd, HWND_NOTOPMOST, 0, 0, 0, 0, SWP_NOSIZE Or SWP_NOMOVE)
  End If
End Sub

Private Sub StepIt(Optional ByVal Step As Double = 1)
  pgeCurrent.Value = pgeCurrent.Value + Step
  pgeTotal.Value = pgeTotal.Value + Step
  lblPrecent.Caption = CStr(Int(pgeCurrent.Value)) & "/" & CStr(Int(pgeCurrent.Max))
  DoEvents
End Sub

Private Sub StepPos(Optional ByVal NewPos As Double = 0)
  pgeCurrent.Value = NewPos
  pgeTotal.Value = NewPos
  lblPrecent.Caption = CStr(Int(pgeCurrent.Value)) & "/" & CStr(Int(pgeCurrent.Max))
  DoEvents
End Sub

Private Sub BeginProgress(ByVal TaskNo As Integer)
  lblInfo(TaskNo).FontBold = True
  Set imgInfo(TaskNo).Picture = imgCurrent.Picture
  CurrentTask = TaskNo
  DoEvents
End Sub

Private Sub EndProgress(ByVal TaskNo As Integer)
  lblInfo(TaskNo).FontBold = False
  Set imgInfo(TaskNo).Picture = imgOK.Picture
  DoEvents
End Sub

' ��ȡԴ�ļ��Ĺ���
Private Sub ReadSourceFile()
  Dim iFile As Integer
  Dim lLength As Long
  Dim sStrBuf() As Byte
  Dim bJuke As Byte
  Dim dDate As Date
  Dim cItem As SMSEntry
  
  BeginProgress 0
  
  ' �������ļ�
  iFile = FreeFile
  
  Open txtSource.Text For Binary Access Read Lock Write As iFile
  
  ' ��ʾ�ļ���С��������
  pgeCurrent.Max = LOF(iFile)
  pgeTotal.Max = LOF(iFile) * 10
  
  ' ��ȡ����
  Do While Loc(iFile) < LOF(iFile)
    ' ����Ŀʵ��
    Set cItem = New BIN2DOC.SMSEntry
    
    ' ��ȡ����ʱ��
    Get iFile, , dDate
    cItem.DateTime = dDate
    
    ' ��ȡ�����ֶ�
    Get iFile, , lLength
    ReDim sStrBuf(lLength) As Byte
    Get iFile, , sStrBuf
    Get iFile, , bJuke
    cItem.ItemName = StrConv(sStrBuf, vbUnicode)
    
    ' ��ȡ�����ֶ�
    Get iFile, , lLength
    ReDim sStrBuf(lLength) As Byte
    Get iFile, , sStrBuf
    Get iFile, , bJuke
    cItem.Content = StrConv(sStrBuf, vbUnicode)
    
    ' ��ӵ�������
    SMSCol.Add cItem
    
    ' ��ʾ����
    StepPos Seek(iFile)
    
    ' ȡ������
    If Cancing Then
      Close iFile
      ErrorOccur "�û�ȡ��������", 0
    End If
  Loop
  
  Close iFile
  
  EndProgress 0
End Sub

' �� Word
Private Sub OpenApp()
  Dim i As Long
  
  ' ���½�����
  BeginProgress 1
  pgeTotal.Max = 100
  pgeCurrent.Max = 7
  pgeCurrent.Value = 0
  
  ' ��������λ��
  'Move 0, 0
  'BringToFront True
  
  ' ��������
  Set WordApp = CreateObject("Word.Application")
  cmdShowHide.Enabled = True
  WordApp.Visible = False
  StepIt
  Set WordTemplate = WordApp.Documents.Open(txtTemplate.Text, , True)
  StepIt
  Set WordEditor = WordApp.Documents.Add(txtTemplate.Text)
  StepIt
  Set WordOut = WordApp.Documents.Add(txtTemplate.Text)
  StepIt
  
  ' ɾ������
  WordEditor.Content.Delete
  StepIt
  WordOut.Content.Delete
  StepIt
  
  ' ����ģ�������
  Dim FindSectionBeginText As Object ' Word.Range
  Dim FindSectionEndText As Object ' Word.Range
  Dim FindMessageBeginText As Object ' Word.Range
  Dim FindMessageEndText As Object ' Word.Range
  
'  Call FindText(FindSectionBeginText, "{SECTION BEGIN}")
'  Call FindText(FindSectionEndText, "{SECTION END}")
'  Call FindText(FindMessageBeginText, "{MESSAGE BEGIN}")
'  Call FindText(FindMessageEndText, "{MESSAGE END}")

  ' ��������ı��
  For i = 1 To WordTemplate.Paragraphs.Count
    Select Case WordTemplate.Paragraphs(i).Range.Text
    Case "{SECTION BEGIN}" + vbCr
      Set FindSectionBeginText = WordTemplate.Paragraphs(i).Range
    Case "{MESSAGE BEGIN}" + vbCr
      Set FindMessageBeginText = WordTemplate.Paragraphs(i).Range
    Case "{SECTION END}" + vbCr
      Set FindSectionEndText = WordTemplate.Paragraphs(i).Range
    Case "{MESSAGE END}" + vbCr
      Set FindMessageEndText = WordTemplate.Paragraphs(i).Range
    End Select
  
    ' ȡ������
    If Cancing Then
      ErrorOccur "�û�ȡ��������", 1
    End If
  Next i
  
  On Error GoTo EErrRange
  
  ' �ĵ���ͷ����
  If WordTemplate.Content.Start < FindSectionBeginText.Start Then
    Set BeforeSection = WordTemplate.Range(WordTemplate.Content.Start, FindSectionBeginText.Start)
    DocStart = True
  Else
    DocStart = False
  End If
  
  ' �ĵ���β����
  If FindSectionEndText.End < WordTemplate.Content.End Then
    Set AfterSection = WordTemplate.Range(WordTemplate.Content.Start, FindSectionBeginText.Start)
    DocEnd = True
  Else
    DocEnd = False
  End If
  
  ' �ڿ�ͷ����
  If FindSectionBeginText.End < FindMessageBeginText.Start Then
    Set BeforeMessage = WordTemplate.Range(FindSectionBeginText.End, FindMessageBeginText.Start)
    SecStart = True
  Else
    SecStart = False
  End If
  
  ' �ڽ�β����
  If FindMessageEndText.End < FindSectionEndText.Start Then
    Set AfterMessage = WordTemplate.Range(FindMessageEndText.End, FindSectionEndText.Start)
    SecEnd = True
  Else
    SecEnd = False
  End If
  
  ' ��Ϣ����
  Set MessageMain = WordTemplate.Range(FindMessageBeginText.End, FindMessageEndText.Start)
  
  On Error GoTo 0
  
  StepIt
  
  ' ������ʾ
  EndProgress 1
  Exit Sub
  
EErrRange:
  ErrorOccur "ģ����λ�ò���ȷ��", 1
End Sub

' ��������
Private Sub WriteDoc()
  Dim i As Long
  Dim SMS As SMSEntry
  Dim LastDate As Date
  Dim NewDay As Boolean
  Dim NoFirst As Boolean
  
  ' ���½�����
  BeginProgress 2
  pgeCurrent.Value = 0
  pgeCurrent.Max = SMSCol.Count
  pgeTotal.AddMax (SMSCol.Count * 1.1)
  
  ' ����ͷ��
  If DocStart Then
    BeforeSection.Copy
    GetEndDoc(WordOut).Paste
  End If
  
  ' ��������
  For Each SMS In SMSCol
    ' �ж��Ƿ����µ�һ��
    NewDay = (DateDiff("d", LastDate, SMS.DateTime) <> 0)
    
    ' д����һ�ڵ�β��
    If NoFirst And NewDay And SecEnd Then
      AfterMessage.Copy
      WordEditor.Content.Paste
      
      ' �滻����
      WordEditor.Content.Find.Execute FindText:="%DATE%", ReplaceWith:=FormatDateTime(SMS.DateTime, vbLongDate), Replace:=wdReplaceAll
      WordEditor.Content.Copy
      
      ' ���Ƶ������
      GetEndDoc(WordOut).Paste
      
      ' ��һ��
      NoFirst = True
    End If
    
    ' д��ڵ�ͷ��
    If NewDay And SecStart Then
      BeforeMessage.Copy
      WordEditor.Content.Paste
      
      ' �滻����
      WordEditor.Content.Find.Execute FindText:="%DATE%", ReplaceWith:=FormatDateTime(SMS.DateTime, vbLongDate), Replace:=wdReplaceAll
      WordEditor.Paragraphs(WordEditor.Paragraphs.Count).Range.Delete
      WordEditor.Content.Copy
      
      ' ���Ƶ������
      GetEndDoc(WordOut).Paste
    End If
    
    ' д����Ϣʵ��
    MessageMain.Copy
    WordEditor.Content.Paste
'    WordEditor.Content.Find.Execute FindText:="%TIME%", ReplaceWith:=FormatDateTime(SMS.DateTime, vbShortTime), Replace:=wdReplaceAll
'    WordEditor.Content.Find.Execute FindText:="%NAME%", ReplaceWith:=SMS.ItemName, Replace:=wdReplaceAll
'    WordEditor.Content.Find.Execute FindText:="%CONTENT%", ReplaceWith:=SMS.Content, Replace:=wdReplaceAll
    Call ReplaceText(WordEditor, "%TIME%", FormatDateTime(SMS.DateTime, vbShortTime))
    Call ReplaceText(WordEditor, "%NAME%", SMS.ItemName)
    Call ReplaceText(WordEditor, "%MESSAGE_CONTENT%", SMS.Content)
    Call WordEditor.Paragraphs(WordEditor.Paragraphs.Count).Range.Delete
    Call WordEditor.Content.Copy
    Call GetEndDoc(WordOut).Paste
    
    ' ��ʾ����
    StepIt
    LastDate = SMS.DateTime
  
    ' ȡ������
    If Cancing Then
      ErrorOccur "�û�ȡ��������", 2
    End If
  Next SMS
  
  ' д�����Ľ�β��
  If SecEnd Then
    AfterMessage.Copy
    WordEditor.Content.Paste
    
    ' �滻����
    WordEditor.Content.Find.Execute FindText:="%DATE%", ReplaceWith:=FormatDateTime(LastDate, vbLongDate), Replace:=wdReplaceAll
    WordEditor.Content.Copy
    
    ' ���Ƶ������
    GetEndDoc(WordOut).Paste
    
    ' ��һ��
    NoFirst = True
  End If
  
  ' д����������
  If DocEnd Then
    AfterSection.Copy
    GetEndDoc(WordOut).Paste
  End If
  
  ' ����
  EndProgress 2
  cmdCancel.Enabled = False
End Sub

Private Function FindText(ByRef ARange As Object, ByVal Text As String) As Boolean ' Word.Range
  Set ARange = WordTemplate.Content
  FindText = ARange.Find.Execute(Text)
  
  If Not FindText Then
    ErrorOccur Text & "���δ�ҵ���", 1
  End If
End Function

Private Sub ErrorOccur(ByVal MSG As String, ByVal TaskNo As Integer)
  Set imgInfo(TaskNo).Picture = imgError.Picture
  MsgBox MSG, vbCritical, App.Title
  
  If TaskNo > 0 Then
    WordEditor.Close False
    WordOut.Close False
    WordTemplate.Close False
    WordApp.Quit False
  End If
  
  End
End Sub

Private Function GetEndDoc(ByRef DOC As Object) As Object  ' Word.Range' Word.Document
  Set GetEndDoc = DOC.Range
  GetEndDoc.Collapse wdCollapseEnd
End Function

Private Sub SaveFile()
  ' �����ļ�
  BeginProgress 3
  pgeTotal.AddMax 3
  pgeCurrent.Max = 3
  pgeCurrent.Value = 0
  
  WordEditor.Close False
  StepIt
  WordTemplate.Close False
  StepIt
  WordOut.SaveAs txtOut.Text
  StepIt
  
  EndProgress 3
End Sub

Private Sub ReplaceText(ByRef DOC As Object, ByVal Text As String, ByVal ReplaceWith As String) ' Word.Document
  ' �滻�ı�
  Dim ARange As Object ' Word.Range
  
  Set ARange = DOC.Content
  
  With ARange.Find
    .ClearFormatting
    '.Replacement.ClearFormatting
    .Text = Text
    '.Replacement.Text = ReplaceWith
    '.Execute Replace:=WdReplace.wdReplaceOne
    If .Execute Then
      ARange.Text = ReplaceWith
    End If
  End With

End Sub

Private Sub picTray_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
  Dim MSG As Long
  MSG = x / Screen.TwipsPerPixelX
  
  If MSG = WM_LBUTTONDBLCLK Then
    '�ָ�
    '====
    Me.WindowState = iLastState
    Me.Show
    App.TaskVisible = True
      
    '����֪ͨ����
    '============
    TrayI.cbSize = Len(TrayI)
    TrayI.hWnd = picTray.hWnd
    TrayI.uId = 1&
    Shell_NotifyIcon NIM_DELETE, TrayI
    
    Timer1.Enabled = False
  End If
End Sub

Private Sub Timer1_Timer()
  Dim MSG As String
  
  MSG = lblInfo(CurrentTask).Caption
  MSG = MSG & Space(4) & lblPrecent.Caption
  
  TrayI.hIcon = TrayIcon(Now)
  TrayI.szTip = MSG + Chr(0)
  TrayI.cbSize = Len(TrayI)
  Shell_NotifyIcon NIM_MODIFY, TrayI
End Sub

Private Function TrayIcon(ByVal NowTime As Date) As StdPicture
  '����ض���ͼ��
  Dim iIndex As Integer
  
  iIndex = Second(NowTime) Mod 2
  
  Set TrayIcon = imgConvert(iIndex).Picture
End Function

Public Function InitCommonControlsVB() As Boolean
   On Error Resume Next
   Dim iccex As tagInitCommonControlsEx
   ' Ensure CC available:
   With iccex
       .lngSize = LenB(iccex)
       .lngICC = ICC_USEREX_CLASSES
   End With
   InitCommonControlsEx iccex
   InitCommonControlsVB = (Err.Number = 0)
   On Error GoTo 0
End Function

