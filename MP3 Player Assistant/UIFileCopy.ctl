VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "MSCOMCTL.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.UserControl UIFileCopy 
   ClientHeight    =   5880
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6375
   LockControls    =   -1  'True
   ScaleHeight     =   5880
   ScaleWidth      =   6375
   Begin VB.CheckBox chkShutDown 
      Caption         =   "���֮��ػ�(&H)"
      Height          =   375
      Left            =   0
      TabIndex        =   19
      Top             =   4080
      Width           =   2055
   End
   Begin VB.PictureBox picTray 
      BorderStyle     =   0  'None
      Height          =   240
      Left            =   2280
      Picture         =   "UIFileCopy.ctx":0000
      ScaleHeight     =   240
      ScaleWidth      =   240
      TabIndex        =   23
      TabStop         =   0   'False
      Top             =   4560
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.CommandButton cmdBackground 
      Caption         =   "��̨����(&B)"
      Height          =   375
      Left            =   2160
      TabIndex        =   20
      Top             =   4080
      Width           =   1335
   End
   Begin MSComctlLib.ImageList iltTray 
      Index           =   0
      Left            =   0
      Top             =   4560
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   17
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":014A
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":02A4
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":03FE
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":0558
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":06B2
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":080C
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":0966
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":0AC0
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":0C1A
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":0D74
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":0ECE
            Key             =   ""
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":1028
            Key             =   ""
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":1182
            Key             =   ""
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":12DC
            Key             =   ""
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":1436
            Key             =   ""
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":1590
            Key             =   ""
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":16EA
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComDlg.CommonDialog CDG 
      Left            =   1080
      Top             =   5280
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
      CancelError     =   -1  'True
      DialogTitle     =   "���渴�Ƽ�¼"
      FileName        =   "Copying.LOG"
      Filter          =   "LOG - ��־�ļ�|*.log|TXT - �ı��ļ�|*.txt"
   End
   Begin VB.CommandButton cmdSaveLog 
      Caption         =   "������־(&L)"
      Height          =   375
      Left            =   3600
      TabIndex        =   21
      Top             =   4080
      Width           =   1335
   End
   Begin VB.CommandButton cmdStop 
      Caption         =   "ֹͣ(&S)"
      Height          =   375
      Left            =   5040
      TabIndex        =   22
      Top             =   4080
      Width           =   1335
   End
   Begin MSComctlLib.ImageList iltInfo 
      Left            =   0
      Top             =   5160
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   6
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":1844
            Key             =   "Exclamation"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":1DDE
            Key             =   "Critical"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":2378
            Key             =   "Information"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":2912
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":2EAC
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":3446
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Timer tmrPerformance 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   600
      Top             =   5280
   End
   Begin VB.Frame fraPerformance 
      Caption         =   "����"
      ForeColor       =   &H00D54600&
      Height          =   1215
      Left            =   3240
      TabIndex        =   12
      Top             =   2760
      Width           =   3135
      Begin VB.Image Image4 
         Height          =   240
         Left            =   120
         Picture         =   "UIFileCopy.ctx":39E0
         Top             =   240
         Width           =   240
      End
      Begin VB.Label ldtSpeed 
         AutoSize        =   -1  'True
         Caption         =   "127,121 KB"
         Height          =   180
         Left            =   1350
         TabIndex        =   18
         Top             =   900
         Width           =   900
      End
      Begin VB.Label ldtTimeRemain 
         AutoSize        =   -1  'True
         Caption         =   "127,121 KB"
         Height          =   180
         Left            =   1350
         TabIndex        =   17
         Top             =   585
         Width           =   900
      End
      Begin VB.Label ldtTimeElapsed 
         AutoSize        =   -1  'True
         Caption         =   "127,121 KB"
         Height          =   180
         Left            =   1350
         TabIndex        =   16
         Top             =   270
         Width           =   900
      End
      Begin VB.Label lblSpeed 
         AutoSize        =   -1  'True
         Caption         =   "�ٶ�:"
         Height          =   180
         Left            =   450
         TabIndex        =   15
         Top             =   900
         Width           =   450
      End
      Begin VB.Label lblTimeRemain 
         AutoSize        =   -1  'True
         Caption         =   "ʣ��ʱ��:"
         Height          =   180
         Left            =   450
         TabIndex        =   14
         Top             =   585
         Width           =   810
      End
      Begin VB.Label lblTimeElapsed 
         AutoSize        =   -1  'True
         Caption         =   "��ȥʱ��:"
         Height          =   180
         Left            =   450
         TabIndex        =   13
         Top             =   270
         Width           =   810
      End
      Begin VB.Image Image3 
         Height          =   240
         Left            =   120
         Picture         =   "UIFileCopy.ctx":3F6A
         Top             =   555
         Width           =   240
      End
      Begin VB.Image Image1 
         Height          =   240
         Left            =   120
         Picture         =   "UIFileCopy.ctx":44F4
         Top             =   855
         Width           =   240
      End
   End
   Begin VB.Frame fraState 
      Caption         =   "״̬"
      ForeColor       =   &H00D54600&
      Height          =   1215
      Left            =   0
      TabIndex        =   5
      Top             =   2760
      Width           =   3135
      Begin VB.Image Image2 
         Height          =   240
         Left            =   120
         Picture         =   "UIFileCopy.ctx":4A7E
         Top             =   855
         Width           =   240
      End
      Begin VB.Image imgCopyed 
         Height          =   240
         Left            =   120
         Picture         =   "UIFileCopy.ctx":5008
         Top             =   555
         Width           =   240
      End
      Begin VB.Label lblTotal 
         AutoSize        =   -1  'True
         Caption         =   "��������:"
         Height          =   180
         Left            =   450
         TabIndex        =   11
         Top             =   270
         Width           =   810
      End
      Begin VB.Label lblCopyed 
         AutoSize        =   -1  'True
         Caption         =   "�Ѹ���:"
         Height          =   180
         Left            =   450
         TabIndex        =   10
         Top             =   585
         Width           =   630
      End
      Begin VB.Label lblRemain 
         AutoSize        =   -1  'True
         Caption         =   "ʣ������:"
         Height          =   180
         Left            =   450
         TabIndex        =   9
         Top             =   900
         Width           =   810
      End
      Begin VB.Label ldtTotal 
         AutoSize        =   -1  'True
         Caption         =   "127,121 KB"
         Height          =   180
         Left            =   1350
         TabIndex        =   8
         Top             =   270
         Width           =   900
      End
      Begin VB.Label ldtCopyed 
         AutoSize        =   -1  'True
         Caption         =   "13,121 KB"
         Height          =   180
         Left            =   1350
         TabIndex        =   7
         Top             =   585
         Width           =   810
      End
      Begin VB.Label ldtRemain 
         AutoSize        =   -1  'True
         Caption         =   "127,121 KB"
         Height          =   180
         Left            =   1350
         TabIndex        =   6
         Top             =   900
         Width           =   900
      End
      Begin VB.Image imgCTotal 
         Height          =   240
         Left            =   120
         Picture         =   "UIFileCopy.ctx":5592
         Top             =   240
         Width           =   240
      End
   End
   Begin MSComctlLib.ListView lvwInfo 
      Height          =   975
      Left            =   0
      TabIndex        =   0
      Top             =   240
      Width           =   6375
      _ExtentX        =   11245
      _ExtentY        =   1720
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      _Version        =   393217
      SmallIcons      =   "iltInfo"
      ColHdrIcons     =   "iltInfo"
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      Appearance      =   1
      NumItems        =   3
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "����"
         Object.Width           =   1693
         ImageIndex      =   4
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "ʱ��"
         Object.Width           =   2302
         ImageIndex      =   5
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "����"
         Object.Width           =   7010
         ImageIndex      =   6
      EndProperty
   End
   Begin MP3PA.ProgressBarEx pbeProgress 
      Height          =   375
      Left            =   0
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   1560
      Width           =   6375
      _ExtentX        =   11245
      _ExtentY        =   661
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "System"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BarForeColor    =   49152
      BackForeColor   =   49152
      BarColor        =   16744576
      BarColor2       =   10231583
      Value           =   0
      BarFillStyle    =   1
   End
   Begin MP3PA.ProgressBarEx pbeCurrent 
      Height          =   375
      Left            =   0
      TabIndex        =   4
      TabStop         =   0   'False
      Top             =   2280
      Width           =   6375
      _ExtentX        =   11245
      _ExtentY        =   661
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "System"
         Size            =   12
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BarForeColor    =   49152
      BackForeColor   =   49152
      BarColor        =   16744576
      BarColor2       =   10231583
      Value           =   0
      BarFillStyle    =   1
   End
   Begin MSComctlLib.ImageList iltTray 
      Index           =   1
      Left            =   600
      Top             =   4560
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   17
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":5B1C
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":5C76
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":5DD0
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":5F2A
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":6084
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":61DE
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":6338
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":6492
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":65EC
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":6746
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":68A0
            Key             =   ""
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":69FA
            Key             =   ""
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":6B54
            Key             =   ""
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":6CAE
            Key             =   ""
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":6E08
            Key             =   ""
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":6F62
            Key             =   ""
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":70BC
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList iltTray 
      Index           =   2
      Left            =   1200
      Top             =   4560
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   17
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":7216
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":7370
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":74CA
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":7624
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":777E
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":78D8
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":7A32
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":7B8C
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":7CE6
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":7E40
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":7F9A
            Key             =   ""
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":80F4
            Key             =   ""
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":824E
            Key             =   ""
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":83A8
            Key             =   ""
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":8502
            Key             =   ""
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":865C
            Key             =   ""
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "UIFileCopy.ctx":87B6
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Label lblInfo 
      AutoSize        =   -1  'True
      Caption         =   "��Ϣ(&I):"
      Height          =   180
      Left            =   0
      TabIndex        =   24
      Top             =   0
      Width           =   720
   End
   Begin VB.Image imgError 
      Height          =   240
      Left            =   3600
      Picture         =   "UIFileCopy.ctx":8910
      Top             =   4560
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Image imgComplete 
      Height          =   240
      Left            =   3240
      Picture         =   "UIFileCopy.ctx":8A5A
      Top             =   4560
      Visible         =   0   'False
      Width           =   240
   End
   Begin VB.Label lblCurrent 
      AutoSize        =   -1  'True
      Caption         =   "����..."
      Height          =   180
      Left            =   0
      TabIndex        =   3
      Top             =   2040
      Width           =   630
   End
   Begin VB.Label lblProgress 
      AutoSize        =   -1  'True
      Caption         =   "�������:"
      Height          =   180
      Left            =   0
      TabIndex        =   1
      Top             =   1320
      Width           =   810
   End
End
Attribute VB_Name = "UIFileCopy"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Private Const FMSize As String = "#,##0 KB"
'Private Const ChunkS As Integer = 1023 '32767

Private DataTotal As Double
Private DataCopyed As Double
Private StartDate As Date
Private LastCopyed As Double
Private LastStat As Date
Private ChunkS As Integer
Private bBackground As Boolean
Private iLastState As Integer
Private iListImage As Integer
Private bCopyMode As Boolean

Public bCancel As Boolean

Private Enum InfoType
  Exclamation = 1
  Critical = 2
  Information = 3
End Enum

'���ʱ��ĺ���
Private Declare Sub GetLocalTime Lib "kernel32" (lpSystemTime As SYSTEMTIME)

Private Type SYSTEMTIME
    wYear As Integer
    wMonth As Integer
    wDayOfWeek As Integer
    wDay As Integer
    wHour As Integer
    wMinute As Integer
    wSecond As Integer
    wMilliseconds As Integer
End Type

'��ʽ�����̵ĺ���
Const SHFD_CAPACITY_DEFAULT = 0 ' default drive capacity
Const SHFD_CAPACITY_360 = 3 ' 360KB, applies to 5.25" drives only
Const SHFD_CAPACITY_720 = 5 ' 720KB, applies to 3.5" drives only
Const SHFD_FORMAT_QUICK = 0 ' quick format
Const SHFD_FORMAT_FULL = 1 ' full format
Const SHFD_FORMAT_SYSONLY = 2 ' copies system files only (Win95 Only!)

Private Declare Function SHFormatDrive Lib "shell32" (ByVal hwndOwner As Long, ByVal iDrive As Long, ByVal iCapacity As Long, ByVal iFormatType As Long) As Long

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

Private Sub cmdBackground_Click()
  If Not bCopyMode Then Exit Sub

  '��С��
  '======
  iLastState = frmMain.WindowState
  frmMain.WindowState = 1
  frmMain.Hide
  App.TaskVisible = False
  bBackground = True
    
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
  TrayI.szTip = "���ڸ����ļ�..."
  TrayI.cbSize = Len(TrayI)
  'Create the icon
  Shell_NotifyIcon NIM_ADD, TrayI

End Sub

Private Sub cmdSaveLog_Click()
  '��������
  Dim F As String
  Dim FI As Integer
  On Error GoTo ErrorExit
  CDG.ShowOpen
  CDG.Flags = cdlOFNExplorer Or cdlOFNHideReadOnly Or cdlOFNNoDereferenceLinks Or cdlOFNNoReadOnlyReturn Or cdlOFNPathMustExist
  F = CDG.FileName
  FI = FreeFile
  
  If FS.FileExists(F) Then
    Select Case MsgBox("�ļ�" & F & "�Ѿ����ڣ�׷���µļ�¼��", vbYesNoCancel)
    Case vbYes
      Open F For Append Access Write As FI
      Print #FI,
    Case vbNo
      Open F For Output Access Write As FI
    Case Else
      Exit Sub
    End Select
  Else
    Open F For Output Access Write As FI
  End If
  
  'д���¼
  Print #FI, "================================="
  Print #FI, Now
  Print #FI, "MP3 Player Assistant �����ļ���¼"
  Print #FI,
  Print #FI, "ʱ��          ����  �¼�"
  Print #FI, "---------------------------------"
  
  For i = 1 To lvwInfo.ListItems.Count
    Print #FI, lvwInfo.ListItems(i).SubItems(1) & "  " & _
               lvwInfo.ListItems(i).Text & "  " & _
               lvwInfo.ListItems(i).SubItems(2)
  Next i
  
  Print #FI, "================================="
  Close #FI
  
  On Error GoTo 0
ErrorExit:
End Sub

Private Sub cmdStop_Click()
  '�ر�
  If cmdStop.Caption = "�ر�" Then
    cmdBackground.Enabled = True
    
    With frmMain
      .Copying = False
      .picCopy.Visible = False
      .picCopy.Enabled = False
      .picCopy.ZOrder 1
      .hspMain.Visible = True
      .tbsFileBrowser.Enabled = True
      .lvwList.Enabled = True
      .hspMain.ZOrder 0
      .picDisk.Visible = False
      .ShowProgress False, ""
      
      .mnuCopy.Enabled = True
      .mnuSelectMP3.Enabled = True
      .mnuCopyLyrics.Enabled = True
      .mnuDeleteBefore.Enabled = True
      .mnuLoad.Enabled = True
      .mnuSave.Enabled = True
      .mnuProperty.Enabled = True
      .mnuOpen.Enabled = True
      .mnuExit.Enabled = True
      .mnuAdd.Enabled = True
      .mnuDelete.Enabled = True
      .mnuAddAll.Enabled = True
      .mnuDeleteAll.Enabled = True
      .mnuCreateFolder.Enabled = True
      .mnuSelectFolder.Enabled = True
      .mnuSort.Enabled = True
      .mnuMyComputer.Enabled = True
      .mnuMyDocuments.Enabled = True
      .mnuFavourite.Enabled = True
      .mnuAppList.Enabled = True
      .mnuDisk.Enabled = True
      .mnuLargeIcon.Enabled = True
      .mnuSmallIcon.Enabled = True
      .mnuList.Enabled = True
      .mnuReport.Enabled = True
      .mnuFullRow.Enabled = True
      .mnuGrid.Enabled = True
      .mnuHotSelect.Enabled = True
      .mnuFilter.Enabled = True
      .mnuPlayBrowser.Enabled = True
      .mnuPlayList.Enabled = True
      .mnuPause.Enabled = True
      .mnuStop.Enabled = True
      .mnuAddToFavourite.Enabled = True
      .mnuDeleteFromFavourite.Enabled = True
      .mnuDeleteAllFavourite.Enabled = True
      .mnuMoveToDirectory.Enabled = True
      .mnuCreateDirectory.Enabled = True
      .mnuDeleteDirectory.Enabled = True
      .mnuImportFromM3U.Enabled = True
      .mnuSaveToM3U.Enabled = True
      .tbrBroswer.Enabled = False
      .tbrPlayer.Enabled = False
      .tbrDefault.Enabled = False
      
      .mnuChangeFileName.Enabled = True
      .mnuInsert.Enabled = True
      .mnuInsertAll.Enabled = True
      .mnurRetrieveAPE.Enabled = True
      .mnurRetrieveID3v1.Enabled = True
      .mnurRetrieveID3v2.Enabled = True
      .mnurRetrieveWMP.Enabled = True
      .mnuResult.Enabled = True
      
      .picDisk.Visible = .mnuDisk.Checked
      
      SetObjectFocus .lvwList.hWnd
      .Form_Resize
    
      .tbrBroswer.Enabled = True
      .tbrPlayer.Enabled = True
      .tbrDefault.Enabled = True
      .tbrBroswer.Enabled = True
      .tbrSearch.Enabled = True
      
      '����б�
      'frmMain.mnuDeleteAll_Click
      Set frmMain.RootListFolder = New ListFolder
      Call frmMain.RecalcSize(True)
      Call frmMain.RefreshChart
      
      dlgSelectPlayer.bStarting = True
      dlgSelectPlayer.Show 1
    End With
  Else
    'ֹͣ����
    bCancel = True
  End If
End Sub

Private Sub picTray_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  Dim MSG As Long
  MSG = X / Screen.TwipsPerPixelX
  
  If MSG = WM_LBUTTONDBLCLK Then
    '�ָ�
    '====
    frmMain.WindowState = iLastState
    frmMain.Show
    App.TaskVisible = True
    bBackground = False
      
    '����֪ͨ����
    '============
    TrayI.cbSize = Len(TrayI)
    TrayI.hWnd = picTray.hWnd
    TrayI.uId = 1&
    Shell_NotifyIcon NIM_DELETE, TrayI
  End If
End Sub

Private Sub tmrPerformance_Timer()
  'ˢ����Ϣ
  Dim NowTime As Date
  Dim Speed As Double
  Dim TimeInterval As Double
  Dim TimeRemain As Long
  Dim MSG As String
  
  NowTime = Now
  
  ldtTimeElapsed.Caption = SecondToStringE(DateDiff("s", StartDate, NowTime))
  
  '�����ٶ�
  TimeInterval = DateDiff("s", LastStat, NowTime)
  Speed = (DataCopyed - LastCopyed) / TimeInterval
  
  ldtSpeed.Caption = (Speed \ 1024) & " KB/S"
  If Speed > 0 Then ldtTimeRemain.Caption = SecondToStringE((DataTotal - DataCopyed) / Speed)
  
  '���º�̨ͼ��
  If bBackground Then
    MSG = "���ڸ���: " & FormatPercent(pbeProgress.value / pbeProgress.Max)
    MSG = MSG & vbCrLf & lblCurrent.Caption
    
    TrayI.hIcon = TrayIcon(NowTime)
    TrayI.szTip = MSG
    TrayI.cbSize = Len(TrayI)
    Shell_NotifyIcon NIM_MODIFY, TrayI
  End If
End Sub

Private Sub UserControl_Click()
  Debug.Print lvwInfo.ColumnHeaders(1).Width
  Debug.Print lvwInfo.ColumnHeaders(2).Width
  Debug.Print lvwInfo.ColumnHeaders(3).Width
End Sub

Private Sub UserControl_Initialize()
  ChunkS = 1023
  lvwInfo.ListItems.Add , , "��Ϣ", , "Information"
  lvwInfo.ListItems(1).SubItems(1) = TimeA
  lvwInfo.ListItems(1).SubItems(2) = "����һ��������Ϣ"
  
  SetHeaderStyle lvwInfo.hWnd
End Sub

Private Sub UserControl_Resize()
  '�����ؼ���С
  Dim X As Long, Y As Long
  
  X = UserControl.ScaleWidth
  Y = UserControl.ScaleHeight
  
  lvwInfo.Width = X
  pbeProgress.Width = X
  pbeCurrent.Width = X
  fraPerformance.Width = (X - 105) / 2
  fraState.Width = (X - 105) / 2
  fraPerformance.Left = (X - 105) / 2 + 105
  cmdBackground.Left = X - 4215
  cmdSaveLog.Left = X - 2775
  cmdStop.Left = X - 1335
  
  lvwInfo.Height = Y - 3480
  lblProgress.Top = Y - 3135
  pbeProgress.Top = Y - 2895
  lblCurrent.Top = Y - 2415
  pbeCurrent.Top = Y - 2175
  fraState.Top = Y - 1695
  fraPerformance.Top = Y - 1695
  chkShutDown.Top = Y - 375
  cmdBackground.Top = Y - 375
  cmdSaveLog.Top = Y - 375
  cmdStop.Top = Y - 375
  
  lvwInfo.ColumnHeaders(3).Width = X - lvwInfo.ColumnHeaders(1).Width - lvwInfo.ColumnHeaders(2).Width - 435.86
End Sub

Public Sub CopyFile(ByVal RootFolder As MP3PA.ListFolder, ByVal Destination As String, Optional ByVal ClearDisk As Boolean = False)
  '��ʼ�����ļ�
'  Dim FC As New VBA.Collection
'  Dim FNewName As New VBA.Collection
  Dim FI As MP3PA.ListInfo
  Dim OriProgress As Double
  Dim ListInfo As New VBA.Collection
  Dim i As Long, j As Long
  
  lvwInfo.ListItems.Clear
  ldtTotal.Caption = vbNullString
  ldtCopyed.Caption = vbNullString
  ldtRemain.Caption = vbNullString
  ldtTimeElapsed.Caption = vbNullString
  ldtTimeRemain.Caption = vbNullString
  ldtSpeed.Caption = vbNullString
  cmdSaveLog.Enabled = False
  cmdStop.Enabled = False
  DataTotal = 0
  DataCopyed = 0
  StartDate = Now
  pbeCurrent.value = 0
  pbeProgress.value = 0
  tmrPerformance.Enabled = False
  bCopyMode = True
  
  '==============
  ' ׼���ļ��б�
  '==============
  AddInfo "��ʼ׼���ļ��б�"
  lblCurrent.Caption = "����׼���ļ��б�..."
  DoEvents
  
  '�ݹ鷨����ļ���
  RecursionAddListInfo ListInfo, RootFolder, Destination
  
  '==========
  ' ��������
  '==========
  Dim REN As String
  Dim RenamePattern As String
  Dim NumberPattern As String
  Dim FileCount As String
  Dim xCount As Long
  Dim xFI As ListInfo
  
  NumberPattern = String(Fix(Log(ListInfo.Count) / Log(10#)) + 1, "0")
  i = 1
  j = 1
  
  If RenameEnabled Then
'    Call RecursionGetAudioFileCount(xCount, RootFolder)
    RenamePattern = RenameKey(RenameCurrent)
  
    '��һ�Ĵ����ļ�
    Do Until i > ListInfo.Count
      Set FI = ListInfo(i)
      
      If (FI.AudioFile) And (FI.TagExist) Then
        '�����ļ���
        REN = RenamePattern
        
        REN = Replace(REN, "%FILENAME%", FS.GetBaseName(FI.FileName))
        REN = Replace(REN, "%FILESIZE%", FI.Size)
        REN = Replace(REN, "%DATECREATED%", Format(FI.CreateDate, "yyyy-mm-dd hh-mm-ss"))
        
        REN = Replace(REN, "%ARTIST%", FI.Artist)
        REN = Replace(REN, "%ALBUM%", FI.Album)
        REN = Replace(REN, "%TITLE%", FI.Title)
        REN = Replace(REN, "%GENRE%", FI.Genre)
        REN = Replace(REN, "%LENGTH%", FI.Length)
        REN = Replace(REN, "%TRACKNUMBER%", FI.Track)
        REN = Replace(REN, "%YEAR%", FI.Year)
      
        REN = Replace(REN, "%NUMBER%", Format(j + NumberStart - 1, NumberPattern))
        
        '������Ľ���洢�� FI ��
        FI.NewName = REN
      Else
        FI.NewName = FS.GetBaseName(FI.FileName)
      End If
      
      '�����б�
      DataTotal = DataTotal + FI.Size
      
      If FI.Lyric Then
        '������ļ���ӵ�����
        Set xFI = New ListInfo
        
        xFI.FileName = FI.LyricFile
        xFI.Size = FI.LyricSize
        xFI.NewName = REN & ".LRC"
        xFI.Destination = FI.Destination
        
        ListInfo.Add xFI, , , i
        
        DataTotal = DataTotal + FI.LyricSize
        
        i = i + 1
      End If
      
      FI.NewName = FI.NewName & Chr(46) & FS.GetExtensionName(FI.FileName)
      
      '��һ��
      i = i + 1
      j = j + 1
    Loop
  Else
    '�����б�
    Do Until i > ListInfo.Count
      Set FI = ListInfo(i)
      
      DataTotal = DataTotal + FI.Size
      FI.NewName = FS.GetBaseName(FI.FileName)
    
      If FI.Lyric Then
        '������ļ���ӵ�����
        Set xFI = New ListInfo
        
        xFI.FileName = FI.LyricFile
        xFI.Size = FI.LyricSize
        xFI.NewName = FI.NewName & ".LRC"
        xFI.Destination = FI.Destination
        
        ListInfo.Add xFI, , , i
        
        DataTotal = DataTotal + FI.LyricSize
        
        i = i + 1
      End If
      
      FI.NewName = FS.GetFileName(FI.FileName)
      
      '��һ��
      i = i + 1
    Loop
  End If
  
  
  AddInfo "�ļ��б�׼�����(" & ListInfo.Count & " ���ļ�)"
  ldtTotal.Caption = Format(Int(DataTotal / 1024), FMSize)
  ldtCopyed.Caption = Format(0, FMSize)
  ldtRemain.Caption = ldtTotal.Caption
  pbeProgress.Max = Int(DataTotal / 1024) + 1
  DoEvents
  
  '==========
  ' ��մ���
  '==========
'  On Error GoTo ErrorOccear
'  If (ClearDisk) And (DF.Count + DC.Count > 1) Then
'    'ɾ���ļ�
'    AddInfo "��ʼ��մ���"
'    OriProgress = DF.Count + DC.Count
'    pbeProgress.Max = pbeProgress.Max + OriProgress
'    pbeCurrent.Value = 0
'    pbeCurrent.Max = DF.Count
'    lblCurrent.Caption = "����ɾ���ļ�..."
'
'    For i = 1 To DC.Count
'      FS.DeleteFile DC(i), True
'      pbeCurrent.Value = i
'      pbeProgress.Value = pbeProgress.Value + 1
'      DoEvents
'    Next i
'
'    pbeCurrent.Value = 0
'    pbeCurrent.Max = DC.Count
'    lblCurrent.Caption = "����ɾ���ļ���..."
'
'    For i = 1 To DF.Count
'      FS.DeleteFolder DF(i), True
'      pbeCurrent.Value = i
'      pbeProgress.Value = pbeProgress.Value + 1
'      DoEvents
'    Next i
'    AddInfo "��մ��̽���(ɾ�� " & DC.Count + DF.Count & " ���ļ����ļ���)"
'  End If
'  On Error GoTo 0
  If ClearDisk Then
    AddInfo "���� Windows ��ʽ���Ի���"
    r = SHFormatDrive(frmMain.hWnd, Asc(UCase(Left(Destination, 1))) - 65, 0, 0)
    AddInfo "Windows ��ʽ���Ի���ر�"
  End If
  
  '�����ļ���
'  If Right(Destination, 1) = "\" Then
'    Destination = Left(Destination, Len(Destination) - 1)
'  End If
'
'  If Not FS.FolderExists(Destination) Then Call CreateFolder(Destination)
  
  '==========
  ' �����ļ�
  '==========
  Dim F1 As Integer
  Dim F2 As Integer
  Dim P1 As String
  Dim P2 As String
  Dim FLen As Double
  Dim Chunk() As Byte
  Dim ReadBegin As Long
  Dim ReadEnd As Long

  AddInfo "��ʼ�����ļ�"
  cmdStop.Enabled = True
  On Error GoTo ErrorOccearWhileCopy
  
  If Right(Destination, 1) <> "\" Then
    Destination = Destination & "\"
  End If
  
  LastStat = Now
  tmrPerformance.Enabled = True
  bCancel = False
  
  Reset
  
  For i = 1 To ListInfo.Count
    Set FI = ListInfo(i)
    
    F1 = FreeFile
    F2 = F1 + 1
    
    P1 = FI.FileName
    P2 = AppendPath(FI.Destination, FI.NewName)
    
    '���ļ�
    Open P1 For Binary Access Read Shared As F1
    Open P2 For Binary Access Write Lock Read Write As F2
    
    Seek F1, 1
    FLen = LOF(F1)
    pbeCurrent.Max = FLen
    pbeCurrent.value = 0
    lblCurrent.Caption = "(" & i & "/" & ListInfo.Count & ")���ڸ����ļ� " & P1 & "..."
    ReadBegin = 1
    ReadEnd = FLen
    
    '���ڱ�ǩ�Ķ���
    If StrComp(FS.GetExtensionName(FI.FileName), "MP3", vbTextCompare) = 0 Then
      'ɾ�� ID3v1
      If TagDelID3v1 Then
        ReadEnd = FindMP3Ender(F1, FLen)
      Else
        ReadEnd = FLen
      End If
      
      'ɾ�� ID3v2
      If TagDelID3v2 Then
        ReadBegin = FindMP3Header(F1)
        
        '������ܾ�д�� ID3v2
        If TagWriteID3v2 Then
          If TagUseUnicode Then
            Call WriteID3v2W(F2, FI.Artist, FI.Album, FI.Title, FI.Track, FI.Genre, FI.Year)
          Else
            Call WriteID3v2A(F2, FI.Artist, FI.Album, FI.Title, FI.Track, FI.Genre, FI.Year)
          End If
        End If
      Else
        ReadEnd = LOF(F1)
      End If
    End If
    
    Seek #F1, ReadBegin
    
    Do Until EOF(F1)
      '���ȡ������
      If bCancel Then
        Close P1
        Close P2
        AddInfo "�û�ȡ������", Exclamation
        FS.DeleteFile P2
        AddInfo "ɾ��������һ����ļ� " & FS.GetFileName(P2), Exclamation
        GoTo LastOperate
        Exit Sub
      End If
      
      'һ������һ������ض�ȡ��д��
      If ReadEnd > Loc(F1) Then
        If ((FLen - Loc(F1)) < ChunkS) Then
          ReDim Chunk(ReadEnd - Loc(F1) - 1) As Byte
          Get F1, , Chunk
        Else
          ReDim Chunk(ChunkS) As Byte
          Get F1, , Chunk
        End If
        
        'д��
        Put F2, , Chunk
        
        '���½���
        pbeCurrent.value = pbeCurrent.value + UBound(Chunk) + 1
        DataCopyed = DataCopyed + UBound(Chunk) + 1
        pbeProgress.value = OriProgress + DataCopyed \ 1024
        ldtCopyed.Caption = Format(Int(DataCopyed / 1024), FMSize)
        ldtRemain.Caption = Format(Int((DataTotal - DataCopyed) / 1024), FMSize)
        DoEvents
      Else
        Exit Do
      End If
    Loop
    
    '�������д�� ID3v1 ��ǩ
    If StrComp(FS.GetExtensionName(FI.FileName), "MP3", vbTextCompare) = 0 Then
      If TagDelID3v1 And TagWriteID3v1 Then
        Call WriteID3v1(F2, FI.Artist, FI.Album, FI.Title, FI.Track, FI.Genre, FI.Year)
      End If
    End If
    
    '�ر��ļ�
    AddInfo "�����ļ��ɹ� " & FS.GetFileName(P1)

SkipFile:
    Close F1
    Close F2
  Next i
  
  pbeCurrent.value = pbeCurrent.Max
  pbeProgress.value = pbeProgress.Max
  AddInfo "���������Ѿ���ɡ�"
  
  If bBackground Then
    TrayI.hIcon = imgComplete.Picture.Handle
    TrayI.szTip = "���������Ѿ���ɡ�"
    TrayI.cbSize = Len(TrayI)
    Shell_NotifyIcon NIM_MODIFY, TrayI
  End If
  
LastOperate:
  cmdStop.Enabled = True
  cmdStop.Caption = "�ر�"
  cmdSaveLog.Enabled = True
  tmrPerformance.Enabled = False
  bCopyMode = False
  Reset
  On Error GoTo 0
  
  If chkShutDown.value Then
    '�ػ�
    Shutdown.ShutDownNT False
  End If
  
  Exit Sub
  
ErrorOccear:
  AddInfo "����(" & Err.Number & "): " & Err.Description, Exclamation
  Resume Next
  
ErrorOccearWhileCopy:
  '���ݴ���ͬ
  Select Case Err.Number
  Case 7, 51, 61
    '��Щ�����Ĵ���, ��ֹ
    AddInfo "����(" & Err.Number & "): " & Err.Description, Critical
    
    If bBackground Then
      TrayI.hIcon = imgError.Picture.Handle
      TrayI.szTip = "������һ�������Ĵ���"
      TrayI.cbSize = Len(TrayI)
      Shell_NotifyIcon NIM_MODIFY, TrayI
    End If
    
    GoTo LastOperate
  Case 53
    '�����ļ�����, ������һ��
    AddInfo "����(" & Err.Number & "): " & Err.Description, Exclamation
    GoTo SkipFile
  Case 76
    '·��δ�ҵ������� 76��
    CreateFolder ListInfo(i).Destination
    Resume
  Case Else
    '�����ֽ�
    AddInfo "�ļ���ȡ����: " & ListInfo(i).FileName, Exclamation
    Resume Next
  End Select
End Sub

Public Function TimeA() As String
  '���ϵͳʱ��
  Dim ST As SYSTEMTIME
  Call GetLocalTime(ST)
  Let TimeA = Format(ST.wHour, "00") & ":" & Format(ST.wMinute, "00") & ":" & Format(ST.wSecond, "00") & "." & Format(ST.wMilliseconds, "000")
End Function

Private Sub AddInfo(ByVal Message As String, Optional ByVal iType As InfoType = Information)
  '�����Ϣ
  Dim nItem As MSComctlLib.ListItem
  Set nItem = lvwInfo.ListItems.Add
  nItem.Text = Choose(iType, "����", "ʧ��", "��Ϣ")
  nItem.SmallIcon = iType
  nItem.SubItems(1) = TimeA
  nItem.SubItems(2) = Message
  nItem.EnsureVisible
End Sub

Private Function SecondToStringE(ByVal Second As Double) As String
  '������ת��Ϊʱ��
  Dim H As Long, Min As Long, S As Long
  
  H = Second \ 3600
  S = Second Mod 60
  Min = (Second \ 60) Mod 60
  
  SecondToStringE = H & ":" & Right("0" & Min, 2) & ":" & Right("0" & S, 2)
End Function

Public Property Get CopySpeed() As Integer
  CopySpeed = (ChunkS + 1) / 1024
End Property

Public Property Let CopySpeed(ByVal vNewValue As Integer)
  If (vNewValue > 32) Or (vNewValue < 1) Then Exit Property
  ChunkS = vNewValue * 1024 - 1
End Property

Private Function TrayIcon(ByVal NowTime As Date) As StdPicture
  '����ض���ͼ��
  Dim iIndex As Integer
  
  iIndex = CInt(DataCopyed * 16 / DataTotal) + 1
  iListImage = (iListImage + 1) Mod 3
  
  Set TrayIcon = iltTray(iListImage).ListImages(iIndex).Picture
End Function

Private Function FindMP3Header(ByVal iFile As Integer) As Long
  '���� MP3 �ļ�ͷ�ĺ���
  Dim bHeader(1) As Byte
  
  Seek #iFile, 1
  
  Do Until EOF(iFile)
    Get #iFile, , bHeader
    
    If bHeader(0) = &HFF And (bHeader(1) = &HFA Or bHeader(1) = &HFB) Then
      '�ҵ�ͷ��
      FindMP3Header = Seek(iFile) - 2
      Exit Function
    End If
    
    Seek #iFile, Seek(iFile) - 1
  Loop
  
  'û�ҵ�
  FindMP3Header = 1
End Function

Private Function FindMP3Ender(ByVal iFile As Integer, ByVal FileLen As Long) As Long
  '���ҽ�β�Ĳ���
  Dim TagText(127) As Byte
  
  Seek iFile, FileLen - 128 + 1
  Get #iFile, , TagText
  
  If GetStringFromByte(TagText, 0, 3) = "TAG" Then
    FindMP3Ender = FileLen - 128
  Else
    FindMP3Ender = FileLen
  End If
End Function

'=================================
' �� Byte �����л���ַ�
'------------------------
' ByteArrary - Ҫ���ݵ� Byte ����
' UpperBound - �Ͻ�
' ReadByte - Ҫ��õ��ַ���
'=================================
Private Function GetStringFromByte(ByRef ByteArrary() As Byte, Optional ByVal UpperBound As Integer = 0, Optional ByVal ReadByte As Integer = 1) As String
  Dim bTemp() As Byte
  Dim i As Long
  
  ReDim bTemp(ReadByte - 1)
  
  For i = UpperBound To UpperBound + ReadByte - 1
    bTemp(i - UpperBound) = ByteArrary(i)
  Next i
  
  GetStringFromByte = StripNulls(StrConv(bTemp, vbUnicode))
End Function

'=================================
' �ݹ�����б���Ϣ��������
'--------------------------
' ListCollection - Ҫ�����ļ���
' ListFolder - Ҫ��ȡ��Ŀ¼
' FolderName - ����Ŀ¼����
'=================================
Private Sub RecursionAddListInfo(ByRef ListCollection As VBA.Collection, ByRef ListFolder As MP3PA.ListFolder, ByRef FolderName As String)
  Dim i As Long
  Dim LI As MP3PA.ListInfo
  
  '��������ļ���������
  For i = 1 To ListFolder.ListFiles.Count
    Set LI = ListFolder.ListFiles(i)
    LI.Destination = FolderName
    ListCollection.Add LI
  Next i
  
  '�ݹ鷨�������ļ���
  For i = 1 To ListFolder.SubFolders.Count
    Call RecursionAddListInfo(ListCollection, ListFolder.SubFolders(i), AppendPath(FolderName, ListFolder.SubFolders(i).FolderName))
  Next i
End Sub

'================================
' �ݹ�ͳ���ļ���Ŀ
'================================
Private Sub RecursionGetAudioFileCount(ByRef FileCount As Long, ByRef ListFolder As MP3PA.ListFolder)
  Dim i As Long
  
  FileCount = ListFolder.ListFiles.Count + FileCount
  
  For i = 1 To ListFolder.SubFolders.Count
    Call RecursionGetAudioFileCount(FileCount, ListFolder.SubFolders(i))
  Next i
End Sub

