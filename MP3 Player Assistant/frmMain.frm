VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.1#0"; "MSCOMCTL.OCX"
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "COMDLG32.OCX"
Begin VB.Form frmMain 
   Caption         =   "MP3 Player Assistant"
   ClientHeight    =   8985
   ClientLeft      =   225
   ClientTop       =   855
   ClientWidth     =   12630
   Icon            =   "frmMain.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   8985
   ScaleWidth      =   12630
   StartUpPosition =   3  '����ȱʡ
   Begin MSComctlLib.ImageList iltListFolder 
      Left            =   2760
      Top             =   2040
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   8
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":058A
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":0B24
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":10BE
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2DC8
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":4AD2
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":506C
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":5606
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":5BA0
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Timer tmrChangedEvent 
      Enabled         =   0   'False
      Interval        =   100
      Left            =   2160
      Top             =   6000
   End
   Begin MSComctlLib.Toolbar tbrSBBar 
      Align           =   1  'Align Top
      Height          =   360
      Left            =   0
      TabIndex        =   30
      Top             =   1470
      Width           =   12630
      _ExtentX        =   22278
      _ExtentY        =   635
      ButtonWidth     =   1138
      ButtonHeight    =   582
      Appearance      =   1
      Style           =   1
      TextAlignment   =   1
      ImageList       =   "iltToolbarSmall"
      _Version        =   393216
      Begin MSComctlLib.Toolbar tbrSearch 
         Height          =   345
         Left            =   0
         TabIndex        =   33
         Top             =   0
         Visible         =   0   'False
         Width           =   10455
         _ExtentX        =   18441
         _ExtentY        =   609
         ButtonWidth     =   2619
         ButtonHeight    =   609
         Style           =   1
         TextAlignment   =   1
         ImageList       =   "iltToolbarSmall"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "�����������"
               ImageIndex      =   9
               Style           =   1
            EndProperty
         EndProperty
         Begin MSComctlLib.ImageCombo icbSearch 
            Height          =   330
            Left            =   1500
            TabIndex        =   34
            Top             =   0
            Width           =   8955
            _ExtentX        =   15796
            _ExtentY        =   582
            _Version        =   393216
            ForeColor       =   -2147483640
            BackColor       =   -2147483643
            ImageList       =   "iltToolbarSmall"
         End
      End
      Begin MSComctlLib.Toolbar tbrBroswer 
         Height          =   345
         Left            =   0
         TabIndex        =   31
         Top             =   0
         Width           =   7215
         _ExtentX        =   12726
         _ExtentY        =   609
         ButtonWidth     =   1349
         ButtonHeight    =   609
         Wrappable       =   0   'False
         Style           =   1
         TextAlignment   =   1
         ImageList       =   "iltToolbarSmall"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   4
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "����"
               ImageIndex      =   1
            EndProperty
            BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "���"
               ImageIndex      =   2
            EndProperty
            BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Style           =   4
               Object.Width           =   2000
            EndProperty
            BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               Caption         =   "ת��"
               ImageIndex      =   3
            EndProperty
         EndProperty
         Begin MSComctlLib.ImageCombo icbBrowse 
            Height          =   315
            Left            =   1545
            TabIndex        =   32
            Top             =   0
            Width           =   1815
            _ExtentX        =   3201
            _ExtentY        =   556
            _Version        =   393216
            ForeColor       =   -2147483640
            BackColor       =   -2147483643
         End
      End
   End
   Begin VB.Timer tmrSetWidth 
      Interval        =   100
      Left            =   2160
      Top             =   5520
   End
   Begin MSComctlLib.ImageList iltFav 
      Left            =   2160
      Top             =   3840
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   16777214
      _Version        =   393216
   End
   Begin MSComctlLib.ImageList iltFavourite 
      Left            =   2160
      Top             =   3240
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
            Picture         =   "frmMain.frx":613A
            Key             =   "FAV_ROOT"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":66D4
            Key             =   "FAV_MUSIC"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":6C6E
            Key             =   "FAV_NORMAL"
         EndProperty
      EndProperty
   End
   Begin MSComDlg.CommonDialog CDG 
      Left            =   2160
      Top             =   6480
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin MSComctlLib.ImageList iltProgram 
      Left            =   2160
      Top             =   2040
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   14
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":7208
            Key             =   "WMP"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":77A2
            Key             =   "WMP_LIST"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":7D3C
            Key             =   "WMP_AUTOLIST"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":82D6
            Key             =   "WINAMP"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":8870
            Key             =   "WINAMP_LIST"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":8E0A
            Key             =   "FOOBAR"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":93A4
            Key             =   "FOOBAR_LIST"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":993E
            Key             =   "WINAMP_LIST_COLLECTION"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":9ED8
            Key             =   "WMP_AUTOLIST_COLLECTION"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":A472
            Key             =   "WMP_LIST_COLLECTION"
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":AA0C
            Key             =   "TTPLAYER"
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":AFA6
            Key             =   "TTPLAYER_LIST"
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":B540
            Key             =   "FOOBAR9"
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":BADA
            Key             =   "FOOBAR9_LIST"
         EndProperty
      EndProperty
   End
   Begin VB.DirListBox drFolder 
      Height          =   2610
      Left            =   4440
      TabIndex        =   14
      Top             =   -4200
      Visible         =   0   'False
      Width           =   1935
   End
   Begin MSComctlLib.ImageList iltMyDoc 
      Left            =   1560
      Top             =   4440
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   16777215
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   16777214
      _Version        =   393216
   End
   Begin VB.Timer tmrPlayer 
      Enabled         =   0   'False
      Interval        =   1000
      Left            =   2160
      Top             =   5040
   End
   Begin MSComctlLib.ImageList iltList 
      Left            =   1560
      Top             =   7440
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   16777214
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   9
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":C074
            Key             =   "?LYRICS"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":C60E
            Key             =   "?LYRICEXRACTED"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":CBA8
            Key             =   "?NOLYRICS"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":D142
            Key             =   ">ID3v1"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":D6DC
            Key             =   ">ID3v2"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":DC76
            Key             =   ">APETAG"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":E210
            Key             =   ">WMP"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":E7AA
            Key             =   ">NOTAG"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":ED44
            Key             =   ">INHERIT"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList iltColHeader 
      Left            =   1560
      Top             =   5040
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   12
      ImageHeight     =   12
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   2
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":F2DE
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":F51A
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList iltListHeader 
      Left            =   1560
      Top             =   6840
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   13
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":F756
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":FCF0
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":1028A
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":10824
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":10DBE
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":11358
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":118F2
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":11E8C
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":12426
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":129C0
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":12F5A
            Key             =   ""
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":134F4
            Key             =   ""
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":13A8E
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList iltSmall 
      Left            =   1560
      Top             =   6240
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   16777214
      _Version        =   393216
   End
   Begin MSComctlLib.ImageList iltLarge 
      Left            =   1560
      Top             =   5640
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   32
      ImageHeight     =   32
      MaskColor       =   16777214
      _Version        =   393216
   End
   Begin VB.PictureBox picPainterL 
      AutoRedraw      =   -1  'True
      BackColor       =   &H00FFFFFE&
      BorderStyle     =   0  'None
      Height          =   480
      Left            =   2160
      ScaleHeight     =   480
      ScaleWidth      =   480
      TabIndex        =   13
      TabStop         =   0   'False
      Top             =   7440
      Visible         =   0   'False
      Width           =   480
   End
   Begin VB.FileListBox flFile 
      Height          =   2610
      Left            =   7680
      TabIndex        =   12
      Top             =   -12000
      Visible         =   0   'False
      Width           =   2535
   End
   Begin VB.PictureBox picPainter 
      Appearance      =   0  'Flat
      AutoRedraw      =   -1  'True
      AutoSize        =   -1  'True
      BackColor       =   &H00FFFFFE&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   240
      Left            =   2160
      ScaleHeight     =   240
      ScaleWidth      =   240
      TabIndex        =   9
      TabStop         =   0   'False
      Top             =   7080
      Visible         =   0   'False
      Width           =   240
   End
   Begin MSComctlLib.ImageList iltFolder 
      Left            =   1560
      Top             =   3840
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   16777215
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   16777214
      _Version        =   393216
   End
   Begin MSComctlLib.ImageList iltToolbarLarge 
      Left            =   1560
      Top             =   2640
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   48
      ImageHeight     =   48
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   15
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":14028
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":14F02
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":15DDC
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":16CB6
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":17B90
            Key             =   ""
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":18A6A
            Key             =   ""
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":19944
            Key             =   ""
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":1A81E
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":1B6F8
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":1C5D2
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":1D4AC
            Key             =   ""
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":1E386
            Key             =   ""
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":1F260
            Key             =   ""
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2013A
            Key             =   ""
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":21014
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList iltToolbarSmall 
      Left            =   1560
      Top             =   2040
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   27
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":21EEE
            Key             =   "IMG1"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":22488
            Key             =   "IMG2"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":22A22
            Key             =   "IMG3"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":22FBC
            Key             =   "IMG4"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":23556
            Key             =   "IMG5"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":23AF0
            Key             =   "IMG6"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2408A
            Key             =   "IMG7"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":24624
            Key             =   ""
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":24BBE
            Key             =   ""
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":25158
            Key             =   ""
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":256F2
            Key             =   ""
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":25C8C
            Key             =   ""
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":26226
            Key             =   ""
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":267C0
            Key             =   ""
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":26D5A
            Key             =   ""
         EndProperty
         BeginProperty ListImage16 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":272F4
            Key             =   ""
         EndProperty
         BeginProperty ListImage17 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2788E
            Key             =   ""
         EndProperty
         BeginProperty ListImage18 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":27E28
            Key             =   ""
         EndProperty
         BeginProperty ListImage19 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":283C2
            Key             =   ""
         EndProperty
         BeginProperty ListImage20 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2895C
            Key             =   ""
         EndProperty
         BeginProperty ListImage21 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":28EF6
            Key             =   ""
         EndProperty
         BeginProperty ListImage22 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":29490
            Key             =   ""
         EndProperty
         BeginProperty ListImage23 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":29A2A
            Key             =   ""
         EndProperty
         BeginProperty ListImage24 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":29FC4
            Key             =   ""
         EndProperty
         BeginProperty ListImage25 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2A55E
            Key             =   ""
         EndProperty
         BeginProperty ListImage26 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2AAF8
            Key             =   ""
         EndProperty
         BeginProperty ListImage27 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2B092
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.PictureBox picDisk 
      Align           =   3  'Align Left
      BackColor       =   &H80000005&
      Height          =   6840
      Left            =   0
      ScaleHeight     =   6780
      ScaleWidth      =   1155
      TabIndex        =   2
      TabStop         =   0   'False
      Top             =   1830
      Width           =   1215
      Begin MP3PA.Cubagor cbgDisk 
         Height          =   5175
         Left            =   120
         TabIndex        =   16
         Top             =   120
         Width           =   615
         _ExtentX        =   1085
         _ExtentY        =   9128
         Value           =   50
         Max             =   100
         Original        =   20
      End
      Begin VB.Label lblZero 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00008000&
         Height          =   195
         Left            =   720
         TabIndex        =   6
         Top             =   5040
         Width           =   90
      End
      Begin VB.Label lblOrigial 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Original"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000040C0&
         Height          =   195
         Left            =   720
         TabIndex        =   5
         Top             =   600
         Width           =   540
      End
      Begin VB.Label lblAdded 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Added"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00FF0000&
         Height          =   195
         Left            =   720
         TabIndex        =   4
         Top             =   360
         Width           =   465
      End
      Begin VB.Label lblTotal 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "Total"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H000000FF&
         Height          =   195
         Left            =   720
         TabIndex        =   3
         Top             =   120
         Width           =   360
      End
   End
   Begin MSComctlLib.Toolbar tbrPlayer 
      Align           =   1  'Align Top
      Height          =   360
      Left            =   0
      TabIndex        =   1
      Top             =   1110
      Width           =   12630
      _ExtentX        =   22278
      _ExtentY        =   635
      ButtonWidth     =   609
      ButtonHeight    =   582
      Wrappable       =   0   'False
      Appearance      =   1
      Style           =   1
      ImageList       =   "iltToolbarSmall"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   4
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Enabled         =   0   'False
            Object.ToolTipText     =   "�����ļ�������е��ļ�"
            ImageIndex      =   4
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Enabled         =   0   'False
            Object.ToolTipText     =   "�����б��е��ļ�"
            ImageIndex      =   5
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Enabled         =   0   'False
            Object.ToolTipText     =   "��ͣ����"
            ImageIndex      =   6
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Enabled         =   0   'False
            Object.ToolTipText     =   "ֹͣ����"
            ImageIndex      =   7
         EndProperty
      EndProperty
      Begin MSComctlLib.Slider sldPos 
         Height          =   300
         Left            =   1350
         TabIndex        =   7
         TabStop         =   0   'False
         Tag             =   "0"
         Top             =   0
         Width           =   8535
         _ExtentX        =   15055
         _ExtentY        =   529
         _Version        =   393216
         Enabled         =   0   'False
         Max             =   100
         TickStyle       =   3
         TextPosition    =   1
      End
   End
   Begin MSComctlLib.StatusBar stbDefault 
      Align           =   2  'Align Bottom
      Height          =   315
      Left            =   0
      TabIndex        =   0
      Top             =   8670
      Width           =   12630
      _ExtentX        =   22278
      _ExtentY        =   556
      _Version        =   393216
      BeginProperty Panels {8E3867A5-8586-11D1-B16A-00C0F0283628} 
         NumPanels       =   3
         BeginProperty Panel1 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   1
            Object.Width           =   19685
            MinWidth        =   26
         EndProperty
         BeginProperty Panel2 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   2
            Object.Width           =   1693
            MinWidth        =   25
            Picture         =   "frmMain.frx":2B62C
            Text            =   "(ֹͣ)"
            TextSave        =   "(ֹͣ)"
            Object.ToolTipText     =   "������״̬"
         EndProperty
         BeginProperty Panel3 {8E3867AB-8586-11D1-B16A-00C0F0283628} 
            AutoSize        =   2
            Object.Width           =   318
            MinWidth        =   25
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.Toolbar tbrDefault 
      Align           =   1  'Align Top
      Height          =   1110
      Left            =   0
      TabIndex        =   8
      Top             =   0
      Width           =   12630
      _ExtentX        =   22278
      _ExtentY        =   1958
      ButtonWidth     =   1614
      ButtonHeight    =   1905
      Wrappable       =   0   'False
      Appearance      =   1
      Style           =   1
      ImageList       =   "iltToolbarLarge"
      _Version        =   393216
      BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
         NumButtons      =   18
         BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "ѡ�� MP3"
            ImageIndex      =   1
         EndProperty
         BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "�������"
            ImageIndex      =   2
            Style           =   1
         EndProperty
         BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "���Ƹ��"
            ImageIndex      =   12
            Style           =   1
            Value           =   1
         EndProperty
         BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "������"
            Key             =   "RENAME"
            ImageIndex      =   13
            Style           =   5
            BeginProperty ButtonMenus {66833FEC-8583-11D1-B16A-00C0F0283628} 
               NumButtonMenus  =   5
               BeginProperty ButtonMenu1 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Text            =   "ʹ��������:"
               EndProperty
               BeginProperty ButtonMenu2 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Text            =   "-"
               EndProperty
               BeginProperty ButtonMenu3 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Text            =   "����������(&E)"
               EndProperty
               BeginProperty ButtonMenu4 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Text            =   "����������(&S)..."
               EndProperty
               BeginProperty ButtonMenu5 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Text            =   "-"
               EndProperty
            EndProperty
         EndProperty
         BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "��ʼ����"
            ImageIndex      =   3
         EndProperty
         BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "���"
            ImageIndex      =   4
         EndProperty
         BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "ɾ��"
            ImageIndex      =   5
         EndProperty
         BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "ȫ��ɾ��"
            ImageIndex      =   6
         EndProperty
         BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "����"
            ImageIndex      =   7
         EndProperty
         BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "�����б�"
            Key             =   "SORTLIST"
            ImageIndex      =   8
            Style           =   5
            BeginProperty ButtonMenus {66833FEC-8583-11D1-B16A-00C0F0283628} 
               NumButtonMenus  =   2
               BeginProperty ButtonMenu1 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Text            =   "����(&S)..."
               EndProperty
               BeginProperty ButtonMenu2 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Text            =   "-"
               EndProperty
            EndProperty
         EndProperty
         BeginProperty Button12 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button13 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "���б�"
            ImageIndex      =   10
         EndProperty
         BeginProperty Button14 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "�����б�"
            ImageIndex      =   11
         EndProperty
         BeginProperty Button15 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button16 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "������"
            Key             =   "FILTER"
            ImageIndex      =   9
            Style           =   5
            BeginProperty ButtonMenus {66833FEC-8583-11D1-B16A-00C0F0283628} 
               NumButtonMenus  =   4
               BeginProperty ButtonMenu1 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "CURRENT"
                  Text            =   "��ǰ:"
               EndProperty
               BeginProperty ButtonMenu2 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Text            =   "-"
               EndProperty
               BeginProperty ButtonMenu3 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Text            =   "����(&S)..."
               EndProperty
               BeginProperty ButtonMenu4 {66833FEE-8583-11D1-B16A-00C0F0283628} 
                  Text            =   "-"
               EndProperty
            EndProperty
         EndProperty
         BeginProperty Button17 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Style           =   3
         EndProperty
         BeginProperty Button18 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            Caption         =   "����"
            ImageIndex      =   15
         EndProperty
      EndProperty
   End
   Begin MP3PA.HSplitter hspMain 
      Align           =   4  'Align Right
      Height          =   6840
      Left            =   5895
      TabIndex        =   18
      Top             =   1830
      Width           =   6735
      _ExtentX        =   11880
      _ExtentY        =   12065
      SplTop          =   2314
      MinTop          =   1200
      MinBottom       =   1200
      TopCtlCount     =   1
      BottomCtlCount  =   1
      ResizeMode      =   1
      TopCtl1         =   "tbsFileBrowser"
      BottomCtl1      =   "picList"
      Begin VB.PictureBox picList 
         AutoRedraw      =   -1  'True
         BorderStyle     =   0  'None
         Height          =   4466
         Left            =   0
         ScaleHeight     =   4470
         ScaleWidth      =   6735
         TabIndex        =   35
         TabStop         =   0   'False
         Top             =   2374
         Width           =   6735
         Begin MP3PA.VSplitter vspFileList 
            Height          =   2775
            Left            =   0
            TabIndex        =   37
            TabStop         =   0   'False
            Top             =   360
            Width           =   5895
            _ExtentX        =   10398
            _ExtentY        =   4895
            MinLeft         =   1200
            MinRight        =   1200
            LeftCtlCount    =   1
            RightCtlCount   =   1
            ResizeMode      =   1
            LeftCtl1        =   "tvwList"
            RightCtl1       =   "lvwList"
            Begin MSComctlLib.TreeView tvwList 
               Height          =   2775
               Left            =   0
               TabIndex        =   39
               Top             =   0
               Width           =   2250
               _ExtentX        =   3969
               _ExtentY        =   4895
               _Version        =   393217
               HideSelection   =   0   'False
               Indentation     =   441
               LabelEdit       =   1
               Sorted          =   -1  'True
               Style           =   7
               ImageList       =   "iltListFolder"
               Appearance      =   1
               OLEDropMode     =   1
            End
            Begin MSComctlLib.ListView lvwList 
               Height          =   2775
               Left            =   2310
               TabIndex        =   38
               Top             =   0
               Width           =   3585
               _ExtentX        =   6324
               _ExtentY        =   4895
               View            =   3
               LabelEdit       =   1
               MultiSelect     =   -1  'True
               LabelWrap       =   -1  'True
               HideSelection   =   0   'False
               OLEDragMode     =   1
               OLEDropMode     =   1
               FullRowSelect   =   -1  'True
               GridLines       =   -1  'True
               _Version        =   393217
               SmallIcons      =   "iltList"
               ColHdrIcons     =   "iltListHeader"
               ForeColor       =   -2147483640
               BackColor       =   -2147483643
               Appearance      =   1
               OLEDragMode     =   1
               OLEDropMode     =   1
               NumItems        =   13
               BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                  Object.Tag             =   "%RANDOM%"
                  Text            =   "����"
                  Object.Width           =   2540
                  ImageIndex      =   11
               EndProperty
               BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                  SubItemIndex    =   1
                  Object.Width           =   2540
                  ImageIndex      =   12
               EndProperty
               BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                  SubItemIndex    =   2
                  Text            =   "��ǩ����"
                  Object.Width           =   2540
                  ImageIndex      =   13
               EndProperty
               BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                  SubItemIndex    =   3
                  Object.Tag             =   "%FILENAME%"
                  Text            =   "�ļ���"
                  Object.Width           =   2540
                  ImageIndex      =   1
               EndProperty
               BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                  SubItemIndex    =   4
                  Object.Tag             =   "%ARTIST%"
                  Text            =   "������"
                  Object.Width           =   2540
                  ImageIndex      =   2
               EndProperty
               BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                  SubItemIndex    =   5
                  Object.Tag             =   "%ALBUM%"
                  Text            =   "��������"
                  Object.Width           =   2540
                  ImageIndex      =   3
               EndProperty
               BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                  SubItemIndex    =   6
                  Object.Tag             =   "%TITLE%"
                  Text            =   "ר��"
                  Object.Width           =   2540
                  ImageIndex      =   4
               EndProperty
               BeginProperty ColumnHeader(8) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                  SubItemIndex    =   7
                  Object.Tag             =   "%GENRE%"
                  Text            =   "����"
                  Object.Width           =   2540
                  ImageIndex      =   5
               EndProperty
               BeginProperty ColumnHeader(9) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                  SubItemIndex    =   8
                  Object.Tag             =   "%LENGTH%"
                  Text            =   "����"
                  Object.Width           =   2540
                  ImageIndex      =   6
               EndProperty
               BeginProperty ColumnHeader(10) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                  SubItemIndex    =   9
                  Object.Tag             =   "%TRACKNUMBER%"
                  Text            =   "����"
                  Object.Width           =   2540
                  ImageIndex      =   7
               EndProperty
               BeginProperty ColumnHeader(11) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                  SubItemIndex    =   10
                  Object.Tag             =   "%YEAR%"
                  Text            =   "���"
                  Object.Width           =   2540
                  ImageIndex      =   8
               EndProperty
               BeginProperty ColumnHeader(12) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                  SubItemIndex    =   11
                  Object.Tag             =   "%FILESIZE%"
                  Text            =   "��С"
                  Object.Width           =   2540
                  ImageIndex      =   9
               EndProperty
               BeginProperty ColumnHeader(13) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
                  SubItemIndex    =   12
                  Object.Tag             =   "%DATECREATED%"
                  Text            =   "����ʱ��"
                  Object.Width           =   2540
                  ImageIndex      =   10
               EndProperty
            End
         End
         Begin MSComctlLib.Toolbar tbrList 
            Height          =   330
            Left            =   0
            TabIndex        =   36
            Top             =   0
            Width           =   6705
            _ExtentX        =   11827
            _ExtentY        =   582
            ButtonWidth     =   609
            ButtonHeight    =   582
            AllowCustomize  =   0   'False
            Style           =   1
            ImageList       =   "iltToolbarSmall"
            _Version        =   393216
            BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
               NumButtons      =   22
               BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
                  Object.ToolTipText     =   "��ʾ�ļ���"
                  ImageIndex      =   20
                  Style           =   1
                  Value           =   1
               EndProperty
               BeginProperty Button2 {66833FEA-8583-11D1-B16A-00C0F0283628} 
                  Object.ToolTipText     =   "����"
                  ImageIndex      =   21
                  Style           =   3
               EndProperty
               BeginProperty Button3 {66833FEA-8583-11D1-B16A-00C0F0283628} 
                  Object.ToolTipText     =   "����һ��"
                  ImageIndex      =   21
               EndProperty
               BeginProperty Button4 {66833FEA-8583-11D1-B16A-00C0F0283628} 
                  Object.ToolTipText     =   "���ļ��ļ���"
                  ImageIndex      =   22
               EndProperty
               BeginProperty Button5 {66833FEA-8583-11D1-B16A-00C0F0283628} 
                  Object.ToolTipText     =   "�������ļ���"
                  ImageIndex      =   27
               EndProperty
               BeginProperty Button6 {66833FEA-8583-11D1-B16A-00C0F0283628} 
                  Key             =   "AUTOFOLDER"
                  Object.ToolTipText     =   "ʹ���Զ��ļ���"
                  ImageIndex      =   23
                  Style           =   1
                  Value           =   1
               EndProperty
               BeginProperty Button7 {66833FEA-8583-11D1-B16A-00C0F0283628} 
                  Object.ToolTipText     =   "ģ���ļ���"
                  ImageIndex      =   24
               EndProperty
               BeginProperty Button8 {66833FEA-8583-11D1-B16A-00C0F0283628} 
                  Object.ToolTipText     =   "ɾ���ļ���"
                  ImageIndex      =   25
               EndProperty
               BeginProperty Button9 {66833FEA-8583-11D1-B16A-00C0F0283628} 
                  Object.Visible         =   0   'False
                  Object.ToolTipText     =   "�ļ�������"
                  ImageIndex      =   26
               EndProperty
               BeginProperty Button10 {66833FEA-8583-11D1-B16A-00C0F0283628} 
                  Style           =   3
               EndProperty
               BeginProperty Button11 {66833FEA-8583-11D1-B16A-00C0F0283628} 
                  Object.ToolTipText     =   "�ƶ�����λ"
                  ImageIndex      =   11
               EndProperty
               BeginProperty Button12 {66833FEA-8583-11D1-B16A-00C0F0283628} 
                  Object.ToolTipText     =   "�����ƶ�"
                  ImageIndex      =   11
               EndProperty
               BeginProperty Button13 {66833FEA-8583-11D1-B16A-00C0F0283628} 
                  Object.ToolTipText     =   "�����ƶ�"
                  ImageIndex      =   12
               EndProperty
               BeginProperty Button14 {66833FEA-8583-11D1-B16A-00C0F0283628} 
                  Object.ToolTipText     =   "�ƶ������"
                  ImageIndex      =   13
               EndProperty
               BeginProperty Button15 {66833FEA-8583-11D1-B16A-00C0F0283628} 
                  Style           =   3
               EndProperty
               BeginProperty Button16 {66833FEA-8583-11D1-B16A-00C0F0283628} 
                  Object.ToolTipText     =   "��ѡ�����Ŀ����"
                  ImageIndex      =   14
               EndProperty
               BeginProperty Button17 {66833FEA-8583-11D1-B16A-00C0F0283628} 
                  Object.ToolTipText     =   "��ѡ��������Ŀ����"
                  ImageIndex      =   15
               EndProperty
               BeginProperty Button18 {66833FEA-8583-11D1-B16A-00C0F0283628} 
                  Style           =   3
               EndProperty
               BeginProperty Button19 {66833FEA-8583-11D1-B16A-00C0F0283628} 
                  Object.ToolTipText     =   "�� ID3v1 ���¶�ȡ��ǩ"
                  ImageIndex      =   16
               EndProperty
               BeginProperty Button20 {66833FEA-8583-11D1-B16A-00C0F0283628} 
                  Object.ToolTipText     =   "�� ID3v2 ���¶�ȡ��ǩ"
                  ImageIndex      =   17
               EndProperty
               BeginProperty Button21 {66833FEA-8583-11D1-B16A-00C0F0283628} 
                  Object.ToolTipText     =   "�� APETAG ���¶�ȡ��ǩ"
                  ImageIndex      =   18
               EndProperty
               BeginProperty Button22 {66833FEA-8583-11D1-B16A-00C0F0283628} 
                  Object.ToolTipText     =   "�� WMP ���¶�ȡ��ǩ"
                  ImageIndex      =   19
               EndProperty
            EndProperty
         End
      End
      Begin MP3PA.VSplitter vspFile 
         Height          =   1815
         Left            =   120
         TabIndex        =   20
         TabStop         =   0   'False
         Top             =   360
         Width           =   6255
         _ExtentX        =   11033
         _ExtentY        =   3201
         MinLeft         =   1200
         MinRight        =   1200
         LeftCtlCount    =   4
         RightCtlCount   =   4
         ResizeMode      =   1
         LeftCtl1        =   "tvwProgram"
         LeftCtl2        =   "tvwFavourite"
         LeftCtl3        =   "tvwFolder"
         LeftCtl4        =   "tvwMydoc"
         RightCtl1       =   "lvwFile"
         RightCtl2       =   "lvwFavourite"
         RightCtl3       =   "lvwProgram"
         RightCtl4       =   "picBack"
         Begin MSComctlLib.TreeView tvwProgram 
            Height          =   1815
            Left            =   0
            TabIndex        =   22
            Top             =   0
            Width           =   2250
            _ExtentX        =   3969
            _ExtentY        =   3201
            _Version        =   393217
            HideSelection   =   0   'False
            Indentation     =   441
            LabelEdit       =   1
            Style           =   7
            ImageList       =   "iltProgram"
            Appearance      =   1
            Enabled         =   0   'False
         End
         Begin MSComctlLib.ListView lvwProgram 
            Height          =   1815
            Left            =   2310
            TabIndex        =   23
            Top             =   0
            Width           =   3945
            _ExtentX        =   6959
            _ExtentY        =   3201
            View            =   3
            LabelEdit       =   1
            MultiSelect     =   -1  'True
            LabelWrap       =   -1  'True
            HideSelection   =   0   'False
            OLEDragMode     =   1
            FullRowSelect   =   -1  'True
            _Version        =   393217
            SmallIcons      =   "iltSmall"
            ForeColor       =   -2147483640
            BackColor       =   -2147483643
            Appearance      =   1
            Enabled         =   0   'False
            OLEDragMode     =   1
            NumItems        =   0
         End
         Begin MSComctlLib.TreeView tvwFavourite 
            CausesValidation=   0   'False
            Height          =   1815
            Left            =   0
            TabIndex        =   27
            Top             =   0
            Width           =   2250
            _ExtentX        =   3969
            _ExtentY        =   3201
            _Version        =   393217
            HideSelection   =   0   'False
            Indentation     =   441
            LabelEdit       =   1
            Sorted          =   -1  'True
            Style           =   7
            ImageList       =   "iltFavourite"
            Appearance      =   1
            Enabled         =   0   'False
            OLEDropMode     =   1
         End
         Begin MSComctlLib.ListView lvwFile 
            Height          =   1815
            Left            =   2310
            TabIndex        =   25
            Tag             =   "0"
            Top             =   0
            Width           =   3945
            _ExtentX        =   6959
            _ExtentY        =   3201
            Arrange         =   2
            LabelEdit       =   1
            MultiSelect     =   -1  'True
            LabelWrap       =   -1  'True
            HideSelection   =   0   'False
            OLEDragMode     =   1
            OLEDropMode     =   1
            PictureAlignment=   5
            _Version        =   393217
            ForeColor       =   -2147483640
            BackColor       =   -2147483643
            Appearance      =   1
            OLEDragMode     =   1
            OLEDropMode     =   1
            NumItems        =   6
            BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               Text            =   "�ļ���"
               Object.Width           =   2540
            EndProperty
            BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               Alignment       =   1
               SubItemIndex    =   1
               Text            =   "��С"
               Object.Width           =   2540
            EndProperty
            BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   2
               Text            =   "����"
               Object.Width           =   2540
            EndProperty
            BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   3
               Text            =   "�޸�ʱ��"
               Object.Width           =   2540
            EndProperty
            BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   4
               Text            =   "����ʱ��"
               Object.Width           =   2540
            EndProperty
            BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   5
               Text            =   "SIZEORDER"
               Object.Width           =   0
            EndProperty
         End
         Begin MSComctlLib.ListView lvwFavourite 
            Height          =   1815
            Left            =   2310
            TabIndex        =   28
            Top             =   0
            Width           =   3945
            _ExtentX        =   6959
            _ExtentY        =   3201
            View            =   3
            LabelEdit       =   1
            Sorted          =   -1  'True
            MultiSelect     =   -1  'True
            LabelWrap       =   -1  'True
            HideSelection   =   0   'False
            OLEDragMode     =   1
            OLEDropMode     =   1
            FullRowSelect   =   -1  'True
            _Version        =   393217
            ForeColor       =   -2147483640
            BackColor       =   -2147483643
            Appearance      =   1
            Enabled         =   0   'False
            OLEDragMode     =   1
            OLEDropMode     =   1
            NumItems        =   7
            BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               Text            =   "���"
               Object.Width           =   2540
            EndProperty
            BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   1
               Text            =   "������"
               Object.Width           =   2540
            EndProperty
            BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   2
               Text            =   "����"
               Object.Width           =   2540
            EndProperty
            BeginProperty ColumnHeader(4) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   3
               Text            =   "ר��"
               Object.Width           =   2540
            EndProperty
            BeginProperty ColumnHeader(5) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   4
               Text            =   "����"
               Object.Width           =   2540
            EndProperty
            BeginProperty ColumnHeader(6) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   5
               Text            =   "����"
               Object.Width           =   2540
            EndProperty
            BeginProperty ColumnHeader(7) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
               SubItemIndex    =   6
               Text            =   "��ʽ"
               Object.Width           =   2540
            EndProperty
         End
         Begin MSComctlLib.TreeView tvwFolder 
            Height          =   1815
            Left            =   0
            TabIndex        =   26
            Top             =   0
            Width           =   2250
            _ExtentX        =   3969
            _ExtentY        =   3201
            _Version        =   393217
            HideSelection   =   0   'False
            Indentation     =   441
            LabelEdit       =   1
            Style           =   7
            ImageList       =   "iltFolder"
            Appearance      =   1
         End
         Begin MSComctlLib.TreeView tvwMydoc 
            Height          =   1815
            Left            =   0
            TabIndex        =   24
            Top             =   0
            Width           =   2250
            _ExtentX        =   3969
            _ExtentY        =   3201
            _Version        =   393217
            HideSelection   =   0   'False
            Indentation     =   441
            LabelEdit       =   1
            Sorted          =   -1  'True
            Style           =   7
            ImageList       =   "iltFolder"
            Appearance      =   1
         End
         Begin VB.PictureBox picBack 
            BackColor       =   &H80000005&
            Height          =   1815
            Left            =   2310
            ScaleHeight     =   1755
            ScaleWidth      =   3885
            TabIndex        =   21
            TabStop         =   0   'False
            Top             =   0
            Width           =   3945
         End
      End
      Begin MSComctlLib.TabStrip tbsFileBrowser 
         Height          =   2314
         Left            =   0
         TabIndex        =   19
         Top             =   0
         Width           =   6735
         _ExtentX        =   11880
         _ExtentY        =   4075
         HotTracking     =   -1  'True
         ImageList       =   "iltTabs"
         _Version        =   393216
         BeginProperty Tabs {1EFB6598-857C-11D1-B16A-00C0F0283628} 
            NumTabs         =   4
            BeginProperty Tab1 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
               Caption         =   "�ҵĵ���"
               ImageVarType    =   2
               ImageIndex      =   1
            EndProperty
            BeginProperty Tab2 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
               Caption         =   "�ҵ��ĵ�"
               ImageVarType    =   2
               ImageIndex      =   2
            EndProperty
            BeginProperty Tab3 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
               Caption         =   "�ղؼ�"
               ImageVarType    =   2
               ImageIndex      =   3
            EndProperty
            BeginProperty Tab4 {1EFB659A-857C-11D1-B16A-00C0F0283628} 
               Caption         =   "�����еĲ����б�"
               ImageVarType    =   2
               ImageIndex      =   4
            EndProperty
         EndProperty
      End
   End
   Begin VB.PictureBox picCopy 
      Enabled         =   0   'False
      Height          =   570
      Left            =   2160
      ScaleHeight     =   510
      ScaleWidth      =   525
      TabIndex        =   15
      TabStop         =   0   'False
      Top             =   4440
      Visible         =   0   'False
      Width           =   585
      Begin MP3PA.UIFileCopy uifCopying 
         Height          =   4935
         Left            =   45
         TabIndex        =   17
         Top             =   90
         Width           =   6735
         _ExtentX        =   11880
         _ExtentY        =   8705
      End
   End
   Begin MSComctlLib.ImageList iltAppHeader 
      Left            =   2160
      Top             =   2640
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   15
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2BBC6
            Key             =   "DISP_TITLE"
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2C160
            Key             =   "ARTIST"
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2C6FA
            Key             =   "TITLE"
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2CC94
            Key             =   "ALBUM"
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2D22E
            Key             =   "GENRE"
         EndProperty
         BeginProperty ListImage6 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2D7C8
            Key             =   "TIME"
         EndProperty
         BeginProperty ListImage7 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2DD62
            Key             =   "TRACKNUMBER"
         EndProperty
         BeginProperty ListImage8 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2E2FC
            Key             =   "DATE"
         EndProperty
         BeginProperty ListImage9 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2E896
            Key             =   "NUMBER"
         EndProperty
         BeginProperty ListImage10 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2EE30
            Key             =   "SAMPLERATE"
         EndProperty
         BeginProperty ListImage11 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2F3CA
            Key             =   "BITRATE"
         EndProperty
         BeginProperty ListImage12 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2F964
            Key             =   "CHANNELS"
         EndProperty
         BeginProperty ListImage13 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":2FEFE
            Key             =   "CODEC"
         EndProperty
         BeginProperty ListImage14 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":30498
            Key             =   "MP3STEREOMODE"
         EndProperty
         BeginProperty ListImage15 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":30A32
            Key             =   "COMMENT"
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ImageList iltTabs 
      Left            =   1560
      Top             =   3240
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483633
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   5
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":30FCC
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":31566
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":31B00
            Key             =   ""
         EndProperty
         BeginProperty ListImage4 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":3209A
            Key             =   ""
         EndProperty
         BeginProperty ListImage5 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "frmMain.frx":32634
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.PictureBox picProgress 
      BorderStyle     =   0  'None
      Height          =   315
      Left            =   1440
      ScaleHeight     =   315
      ScaleWidth      =   8775
      TabIndex        =   10
      TabStop         =   0   'False
      Top             =   1920
      Visible         =   0   'False
      Width           =   8775
      Begin MP3PA.ProgressBarEx pbeDefault 
         Height          =   315
         Left            =   2505
         TabIndex        =   29
         TabStop         =   0   'False
         Top             =   0
         Width           =   6495
         _ExtentX        =   11456
         _ExtentY        =   556
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
         BarFillStyle    =   1
      End
      Begin VB.Label lblProgrss 
         AutoSize        =   -1  'True
         Caption         =   "����..."
         Height          =   180
         Left            =   60
         TabIndex        =   11
         Top             =   75
         Width           =   630
      End
   End
   Begin VB.Menu mnuFile 
      Caption         =   "�ļ�(&F)"
      Begin VB.Menu mnuCopy 
         Caption         =   "��������(&C)..."
         Shortcut        =   {F7}
      End
      Begin VB.Menu mnuSelectMP3 
         Caption         =   "ѡ�� &MP3 �̷�..."
         Shortcut        =   {F6}
      End
      Begin VB.Menu mnuCopyLyrics 
         Caption         =   "���Ƹ��(&Y)"
         Checked         =   -1  'True
         Shortcut        =   ^{F7}
      End
      Begin VB.Menu mnuDeleteBefore 
         Caption         =   "����ǰ��ɾ��(&D)"
         Shortcut        =   ^{F6}
      End
      Begin VB.Menu mnuCopyMusicInfo 
         Caption         =   "���Ƹ�����Ϣ�б�(&Y)"
         Shortcut        =   ^C
      End
      Begin VB.Menu mnuChangeFileName 
         Caption         =   "�����������ļ�(&M)..."
         Shortcut        =   ^M
      End
      Begin VB.Menu mnuLine5 
         Caption         =   "-"
      End
      Begin VB.Menu mnuLoad 
         Caption         =   "�Ӳ����б��м���(&O)..."
         Shortcut        =   ^O
      End
      Begin VB.Menu mnuSave 
         Caption         =   "����Ϊ�����б�(&S)..."
         Shortcut        =   ^S
      End
      Begin VB.Menu mnuLine1 
         Caption         =   "-"
      End
      Begin VB.Menu mnuProperty 
         Caption         =   "����(&R)...	Alt+Enter"
      End
      Begin VB.Menu mnuOpen 
         Caption         =   "�Թ�����(&E)...	Ctrl+Enter"
      End
      Begin VB.Menu mnuLine51 
         Caption         =   "-"
      End
      Begin VB.Menu mnuOption 
         Caption         =   "ѡ��(&P)..."
         Shortcut        =   ^P
      End
      Begin VB.Menu mnuLine2 
         Caption         =   "-"
      End
      Begin VB.Menu mnuExit 
         Caption         =   "�˳�(&X)	Alt+F4"
      End
   End
   Begin VB.Menu mnuEdit 
      Caption         =   "�༭(&E)"
      Begin VB.Menu mnuAdd 
         Caption         =   "���(&A)"
         Shortcut        =   {F2}
      End
      Begin VB.Menu mnuInsert 
         Caption         =   "����(&I)"
         Shortcut        =   +^{F2}
      End
      Begin VB.Menu mnuDelete 
         Caption         =   "ɾ��(&D)"
         Shortcut        =   {F3}
      End
      Begin VB.Menu mnuLine3 
         Caption         =   "-"
      End
      Begin VB.Menu mnuAddAll 
         Caption         =   "ȫ�����(&J)"
         Shortcut        =   +{F2}
      End
      Begin VB.Menu mnuInsertAll 
         Caption         =   "ȫ������(&R)"
      End
      Begin VB.Menu mnuDeleteAll 
         Caption         =   "ȫ��ɾ��(&T)"
         Shortcut        =   +{F3}
      End
      Begin VB.Menu mnuLine4 
         Caption         =   "-"
      End
      Begin VB.Menu mnuCreateFolder 
         Caption         =   "�����ļ���(&C)..."
      End
      Begin VB.Menu mnuDeleteFolder 
         Caption         =   "ɾ���ļ���(&E)	Delete"
      End
      Begin VB.Menu mnuPreviousLevel 
         Caption         =   "����һ��(&U)	Backspace"
      End
      Begin VB.Menu mnuRenameFolder 
         Caption         =   "�������ļ���(&R)..."
      End
      Begin VB.Menu mnuAutoCreateFolder 
         Caption         =   "�Զ������ļ���(&A)"
         Begin VB.Menu mnuCreateArtist 
            Caption         =   "����<������>����(&A)"
         End
         Begin VB.Menu mnuCreateAlbum 
            Caption         =   "����<ר��>����(&L)"
         End
         Begin VB.Menu mnuCreateModify 
            Caption         =   "����<�޸�ʱ��>����(&M)"
         End
         Begin VB.Menu mnuCreateGenre 
            Caption         =   "����<����>����(&G)"
         End
         Begin VB.Menu mnuLine20 
            Caption         =   "-"
         End
         Begin VB.Menu mnuCreateNo 
            Caption         =   "���Զ������ļ���(&N)"
            Checked         =   -1  'True
         End
      End
      Begin VB.Menu mnuApplyFolderTemplate 
         Caption         =   "�����ļ���ģ��(&P)..."
      End
      Begin VB.Menu mnuLine8 
         Caption         =   "-"
      End
      Begin VB.Menu mnuSelectFolder 
         Caption         =   "ѡ���ļ���(&S)..."
         Shortcut        =   {F4}
      End
      Begin VB.Menu mnuSelDestination 
         Caption         =   "ѡ��Ŀ���ļ���(&T)..."
         Enabled         =   0   'False
         Visible         =   0   'False
      End
      Begin VB.Menu mnuLine14 
         Caption         =   "-"
      End
      Begin VB.Menu mnuSort 
         Caption         =   "����������Ŀ(&O)..."
         Shortcut        =   {F5}
      End
      Begin VB.Menu mnuSortRandom 
         Caption         =   "�������������Ŀ(&R)"
         Shortcut        =   +^{F5}
      End
      Begin VB.Menu mnuOrderSelection 
         Caption         =   "����ѡ����Ŀ(&M)..."
         Shortcut        =   +{F5}
      End
      Begin VB.Menu mnuOrderRandomSelection 
         Caption         =   "���������ѡ��Ŀ(&N)"
      End
      Begin VB.Menu mnuLineY 
         Caption         =   "-"
      End
      Begin VB.Menu mnuMoveFirst 
         Caption         =   "�ƶ�����ǰ(&F)	A"
      End
      Begin VB.Menu mnuUp 
         Caption         =   "�����ƶ�(&U)	W"
      End
      Begin VB.Menu mnuDown 
         Caption         =   "�����ƶ�(&W)	S"
      End
      Begin VB.Menu mnuMoveLast 
         Caption         =   "�ƶ���ĩβ(&L)	D"
      End
      Begin VB.Menu mnuLineZ 
         Caption         =   "-"
      End
      Begin VB.Menu mnurRetrieveID3v1 
         Caption         =   "�� ID3v1 �ض���ǩ(&1)"
      End
      Begin VB.Menu mnurRetrieveID3v2 
         Caption         =   "�� ID3v2 �ض���ǩ(&2)"
      End
      Begin VB.Menu mnurRetrieveAPE 
         Caption         =   "�� APETAG �ض���ǩ(&3)"
      End
      Begin VB.Menu mnurRetrieveWMP 
         Caption         =   "�� WMP �ض���ǩ(&4)"
      End
   End
   Begin VB.Menu mnuView 
      Caption         =   "��ͼ(&V)"
      Begin VB.Menu mnuGeneralToolbar 
         Caption         =   "���湤����(&T)"
         Checked         =   -1  'True
      End
      Begin VB.Menu mnuPlayToolbar 
         Caption         =   "���Ź�����(&P)"
         Checked         =   -1  'True
      End
      Begin VB.Menu mnuBroswerToolbar 
         Caption         =   "���/����������(&B)"
         Checked         =   -1  'True
      End
      Begin VB.Menu mnuLineX 
         Caption         =   "-"
      End
      Begin VB.Menu mnuResult 
         Caption         =   "�����������(&U)"
      End
      Begin VB.Menu mnuVideo 
         Caption         =   "��Ƶ����(&V)"
      End
      Begin VB.Menu mnuFloatWindow 
         Caption         =   "������(&Z)"
      End
      Begin VB.Menu mnuListFolder 
         Caption         =   "�б��ļ���(&R)"
         Checked         =   -1  'True
      End
      Begin VB.Menu mnuLine9 
         Caption         =   "-"
      End
      Begin VB.Menu mnuMyComputer 
         Caption         =   "�ҵĵ���(&C)"
         Checked         =   -1  'True
         Shortcut        =   ^{F1}
      End
      Begin VB.Menu mnuMyDocuments 
         Caption         =   "�ҵ��ĵ�(&D)"
         Shortcut        =   ^{F2}
      End
      Begin VB.Menu mnuFavourite 
         Caption         =   "�ղؼ�(&F)"
         Shortcut        =   ^{F3}
      End
      Begin VB.Menu mnuAppList 
         Caption         =   "Ӧ�ó����嵥(&A)"
         Shortcut        =   ^{F4}
      End
      Begin VB.Menu mnuLine10 
         Caption         =   "-"
      End
      Begin VB.Menu mnuStatusBar 
         Caption         =   "״̬��(&S)"
         Checked         =   -1  'True
      End
      Begin VB.Menu mnuDisk 
         Caption         =   "���̿ռ�(&K)"
         Checked         =   -1  'True
         Shortcut        =   ^{F5}
      End
      Begin VB.Menu mnuLine11 
         Caption         =   "-"
      End
      Begin VB.Menu mnuLargeIcon 
         Caption         =   "��ͼ��(&B)"
         Checked         =   -1  'True
      End
      Begin VB.Menu mnuSmallIcon 
         Caption         =   "Сͼ��(&M)"
      End
      Begin VB.Menu mnuList 
         Caption         =   "�б�(&L)"
      End
      Begin VB.Menu mnuReport 
         Caption         =   "����(&R)"
      End
      Begin VB.Menu mnuLine13 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFullRow 
         Caption         =   "����ѡ��(&U)"
         Checked         =   -1  'True
      End
      Begin VB.Menu mnuGrid 
         Caption         =   "������(&G)"
      End
      Begin VB.Menu mnuHotSelect 
         Caption         =   "��׷��(&H)"
      End
      Begin VB.Menu mnuLine12 
         Caption         =   "-"
      End
      Begin VB.Menu mnuFilter 
         Caption         =   "������(&F)..."
         Shortcut        =   ^F
      End
   End
   Begin VB.Menu mnuPlay 
      Caption         =   "����(&P)"
      Begin VB.Menu mnuPlayBrowser 
         Caption         =   "���������(&B)"
         Shortcut        =   {F9}
      End
      Begin VB.Menu mnuPlayList 
         Caption         =   "�����б�(&L)"
         Shortcut        =   +{F9}
      End
      Begin VB.Menu mnuPause 
         Caption         =   "��ͣ(&P)"
         Shortcut        =   {F11}
      End
      Begin VB.Menu mnuStop 
         Caption         =   "ֹͣ(&S)"
         Shortcut        =   {F12}
      End
   End
   Begin VB.Menu mnuRFavourite 
      Caption         =   "�ղؼ�(&F)"
      Begin VB.Menu mnuAddToFavourite 
         Caption         =   "��ӵ��ղؼ�(&A)..."
         Shortcut        =   ^D
      End
      Begin VB.Menu mnuDeleteFromFavourite 
         Caption         =   "���ղؼ���ɾ��(&D)	Delete"
      End
      Begin VB.Menu mnuDeleteAllFavourite 
         Caption         =   "ȫ��ɾ��(&L)	Alt+Delete"
      End
      Begin VB.Menu mnuMoveToDirectory 
         Caption         =   "�ƶ���Ŀ¼(&O)..."
      End
      Begin VB.Menu mnuLine16 
         Caption         =   "-"
      End
      Begin VB.Menu mnuCreateDirectory 
         Caption         =   "����Ŀ¼(&C)..."
      End
      Begin VB.Menu mnuDeleteDirectory 
         Caption         =   "ɾ��Ŀ¼(&E)..."
      End
      Begin VB.Menu mnuLine15 
         Caption         =   "-"
      End
      Begin VB.Menu mnuImportFromM3U 
         Caption         =   "���ļ�����(&I)..."
         Shortcut        =   ^I
      End
      Begin VB.Menu mnuSaveToM3U 
         Caption         =   "����Ϊ�嵥(&S)..."
         Shortcut        =   ^E
      End
   End
   Begin VB.Menu mnuHelp 
      Caption         =   "����(&H)"
      NegotiatePosition=   3  'Right
      Begin VB.Menu mnuTopic 
         Caption         =   "����(&T)..."
         Shortcut        =   {F1}
      End
      Begin VB.Menu mnuIndex 
         Caption         =   "����(&I)..."
         Visible         =   0   'False
      End
      Begin VB.Menu mnuSerachHelp 
         Caption         =   "����(&S)..."
      End
      Begin VB.Menu mnuBookmark 
         Caption         =   "��ǩ(&B)..."
      End
      Begin VB.Menu mnuLine17 
         Caption         =   "-"
      End
      Begin VB.Menu mnuEmail 
         Caption         =   "д�Ÿ�����(&E)..."
         Shortcut        =   +^{F1}
      End
      Begin VB.Menu mnuReportBUG 
         Caption         =   "���� BUG(&R)..."
      End
      Begin VB.Menu mnuDonation 
         Caption         =   "����(лл��)(&D)..."
      End
      Begin VB.Menu mnuLin19 
         Caption         =   "-"
      End
      Begin VB.Menu mnuWebsite 
         Caption         =   "������(&F)"
      End
      Begin VB.Menu mnuHomePage 
         Caption         =   "�ٷ���վ(&O)"
      End
      Begin VB.Menu mnuLin18 
         Caption         =   "-"
      End
      Begin VB.Menu mnuAbout 
         Caption         =   "����(&A)..."
         Shortcut        =   +{F1}
      End
   End
   Begin VB.Menu popmenu 
      Caption         =   "POPMENU"
      Begin VB.Menu popTvwFolder 
         Caption         =   "popTvwFolder"
         Begin VB.Menu poptfProperty 
            Caption         =   "����(&P)..."
         End
      End
      Begin VB.Menu popLvwFile 
         Caption         =   "popLvwFile"
         Begin VB.Menu poplfPlay 
            Caption         =   "����(&Y)"
         End
         Begin VB.Menu poplfOpen 
            Caption         =   "��(&O)..."
         End
         Begin VB.Menu poplfProperty 
            Caption         =   "����(&P)..."
         End
         Begin VB.Menu poplfB1 
            Caption         =   "-"
         End
         Begin VB.Menu poplfAddToFav 
            Caption         =   "��ӵ��ղؼ�(&F)..."
         End
         Begin VB.Menu poplfB2 
            Caption         =   "-"
         End
         Begin VB.Menu poplfSelAll 
            Caption         =   "ȫѡ(&L)"
         End
         Begin VB.Menu poplfB3 
            Caption         =   "-"
         End
         Begin VB.Menu poplfAdd 
            Caption         =   "���(&A)"
         End
         Begin VB.Menu poplfInsert 
            Caption         =   "����(&I)"
         End
         Begin VB.Menu poplfAddAll 
            Caption         =   "ȫ�����(&D)"
         End
      End
      Begin VB.Menu popTvwFavourite 
         Caption         =   "popTvwFavourite"
         Begin VB.Menu poptfaDelete 
            Caption         =   "ɾ��Ŀ¼(&D)..."
         End
         Begin VB.Menu poptfaCreate 
            Caption         =   "����Ŀ¼(&C)..."
         End
      End
      Begin VB.Menu popLvwFavourite 
         Caption         =   "popLvwFavourite"
         Begin VB.Menu poplfaPlay 
            Caption         =   "����(&Y)"
         End
         Begin VB.Menu poplfaOpen 
            Caption         =   "��(&O)..."
         End
         Begin VB.Menu poplfaProperty 
            Caption         =   "����(&P)..."
         End
         Begin VB.Menu poplfaB1 
            Caption         =   "-"
         End
         Begin VB.Menu poplfaSelAll 
            Caption         =   "ȫѡ(&S)"
         End
         Begin VB.Menu poplfaB2 
            Caption         =   "-"
         End
         Begin VB.Menu poplfaDelete 
            Caption         =   "ɾ��(&D)..."
         End
         Begin VB.Menu poplfaDeleteAll 
            Caption         =   "ȫ��ɾ��(&E)..."
         End
         Begin VB.Menu poplfaB4 
            Caption         =   "-"
         End
         Begin VB.Menu poplfaImport 
            Caption         =   "�Ӳ����б���(&I)..."
         End
         Begin VB.Menu poplfaSave 
            Caption         =   "���浽�����б�(&S)..."
         End
         Begin VB.Menu poplfaB3 
            Caption         =   "-"
         End
         Begin VB.Menu poplfaAdd 
            Caption         =   "��ӵ��б�(&A)"
         End
         Begin VB.Menu poplfaInsert 
            Caption         =   "���뵽�б�(&N)"
         End
         Begin VB.Menu poplfaAddAll 
            Caption         =   "ȫ����ӵ��б�(&L)"
         End
      End
      Begin VB.Menu popTvwProgram 
         Caption         =   "popTvwProgram"
         Begin VB.Menu poptpOption 
            Caption         =   "�����б�ѡ��(&P)..."
         End
      End
      Begin VB.Menu popLvwProgram 
         Caption         =   "popLvwProgram"
         Begin VB.Menu poptpPlay 
            Caption         =   "����(&Y)"
         End
         Begin VB.Menu poptpOpen 
            Caption         =   "��(&O)..."
         End
         Begin VB.Menu poptpProperty 
            Caption         =   "����(&P)..."
         End
         Begin VB.Menu poptpB1 
            Caption         =   "-"
         End
         Begin VB.Menu poptpSelAll 
            Caption         =   "ȫѡ(&S)"
         End
         Begin VB.Menu poptpB2 
            Caption         =   "-"
         End
         Begin VB.Menu poptpAdd 
            Caption         =   "��ӵ��б�(&A)"
         End
         Begin VB.Menu poptpInsert 
            Caption         =   "���뵽�б�(&I)"
         End
         Begin VB.Menu poptpAddAll 
            Caption         =   "ȫ����ӵ��б�(&L)"
         End
         Begin VB.Menu poptpB3 
            Caption         =   "-"
         End
         Begin VB.Menu poptpAddFav 
            Caption         =   "��ӵ��ղؼ�(&F)..."
         End
      End
      Begin VB.Menu popLvwList 
         Caption         =   "popLvwList"
         Begin VB.Menu popllPlay 
            Caption         =   "����(&Y)"
         End
         Begin VB.Menu popllOpen 
            Caption         =   "��(&O)..."
         End
         Begin VB.Menu popllProperty 
            Caption         =   "����(&P)..."
         End
         Begin VB.Menu popllB1 
            Caption         =   "-"
         End
         Begin VB.Menu popllDelete 
            Caption         =   "ɾ��(&D)"
         End
         Begin VB.Menu popllDeleteAll 
            Caption         =   "ȫ��ɾ��(&A)"
         End
         Begin VB.Menu popllB2 
            Caption         =   "-"
         End
         Begin VB.Menu popllMoveFirst 
            Caption         =   "�ƶ�������(&I)"
         End
         Begin VB.Menu popllMoveUp 
            Caption         =   "�����ƶ�(&P)"
         End
         Begin VB.Menu popllMoveDown 
            Caption         =   "�����ƶ�(&N)"
         End
         Begin VB.Menu popllMoveLast 
            Caption         =   "�ƶ������(&L)"
         End
         Begin VB.Menu popllB3 
            Caption         =   "-"
         End
         Begin VB.Menu popllSort 
            Caption         =   "����������Ŀ(&S)..."
         End
         Begin VB.Menu popllSortSel 
            Caption         =   "����ѡ����Ŀ(&O)..."
         End
         Begin VB.Menu popllB4 
            Caption         =   "-"
         End
         Begin VB.Menu popllSortRandom 
            Caption         =   "�������������Ŀ(&R)"
         End
         Begin VB.Menu popllSortRandimSel 
            Caption         =   "�������ѡ����Ŀ(&M)"
         End
         Begin VB.Menu popllB5 
            Caption         =   "-"
         End
         Begin VB.Menu popllRetrieveID3v1 
            Caption         =   "�� ID3v1 �ض���ǩ(&1)"
         End
         Begin VB.Menu popllRetrieveID3v2 
            Caption         =   "�� ID3v2 �ض���ǩ(&2)"
         End
         Begin VB.Menu popllRetrieveAPETAG 
            Caption         =   "�� APETAG �ض���ǩ(&3)"
         End
         Begin VB.Menu popllRetrieveWMP 
            Caption         =   "�� WMP �ض���ǩ(&4)"
         End
         Begin VB.Menu popllB6 
            Caption         =   "-"
         End
         Begin VB.Menu popllImport 
            Caption         =   "���벥���б�(&T)..."
         End
         Begin VB.Menu popllExport 
            Caption         =   "���������б�(&X)..."
         End
         Begin VB.Menu popllB7 
            Caption         =   "-"
         End
         Begin VB.Menu popllAddFav 
            Caption         =   "��ӵ��ղؼ�(&F)..."
         End
      End
      Begin VB.Menu popTvwLIst 
         Caption         =   "popTvwList"
         Begin VB.Menu poptlPrevious 
            Caption         =   "����һ��(&P)"
         End
         Begin VB.Menu poptlNewFolder 
            Caption         =   "�½��ļ���(&N)..."
         End
         Begin VB.Menu poptlRename 
            Caption         =   "�������ļ���(&R)..."
         End
         Begin VB.Menu poptlDelete 
            Caption         =   "ɾ���ļ���(&D)"
         End
      End
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit
 
Private Starting As Boolean
Private StartSplL As Long
Private StartSplT As Long
Private CancelProcess As Boolean
Private ProcessRunning As Boolean

Private bSelectChanged As Boolean
Private bMouseDown As Boolean

Private oPlayerMedia As WMPLibCtl.IWMPMedia
Private sMsg As String
Private bInternal As Boolean

Private PlayListInfo As New VBA.Collection '���ڴ洢�嵥��Ŀ����Ϣ
Public PlayListKeys As New VBA.Collection '���ڴ洢�嵥��Ŀ�� �ļ� - ��� һһ��Ӧ
'Private CurrentFolder As New MP3PA.ListFolder '���ڴ����Ŀ¼����Ϣ
Private CurrentControl As MSComctlLib.ListView
Private StartDrag As Boolean
Public Copying As Boolean

Public ActivePage As Long
Private ActiveLVW As MSComctlLib.ListView
Private CurrentPath As String
Private AppFileSize() As Double
Private oCurFav As MP3PA.FAVFolder
Public DragSender As String

Private FavShifting As Boolean

Public CurrentListFolder As ListFolder
Public RootListFolder As ListFolder

Private Declare Sub Sleep Lib "kernel32.dll" (ByVal dwMilliseconds As Long)

'�ı���¼�
Private SearchKeyChanged As Boolean
Private SelectionFavChanged As Boolean
Private SelectionPrgChanged As Boolean
Private SelectionFilChanged As Boolean

'���ö��� Caption
Private Declare Function SetWindowText Lib "user32.dll" Alias "SetWindowTextA" (ByVal hWnd As Long, ByVal lpString As String) As Long

'���Ƹ�
Private Declare Function SetParent Lib "user32" (ByVal hWndChild As Long, ByVal hWndNewParent As Long) As Long

'��ó���ͼ��� API
Private Declare Function ExtractIconEx Lib "shell32.dll" Alias "ExtractIconExA" (ByVal lpszFile As String, ByVal nIconIndex As Long, phiconLarge As Long, phiconSmall As Long, ByVal nIcons As Long) As Long
Private Declare Function DrawIconEx Lib "user32" (ByVal hdc As Long, ByVal xLeft As Long, ByVal yTop As Long, ByVal hIcon As Long, ByVal cxWidth As Long, ByVal cyWidth As Long, ByVal istepIfAniCur As Long, ByVal hbrFlickerFreeDraw As Long, ByVal diFlags As Long) As Long
Private Declare Function DrawIcon Lib "user32" (ByVal hdc As Long, ByVal X As Long, ByVal Y As Long, ByVal hIcon As Long) As Long

Private Declare Function TerminateProcess Lib "kernel32" (ByVal hProcess As Long, ByVal uExitCode As Long) As Long
Private Declare Function GetCurrentProcess Lib "kernel32" () As Long


'��ô��ڵĴ�С
Private Declare Function GetWindowRect Lib "user32.dll" (ByVal hWnd As Long, ByRef lpRect As RECT) As Long
Private Type RECT
  Left As Long
  Top As Long
  Right As Long
  Bottom As Long
End Type

Public Sub RecalcSize(Optional ByVal RefreshAll As Boolean = False)
  '���¼����С
  Dim i As Long
  Dim nLF As MP3PA.ListFolder
  
  SpaceAdded = 0
  
  If RefreshAll Then
    '�������ԵĴ�С
    For i = 1 To tvwList.Nodes.Count
      Set nLF = tvwList.Nodes(i).tag
      nLF.Recalculate frmMain.mnuCopyLyrics.Checked
    Next i
  End If
  
  On Error Resume Next
  If frmMain.mnuCopyLyrics.Checked Then
    For i = 1 To PlayListInfo.Count
      SpaceAdded = SpaceAdded + PlayListInfo(i).Size
    Next i
  Else
    For i = 1 To PlayListInfo.Count
      SpaceAdded = SpaceAdded + PlayListInfo(i).Size + PlayListInfo(i).LyricSize
    Next i
  End If
  On Error GoTo 0
  
  SpaceAdded = SpaceAdded + RootListFolder.TotalSize - CurrentListFolder.TotalFileSize
End Sub

Private Sub Form_Load()
  mnuHelp.Caption = Chr(8) + mnuHelp.Caption
  popmenu.Visible = False
  
  '���������ʵ�����˳�
  If App.PrevInstance Then
    Unload Me
    TerminateProcess GetCurrentProcess, 0
    End
  End If
  
  lblAdded.Caption = 0
  lblOrigial.Caption = 0
  lblTotal.Caption = 0
  
  'picBSBar.Height = 360
  
  SysRoot = FS.GetSpecialfolder(1)
  WinRoot = FS.GetSpecialfolder(0)
  If Right(SysRoot, 1) <> "\" Then SysRoot = SysRoot & "\"
  If Right(WinRoot, 1) <> "\" Then WinRoot = WinRoot & "\"
  
  Screen.MousePointer = 13
  App.Title = "MP3 Player Assistant"
  DoEvents
  
  'д��һЩ��ʼ������
  SpaceTotal = 127512576
  SpaceFact = 2596992
  SpaceAdded = 0
  SpaceUsed = 0
  ActivePage = 1
  LastAscending = True
  RefreshChart
  Load ffmVideo
  oReaderWMPTAG.InitClass ffmVideo.WMP
  
  IniSet.FileName = App.Path & "\Settings.ini"
  
  '��ʾչʾ����
  frmSplash.ShowMe
  frmSplash.SetInfo "�������ý���..."
  
'  '����
'  Dim xMDIA As WMPLibCtl.IWMPMedia
'
'  Set xMDIA = WMP.newMedia("F:\1.mp3")
'
'  For i = 0 To xMDIA.attributeCount - 1
'    Debug.Print xMDIA.getAttributeName(i) & ":" & xMDIA.getItemInfo(xMDIA.getAttributeName(i))
'  Next i
    
  '���ƽ�����
  SetParent picProgress.hWnd, stbDefault.hWnd
  SetHeaderStyle lvwProgram.hWnd
  
  '�������
  If Not FS.FileExists(IniSet.FileName) Then
    Call IniSet.SetIniString("MainForm", "Top", "105")
    Call IniSet.SetIniString("MainForm", "Left", "105")
    Call IniSet.SetIniString("MainForm", "Width", "10575")
    Call IniSet.SetIniString("MainForm", "Height", "8220")
    Call IniSet.SetIniString("MainForm", "Maxed", "0")
    
    Call IniSet.SetIniString("Interface", "TBGeneral", "1")
    Call IniSet.SetIniString("Interface", "TBPlayer", "1")
    Call IniSet.SetIniString("Interface", "TBBrowser", "1")
    Call IniSet.SetIniString("Interface", "SBDefault", "1")
    Call IniSet.SetIniString("Interface", "SBDisk", "1")
    Call IniSet.SetIniString("Interface", "TABBrowser", "1")
    Call IniSet.SetIniString("Interface", "TVWWidth", "2250")
    Call IniSet.SetIniString("Interface", "TABHeight", "2486")
    
    Call IniSet.SetIniString("ListViweFile", "View", "3")
    Call IniSet.SetIniString("ListViweFile", "GradLine", "0")
    Call IniSet.SetIniString("ListViweFile", "HotTrack", "0")
    Call IniSet.SetIniString("ListViweFile", "FullLine", "1")
    Call IniSet.SetIniString("ListViweFile", "HeaderWidth1", "3644")
    Call IniSet.SetIniString("ListViweFile", "HeaderWidth2", "1408")
    Call IniSet.SetIniString("ListViweFile", "HeaderWidth3", "900")
    Call IniSet.SetIniString("ListViweFile", "HeaderWidth4", "1890")
    Call IniSet.SetIniString("ListViweFile", "HeaderWidth5", "1890")
    
    Call IniSet.SetIniString("ListViweList", "GradLine", "1")
    Call IniSet.SetIniString("ListViweList", "HotTrack", "0")
    Call IniSet.SetIniString("ListViweList", "FullLine", "1")
    Call IniSet.SetIniString("ListViweList", "HeaderWidth1", "959")
    Call IniSet.SetIniString("ListViweList", "HeaderWidth2", "434")
    Call IniSet.SetIniString("ListViweList", "HeaderWidth3", "2415")
    Call IniSet.SetIniString("ListViweList", "HeaderWidth4", "1890")
    Call IniSet.SetIniString("ListViweList", "HeaderWidth5", "1890")
    Call IniSet.SetIniString("ListViweList", "HeaderWidth6", "2234")
    Call IniSet.SetIniString("ListViweList", "HeaderWidth7", "1408")
    Call IniSet.SetIniString("ListViweList", "HeaderWidth8", "1065")
    Call IniSet.SetIniString("ListViweList", "HeaderWidth9", "915")
    Call IniSet.SetIniString("ListViweList", "HeaderWidth10", "929")
    Call IniSet.SetIniString("ListViweList", "HeaderWidth11", "1379")
    Call IniSet.SetIniString("ListViweList", "HeaderWidth12", "1890")
    Call IniSet.SetIniString("ListViweList", "HeaderWidth13", "1890")
    
    Call IniSet.SetIniString("FindLyrics", "FindInSongDir", "1")
    Call IniSet.SetIniString("FindLyrics", "LyricDirCount", "0")
    
    Call IniSet.SetIniString("Info Reader", "First", "1")
    Call IniSet.SetIniString("Info Reader", "Second", "2")
    Call IniSet.SetIniString("Info Reader", "Third", "0")
                    
    Call IniSet.SetIniString("Filters", "Counter", 4)
    Call IniSet.SetIniString("Filters", "Filter1", "�����ļ�#Separator#*.*")
    Call IniSet.SetIniString("Filters", "Filter2", "MPEG Layer 3#Separator#*.MP3")
    Call IniSet.SetIniString("Filters", "Filter3", "Windows Media Audio#Separator#*.WMA")
    Call IniSet.SetIniString("Filters", "Filter4", "����������֧���ļ�#Separator#*.MP3;*.WMA")
    
    Call IniSet.SetIniString("Sort Keys", "Counter", 3)
    Call IniSet.SetIniString("Sort Keys", "Key1", "%ARTIST% - %ALBUM% - %TRACKNUMBER% - %TITLE%")
    Call IniSet.SetIniString("Sort Keys", "Key2", "%YEAR% - %ARTIST% - %ALBUM% - %TRACKNUMBER% - %TITLE%")
    Call IniSet.SetIniString("Sort Keys", "Key3", "%ARTIST% - %TITLE%")
    
    Call IniSet.SetIniString("Kernel", "CopySeeed", 2)
    Call IniSet.SetIniString("Kernel", "NumberStart", 1)
    
    Call IniSet.SetIniString("App List", "WMP", 1)
    Call IniSet.SetIniString("App List", "Winamp", vbNullString)
    Call IniSet.SetIniString("App List", "Foobar", vbNullString)
  End If
  
  '����������
  Dim RenameKeyCount As Long
  
  RenameKeyCount = IniSet.GetIniInteger("Rename", "Counter", -1)
  RenameEnabled = CBool(IniSet.GetIniInteger("Rename", "Enabled", 0))
  RenameCurrent = IniSet.GetIniInteger("Rename", "Current", 1)
  NumberStart = IniSet.GetIniInteger("Rename", "NumberStart", 1)
  
  Select Case RenameKeyCount
  Case -1
    '˵��û�иý�
    Call IniSet.SetIniString("Rename", "Enabled", "0")
    Call IniSet.SetIniString("Rename", "Counter", 3)
    Call IniSet.SetIniString("Rename", "Current", 1)
    Call IniSet.SetIniString("Rename", "Pattern1", "%NUMBER%.%ARTIST% - %TITLE%")
    Call IniSet.SetIniString("Rename", "Pattern2", "%ARTIST% - %TITLE%")
    Call IniSet.SetIniString("Rename", "Pattern3", "%ARTIST% - %ALBUM% - %TRACKNUMBER%.%TITLE%")
    
    RenameKeyCount = 3
    RenameCurrent = 1
    RenameEnabled = False
  End Select
  
  For i = 1 To RenameKeyCount
    RenameKey.Add IniSet.GetIniString("Rename", "Pattern" & i, "Error Pattern")
    tbrDefault.Buttons("RENAME").ButtonMenus.Add , , RenameKey(i)
  Next i
  
  Call SetRenameStatus(RenameEnabled)

  '������д ID3
  TagWriteID3v1 = IniSet.GetIniInteger("Tagging", "WriteID3v1", 0)
  TagWriteID3v2 = IniSet.GetIniInteger("Tagging", "WriteID3v2", 0)
  TagDelID3v1 = IniSet.GetIniInteger("Tagging", "DelID3v1", 0)
  TagDelID3v2 = IniSet.GetIniInteger("Tagging", "DelID3v2", 0)
  TagUseUnicode = IniSet.GetIniInteger("Tagging", "UseUnicode", 0)
  
  '���ý���
  Starting = True
  Me.Move CSng(IniSet.GetIniString("MainForm", "Left", 105)), _
          CSng(IniSet.GetIniString("MainForm", "Top", 105)), _
          CSng(IniSet.GetIniString("MainForm", "Width", 10575)), _
          CSng(IniSet.GetIniString("MainForm", "Height", 8220))
  Me.WindowState = CInt(IniSet.GetIniString("MainForm", "Maxed", 0)) * 2
  tbrDefault.Visible = CBool(IniSet.GetIniString("Interface", "TBGeneral", 1))
  tbrPlayer.Visible = CBool(IniSet.GetIniString("Interface", "TBPlayer", 1))
  tbrBroswer.Visible = CBool(IniSet.GetIniString("Interface", "TBBrowser", 1))
  stbDefault.Visible = CBool(IniSet.GetIniString("Interface", "SBDefault", 1))
  picDisk.Visible = CBool(IniSet.GetIniString("Interface", "SBDisk", 1))
  Form_Resize
  vspFile.SplLeft = CLng(IniSet.GetIniString("Interface", "TVWWidth", 2250))
  hspMain.SplTop = CLng(IniSet.GetIniString("Interface", "TABHeight", 2486))
  vspFileList.SplLeft = CLng(IniSet.GetIniString("Interface", "ListWidth", 2250))
  vspFileList.Hide = CLng(IniSet.GetIniInteger("Interface", "ListShow", 0))
  
  '��ȡ����������Ϣ
  FloatWindowProperty.bShowInfo = CBool(IniSet.GetIniString("Float Window", "ShowInfo", 1))
  FloatWindowProperty.bTransparency = CByte(IniSet.GetIniString("Float Window", "Transparency", 180))
  FloatWindowProperty.cfpPosition = CInt(IniSet.GetIniString("Float Window", "Position", 3))
  FloatWindowProperty.lAddInfoDelay = CLng(IniSet.GetIniString("Float Window", "InfoDelay", 3000))
  FloatWindowProperty.lAnchorHorizon = CLng(IniSet.GetIniString("Float Window", "AnchorHorizon", 600))
  FloatWindowProperty.lAnchorVertical = CLng(IniSet.GetIniString("Float Window", "AnchorVertical", 600))
  
  '���� ListView
  lvwFile.View = IniSet.GetIniString("ListViweFile", "View", 3)
  lvwFile.GridLines = CBool(IniSet.GetIniString("ListViweFile", "GradLine", 0))
  lvwFile.HotTracking = CBool(IniSet.GetIniString("ListViweFile", "HotTrack", 0))
  lvwFile.FullRowSelect = CBool(IniSet.GetIniString("ListViweFile", "FullLine", 1))
  lvwFile.ColumnHeaders(1).Width = IniSet.GetIniString("ListViweFile", "HeaderWidth1", 3644)
  lvwFile.ColumnHeaders(2).Width = IniSet.GetIniString("ListViweFile", "HeaderWidth2", 1408)
  lvwFile.ColumnHeaders(3).Width = IniSet.GetIniString("ListViweFile", "HeaderWidth3", 900)
  lvwFile.ColumnHeaders(4).Width = IniSet.GetIniString("ListViweFile", "HeaderWidth4", 1890)
  lvwFile.ColumnHeaders(5).Width = IniSet.GetIniString("ListViweFile", "HeaderWidth5", 1890)
  
  lvwList.GridLines = CBool(IniSet.GetIniString("ListViweList", "GradLine", 1))
  lvwList.HotTracking = CBool(IniSet.GetIniString("ListViweList", "HotTrack", 0))
  lvwList.FullRowSelect = CBool(IniSet.GetIniString("ListViweList", "FullLine", 1))
  lvwList.ColumnHeaders(1).Width = IniSet.GetIniString("ListViweList", "HeaderWidth1", 959)
  lvwList.ColumnHeaders(2).Width = IniSet.GetIniString("ListViweList", "HeaderWidth2", 434)
  lvwList.ColumnHeaders(3).Width = IniSet.GetIniString("ListViweList", "HeaderWidth3", 1000)
  lvwList.ColumnHeaders(4).Width = IniSet.GetIniString("ListViweList", "HeaderWidth4", 2451)
  lvwList.ColumnHeaders(5).Width = IniSet.GetIniString("ListViweList", "HeaderWidth5", 1890)
  lvwList.ColumnHeaders(6).Width = IniSet.GetIniString("ListViweList", "HeaderWidth6", 1890)
  lvwList.ColumnHeaders(7).Width = IniSet.GetIniString("ListViweList", "HeaderWidth7", 2234)
  lvwList.ColumnHeaders(8).Width = IniSet.GetIniString("ListViweList", "HeaderWidth8", 1408)
  lvwList.ColumnHeaders(9).Width = IniSet.GetIniString("ListViweList", "HeaderWidth9", 1065)
  lvwList.ColumnHeaders(10).Width = IniSet.GetIniString("ListViweList", "HeaderWidth10", 915)
  lvwList.ColumnHeaders(11).Width = IniSet.GetIniString("ListViweList", "HeaderWidth11", 929)
  lvwList.ColumnHeaders(12).Width = IniSet.GetIniString("ListViweList", "HeaderWidth12", 1379)
  lvwList.ColumnHeaders(13).Width = IniSet.GetIniString("ListViweList", "HeaderWidth13", 1890)
  
  '����Ӧ�ó��� LVW
  lvwProgram.GridLines = CBool(IniSet.GetIniString("APP ListView", "GradLine", 0))
  lvwProgram.HotTracking = CBool(IniSet.GetIniString("APP ListView", "HotTrack", 0))
  lvwProgram.FullRowSelect = CBool(IniSet.GetIniString("APP ListView", "FullLine", 1))
  lLVWFoobarWidth(1) = IniSet.GetIniString("APP ListView", "Foobar_HeaderWidth1", 1000)
  lLVWFoobarWidth(2) = IniSet.GetIniString("APP ListView", "Foobar_HeaderWidth2", 1500)
  lLVWFoobarWidth(3) = IniSet.GetIniString("APP ListView", "Foobar_HeaderWidth3", 1600)
  lLVWFoobarWidth(4) = IniSet.GetIniString("APP ListView", "Foobar_HeaderWidth4", 1600)
  lLVWFoobarWidth(5) = IniSet.GetIniString("APP ListView", "Foobar_HeaderWidth5", 960)
  lLVWFoobarWidth(6) = IniSet.GetIniString("APP ListView", "Foobar_HeaderWidth6", 960)
  lLVWFoobarWidth(7) = IniSet.GetIniString("APP ListView", "Foobar_HeaderWidth7", 1000)
  lLVWFoobarWidth(8) = IniSet.GetIniString("APP ListView", "Foobar_HeaderWidth8", 1300)
  lLVWFoobarWidth(9) = IniSet.GetIniString("APP ListView", "Foobar_HeaderWidth9", 1200)
  lLVWFoobarWidth(10) = IniSet.GetIniString("APP ListView", "Foobar_HeaderWidth10", 900)
  lLVWFoobarWidth(11) = IniSet.GetIniString("APP ListView", "Foobar_HeaderWidth11", 1000)
  lLVWFoobarWidth(12) = IniSet.GetIniString("APP ListView", "Foobar_HeaderWidth12", 1600)
  
  lLVWWinampWidth(1) = IniSet.GetIniString("APP ListView", "Winamp_HeaderWidth1", 1000)
  lLVWWinampWidth(2) = IniSet.GetIniString("APP ListView", "Winamp_HeaderWidth2", 1500)
  lLVWWinampWidth(3) = IniSet.GetIniString("APP ListView", "Winamp_HeaderWidth3", 1600)
  
  lLVWWMPWidth(1) = IniSet.GetIniString("APP ListView", "WMP_HeaderWidth1", 1000)
  lLVWWMPWidth(2) = IniSet.GetIniString("APP ListView", "WMP_HeaderWidth2", 1500)
  lLVWWMPWidth(3) = IniSet.GetIniString("APP ListView", "WMP_HeaderWidth3", 1600)
  lLVWWMPWidth(4) = IniSet.GetIniString("APP ListView", "WMP_HeaderWidth4", 1000)
  lLVWWMPWidth(5) = IniSet.GetIniString("APP ListView", "WMP_HeaderWidth5", 1500)
  lLVWWMPWidth(6) = IniSet.GetIniString("APP ListView", "WMP_HeaderWidth6", 1600)
  lLVWWMPWidth(7) = IniSet.GetIniString("APP ListView", "WMP_HeaderWidth7", 1000)
  lLVWWMPWidth(8) = IniSet.GetIniString("APP ListView", "WMP_HeaderWidth8", 1500)
  lLVWWMPWidth(9) = IniSet.GetIniString("APP ListView", "WMP_HeaderWidth9", 1600)
  
  '�����ղؼ� LVW
  lvwFavourite.GridLines = CBool(IniSet.GetIniString("Fav ListView", "GradLine", 0))
  lvwFavourite.HotTracking = CBool(IniSet.GetIniString("Fav ListView", "HotTrack", 0))
  lvwFavourite.FullRowSelect = CBool(IniSet.GetIniString("Fav ListView", "FullLine", 1))
  lLVWMusic(1) = IniSet.GetIniString("Fav ListView", "Music_HeaderWidth1", 1000)
  lLVWMusic(2) = IniSet.GetIniString("Fav ListView", "Music_HeaderWidth2", 1500)
  lLVWMusic(3) = IniSet.GetIniString("Fav ListView", "Music_HeaderWidth3", 1600)
  lLVWMusic(4) = IniSet.GetIniString("Fav ListView", "Music_HeaderWidth4", 1600)
  lLVWMusic(5) = IniSet.GetIniString("Fav ListView", "Music_HeaderWidth5", 960)
  lLVWMusic(6) = IniSet.GetIniString("Fav ListView", "Music_HeaderWidth6", 960)
  lLVWMusic(7) = IniSet.GetIniString("Fav ListView", "Music_HeaderWidth7", 1000)
  lLVWMusic(8) = IniSet.GetIniString("Fav ListView", "Music_HeaderWidth8", 1300)
  lLVWMusic(9) = IniSet.GetIniString("Fav ListView", "Music_HeaderWidth9", 1200)
  lLVWMusic(10) = IniSet.GetIniString("Fav ListView", "Music_HeaderWidth10", 900)
  
  lLVWDefault(1) = IniSet.GetIniString("Fav ListView", "Normal_HeaderWidth1", 1000)
  lLVWDefault(2) = IniSet.GetIniString("Fav ListView", "Normal_HeaderWidth2", 1500)
  lLVWDefault(3) = IniSet.GetIniString("Fav ListView", "Normal_HeaderWidth3", 1600)
  lLVWDefault(4) = IniSet.GetIniString("Fav ListView", "Normal_HeaderWidth4", 1000)
  lLVWDefault(5) = IniSet.GetIniString("Fav ListView", "Normal_HeaderWidth5", 1500)
  
  '���²˵�
  mnuGeneralToolbar.Checked = CBool(IniSet.GetIniString("Interface", "TBGeneral", 1))
  mnuPlayToolbar.Checked = CBool(IniSet.GetIniString("Interface", "TBPlayer", 1))
  mnuBroswerToolbar.Checked = CBool(IniSet.GetIniString("Interface", "TBBrowser", 1))
  mnuStatusBar.Checked = CBool(IniSet.GetIniString("Interface", "SBDefault", 1))
  mnuDisk.Checked = CBool(IniSet.GetIniString("Interface", "SBDisk", 1))
  mnuFloatWindow.Checked = CBool(IniSet.GetIniInteger("Interface", "FloatWindow", 1))
  
  '���ò���
  Dim bLRCIIExist As Boolean
  
  frmSplash.SetInfo "���ڵ�����Ϣ����..."
  
  InfoReadIdx(0) = CLng(IniSet.GetIniString("Info Reader", "First", 1))
  InfoReadIdx(1) = CLng(IniSet.GetIniString("Info Reader", "Second", 2))
  InfoReadIdx(2) = CLng(IniSet.GetIniString("Info Reader", "Third", 4))
  
  Set InfoReadObj(0) = Choose(InfoReadIdx(0) + 1, oReaderNone, oReaderID3v1, oReaderID3v2, oReaderAPETAG, oReaderWMPTAG)
  Set InfoReadObj(1) = Choose(InfoReadIdx(1) + 1, oReaderNone, oReaderID3v1, oReaderID3v2, oReaderAPETAG, oReaderWMPTAG)
  Set InfoReadObj(2) = Choose(InfoReadIdx(2) + 1, oReaderNone, oReaderID3v1, oReaderID3v2, oReaderAPETAG, oReaderWMPTAG)
  
  General.FindLyricInSongDir = CBool(IniSet.GetIniString("FindLyrics", "FindInSongDir", 1))
  bLRCIIExist = IsLyricsII(LyricsIIFolder)
  
  For i = 1 To CLng(IniSet.GetIniString("FindLyrics", "LyricDirCount", 0))
    General.LyricDir.Add CStr(IniSet.GetIniString("FindLyrics", "Dir" & i))
  Next i
  
  If bLRCIIExist Then
    bLYCIIAssociationList = CBool(IniSet.GetIniString("FindLyrics", "LyricsIIAssociationList", 1))
    bLYCIIDownDir = CBool(IniSet.GetIniString("FindLyrics", "LyricsIIDownDir", 1))
    bLYCIISearchDir = CBool(IniSet.GetIniString("FindLyrics", "LyricsIISearchDir", 1))
    InitLyricsIIDir
  End If
  
  bLyricFromFile = CBool(IniSet.GetIniInteger("FindLyrics", "ExractFromFile", 0))
  
  '���ó��򲥷��嵥
  AppWmp = CBool(IniSet.GetIniString("App List", "WMP", 1))
  AppWinamp = IniSet.GetIniString("App List", "Winamp", vbNullString)
  AppFoobar = IniSet.GetIniString("App List", "Foobar", vbNullString)
  AppFoobar9 = IniSet.GetIniString("App List", "Foobar9", vbNullString)
  AppTTPlayer = IniSet.GetIniString("App List", "TTPlayer", vbNullString)
  
  '���ù�����
  frmSplash.SetInfo "�������ù�����..."
  
  Dim sKey As Variant
  Dim nButton As MSComctlLib.ButtonMenu
  Dim sStr As String
  Dim sFlt As String
  
  Set FilterSet = New VBA.Collection
  
  For i = 1 To CLng(IniSet.GetIniString("Filters", "Counter", 4))
    sKey = IniSet.GetIniString("Filters", "Filter" & i, "δ֪��" & i & "#Separator#")
    sStr = Trim(Left(sKey, InStr(1, sKey, "#Separator#") - 1))
    sFlt = VBA.StrConv(Trim(Right(sKey, Len(sKey) - Len(sStr) - 11)), vbNarrow)
  
    FilterKey.Add sStr
    FilterSet.Add sFlt
    
    Set nButton = tbrDefault.Buttons("FILTER").ButtonMenus.Add
    nButton.Text = sStr & vbTab & sFlt
  Next i
  
  tbrDefault.Buttons("FILTER").ButtonMenus("CURRENT").Text = "��ǰ������: " & vbTab & FilterSet(1)
  CurrentFilter = FilterSet(1)
  
  '���������־
  Set SortKeySet = New VBA.Collection
  
  For i = 1 To CLng(IniSet.GetIniString("Sort Keys", "Counter", 0))
    sStr = IniSet.GetIniString("Sort Keys", "Key" & i)
    SortKeySet.Add sStr
    Set nButton = tbrDefault.Buttons("SORTLIST").ButtonMenus.Add
    nButton.Text = sStr
  Next i
  
  '��ȡ��������
  PS_CustomVolumn = CDbl(IniSet.GetIniString("Player Selector", "CustomVolumn", 0))
  PS_Volumn = CInt(IniSet.GetIniString("Player Selector", "Volumn", 0))
  PS_Remained = CDbl(IniSet.GetIniString("Player Selector", "Remained", 0))
  PS_Drive = IniSet.GetIniString("Player Selector", "Drive", "C:")
  PS_PreserveFolderTree = CBool(IniSet.GetIniInteger("Player Selector", "PreserveFolderTree", 1))
  PS_AutoFolderTree = CBool(IniSet.GetIniInteger("Player Selector", "AutoFolderTree", 0))
  PS_TemplateFolder = CBool(IniSet.GetIniInteger("Player Selector", "TemplateFolder", 0))
  PS_AutoFolderIndex = CLng(IniSet.GetIniInteger("Player Selector", "AutoFolderIndex", 1))
  PS_TemplateName = IniSet.GetIniString("Player Selector", "TemplateName")
  
  uifCopying.CopySpeed = CInt(IniSet.GetIniString("Kernel", "CopySeeed", 1))
  mnuDeleteBefore.Checked = CBool(IniSet.GetIniString("Kernel", "ClearDisk", 1))
  tbrDefault.Buttons(2).value = Abs(mnuDeleteBefore.Checked)
  InheritInfo = CBool(IniSet.GetIniString("Kernel", "InheritInfo", 1))
  NoTime = CBool(IniSet.GetIniString("Kernel", "NoTime", 0))
  NoDuration = CBool(IniSet.GetIniString("Kernel", "NoDuration", 0))
  
  '��ȡ�����ı�
  For i = 1 To IniSet.GetIniInteger("Search Keys", "Counter", 0)
    sStr = IniSet.GetIniString("Search Keys", "Key" & i)
    
    If Len(Trim(sStr)) Then
      If Not ItemExistOBJ("[KEY]" & sStr, icbSearch.ComboItems) Then
        icbSearch.ComboItems.Add , "[KEY]" & sStr, sStr, 8
      End If
    End If
  Next i
  
  '��� TreeView
  frmSplash.SetInfo "���ڻ���ļ�����Ϣ..."
  RefreshFolder
  tvwFolder.Nodes("?MYCOMPUTER").Expanded = True
  SortListView lvwFile, 0, lvwAscending

  frmSplash.SetInfo "���ڻ���ҵ��ĵ���Ϣ..."
  RefreshMyDoc
  tvwMydoc.Nodes(1).Expanded = True
  
  frmSplash.SetInfo "���ڶ�ȡӦ�ó����еĲ����б�..."
  RefreshAppList
  
  '��ʼ
  frmSplash.SetInfo "����ˢ���ļ��б�..."
  tbsFileBrowser_Click
  
  '���ڶ�ȡ�ղؼк��ļ���ģ��
  frmSplash.SetInfo "���ڶ�ȡ�ղؼк��ļ���ģ��..."
  RefreshFavourite
  TemplateRead
  Screen.MousePointer = 0
  
  frmSplash.SetInfo "�������� MP3 ������..."
  frmSplash.BringToFront False
  dlgSelectPlayer.bStarting = True
  dlgSelectPlayer.Show 1
 
  'Load ffmSearch
  
  '��Ӳ���
  Set lvwList.SmallIcons = iltList
  Set lvwProgram.SmallIcons = iltList
  Set lvwProgram.ColumnHeaderIcons = iltAppHeader
  
  lvwProgram.ColumnHeaders.Add , , , , , 1
  lvwList.ListItems.Add , , , , 1
  lvwProgram.ListItems.Add , , , , 1
  DoEvents
  
  lvwList.ListItems.Clear
  lvwProgram.ListItems.Clear
  lvwProgram.ColumnHeaders.Clear
  tmrChangedEvent.Enabled = True
  
  Starting = False
  Unload frmSplash
  ffmBacket.UpdateWindow mnuFloatWindow.Checked
End Sub

Private Sub Form_Paint()
  '������
  If hspMain.ResizeMode Then
    hspMain.ResizeMode = ByPrecent
    vspFile.ResizeMode = ByPrecent
  End If
End Sub

Public Sub Form_Resize()
  If Me.WindowState = 1 Then Exit Sub
  If Starting Then Exit Sub
  
  tbrBroswer.Move 0, 0, Me.ScaleWidth
  tbrSearch.Move 0, 0, Me.ScaleWidth
  icbSearch.Width = Me.ScaleWidth - 1560 + 75
  
  If Copying Then
    picCopy.tag = "NORESIZE"
    picCopy.Align = vbAlignLeft
    picCopy.Align = 0
    picCopy.Move 0, hspMain.Top, Me.ScaleWidth, picDisk.Height
    picCopy.tag = vbNullString
    picCopy_Resize
  Else
    hspMain.Width = Me.ScaleWidth - Abs(picDisk.Visible) * (picDisk.Width + 45)
    tbrBroswer.Buttons(3).Width = Me.ScaleWidth - 2295
    icbBrowse.Width = Me.ScaleWidth - 2295
    sldPos.Move 1380, (tbrPlayer.Height - 300) / 2, Me.ScaleWidth - 1425
    picProgress.Move 0, 0, Me.ScaleWidth, 315
  End If
  
  If Me.WindowState = 2 Then
    Call IniSet.SetIniString("MainForm", "Maxed", 1)
  Else
    Call IniSet.SetIniString("MainForm", "Maxed", 0)
    Call IniSet.SetIniString("MainForm", "Top", Me.Top)
    Call IniSet.SetIniString("MainForm", "Left", Me.Left)
    Call IniSet.SetIniString("MainForm", "Width", Me.Width)
    Call IniSet.SetIniString("MainForm", "Height", Me.Height)
  End If
  
  '������Ƶ���ڵ�λ��
  Dim r As RECT
  Dim hParent As Long
  
  If picDisk.Visible Then
    hParent = picDisk.hWnd
  Else
    If vspFileList.Hide = ShowAll Then
      hParent = tvwList.hWnd
    Else
      hParent = lvwList.hWnd
    End If
  End If
  
  If GetWindowRect(hParent, r) Then
    ffmVideo.Move r.Left * 15, r.Bottom * 15 - ffmVideo.Height, ffmVideo.Width, ffmVideo.Height
  End If
  
'  stbDefault.Panels(1).Width = (Me.ScaleWidth - 60) / 2
'  stbDefault.Panels(2).Width = (Me.ScaleWidth - 60) / 2
  
  RefreshChart
End Sub

Private Sub Form_Unload(Cancel As Integer)
  '�����п�
  Select Case lvwProgram.tag
  Case "FOOBAR", "FOOBAR9"
    For i = 1 To 12
      lLVWFoobarWidth(i) = lvwProgram.ColumnHeaders(i).Width
    Next i
  Case "WINAMP"
    For i = 1 To 3
      lLVWWinampWidth(i) = lvwProgram.ColumnHeaders(i).Width
    Next i
  Case "WMP"
    For i = 1 To 8
      lLVWWMPWidth(i) = lvwProgram.ColumnHeaders(i).Width
    Next i
  End Select
  
  Unload ffmSearch
  
  '�����б���
  Call IniSet.SetIniString("Fav ListView", "GradLine", Abs(lvwFavourite.GridLines))
  Call IniSet.SetIniString("Fav ListView", "HotTrack", Abs(lvwFavourite.HotTracking))
  Call IniSet.SetIniString("Fav ListView", "FullLine", Abs(lvwFavourite.FullRowSelect))
  
  Call IniSet.SetIniString("APP ListView", "GradLine", Abs(lvwProgram.GridLines))
  Call IniSet.SetIniString("APP ListView", "HotTrack", Abs(lvwProgram.HotTracking))
  Call IniSet.SetIniString("APP ListView", "FullLine", Abs(lvwProgram.FullRowSelect))
  
  Call IniSet.SetIniString("ListViweFile", "View", Abs(lvwFile.View))
  Call IniSet.SetIniString("ListViweFile", "GradLine", Abs(lvwFile.GridLines))
  Call IniSet.SetIniString("ListViweFile", "HotTrack", Abs(lvwFile.HotTracking))
  Call IniSet.SetIniString("ListViweFile", "FullLine", Abs(lvwFile.FullRowSelect))
  
  Call IniSet.SetIniString("ListViweList", "GradLine", Abs(lvwList.GridLines))
  Call IniSet.SetIniString("ListViweList", "HotTrack", Abs(lvwList.HotTracking))
  Call IniSet.SetIniString("ListViweList", "FullLine", Abs(lvwList.FullRowSelect))
  
  '�����б�Ŀ��
  Call IniSet.SetIniString("ListViweFile", "HeaderWidth1", lvwFile.ColumnHeaders(1).Width)
  Call IniSet.SetIniString("ListViweFile", "HeaderWidth2", lvwFile.ColumnHeaders(2).Width)
  Call IniSet.SetIniString("ListViweFile", "HeaderWidth3", lvwFile.ColumnHeaders(3).Width)
  Call IniSet.SetIniString("ListViweFile", "HeaderWidth4", lvwFile.ColumnHeaders(4).Width)
  Call IniSet.SetIniString("ListViweFile", "HeaderWidth5", lvwFile.ColumnHeaders(5).Width)
  
  '�����б�Ŀ��
  Call IniSet.SetIniString("ListViweList", "HeaderWidth1", lvwList.ColumnHeaders(1).Width)
  Call IniSet.SetIniString("ListViweList", "HeaderWidth2", lvwList.ColumnHeaders(2).Width)
  Call IniSet.SetIniString("ListViweList", "HeaderWidth3", lvwList.ColumnHeaders(3).Width)
  Call IniSet.SetIniString("ListViweList", "HeaderWidth4", lvwList.ColumnHeaders(4).Width)
  Call IniSet.SetIniString("ListViweList", "HeaderWidth5", lvwList.ColumnHeaders(5).Width)
  Call IniSet.SetIniString("ListViweList", "HeaderWidth6", lvwList.ColumnHeaders(6).Width)
  Call IniSet.SetIniString("ListViweList", "HeaderWidth7", lvwList.ColumnHeaders(7).Width)
  Call IniSet.SetIniString("ListViweList", "HeaderWidth8", lvwList.ColumnHeaders(8).Width)
  Call IniSet.SetIniString("ListViweList", "HeaderWidth9", lvwList.ColumnHeaders(9).Width)
  Call IniSet.SetIniString("ListViweList", "HeaderWidth10", lvwList.ColumnHeaders(10).Width)
  Call IniSet.SetIniString("ListViweList", "HeaderWidth11", lvwList.ColumnHeaders(11).Width)
  Call IniSet.SetIniString("ListViweList", "HeaderWidth12", lvwList.ColumnHeaders(12).Width)
  Call IniSet.SetIniString("ListViweList", "HeaderWidth13", lvwList.ColumnHeaders(13).Width)
  
  Call IniSet.SetIniString("APP ListView", "Foobar_HeaderWidth1", lLVWFoobarWidth(1))
  Call IniSet.SetIniString("APP ListView", "Foobar_HeaderWidth2", lLVWFoobarWidth(2))
  Call IniSet.SetIniString("APP ListView", "Foobar_HeaderWidth3", lLVWFoobarWidth(3))
  Call IniSet.SetIniString("APP ListView", "Foobar_HeaderWidth4", lLVWFoobarWidth(4))
  Call IniSet.SetIniString("APP ListView", "Foobar_HeaderWidth5", lLVWFoobarWidth(5))
  Call IniSet.SetIniString("APP ListView", "Foobar_HeaderWidth6", lLVWFoobarWidth(6))
  Call IniSet.SetIniString("APP ListView", "Foobar_HeaderWidth7", lLVWFoobarWidth(7))
  Call IniSet.SetIniString("APP ListView", "Foobar_HeaderWidth8", lLVWFoobarWidth(8))
  Call IniSet.SetIniString("APP ListView", "Foobar_HeaderWidth9", lLVWFoobarWidth(9))
  Call IniSet.SetIniString("APP ListView", "Foobar_HeaderWidth10", lLVWFoobarWidth(10))
  Call IniSet.SetIniString("APP ListView", "Foobar_HeaderWidth11", lLVWFoobarWidth(11))
  Call IniSet.SetIniString("APP ListView", "Foobar_HeaderWidth12", lLVWFoobarWidth(12))
  
  Call IniSet.SetIniString("APP ListView", "Winamp_HeaderWidth1", lLVWWinampWidth(1))
  Call IniSet.SetIniString("APP ListView", "Winamp_HeaderWidth2", lLVWWinampWidth(2))
  Call IniSet.SetIniString("APP ListView", "Winamp_HeaderWidth3", lLVWWinampWidth(3))

  Call IniSet.SetIniString("APP ListView", "WMP_HeaderWidth1", lLVWWMPWidth(1))
  Call IniSet.SetIniString("APP ListView", "WMP_HeaderWidth2", lLVWWMPWidth(2))
  Call IniSet.SetIniString("APP ListView", "WMP_HeaderWidth3", lLVWWMPWidth(3))
  Call IniSet.SetIniString("APP ListView", "WMP_HeaderWidth4", lLVWWMPWidth(4))
  Call IniSet.SetIniString("APP ListView", "WMP_HeaderWidth5", lLVWWMPWidth(5))
  Call IniSet.SetIniString("APP ListView", "WMP_HeaderWidth6", lLVWWMPWidth(6))
  Call IniSet.SetIniString("APP ListView", "WMP_HeaderWidth7", lLVWWMPWidth(7))
  Call IniSet.SetIniString("APP ListView", "WMP_HeaderWidth8", lLVWWMPWidth(8))
  Call IniSet.SetIniString("APP ListView", "WMP_HeaderWidth9", lLVWWMPWidth(9))

  Call IniSet.SetIniString("Fav ListView", "Music_HeaderWidth1", lLVWMusic(1))
  Call IniSet.SetIniString("Fav ListView", "Music_HeaderWidth2", lLVWMusic(2))
  Call IniSet.SetIniString("Fav ListView", "Music_HeaderWidth3", lLVWMusic(3))
  Call IniSet.SetIniString("Fav ListView", "Music_HeaderWidth4", lLVWMusic(4))
  Call IniSet.SetIniString("Fav ListView", "Music_HeaderWidth5", lLVWMusic(5))
  Call IniSet.SetIniString("Fav ListView", "Music_HeaderWidth6", lLVWMusic(6))
  Call IniSet.SetIniString("Fav ListView", "Music_HeaderWidth7", lLVWMusic(7))
  Call IniSet.SetIniString("Fav ListView", "Music_HeaderWidth8", lLVWMusic(8))
  Call IniSet.SetIniString("Fav ListView", "Music_HeaderWidth9", lLVWMusic(9))
  Call IniSet.SetIniString("Fav ListView", "Music_HeaderWidth10", lLVWMusic(10))
  
  Call IniSet.SetIniString("Fav ListView", "Normal_HeaderWidth1", lLVWDefault(1))
  Call IniSet.SetIniString("Fav ListView", "Normal_HeaderWidth2", lLVWDefault(2))
  Call IniSet.SetIniString("Fav ListView", "Normal_HeaderWidth3", lLVWDefault(3))
  Call IniSet.SetIniString("Fav ListView", "Normal_HeaderWidth4", lLVWDefault(4))
  Call IniSet.SetIniString("Fav ListView", "Normal_HeaderWidth5", lLVWDefault(5))

  '�����������
  Call IniSet.SetIniString("Interface", "TBBrowser", Abs(mnuBroswerToolbar.Checked))
  Call IniSet.SetIniString("Interface", "SBDisk", Abs(mnuDisk.Checked))
  Call IniSet.SetIniString("Interface", "TBGeneral", Abs(mnuGeneralToolbar.Checked))
  Call IniSet.SetIniString("ListViweFile", "View", lvwFile.View)
  Call IniSet.SetIniString("Interface", "TBPlayer", Abs(mnuPlayToolbar.Checked))
  Call IniSet.SetIniString("Interface", "SBDefault", Abs(mnuStatusBar.Checked))
  Call IniSet.SetIniString("Interface", "TVWWidth", vspFile.SplLeft)
  Call IniSet.SetIniString("Interface", "ListWidth", vspFileList.SplLeft)
  Call IniSet.SetIniString("Interface", "TABHeight", hspMain.SplTop)
  Call IniSet.SetIniString("Interface", "FloatWindow", Abs(mnuFloatWindow.Checked))
  
  '���������
  Call IniSet.SetIniString("Filters", "Counter", FilterSet.Count)
  
  For i = 1 To FilterSet.Count
    Call IniSet.SetIniString("Filters", "Filter" & i, FilterKey(i) & "#Separator#" & FilterSet(i))
  Next i
  
  '��������
  Call IniSet.SetIniString("Sort Keys", "Counter", SortKeySet.Count)
  
  For i = 1 To SortKeySet.Count
    Call IniSet.SetIniString("Sort Keys", "Key" & i, SortKeySet(i))
  Next i
  
  '������������Ϣ
  Call IniSet.SetIniString("Rename", "Counter", RenameKey.Count)
  Call IniSet.SetIniString("Rename", "Enabled", Abs(RenameEnabled))
  Call IniSet.SetIniString("Rename", "Current", RenameCurrent)
  Call IniSet.SetIniString("Rename", "NumberStart", NumberStart)
  
  For i = 1 To RenameKey.Count
    Call IniSet.SetIniString("Rename", "Pattern" & i, RenameKey(i))
  Next i
  
  '������д��ǩ
  Call IniSet.SetIniString("Tagging", "WriteID3v1", Abs(TagWriteID3v1))
  Call IniSet.SetIniString("Tagging", "WriteID3v2", Abs(TagWriteID3v2))
  Call IniSet.SetIniString("Tagging", "DelID3v1", Abs(TagDelID3v1))
  Call IniSet.SetIniString("Tagging", "DelID3v2", Abs(TagDelID3v2))
  Call IniSet.SetIniString("Tagging", "UseUnicode", Abs(TagUseUnicode))
  
  '������Ϣ��ȡ
  Call IniSet.SetIniString("Info Reader", "First", InfoReadIdx(0))
  Call IniSet.SetIniString("Info Reader", "Second", InfoReadIdx(1))
  Call IniSet.SetIniString("Info Reader", "Third", InfoReadIdx(2))
  
  '��������
  Call IniSet.SetIniString("Player Selector", "CustomVolumn", PS_CustomVolumn)
  Call IniSet.SetIniString("Player Selector", "Volumn", PS_Volumn)
  Call IniSet.SetIniString("Player Selector", "Remained", PS_Remained)
  Call IniSet.SetIniString("Player Selector", "Drive", PS_Drive)
  Call IniSet.SetIniString("Player Selector", "PreserveFolderTree", Abs(PS_PreserveFolderTree))
  Call IniSet.SetIniString("Player Selector", "AutoFolderTree", Abs(PS_AutoFolderTree))
  Call IniSet.SetIniString("Player Selector", "TemplateFolder", Abs(PS_TemplateFolder))
  Call IniSet.SetIniString("Player Selector", "AutoFolderIndex", PS_AutoFolderIndex)
  Call IniSet.SetIniString("Player Selector", "TemplateName", PS_TemplateName)
  Call IniSet.SetIniString("Kernel", "CopySeeed", uifCopying.CopySpeed)
  Call IniSet.SetIniString("Kernel", "ClearDisk", Abs(mnuDeleteBefore.Checked))
  Call IniSet.SetIniString("Kernel", "InheritInfo", Abs(InheritInfo))
  Call IniSet.SetIniString("Kernel", "NoTime", Abs(NoTime))
  Call IniSet.SetIniString("Kernel", "NoDuration", Abs(NoDuration))
  
  '������������Ϣ
  Call IniSet.SetIniString("Float Window", "ShowInfo", Abs(FloatWindowProperty.bShowInfo))
  Call IniSet.SetIniString("Float Window", "Transparency", FloatWindowProperty.bTransparency)
  Call IniSet.SetIniString("Float Window", "Position", Abs(FloatWindowProperty.cfpPosition))
  Call IniSet.SetIniString("Float Window", "InfoDelay", Abs(FloatWindowProperty.lAddInfoDelay))
  Call IniSet.SetIniString("Float Window", "AnchorHorizon", Abs(FloatWindowProperty.lAnchorHorizon))
  Call IniSet.SetIniString("Float Window", "AnchorVertical", Abs(FloatWindowProperty.lAnchorVertical))
  
  '���������ؼ���
  Call IniSet.SetIniString("Search Keys", "Counter", icbSearch.ComboItems.Count)
  
  For i = 1 To icbSearch.ComboItems.Count
    Call IniSet.SetIniString("Search Keys", "Key" & i, icbSearch.ComboItems(i).Text)
  Next i
  
  '��������Ϣ
  Call IniSet.SetIniString("FindLyrics", "LyricDirCount", LyricDir.Count)
  Call IniSet.SetIniString("FindLyrics", "FindInSongDir", Abs(mnuCopyLyrics.Checked))
  Call IniSet.SetIniString("FindLyrics", "LyricsIIAssociationList", Abs(bLYCIIAssociationList))
  Call IniSet.SetIniString("FindLyrics", "LyricsIIDownDir", Abs(bLYCIIDownDir))
  Call IniSet.SetIniString("FindLyrics", "LyricsIISearchDir", Abs(bLYCIISearchDir))
  Call IniSet.SetIniString("FindLyrics", "ExractFromFile", Abs(bLyricFromFile))
 
  For i = 1 To LyricDir.Count
    Call IniSet.SetIniString("FindLyrics", "Dir" & i, LyricDir(i))
  Next i
  
  '����Ӧ�ó�����Ϣ
  Call IniSet.SetIniString("App List", "WMP", Abs(AppWmp))
  Call IniSet.SetIniString("App List", "Winamp", AppWinamp)
  Call IniSet.SetIniString("App List", "Foobar", AppFoobar)
  Call IniSet.SetIniString("App List", "Foobar9", AppFoobar9)
  Call IniSet.SetIniString("App List", "TTPlayer", AppTTPlayer)

  '���±����ղؼ��ļ�
  SaveFavItem oFav, True
  
  '�����ļ�
  iniFav.Update
  IniSet.Update
  
   '����ģ����Ŀ
  Template.TemplateWrite
 
  End
End Sub

Private Sub hspMain_ResizeCompleted(ByVal TopHeihgt As Single, ByVal BottomHeight As Single, ByVal BottomTop As Single, ByVal Width As Single)
  vspFile.Move 120, 435, Width - 240, Abs(TopHeihgt - 540)
End Sub

Private Sub icbBrowse_Click()
  'ˢ��
  Dim MyDocPath As Boolean
  Dim SelPath As String
  
  MyDocPath = (icbBrowse.selectedItem.Index > icbBrowse.ComboItems("?MYDOCUMENTS").Index)
  
  '�ų������ַ�
  Select Case icbBrowse.selectedItem.Key
  Case "?MYCOMPUTER"
    tvwFolder.Nodes(1).Selected = True
    tvwFolder.Nodes(1).EnsureVisible
    tbsFileBrowser.Tabs(1).Selected = True
    tbsFileBrowser_Click
  Case "?MYDOCUMENTS"
    tvwMydoc.Nodes(1).Selected = True
    tvwMydoc.Nodes(1).EnsureVisible
    tbsFileBrowser.Tabs(2).Selected = True
    tbsFileBrowser_Click
  Case Else
    'ѡ��·��
    SelPath = icbBrowse.selectedItem.Key
    
    If MyDocPath Then
      ExpandFolder tvwMydoc, FS.GetParentFolderName(SelPath)
      tvwMydoc.Nodes(SelPath).Selected = True
      tvwMydoc.Nodes(SelPath).EnsureVisible
      tbsFileBrowser.Tabs(2).Selected = True
      tbsFileBrowser_Click
    ElseIf Len(SelPath) = 3 Then
      tvwFolder.Nodes(SelPath).Selected = True
      tvwFolder.Nodes(SelPath).EnsureVisible
      tbsFileBrowser.Tabs(1).Selected = True
      tbsFileBrowser_Click
    Else
      ExpandFolder tvwFolder, FS.GetParentFolderName(SelPath)
      tvwFolder.Nodes(SelPath).Selected = True
      tvwFolder.Nodes(SelPath).EnsureVisible
      tbsFileBrowser.Tabs(1).Selected = True
      tbsFileBrowser_Click
    End If
  End Select
End Sub

Private Sub icbBrowse_GotFocus()
  'ȫѡ
  icbBrowse.SelStart = 0
  icbBrowse.SelLength = LenB(icbBrowse.Text)
End Sub

Private Sub icbBrowse_KeyDown(KeyCode As Integer, Shift As Integer)
  If KeyCode = vbKeyReturn Then
    '�س�
    tbrBroswer_ButtonClick tbrBroswer.Buttons(4)
  End If
End Sub

Private Sub icbSearch_Change()
  '��ʼ����
  If (Not mnuResult.Checked) Then
    ffmSearch.ShowWindow True, False
    mnuResult.Checked = True
    tbrSearch.Buttons(1).value = tbrPressed
  End If
  
  SearchKeyChanged = True
End Sub

Private Sub icbSearch_Click()
  icbSearch_Change
End Sub

Private Sub icbSearch_KeyDown(KeyCode As Integer, Shift As Integer)
  Dim xCBItem As MSComctlLib.ComboItem
  Dim sStr As String
  Dim sKey As String

  If Shift = 0 And KeyCode = vbKeyReturn Then
    '�����Ŀ
    sStr = icbSearch.Text
    sKey = "[KEY]" & sStr
    
    If ItemExistOBJ(sKey, icbSearch.ComboItems) Then
      icbSearch.ComboItems.Remove sKey
    End If
    
    Set xCBItem = icbSearch.ComboItems.Add(1, sKey, sStr, 8)
    Set icbSearch.selectedItem = xCBItem
  End If
End Sub

Private Sub lblTotal_Change()
  picDisk.Width = lblTotal.Width + 855
  
  If Me.Visible Then Form_Resize
End Sub

Private Sub lvwFavourite_ColumnClick(ByVal ColumnHeader As MSComctlLib.ColumnHeader)
  '��������
  Dim PreSortKey As Integer
  Dim NewSortKey As Integer
  Dim SortOrder As Integer
  
  PreSortKey = lvwFavourite.SortKey
  NewSortKey = ColumnHeader.Index - 1
  
  If PreSortKey = NewSortKey Then
    SortOrder = Choose(lvwFavourite.SortOrder + 1, 1, 0)
  Else
    SortOrder = lvwFavourite.SortOrder
  End If
   
  SortListView lvwFavourite, NewSortKey, SortOrder
End Sub

Private Sub lvwFavourite_DblClick()
  '˫������
  If mnuPlayBrowser.Enabled Then
    mnuPlayBrowser_Click
  Else
    mnuOpen_Click
  End If
End Sub

Private Sub lvwFavourite_GotFocus()
  Set ActiveLVW = lvwFavourite
  RefreshStyle
End Sub

Private Sub lvwFavourite_ItemClick(ByVal Item As MSComctlLib.ListItem)
  SelectionFavChanged = True
End Sub

Private Sub lvwFavourite_KeyDown(KeyCode As Integer, Shift As Integer)
  If (KeyCode = vbKeyA) And (Shift = 2) Then  'Ctrl+A
    For i = 1 To lvwFavourite.ListItems.Count
      lvwFavourite.ListItems(i).Selected = True
    Next i
    
    lvwFavourite_ItemClick lvwFavourite.selectedItem
  End If
  
  'Delete
  If (KeyCode = vbKeyDelete) And (Shift = 0) Then mnuDeleteFromFavourite_Click
  
  'Alt+Delete
  If (KeyCode = vbKeyDelete) And (Shift = vbAltMask) Then mnuDeleteAllFavourite_Click
  
  'Alt+Enter
  If (KeyCode = vbKeyReturn) And (Shift = vbAltMask) Then mnuProperty_Click
  
  'Ctrl+Enter
  If (KeyCode = vbKeyReturn) And (Shift = vbCtrlMask) Then mnuOpen_Click
End Sub

Private Sub lvwFavourite_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
    PopupMenu popLvwFavourite
  End If
  
  FavShifting = (Shift = vbShiftMask)
End Sub

Private Sub lvwFavourite_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  DragSender = vbNullString
End Sub

Private Sub lvwFavourite_OLEDragDrop(Data As MSComctlLib.DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
  '��ӵ��ղؼ�
  Dim oFS As New VBA.Collection
  
  If Not DragSender = "lvwFavourite" Then
    If Data.GetFormat(vbCFFiles) Then
      '�����ļ�
      On Error GoTo CannotDrop
      
      For i = 1 To Data.Files.Count
        oFS.Add Data.Files(i)
      Next i
      
      dlgAddFavourite.ShowAddFavourite oFS, oCurFav.Key, False
    End If
  End If
  
  On Error GoTo 0
  Exit Sub
CannotDrop:
  MsgBox "���Ϸŵ�ʱ������һ������", vbCritical
  On Error GoTo 0
End Sub

Private Sub lvwFavourite_OLEDragOver(Data As MSComctlLib.DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single, State As Integer)
  '�����϶�������
  If Data.GetFormat(vbCFFiles) Then
    Effect = vbDropEffectCopy
  Else
    Effect = vbDropEffectNone
  End If
End Sub

Private Sub lvwFavourite_OLESetData(Data As MSComctlLib.DataObject, DataFormat As Integer)
  Data.SetData , 15
End Sub

Private Sub lvwFavourite_OLEStartDrag(Data As MSComctlLib.DataObject, AllowedEffects As Long)
  '�����з�
  AllowedEffects = vbDropEffectCopy

  For i = 1 To lvwFavourite.ListItems.Count
    If lvwFavourite.ListItems(i).Selected = True Then
      Data.Files.Add lvwFavourite.ListItems(i).Key
    End If
  Next i
  
  Data.SetData , 15
  DragSender = "lvwFavourite"
End Sub

Private Sub lvwFile_ColumnClick(ByVal ColumnHeader As MSComctlLib.ColumnHeader)
  '��������
  Dim PreSortKey As Integer
  Dim NewSortKey As Integer
  Dim SortOrder As Integer
  Dim nHeader As MSComctlLib.ColumnHeader
  Dim sNew As String
  
  PreSortKey = lvwFile.SortKey
  NewSortKey = ColumnHeader.Index - 1
  
  If PreSortKey = 5 Then PreSortKey = 1
  
  If PreSortKey = NewSortKey Then
    SortOrder = Choose(lvwFile.SortOrder + 1, 1, 0)
  Else
    SortOrder = lvwFile.SortOrder
  End If
  
  lvwFile.ColumnHeaders(6).Width = 0
  
  If NewSortKey = 1 Then
    NewSortKey = 5
    SortListView lvwFile, NewSortKey, SortOrder
    SetHeaderImage lvwFile.hWnd, 2, SortOrder + 1, "��С", 1
  Else
    SortListView lvwFile, NewSortKey, SortOrder
  End If
End Sub

Private Sub lvwFile_DblClick()
  '�����ļ�
  If Not lvwFile.selectedItem Is Nothing Then
    If mnuPlayBrowser.Enabled Then
      mnuPlayBrowser_Click
    Else
      mnuOpen_Click
    End If
  End If
End Sub

Private Sub lvwFile_ItemClick(ByVal Item As MSComctlLib.ListItem)
  '����״̬��
  SelectionFilChanged = True
End Sub

Private Sub lvwFile_KeyDown(KeyCode As Integer, Shift As Integer)
  If (KeyCode = 65) And (Shift = 2) Then
    For i = 1 To lvwFile.ListItems.Count
      lvwFile.ListItems(i).Selected = True
    Next i
    
    If lvwFile.ListItems.Count > 1 Then lvwFile_ItemClick Nothing
  End If

  'Alt+Enter
  If (KeyCode = vbKeyReturn) And (Shift = vbAltMask) Then mnuProperty_Click

  'Ctrl+Enter
  If (KeyCode = vbKeyReturn) And (Shift = vbCtrlMask) Then mnuOpen_Click
End Sub

Private Sub lvwFile_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
    PopupMenu popLvwFile
  End If
End Sub

Private Sub lvwFile_OLESetData(Data As MSComctlLib.DataObject, DataFormat As Integer)
  DataFormat = vbCFFiles
End Sub

Private Sub lvwFile_OLEStartDrag(Data As MSComctlLib.DataObject, AllowedEffects As Long)
  '�����з�
  AllowedEffects = vbDropEffectCopy

  For i = 1 To lvwFile.ListItems.Count
    If lvwFile.ListItems(i).Selected = True Then
      Data.Files.Add lvwFile.ListItems(i).ListSubItems(1).tag
    End If
  Next i
  
  Set lvwFile.DragIcon = lvwFile.selectedItem.CreateDragImage
  
  Data.SetData , 15
  DragSender = "lvwFile"
End Sub

Private Sub lvwList_ColumnClick(ByVal ColumnHeader As MSComctlLib.ColumnHeader)
  '����
  Dim sSortKey As String
  
  '"%FILENAME%"
  '"%ARTIST%"
  '"%ALBUM%"
  '"%TITLE%"
  '"%GENRE%"
  '"%LENGTH%"
  '"%TRACKNUMBER%"
  '"%YEAR%"
  '"%FILESIZE%"
  '"%DATECREATED%"
  
  sSortKey = ColumnHeader.tag
  
  Select Case ColumnHeader.Index
  Case 1
    '�������
    SortListRandom
    Exit Sub
  Case 2: Exit Sub
  Case 3: Exit Sub
  Case 4: sSortKey = "%FILENAME%"
  Case 5: sSortKey = "%ARTIST%"
  Case 6: sSortKey = "%TITLE%"
  Case 7: sSortKey = "%ALBUM%"
  Case 8: sSortKey = "%GENRE%"
  Case 9: sSortKey = "%LENGTH%"
  Case 10: sSortKey = "%TRACKNUMBER%"
  Case 11: sSortKey = "%YEAR%"
  Case 12: sSortKey = "%FILESIZE%"
  Case 13: sSortKey = "%DATECREATED%"
  End Select
  
  '�����ֶ�����
  If LastSortKey = sSortKey Then
    LastAscending = Not LastAscending
    LastSortKey = sSortKey
    SortList sSortKey, LastAscending, , True
  Else
    LastSortKey = sSortKey
    SortList sSortKey, LastAscending, , True
  End If
End Sub

Private Sub lvwList_DblClick()
  '�����ļ�
  If Not (lvwList.selectedItem Is Nothing) Then
    If mnuPlayList.Enabled Then
      mnuPlayList_Click
    Else
      mnuOpen_Click
    End If
  End If
End Sub

Private Sub lvwList_GotFocus()
  '��ý���
  Set CurrentControl = lvwList
  
  mnuMoveLast.Enabled = True
  mnuMoveLast.Enabled = True
  mnuUp.Enabled = True
  mnuDown.Enabled = True
  
  lvwList_ItemClick lvwList.selectedItem
End Sub

Private Sub lvwList_ItemClick(ByVal Item As MSComctlLib.ListItem)
  '�Ƿ���ʾ����
  Dim iInfo As MP3PA.ListInfo
  Dim SelSize As Double
  Dim SelItem As ListInfo
  Dim Counter As Long
  
 If Not (Item Is Nothing) Then
    Set iInfo = PlayListInfo(Item.Index)
    
    Select Case UCase(FS.GetExtensionName(iInfo.FileName))
    Case "WMA", "MP3", "WAV"
      mnuPlayList.Enabled = True
      tbrPlayer.Buttons(2).Enabled = True
    Case Else
      mnuPlayList.Enabled = False
      tbrPlayer.Buttons(2).Enabled = False
    End Select
  End If
  
  Set stbDefault.Panels(1).Picture = iltTabs.ListImages(5).Picture
  Set ActiveLVW = lvwList
  Call RefreshStyle
  
  stbDefault.Panels(1).ToolTipText = "�嵥���ܹ� " & PlayListInfo.Count & " ���ļ�, �ܹ���С " & DisplaySize(SpaceAdded)
  
  For i = 1 To PlayListInfo.Count
    If lvwList.ListItems(i).Selected Then
      Set SelItem = PlayListInfo(i)
      SelSize = SelSize + SelItem.LyricSize + SelItem.Size
      Counter = Counter + 1
    End If
  Next i
  
  If Counter = 0 Then
    stbDefault.Panels(1).Text = stbDefault.Panels(1).ToolTipText
  Else
    stbDefault.Panels(1).Text = "ѡ���� " & Counter & " ���ļ�, �ܹ���С " & DisplaySize(SelSize)
  End If
End Sub

Private Sub lvwList_KeyDown(KeyCode As Integer, Shift As Integer)
  If Shift = 0 Then
    Select Case KeyCode
    Case vbKeyDelete
      mnuDelete_Click
    Case vbKeyW
      mnuUp_Click
    Case vbKeyS
      mnuDown_Click
    Case vbKeyA
      mnuMoveFirst_Click
    Case vbKeyD
      mnuMoveLast_Click
    End Select
  Else
    If (KeyCode = vbKeyA) And (Shift = 2) Then  'Ctrl+A
      For i = 1 To lvwList.ListItems.Count
        lvwList.ListItems(i).Selected = True
      Next i
    End If
  End If

  'Alt+Enter
  If (KeyCode = vbKeyReturn) And (Shift = vbAltMask) Then mnuProperty_Click

  'Ctrl+Enter
  If (KeyCode = vbKeyReturn) And (Shift = vbCtrlMask) Then mnuOpen_Click
End Sub

Private Sub lvwList_LostFocus()
  '��ý���
  Set CurrentControl = Nothing
  
  mnuMoveLast.Enabled = False
  mnuMoveLast.Enabled = False
  mnuUp.Enabled = False
  mnuDown.Enabled = False
  
  If ActivePage < 3 Then
    lvwFile_ItemClick Nothing
  End If
End Sub

Private Sub lvwList_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
    PopupMenu popLvwList
  End If
  
  StartDrag = True
End Sub

Private Sub lvwList_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  DragSender = vbNullString
End Sub

Private Sub lvwList_OLECompleteDrag(Effect As Long)
  DragSender = vbNullString
End Sub

Public Sub lvwList_OLEDragDrop(Data As MSComctlLib.DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
  '����ļ�
  Dim oFiles As New VBA.Collection
  Dim oExist As New VBA.Collection
  Dim sAddNo As String
  Dim sfile As String
  Dim iItem As MSComctlLib.ListItem
  Dim bNoSpace As Boolean
  Dim dSpace As Double
  Dim nItems As New VBA.Collection
  Dim oLVW As MSComctlLib.ListView
  
  '������ڲ��зž�����
  Select Case DragSender
  Case "lvwList"
    Set lvwList.DropHighlight = Nothing
    DragSender = vbNullString
    Exit Sub
  Case "lvwFavourite", "lvwFile", "lvwProgram"
    '����ǳ����ڵĿؼ��Ϸž�ִ��һ����������
    'ȷ����ǰ����б�
    Select Case ActivePage
    Case 1, 2: Set oLVW = lvwFile
    Case 3: Set oLVW = lvwFavourite
    Case 4: Set oLVW = lvwProgram
    End Select
    
    '�����ѡ��Ŀ
    For i = 1 To oLVW.ListItems.Count
      If oLVW.ListItems(i).Selected Then
        nItems.Add i
      End If
    Next i
    
    If lvwList.DropHighlight Is Nothing Then
      Call AddFileItems(nItems)
    Else
      Call AddFileItems(nItems, lvwList.DropHighlight.Index)
    End If
    
    Set lvwList.DropHighlight = Nothing
    DragSender = vbNullString
    Exit Sub
  Case "lvwResult"
  '����ļ�
    For i = 1 To ffmSearch.lvwResult.ListItems.Count
      If ffmSearch.lvwResult.ListItems(i).Selected Then
        nItems.Add Val(ffmSearch.lvwResult.ListItems(i).Text)
      End If
    Next i
    
    If lvwList.DropHighlight Is Nothing Then
      Call AddFileItems(nItems)
    Else
      Call AddFileItems(nItems, lvwList.DropHighlight.Index)
    End If
    
    Set lvwList.DropHighlight = Nothing
    DragSender = vbNullString
    Exit Sub
  End Select
  
  dSpace = SpaceTotal - SpaceUsed - SpaceAdded
  sAddNo = "û���㹻�Ŀռ���������ļ���" & vbCrLf & vbCrLf
  
  'Ԥ������ļ�
  If Data.GetFormat(vbCFFiles) Then
    For i = 1 To Data.Files.Count
      sfile = Data.Files.Item(i)
    
      If FS.FileExists(sfile) Then
        If ItemExist(sfile, PlayListKeys) Then
          oExist.Add sfile
        Else
          dSpace = dSpace - FS.GetFile(sfile).Size
          
          If dSpace < 0 Then
            'û�пռ���
            bNoSpace = True
            sAddNo = sAddNo & sfile & vbCrLf
          Else
            oFiles.Add sfile
          End If
        End If
      End If
    Next i
  End If
  
  If bNoSpace Then
    sAddNo = sAddNo & vbCrLf & "�Ƿ������"
    
    If MsgBox(sAddNo, vbQuestion + vbYesNo) = vbNo Then
      Set lvwList.DropHighlight = Nothing
      Exit Sub
    End If
  End If
  
  '����ļ�
  If oFiles.Count Then
    If lvwList.DropHighlight Is Nothing Then
      AddFile oFiles
    Else
      AddFile oFiles, lvwList.DropHighlight.Index
    End If
  End If
  
  '����ѡ��
  For i = 1 To lvwList.ListItems.Count
    lvwList.ListItems(i).Selected = False
  Next i
  
  For i = 1 To oExist.Count
    lvwList.ListItems(PlayListKeys(oExist(i))).Selected = True
  Next i
  
  If oExist.Count Then lvwList.selectedItem.EnsureVisible
  
  '���ø���
  Set lvwList.DropHighlight = Nothing
End Sub

Private Sub lvwList_OLEDragOver(Data As MSComctlLib.DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single, State As Integer)
  '�����϶�������
  If Data.GetFormat(vbCFFiles) Then
    Effect = vbDropEffectCopy
  Else
    Effect = vbDropEffectNone
  End If
  
  '���ø���
  If State = 1 Then
    Set lvwList.DropHighlight = Nothing
  Else
    Set lvwList.DropHighlight = lvwList.HitTest(X, Y)
    
    If Not lvwList.DropHighlight Is Nothing Then
      lvwList.DropHighlight.EnsureVisible
    End If
  End If
End Sub

Private Sub lvwList_OLESetData(Data As MSComctlLib.DataObject, DataFormat As Integer)
  DataFormat = 15
  Data.Files.Clear
  
  For i = 1 To lvwList.ListItems.Count
    If lvwList.ListItems(1).Selected Then
      Data.Files.Add PlayListInfo(i).FileName
    End If
  Next i
End Sub

Private Sub lvwList_OLEStartDrag(Data As MSComctlLib.DataObject, AllowedEffects As Long)
  '�����з�
  AllowedEffects = vbDropEffectCopy
  
  Data.Files.Clear
  Data.SetData , 15
  
  For i = 1 To lvwList.ListItems.Count
    If lvwList.ListItems(1).Selected Then
      Data.Files.Add PlayListInfo(i).FileName
    End If
  Next i
  
  DragSender = "lvwList"
End Sub

Private Sub lvwProgram_DblClick()
  '˫������
  mnuPlayBrowser_Click
End Sub

Private Sub lvwProgram_GotFocus()
  '����Ч��
  Set ActiveLVW = lvwProgram
  RefreshStyle
End Sub

Private Sub lvwProgram_ItemClick(ByVal Item As MSComctlLib.ListItem)
  SelectionPrgChanged = True
End Sub

Private Sub lvwProgram_KeyDown(KeyCode As Integer, Shift As Integer)
  If (KeyCode = vbKeyA) And (Shift = 2) Then  'Ctrl+A
    For i = 1 To lvwProgram.ListItems.Count
      lvwProgram.ListItems(i).Selected = True
    Next i
    lvwProgram_ItemClick lvwProgram.selectedItem
  End If
  
  'Alt+Enter
  If (KeyCode = vbKeyReturn) And (Shift = vbAltMask) Then mnuProperty_Click
  
  'Ctrl+Enter
  If (KeyCode = vbKeyReturn) And (Shift = vbCtrlMask) Then mnuOpen_Click
End Sub

Private Sub lvwProgram_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
    PopupMenu popLvwProgram
  End If
End Sub

Private Sub lvwProgram_OLESetData(Data As MSComctlLib.DataObject, DataFormat As Integer)
  Data.SetData , 15
End Sub

Private Sub lvwProgram_OLEStartDrag(Data As MSComctlLib.DataObject, AllowedEffects As Long)
  '�����з�
  AllowedEffects = vbDropEffectCopy

  For i = 1 To lvwProgram.ListItems.Count
    If lvwProgram.ListItems(i).Selected = True Then
      Data.Files.Add lvwProgram.ListItems(i).tag
    End If
  Next i
  
  Set lvwProgram.DragIcon = lvwProgram.selectedItem.CreateDragImage
  
  Data.SetData , 15
  DragSender = "lvwProgram"
End Sub

Private Sub mnuAbout_Click()
  '��ʾ���ڶԻ���
  frmAbout.Show 1
End Sub

Private Sub mnuAdd_Click()
  Dim nItems As New VBA.Collection
  Dim oLVW As MSComctlLib.ListView
  
  'ȷ����ǰ����б�
  Select Case ActivePage
  Case 1, 2: Set oLVW = lvwFile
  Case 3: Set oLVW = lvwFavourite
  Case 4: Set oLVW = lvwProgram
  End Select
  
  '�����ѡ��Ŀ
  For i = 1 To oLVW.ListItems.Count
    If oLVW.ListItems(i).Selected Then
      nItems.Add i
    End If
  Next i
  
  '׼����ӵ��ļ�
  Call AddFileItems(nItems)
End Sub

Private Sub mnuAddAll_Click()
  Dim nItems As New VBA.Collection
  Dim oLVW As MSComctlLib.ListView
  
  'ȷ����ǰ����б�
  Select Case ActivePage
  Case 1, 2: Set oLVW = lvwFile
  Case 3: Set oLVW = lvwFavourite
  Case 4: Set oLVW = lvwProgram
  End Select
  
  '���������Ŀ
  For i = 1 To oLVW.ListItems.Count
    nItems.Add i
  Next i
  
  '׼����ӵ��ļ�
  Call AddFileItems(nItems)
End Sub

Private Sub mnuAddToFavourite_Click()
  '��ӵ��ղؼ�
  Dim oFile As New VBA.Collection
  
  Select Case Me.ActiveControl.Name
  Case "lvwFile", "tvwFolder", "tvwMydoc"
    '�ļ�
    For i = 1 To lvwFile.ListItems.Count
      If lvwFile.ListItems(i).Selected Then
        oFile.Add lvwFile.ListItems(i).ListSubItems(1).tag
      End If
    Next i
  Case "tvwProgram", "lvwProgram"
    'Ӧ�ó����б�
    For i = 1 To lvwProgram.ListItems.Count
      If lvwProgram.ListItems(i).Selected Then
        oFile.Add lvwProgram.ListItems(i).tag
      End If
    Next i
  Case "lvwList"
    '�����б�
    For i = 1 To PlayListInfo.Count
      If lvwList.ListItems(i).Selected Then
        oFile.Add PlayListInfo(i).FileName
      End If
    Next i
  End Select
  
  If oFile.Count Then
    Call dlgAddFavourite.ShowAddFavourite(oFile, oCurFav.Key)
  End If
End Sub

Private Sub mnuAppList_Click()
  tbsFileBrowser.Tabs(4).Selected = True
  tbsFileBrowser_Click
End Sub

Private Sub mnuApplyFolderTemplate_Click()
  dlgTemplateFolder.Show 1
End Sub

Private Sub mnuBookmark_Click()
   General.CallHelp Me.hWnd, , HH_DISPLAY_TOC
End Sub

Private Sub mnuBroswerToolbar_Click()
  mnuBroswerToolbar.Checked = Not mnuBroswerToolbar.Checked
  tbrSBBar.Visible = mnuBroswerToolbar.Checked
  tbrSBBar.Top = 1410
End Sub

Public Sub mnuChangeFileName_Click()
  dlgRenameKey.Show 1
  SetRenameStatus RenameEnabled
End Sub

Public Sub mnuCopy_Click()
  '��ʼ����
  RecalcSize True
  
  If SpaceAdded = 0 Then
    MsgBox "������û��Ҫ���Ƶ��ļ���", vbInformation
    Exit Sub
  End If
  
  '׼�������ļ�
  frmReady.Show 1
  If frmReady.bCanceled Then Exit Sub
    
  Copying = True
  picCopy.Visible = True
  picCopy.Enabled = True
  picCopy.ZOrder 0
  hspMain.Visible = False
  tbsFileBrowser.Enabled = False
  lvwList.Enabled = False
  hspMain.ZOrder 1
  picDisk.Visible = False
  Form_Resize
  ShowProgress True, "���ڸ����ļ�...", False
  DoEvents
  
  '������Ч�Ľ���
  stbDefault.Enabled = False
  mnuCopy.Enabled = False
  mnuSelectMP3.Enabled = False
  mnuCopyLyrics.Enabled = False
  mnuDeleteBefore.Enabled = False
  mnuLoad.Enabled = False
  mnuSave.Enabled = False
  mnuProperty.Enabled = False
  mnuOpen.Enabled = False
  mnuExit.Enabled = False
  mnuAdd.Enabled = False
  mnuDelete.Enabled = False
  mnuAddAll.Enabled = False
  mnuDeleteAll.Enabled = False
  mnuCreateFolder.Enabled = False
  mnuSelectFolder.Enabled = False
  mnuSort.Enabled = False
  mnuMyComputer.Enabled = False
  mnuMyDocuments.Enabled = False
  mnuFavourite.Enabled = False
  mnuAppList.Enabled = False
  mnuDisk.Enabled = False
  mnuLargeIcon.Enabled = False
  mnuSmallIcon.Enabled = False
  mnuList.Enabled = False
  mnuReport.Enabled = False
  mnuFullRow.Enabled = False
  mnuGrid.Enabled = False
  mnuHotSelect.Enabled = False
  mnuFilter.Enabled = False
  mnuPlayBrowser.Enabled = False
  mnuPlayList.Enabled = False
  mnuPause.Enabled = False
  mnuStop.Enabled = False
  mnuAddToFavourite.Enabled = False
  mnuDeleteFromFavourite.Enabled = False
  mnuDeleteAllFavourite.Enabled = False
  mnuMoveToDirectory.Enabled = False
  mnuCreateDirectory.Enabled = False
  mnuDeleteDirectory.Enabled = False
  mnuImportFromM3U.Enabled = False
  mnuSaveToM3U.Enabled = False
  
  mnuChangeFileName.Enabled = False
  mnuInsert.Enabled = False
  mnuInsertAll.Enabled = False
  mnurRetrieveAPE.Enabled = False
  mnurRetrieveID3v1.Enabled = False
  mnurRetrieveID3v2.Enabled = False
  mnurRetrieveWMP.Enabled = False
  mnuResult.Enabled = False
    
  tbrBroswer.Enabled = False
  tbrPlayer.Enabled = False
  tbrDefault.Enabled = False
  tbrBroswer.Enabled = False
  tbrSearch.Enabled = False
  
  If mnuFloatWindow.Checked Then
    ffmBacket.Visible = False
  End If
  
  'uifCopying.CopyFile PlayListInfo, stbDefault.Panels(3).Text, mnuDeleteBefore.Checked
  UpdateList
  
  uifCopying.CopyFile RootListFolder, Left(stbDefault.Panels(3).Text, 3), mnuDeleteBefore.Checked
  
'  '�ָ�����
'  Copying = False
'  picCopy.Visible = False
'  picCopy.ZOrder 1
'  hspMain.Visible = True
'  hspMain.ZOrder 0
'  picDisk.Visible = True
'  Form_Resize
'  ShowProgress False, ""
  If mnuFloatWindow.Checked Then
    ffmBacket.Visible = True
  End If
  
  stbDefault.Enabled = True
End Sub

Public Sub mnuCopyLyrics_Click()
  '���Ƹ��
  mnuCopyLyrics.Checked = Not mnuCopyLyrics.Checked
  tbrDefault.Buttons(3).value = Abs(mnuCopyLyrics.Checked)
  RecalcSize True
  RefreshChart
End Sub

Private Sub mnuCopyMusicInfo_Click()
  '���Ƹ�����Ϣ��������
  Dim MSG As String
  Dim LI As MSComctlLib.ListItem
  
  ShowProgress True, "���ڸ�����Ϣ...", False
  Me.MousePointer = 11
  
  MSG = "���" & vbTab
  MSG = MSG & "�ļ���" & vbTab
  MSG = MSG & "������" & vbTab
  MSG = MSG & "��������" & vbTab
  MSG = MSG & "ר��" & vbTab
  MSG = MSG & "����" & vbTab
  MSG = MSG & "����" & vbTab
  MSG = MSG & "����" & vbTab
  MSG = MSG & "���" & vbTab
  MSG = MSG & "��С" & vbTab
  MSG = MSG & "����ʱ��" & vbCrLf

  For i = 1 To lvwList.ListItems.Count
    Set LI = lvwList.ListItems(i)
    
    MSG = MSG & LI.Text & vbTab
    MSG = MSG & LI.SubItems(3) & vbTab
    MSG = MSG & LI.SubItems(4) & vbTab
    MSG = MSG & LI.SubItems(5) & vbTab
    MSG = MSG & LI.SubItems(6) & vbTab
    MSG = MSG & LI.SubItems(7) & vbTab
    MSG = MSG & LI.SubItems(8) & vbTab
    MSG = MSG & LI.SubItems(9) & vbTab
    MSG = MSG & LI.SubItems(10) & vbTab
    MSG = MSG & LI.SubItems(11) & vbTab
    MSG = MSG & LI.SubItems(12) & vbCrLf
  Next i
  
  Clipboard.Clear
  Clipboard.SetText MSG, vbCFText
  
  ShowProgress False, ""
  Me.MousePointer = 0
End Sub

Private Sub mnuCreateAlbum_Click()
  PS_AutoFolderIndex = 2
  PS_AutoFolderTree = True
  SwitchAutoFolder
End Sub

Private Sub mnuCreateArtist_Click()
  PS_AutoFolderIndex = 1
  PS_AutoFolderTree = True
  SwitchAutoFolder
End Sub

Private Sub mnuCreateDirectory_Click()
  '�򿪴���Ŀ¼�Ի���
  dlgAddFavFolder.ShowDialog oCurFav.Key
End Sub

Private Sub mnuCreateFolder_Click()
  '�����ļ���
  Dim sSubFolder As String
  Dim nNode As MSComctlLib.Node
  Dim nListInfo As MP3PA.ListFolder
  
InputFolderName:
  sSubFolder = InputBox("������Ҫ���������ļ��е�����", Me.Caption)
  
  If Len(sSubFolder) = 0 Then
    Exit Sub
  End If
  
  If Not IsFileName(sSubFolder) Then
    '����Ķ��ļ�������
    MsgBox "������ġ� " & sSubFolder & "������һ���Ϸ���Ŀ¼���ơ�", vbInformation, Me.Caption
    GoTo InputFolderName
    Exit Sub
  End If
  
  If CurrentListFolder.SubFolders.Exist(sSubFolder) Then
    '�ļ����Ѿ�����
    MsgBox "������ġ����ļ����Ѿ����ڡ�", vbInformation, Me.Caption
    GoTo InputFolderName
    Exit Sub
  End If
  
  '��ʼ����ļ���
  Set nListInfo = CurrentListFolder.SubFolders.Add(CurrentListFolder, sSubFolder)
  Set nNode = tvwList.Nodes.Add(tvwList.selectedItem.Index, tvwChild, , sSubFolder, 3)
  nNode.SelectedImage = 4
  nNode.Selected = True
  nNode.Sorted = True
  Set nNode.tag = nListInfo
  tvwList_NodeClick nNode
End Sub

Private Sub mnuCreateGenre_Click()
  PS_AutoFolderIndex = 4
  PS_AutoFolderTree = True
  SwitchAutoFolder
End Sub

Private Sub mnuCreateModify_Click()
  PS_AutoFolderIndex = 3
  PS_AutoFolderTree = True
  SwitchAutoFolder
End Sub

Private Sub mnuCreateNo_Click()
  PS_AutoFolderIndex = 0
  PS_AutoFolderTree = False
  SwitchAutoFolder
End Sub

Private Sub mnuDelete_Click()
  '���б���ɾ��ָ�����ļ�
  i = 1
  
  Do Until i > lvwList.ListItems.Count
    If lvwList.ListItems(i).Selected = True Then
      lvwList.ListItems.Remove i
      PlayListInfo.Remove i
    Else
      i = i + 1
    End If
  Loop
  
  For i = 1 To lvwList.ListItems.Count
    lvwList.ListItems(i).Text = i
    PlayListInfo(i).Index = i
  Next i
  
  UpdateListKeys
  RecalcSize
  RefreshChart
End Sub


Public Sub mnuDeleteAll_Click()
  Set PlayListInfo = New VBA.Collection
  Set PlayListKeys = New VBA.Collection
  lvwList.ListItems.Clear
  RecalcSize
  RefreshChart
End Sub

Private Sub mnuDeleteAllFavourite_Click()
  'ȫ��ɾ��
  Set oCurFav.FavouriteItems = New MP3PA.FAVItems
  lvwFavourite.ListItems.Clear
End Sub

Public Sub mnuDeleteBefore_Click()
  '�ж��ܷ����
  tbrDefault.Buttons(2).value = Abs(mnuDeleteBefore.Checked)

  If (mnuDeleteBefore.Checked) Then
    If Not CheckDiskSize(SpaceTotal - SpaceFact) Then Exit Sub
  End If
  
  mnuDeleteBefore.Checked = Not mnuDeleteBefore.Checked
  tbrDefault.Buttons(2).value = Abs(mnuDeleteBefore.Checked)
  SpaceUsed = IIf(mnuDeleteBefore.Checked, 0, SpaceFact)
  RecalcSize
  RefreshChart
End Sub

Private Sub mnuDeleteDirectory_Click()
  'ɾ���ղؼ�Ŀ¼
  Dim oPFF As MP3PA.FAVFolder
  Dim oPND As MSComctlLib.Node
  
  If tvwFavourite.selectedItem.Parent Is Nothing Then
    '����ɾ����Ŀ¼
    MsgBox "������ɾ���ղؼеĸ�Ŀ¼��", vbCritical
    Exit Sub
  ElseIf MsgBox("���Ƿ�Ҫɾ���ղؼС�" & FS.GetFileName(oCurFav.Key) & "����", vbQuestion + vbDefaultButton2 + vbYesNo) = vbNo Then
    Exit Sub
  End If
  
  Set oPND = tvwFavourite.selectedItem.Parent
  Set oPFF = oFavCol(oPND.Key)
  
  'ɾ��
  tvwFavourite.Nodes.Remove oCurFav.Key
  oPFF.FavouriteSubFolders.Remove oCurFav.Key
  oFavCol.Remove oCurFav.Key
  Set oCurFav = Nothing
  
  'ˢ��
  tvwFavourite_NodeClick tvwFavourite.selectedItem
End Sub

Private Sub mnuDeleteFolder_Click()
  'ɾ���ļ���
  Dim nNode As MSComctlLib.Node
  
  Set nNode = tvwList.selectedItem
  
  '��ʾ��Ϣ
  If nNode.Key = "ROOT" Then MsgBox "������ɾ�����ļ��С�", vbExclamation, Me.Caption: Exit Sub
  If MsgBox("���Ƿ�Ҫɾ���ļ��С�" & nNode.Text & "���µ��������ݣ�", vbYesNo + vbQuestion, Me.Caption) = vbNo Then Exit Sub
  
  nNode.tag.ClearAllFileSize
  CurrentListFolder.ParentFolder.SubFolders.Remove CurrentListFolder.FolderName
  
  '��ʼɾ���ļ���
  Set nNode.tag = Nothing
  nNode.tag = Empty
  
  If nNode.Next Is Nothing Then
    'Set CurrentListFolder = nNode.Parent.Tag
    nNode.Parent.Selected = True
    tvwList_NodeClick tvwList.selectedItem
    tvwList.Nodes.Remove nNode.Index
  Else
    'Set CurrentListFolder = nNode.Next.Tag
    nNode.Next.Selected = True
    tvwList_NodeClick tvwList.selectedItem
    tvwList.Nodes.Remove nNode.Index
  End If
  
  RecalcSize
  RefreshChart
End Sub

Private Sub mnuDeleteFromFavourite_Click()
  'ɾ����Ŀ
  Dim sKey As String
  Dim sSpc As String
  Dim sTmp As String
  
  i = 1
  
  Do Until i > lvwFavourite.ListItems.Count
    '���ѡ���˾�ɾ��
    If lvwFavourite.ListItems(i).Selected Then
      sKey = lvwFavourite.ListItems(i).Key
      lvwFavourite.ListItems.Remove i
      oCurFav.FavouriteItems.Remove sKey
    Else
      i = i + 1
    End If
  Loop
  
  '������������
  sSpc = Space(Len(CStr(lvwFavourite.ListItems.Count)))
  
  For i = 1 To lvwFavourite.ListItems.Count
    sTmp = i
    RSet sSpc = sTmp
    lvwFavourite.ListItems(i).Text = sSpc
  Next i
End Sub

Private Sub mnuDisk_Click()
  mnuDisk.Checked = Not mnuDisk.Checked
  picDisk.Visible = mnuDisk.Checked
  Form_Resize
End Sub

Private Sub mnuDonation_Click()
  frmAbout.ShowDonation
End Sub

Private Sub mnuDown_Click()
  '�ƶ���һ��
  If lvwList.ListItems.Count < 2 Then Exit Sub
  If lvwList.ListItems.Item(PlayListInfo.Count).Selected Then Exit Sub
  MoveItems 1
End Sub

Private Sub mnuEmail_Click()
  SHWriteEmail "chenminglong21cn@21cn.com", "�� MP3 Player Assistant �����ߵ�һ����"
End Sub

Private Sub mnuExit_Click()
  Unload Me
End Sub

Private Sub mnuFavourite_Click()
  Set tbsFileBrowser.selectedItem = tbsFileBrowser.Tabs(3)
  tbsFileBrowser_Click
End Sub

Private Sub mnuFilter_Click()
  dlgSelFilter.Show 1
End Sub

Public Sub mnuFloatWindow_Click()
  '��ʾ������������
  mnuFloatWindow.Checked = Not mnuFloatWindow.Checked
  ffmBacket.UpdateWindow mnuFloatWindow.Checked
End Sub

Private Sub mnuFullRow_Click()
  mnuFullRow.Checked = Not mnuFullRow.Checked
  ActiveLVW.FullRowSelect = mnuFullRow.Checked
End Sub

Private Sub mnuGeneralToolbar_Click()
  mnuGeneralToolbar.Checked = Not mnuGeneralToolbar.Checked
  tbrDefault.Visible = mnuGeneralToolbar.Checked
  tbrDefault.Top = 0
End Sub

Private Sub mnuGrid_Click()
  mnuGrid.Checked = Not mnuGrid.Checked
  ActiveLVW.GridLines = mnuGrid.Checked
End Sub

Private Sub mnuHomePage_Click()
  SHOpenLink "http://www.paqckt.com/flydragon/mp3pa/", Me.hWnd
End Sub

Private Sub mnuHotSelect_Click()
  mnuHotSelect.Checked = Not mnuHotSelect.Checked
  ActiveLVW.HotTracking = mnuHotSelect.Checked
End Sub

Private Sub mnuImportFromM3U_Click()
  '�򿪲����б�
  Dim FN As String
  Dim FIS As VBA.Collection
  Dim TotalSize As Double
  Dim FreeSize As Double
  Dim MSG As String
  Dim OverSpace As Boolean
  
  With CDG
    Err.Clear
    .CancelError = True
    .DialogTitle = "���ز����б�"
    .Filter = "M3U - MP3 �����б�|*.m3u|M3U - ��ǿ�� MP3 �����б�|*.m3u|PLS - Winamp �����б�|*.pls|FPL - Foobar2000 �����б�|*.fpl|CUE - ���ӽ�Ŀ�ݲ������|*.cue|M3U8 - MP3 �����б�(UTF-8 ����)|*.m3u8|WPL - Windows Media Player �����б�|*.wpl|ASX - Windows Media Player ��Ƶ��ݷ�ʽ|*.asx"
    .Flags = cdlOFNExplorer Or cdlOFNFileMustExist Or cdlOFNHideReadOnly Or cdlOFNLongNames
    On Error GoTo EndSub
    .ShowOpen
    On Error GoTo 0
    
    FN = .FileName
  End With
  
  '�����ļ�
  Me.MousePointer = 11
  ShowProgress True, "���ڶ�ȡ�ļ�...", False
  DoEvents
  
  Select Case UCase(FS.GetExtensionName(FN))
  Case "M3U": Set FIS = PlaylistReader.M3U_GetItems(FN)
  Case "PLS": Set FIS = PlaylistReader.PLS_GetItems(FN)
  Case "CUE": Set FIS = PlaylistReader.CUE_GetItems(FN)
  Case "M3U8": Set FIS = PlaylistReader.M3U8_GetItems(FN)
  Case "WPL": Set FIS = PlaylistReader.WPL_GetItems(FN, ffmVideo.WMP)
  Case "ASX": Set FIS = PlaylistReader.ASX_GetItems(FN, ffmVideo.WMP)
  Case "FPL"
    '��ȡ FPL �ļ�
    If PlaylistReader.ReadFplInfo(FN) Then
      Set FIS = New VBA.Collection
      
      For i = 1 To PlaylistReader.FplListCount
        FIS.Add PlaylistReader.GetFplInfoItem(i).FileName
      Next i
    End If
  Case Else
    Me.MousePointer = 0
    ShowProgress False, ""
  End Select
  
  '��ӵ��ղؼ�
  dlgAddFavourite.ShowAddFavourite FIS, oCurFav.Key, False
EndSub:
End Sub

Private Sub mnuIndex_Click()
  MsgBox "�����ļ����������С�"
End Sub

Private Sub mnuInsert_Click()
  Dim nItems As New VBA.Collection
  Dim oLVW As MSComctlLib.ListView
  
  'ȷ����ǰ����б�
  Select Case ActivePage
  Case 1, 2: Set oLVW = lvwFile
  Case 3: Set oLVW = lvwFavourite
  Case 4: Set oLVW = lvwProgram
  End Select
  
  '�����ѡ��Ŀ
  For i = 1 To oLVW.ListItems.Count
    If oLVW.ListItems(i).Selected Then
      nItems.Add i
    End If
  Next i
  
  '׼����ӵ��ļ�
  If lvwList.selectedItem Is Nothing Then
    Call AddFileItems(nItems)
  Else
    Call AddFileItems(nItems, lvwList.selectedItem.Index)
  End If
End Sub

Private Sub mnuInsertAll_Click()
  Dim nItems As New VBA.Collection
  Dim oLVW As MSComctlLib.ListView
  
  'ȷ����ǰ����б�
  Select Case ActivePage
  Case 1, 2: Set oLVW = lvwFile
  Case 3: Set oLVW = lvwFavourite
  Case 4: Set oLVW = lvwProgram
  End Select
  
  '���������Ŀ
  For i = 1 To oLVW.ListItems.Count
    nItems.Add i
  Next i
  
  '׼����ӵ��ļ�
  If lvwList.selectedItem Is Nothing Then
    Call AddFileItems(nItems)
  Else
    Call AddFileItems(nItems, lvwList.selectedItem.Index)
  End If
End Sub

Private Sub mnuLargeIcon_Click()
  lvwFile.View = lvwIcon
  mnuLargeIcon.Checked = True
  mnuSmallIcon.Checked = False
  mnuList.Checked = False
  mnuReport.Checked = False
End Sub

Private Sub mnuList_Click()
  lvwFile.View = lvwList
  mnuLargeIcon.Checked = False
  mnuSmallIcon.Checked = False
  mnuList.Checked = True
  mnuReport.Checked = False
End Sub

Private Sub mnuListFolder_Click()
  mnuListFolder.Checked = Not mnuListFolder.Checked
  tbrList.Buttons(1).value = Abs(mnuListFolder.Checked)
  If mnuListFolder.Checked Then vspFileList.Hide = ShowAll Else vspFileList.Hide = ShowPart2
End Sub

Public Sub mnuLoad_Click()
  '�򿪲����б�
  Dim FN As String
  Dim FIS As VBA.Collection
  Dim TotalSize As Double
  Dim FreeSize As Double
  Dim MSG As String
  Dim OverSpace As Boolean
  
  With CDG
    Err.Clear
    .CancelError = True
    .DialogTitle = "���ز����б�"
    .Filter = "M3U - MP3 �����б�|*.m3u|M3U - ��ǿ�� MP3 �����б�|*.m3u|PLS - Winamp �����б�|*.pls|FPL - Foobar2000 �����б�|*.fpl|CUE - ���ӽ�Ŀ�ݲ������|*.cue|M3U8 - MP3 �����б�(UTF-8 ����)|*.m3u8|WPL - Windows Media Player �����б�|*.wpl|ASX - Windows Media Player ��Ƶ��ݷ�ʽ|*.asx|TTBL - ǧǧ�����Ĳ����б�|*.ttbl"
    .Flags = cdlOFNExplorer Or cdlOFNFileMustExist Or cdlOFNHideReadOnly Or cdlOFNLongNames
    On Error GoTo EndSub
    .ShowOpen
    On Error GoTo 0
    
    FN = .FileName
  End With
  
  '�����ļ�
  Me.MousePointer = 11
  ShowProgress True, "���ڶ�ȡ�ļ�...", False
  DoEvents
  
  Select Case UCase(FS.GetExtensionName(FN))
  Case "M3U": Set FIS = PlaylistReader.M3U_GetItems(FN)
  Case "PLS": Set FIS = PlaylistReader.PLS_GetItems(FN)
  Case "CUE": Set FIS = PlaylistReader.CUE_GetItems(FN)
  Case "M3U8": Set FIS = PlaylistReader.M3U8_GetItems(FN)
  Case "WPL": Set FIS = PlaylistReader.WPL_GetItems(FN, ffmVideo.WMP)
  Case "ASX": Set FIS = PlaylistReader.ASX_GetItems(FN, ffmVideo.WMP)
  Case "FPL"
    '��ȡ FPL �ļ�
    If PlaylistReader.ReadFplInfo(FN) Then
      Set FIS = New VBA.Collection
      
      For i = 1 To PlaylistReader.FplListCount
        FN = PlaylistReader.GetFplInfoItem(i).FileName
        
        If InStr(1, FN, "file://", vbTextCompare) = 1 Then
          FN = Right(FN, Len(FN) - 7)
          FIS.Add FN
        End If
      Next i
    End If
  Case "TTBL"
    '��ȡǧǧ�������б�
    If Len(PlaylistReader.ReadTTPLInfo(FN)) Then
      Set FIS = New VBA.Collection
      
      For i = 1 To PlaylistReader.M3UListCount
        FN = PlaylistReader.GetM3UInfoItem(i).FileName
        FIS.Add FN
      Next i
    End If
  Case Else
    Me.MousePointer = 0
    ShowProgress False, ""
    Exit Sub
  End Select
  
  '����ļ���С
  ShowProgress True, "���ڼ����С...", False
  
  i = 1
  FreeSize = SpaceTotal - SpaceUsed - SpaceAdded
  MSG = "û���㹻�Ŀռ���������ļ����Ƿ������" & vbCrLf
  
  Do Until i = FIS.Count + 1
    If FS.FileExists(FIS(i)) Then
      TotalSize = TotalSize + FileLen(FIS(i))
      
      If TotalSize > FreeSize Then
        MSG = MSG & vbCrLf & FIS(i)
        FIS.Remove i
        OverSpace = True
      Else
        i = i + 1
      End If
    Else
      FIS.Remove i
    End If
  Loop
  
  '�Ƿ����
  If (OverSpace) Then
    If MsgBox(MSG, vbQuestion + vbYesNo) = vbNo Then
      Exit Sub
    End If
  End If
  
  '����ļ�
  AddFile FIS
  
EndSub:
End Sub

Private Sub mnuMoveFirst_Click()
  Dim pos As Long
  
  '�ƶ�����ǰ
  If lvwList.ListItems.Count < 2 Then Exit Sub
  If lvwList.ListItems.Item(1).Selected Then Exit Sub
  
  '����ѡ����ʼ����Ŀ
  For i = 1 To lvwList.ListItems.Count
    If lvwList.ListItems(i).Selected Then
      pos = -i + 1
      MoveItems pos
      Exit For
    End If
  Next i
End Sub

Private Sub mnuMoveLast_Click()
  Dim pos As Long
  Dim LastIndex As Long
  
  '�ƶ������
  LastIndex = PlayListInfo.Count
  
  If LastIndex < 2 Then Exit Sub
  If lvwList.ListItems.Item(LastIndex).Selected Then Exit Sub
  
  '����ѡ����ʼ����Ŀ
  For i = LastIndex To 1 Step -1
    If lvwList.ListItems(i).Selected Then
      pos = LastIndex - i
      MoveItems pos
      Exit For
    End If
  Next i
End Sub

Private Sub mnuMoveToDirectory_Click()
  '�ƶ���Ŀ¼
  Dim sRtnFK As String
  Dim oFIS As MP3PA.FAVItems
  Dim oFI As MP3PA.FAVItem
  Dim oFIORI As MP3PA.FAVItem
  Dim oSelCol As New VBA.Collection
  Dim sFileName As String
  
  If dlgChooseFav.GetFavouriteDirectory(sRtnFK, oCurFav.Key) Then
    If sRtnFK = oCurFav.Key Then Exit Sub
    
    Set oFIS = oFavCol(sRtnFK).FavouriteItems
    
    For i = 1 To lvwFavourite.ListItems.Count
      If lvwFavourite.ListItems(i).Selected Then
        '��ӵ��µļ�����
        sFileName = lvwFavourite.ListItems(i).Key
        
        If Not oFIS.Exist(sFileName) Then
          '��Ҫ���
          Set oFI = oFIS.Add(sFileName, sFileName)
          Set oFIORI = oCurFav.FavouriteItems(sFileName)
          
          '��������
          oFI.Album = oFIORI.Album
          oFI.Artist = oFIORI.Artist
          oFI.Comment = oFIORI.Comment
          oFI.Duration = oFIORI.Duration
          oFI.FileName = oFIORI.FileName
          oFI.Genre = oFIORI.Genre
          oFI.Key = oFIORI.Key
          oFI.Title = oFIORI.Title
          oFI.Track = oFIORI.Track
          oFI.Year = oFIORI.Year
        End If
        
        'ɾ��
        oCurFav.FavouriteItems.Remove sFileName
        
        '���Ҫѡ��
        oSelCol.Add sFileName
      End If
    Next i
    
    'ˢ��
    tvwFavourite.Nodes(sRtnFK).Selected = True
    tvwFavourite_NodeClick tvwFavourite.selectedItem
    
    'ѡ����Ŀ
    For i = 1 To oSelCol.Count
      lvwFavourite.ListItems(oSelCol(i)).Selected = True
    Next i
    
    If Not lvwFavourite.selectedItem Is Nothing Then
      lvwFavourite.selectedItem.EnsureVisible
    End If
  End If
End Sub

Private Sub mnuMyComputer_Click()
  tbsFileBrowser.Tabs(1).Selected = True
  tbsFileBrowser_Click
End Sub

Private Sub mnuMyDocuments_Click()
  Set tbsFileBrowser.selectedItem = tbsFileBrowser.Tabs(2)
  tbsFileBrowser_Click
End Sub

Private Sub mnuOpen_Click()
  Dim sPath As String
  
  Select Case Me.ActiveControl.Name
  Case "lvwProgram"
    If Not Me.ActiveControl.selectedItem Is Nothing Then
      If FS.FileExists(Me.ActiveControl.selectedItem.tag) Then
        sPath = lvwProgram.selectedItem.tag
      End If
    End If
  Case "lvwFavourite"
    If Not lvwFavourite.selectedItem Is Nothing Then
      If FS.FileExists(lvwFavourite.selectedItem.Key) Then
        sPath = lvwFavourite.selectedItem.Key
      End If
    End If
  Case "lvwList"
    If Not lvwList.selectedItem Is Nothing Then
      If FS.FileExists(PlayListInfo(lvwList.selectedItem.Index).FileName) Then
        sPath = PlayListInfo(lvwList.selectedItem.Index).FileName
      End If
    End If
  Case "lvwFile"
    If Not lvwFile.selectedItem Is Nothing Then
      If FS.FileExists(lvwFile.selectedItem.ListSubItems(1).tag) Then
        sPath = lvwFile.selectedItem.ListSubItems(1).tag
      End If
    End If
  End Select
  
  If Len(sPath) Then
    ShellOpera.shelldoc sPath
  End If
End Sub

Private Sub mnuOption_Click()
  dlgOption.ShowPage 1
End Sub

Private Sub mnuOrderRandomSelection_Click()
  Dim nSelItems As New VBA.Collection
  
  For i = 1 To lvwList.ListItems.Count
    If lvwList.ListItems(i).Selected Then
      nSelItems.Add i
    End If
  Next i
  
  SortListRandom nSelItems
End Sub

Private Sub mnuOrderSelection_Click()
  Load dlgSelSortKey
  dlgSelSortKey.chkOrderSelection.value = 1
  dlgSelSortKey.Show 1
End Sub

Public Sub mnuPause_Click()
  '��ͣ
  If Not picProgress.Visible Then
    If ffmVideo.WMP.playState = wmppsPaused Then
      stbDefault.Panels(2).Text = "(���ڲ��� " & ffmVideo.WMP.Controls.currentPositionString & _
                                "/" & oPlayerMedia.durationString & ")" & sMsg
      'stbDefault.Panels(2).Width = stbDefault.Panels(2).Width + 240
      tmrPlayer.Enabled = True
      ffmVideo.WMP.Controls.play
    ElseIf ffmVideo.WMP.playState = wmppsPlaying Then
      stbDefault.Panels(2).Text = "(��ͣ " & ffmVideo.WMP.Controls.currentPositionString & _
                                "/" & oPlayerMedia.durationString & ")" & sMsg
      'stbDefault.Panels(2).Width = stbDefault.Panels(2).Width + 240
      tmrPlayer.Enabled = False
      ffmVideo.WMP.Controls.pause
    End If
  End If
End Sub

Private Sub mnuPlayBrowser_Click()
  '�����ļ�
  Dim sFileName As String
  
  Select Case ActivePage
  Case 1, 2
    If Not lvwFile.selectedItem Is Nothing Then
      sFileName = lvwFile.selectedItem.ListSubItems(1).tag
    Else
      Exit Sub
    End If
  Case 3
    If Not lvwFavourite.selectedItem Is Nothing Then
      sFileName = lvwFavourite.selectedItem.Key
    Else
      Exit Sub
    End If
  Case 4
    If Not lvwProgram.selectedItem Is Nothing Then
      sFileName = lvwProgram.selectedItem.tag
      
      If Not FS.FileExists(sFileName) Then Exit Sub
    Else
      Exit Sub
    End If
  End Select
  
  PlayMusicFile sFileName
End Sub

Private Sub mnuPlayList_Click()
  '����
  If lvwList.selectedItem Is Nothing Then Exit Sub
  PlayMusicFile PlayListInfo(lvwList.selectedItem.Index).FileName
End Sub

Private Sub mnuPlayToolbar_Click()
  mnuPlayToolbar.Checked = Not mnuPlayToolbar.Checked
  tbrPlayer.Visible = mnuPlayToolbar.Checked
  tbrPlayer.Top = 1050
End Sub

Private Sub mnuPreviousLevel_Click()
  '����һ��
  If Not CurrentListFolder.ParentFolder Is Nothing Then
    tvwList.selectedItem.Parent.Selected = True
    tvwList_NodeClick tvwList.selectedItem
  End If
End Sub

Private Sub mnuProperty_Click()
  '�����Դ���
  Dim sPath As String
  
  Select Case Me.ActiveControl.Name
  Case "tvwFolder", "tvwMydoc"
    '������
    If FS.FolderExists(Me.ActiveControl.selectedItem.Key) Then
      SHShowProperty Me.ActiveControl.selectedItem.Key, Me.hWnd
    End If
    Exit Sub
  Case "lvwProgram"
    If Not Me.ActiveControl.selectedItem Is Nothing Then
      If FS.FileExists(Me.ActiveControl.selectedItem.tag) Then
        sPath = lvwProgram.selectedItem.tag
      End If
    End If
  Case "lvwFavourite"
    If Not Me.ActiveControl.selectedItem Is Nothing Then
      If FS.FileExists(lvwFavourite.selectedItem.Key) Then
        sPath = lvwFavourite.selectedItem.Key
      End If
    End If
  Case "lvwList"
    If Not lvwList.selectedItem Is Nothing Then
      If FS.FileExists(PlayListInfo(lvwList.selectedItem.Index).FileName) Then
        sPath = PlayListInfo(lvwList.selectedItem.Index).FileName
      End If
    End If
  Case "lvwFile"
    If Not lvwFile.selectedItem Is Nothing Then
      If FS.FileExists(lvwFile.selectedItem.ListSubItems(1).tag) Then
        sPath = lvwFile.selectedItem.ListSubItems(1).tag
      End If
    End If
  End Select
  
  '����� MP3 �ļ��͵����ڲ��Ի���
  If Len(sPath) Then
'    If UCase(FS.GetExtensionName(sPath)) = "MP3" Then
      dlgProperty.ShowPropery sPath
'    Else
'      DiskInfo.SHShowProperty sPath, 0
'    End If
  End If
End Sub

Private Sub mnuRenameFolder_Click()
  '�������ļ���
  Dim sSubFolder As String
  Dim sOldName As String
  Dim nNode As MSComctlLib.Node
  Dim nParentFolder As MP3PA.ListFolder
  Dim nNewFolder As MP3PA.ListFolder
  
  If CurrentListFolder Is RootListFolder Then
    MsgBox "�����ܸ��ĸ�Ŀ¼�����֡�", vbInformation, Me.Caption
    Exit Sub
  End If

InputFolderName:
  sOldName = CurrentListFolder.FolderName
  sSubFolder = InputBox("�����롰" & sOldName & "���ļ��е�������", Me.Caption)
  
  If (Len(sSubFolder) = 0) Or (sOldName = sSubFolder) Then
    Exit Sub
  End If
  
  If Not IsFileName(sSubFolder) Then
    '����Ķ��ļ�������
    MsgBox "������ġ� " & sSubFolder & "������һ���Ϸ���Ŀ¼���ơ�", vbInformation, Me.Caption
    GoTo InputFolderName
    Exit Sub
  End If
  
  If CurrentListFolder.SubFolders.Exist(sSubFolder) Then
    '�ļ����Ѿ�����
    MsgBox "������ġ����ļ����Ѿ����ڡ�", vbInformation, Me.Caption
    GoTo InputFolderName
    Exit Sub
  End If
  
  '��ʼ�����ļ��е�����
  Set nParentFolder = CurrentListFolder.ParentFolder
  Call nParentFolder.SubFolders.Remove(sOldName)
  Set nNewFolder = nParentFolder.SubFolders.Add(nParentFolder, sSubFolder)
   
  '����ԭ���ĵ����ڵ�����
  Set nNewFolder.ListFiles = CurrentListFolder.ListFiles
  Set nNewFolder.SubFolders = CurrentListFolder.SubFolders
  nNewFolder.TotalFileSize = CurrentListFolder.TotalFileSize
  nNewFolder.TotalSize = CurrentListFolder.TotalSize
  
  'Set nNewFolder = CurrentListFolder
  
  '������������
  tvwList.selectedItem.Text = sSubFolder
End Sub

Private Sub mnuReport_Click()
  lvwFile.View = 3
  mnuLargeIcon.Checked = False
  mnuSmallIcon.Checked = False
  mnuList.Checked = False
  mnuReport.Checked = True
End Sub

Private Sub mnuReportBUG_Click()
  SHWriteEmail "chenminglong21cn@21cn.com", "���� MP3 Player Assistant �� BUG"
End Sub

Private Sub mnuResult_Click()
  mnuResult.Checked = Not mnuResult.Checked
  tbrSearch.Buttons(1).value = Abs(mnuResult.Checked)
  ffmSearch.ShowWindow mnuResult.Checked
End Sub

Private Sub mnurRetrieveAPE_Click()
  RetrieveTag oReaderAPETAG
End Sub

Private Sub mnurRetrieveID3v1_Click()
  Me.RetrieveTag oReaderID3v1
End Sub

Private Sub mnurRetrieveID3v2_Click()
  RetrieveTag oReaderID3v2
End Sub

Private Sub mnurRetrieveWMP_Click()
  RetrieveTag oReaderWMPTAG
End Sub

Private Sub mnuSave_Click()
  '���沥���б�
  With CDG
    .CancelError = True
    .DefaultExt = "M3U"
    .DialogTitle = "���б���Ϊ�����б�"
    .Filter = "M3U - MP3 �����嵥|*.m3u"
    .Flags = cdlOFNExplorer Or cdlOFNExtensionDifferent Or cdlOFNHideReadOnly Or cdlOFNLongNames Or cdlOFNNoDereferenceLinks Or cdlOFNNoReadOnlyReturn Or cdlOFNNoValidate Or cdlOFNOverwritePrompt
    On Error GoTo ExitSub
    .ShowSave
    On Error GoTo 0
  End With
  
  'д���ļ�
  Dim F As Integer
  
  On Error GoTo happeneanerror
  F = FreeFile
  Open CDG.FileName For Output Access Write As F
  
  For i = 1 To PlayListInfo.Count
    Print #F, PlayListInfo(i).FileName
  Next i
  
  Close #F
  On Error GoTo 0
  
  Exit Sub
happeneanerror:
  MsgBox "[" & Err.Number & "]" & Err.Description, vbCritical
ExitSub:
End Sub

Private Sub mnuSaveToM3U_Click()
  '���沥���б�
  With CDG
    .CancelError = True
    .DefaultExt = "M3U"
    .DialogTitle = "���б���Ϊ�����б�"
    .Filter = "M3U - MP3 �����嵥|*.m3u"
    .Flags = cdlOFNExplorer Or cdlOFNExtensionDifferent Or cdlOFNHideReadOnly Or cdlOFNLongNames Or cdlOFNNoDereferenceLinks Or cdlOFNNoReadOnlyReturn Or cdlOFNNoValidate Or cdlOFNOverwritePrompt
    On Error GoTo ExitSub
    .ShowSave
    On Error GoTo 0
  End With
  
  'д���ļ�
  Dim F As Integer
  
  On Error GoTo happeneanerror
  F = FreeFile
  Open CDG.FileName For Output Access Write As F
  
  For i = 1 To oCurFav.FavouriteItems.Count
    Print #F, oCurFav.FavouriteItems(i).FileName
  Next i
  
  Close #F
  On Error GoTo 0
  
  Exit Sub
happeneanerror:
  MsgBox "[" & Err.Number & "]" & Err.Description, vbCritical
ExitSub:

End Sub

Private Sub mnuSelDestination_Click()
  dlgSelDestDir.Show 1
End Sub

Private Sub mnuSelectFolder_Click()
  tbrBroswer_ButtonClick tbrBroswer.Buttons(2)
End Sub

Private Sub mnuSelectMP3_Click()
  dlgSelectPlayer.bStarting = False
  dlgSelectPlayer.Show 1
End Sub

Private Sub mnuSerachHelp_Click()
   General.CallHelp Me.hWnd, , HH_DISPLAY_SEARCH
End Sub

Private Sub mnuSmallIcon_Click()
  lvwFile.View = lvwSmallIcon
  mnuLargeIcon.Checked = False
  mnuSmallIcon.Checked = True
  mnuList.Checked = False
  mnuReport.Checked = False
End Sub

Private Sub mnuSort_Click()
  dlgSelSortKey.Show 1
End Sub

Private Sub mnuSortRandom_Click()
  SortListRandom
End Sub

Private Sub mnuStatusBar_Click()
  mnuStatusBar.Checked = Not mnuStatusBar.Checked
  stbDefault.Visible = mnuStatusBar.Checked
End Sub

Public Sub mnuStop_Click()
  Me.MousePointer = 11
  ffmVideo.WMP.Controls.stop
  Me.MousePointer = 0
  stbDefault.Panels(2).Text = "(ֹͣ)"
  'stbDefault.Panels(2).Width = stbDefault.Panels(2).Width + 240
  mnuStop.Enabled = False
  mnuPause.Enabled = False
  tbrPlayer.Buttons(3).Enabled = False
  tbrPlayer.Buttons(4).Enabled = False
  sldPos.Enabled = False
  tmrPlayer.Enabled = False

  '����������
  If ffmSearch.RWLoaded Then
    ffmSearch.tbrSearch.Buttons(18).Enabled = False
    ffmSearch.tbrSearch.Buttons(19).Enabled = False
  End If
  
  If mnuVideo.Checked Then mnuVideo_Click
End Sub

Private Sub mnuTopic_Click()
  CallHelp Me.hWnd
End Sub

Private Sub mnuUp_Click()
  '�ƶ���һ��
  If lvwList.ListItems.Count < 2 Then Exit Sub
  If lvwList.ListItems.Item(1).Selected Then Exit Sub
  MoveItems -1
End Sub

Public Sub mnuVideo_Click()
  mnuVideo.Checked = Not mnuVideo.Checked
  ffmVideo.ShowWindow mnuVideo.Checked
End Sub

Private Sub mnuWebsite_Click()
  SHOpenLink "http://www.paqckt.com/flydragon/", Me.hWnd
End Sub

Private Sub picCopy_Resize()
  If picCopy.tag <> "NORESIZE" Then uifCopying.Move 240, 240, picCopy.ScaleWidth - 480, picCopy.ScaleHeight - 480
End Sub

Private Sub picDisk_Resize()
  '�������ֱ�ǩ��λ��
  cbgDisk.Move 120, 120, 500, picDisk.ScaleHeight - 330
  lblZero.Top = picDisk.ScaleHeight - 345
End Sub

Private Sub picList_Resize()
  Dim X As Long, Y As Long
  Const H As Long = 345
  
  X = picList.ScaleWidth
  Y = picList.ScaleHeight
  
'  picListToolbar.Move 15, 15, W, y - 30
'  lvwList.Move W + 30, 0, x - W - 30, y
'
'  '���Ʊ߿�
'  picList.Cls
'  picList.Line (0, 0)-(W + 15, 0), &H80000014
'  picList.Line (0, 0)-(0, y), &H80000014
'  picList.Line (0, y - 15)-(W + 30, y - 15), &H80000010
'  picList.Line (W + 15, 0)-(W + 15, y - 15), &H80000010
  tbrList.Width = X
  vspFileList.Move 0, H, X, Y - H
End Sub

Private Sub picProgress_Resize()
  pbeDefault.Width = picProgress.ScaleWidth - pbeDefault.Left
End Sub

Private Sub poplfaAdd_Click()
  mnuAdd_Click
End Sub

Private Sub poplfaAddAll_Click()
  mnuAddAll_Click
End Sub

Private Sub poplfAdd_Click()
  mnuAdd_Click
End Sub

Private Sub poplfAddAll_Click()
  mnuAddAll_Click
End Sub

Private Sub poplfAddToFav_Click()
  mnuAddToFavourite_Click
End Sub

Private Sub poplfaDelete_Click()
  mnuDeleteFromFavourite_Click
End Sub

Private Sub poplfaDeleteAll_Click()
  mnuDeleteAllFavourite_Click
End Sub

Private Sub poplfaImport_Click()
  mnuImportFromM3U_Click
End Sub

Private Sub poplfaInsert_Click()
  mnuInsert_Click
End Sub

Private Sub poplfaOpen_Click()
  mnuOpen_Click
End Sub

Private Sub poplfaPlay_Click()
  mnuPlayBrowser_Click
End Sub

Private Sub poplfaProperty_Click()
  mnuProperty_Click
End Sub

Private Sub poplfaSave_Click()
  mnuSaveToM3U_Click
End Sub

Private Sub poplfaSelAll_Click()
  lvwFavourite_KeyDown 65, 2
End Sub

Private Sub poplfInsert_Click()
  mnuInsert_Click
End Sub

Private Sub poplfOpen_Click()
  mnuOpen_Click
End Sub

Private Sub poplfPlay_Click()
  mnuPlayBrowser_Click
End Sub

Private Sub poplfProperty_Click()
  mnuProperty_Click
End Sub

Private Sub poplfSelAll_Click()
  lvwFile_KeyDown 65, 2
End Sub

Private Sub popllAddFav_Click()
  mnuAddToFavourite_Click
End Sub

Private Sub popllDelete_Click()
  mnuDelete_Click
End Sub

Private Sub popllDeleteAll_Click()
  mnuDeleteAll_Click
End Sub

Private Sub popllExport_Click()
  mnuSave_Click
End Sub

Private Sub popllImport_Click()
  mnuLoad_Click
End Sub

Private Sub popllMoveDown_Click()
  mnuDown_Click
End Sub

Private Sub popllMoveFirst_Click()
  mnuMoveFirst_Click
End Sub

Private Sub popllMoveLast_Click()
  mnuMoveLast_Click
End Sub

Private Sub popllMoveUp_Click()
  mnuUp_Click
End Sub

Private Sub popllOpen_Click()
  mnuOpen_Click
End Sub

Private Sub popllPlay_Click()
  mnuPlayList_Click
End Sub

Private Sub popllProperty_Click()
  mnuProperty_Click
End Sub

Private Sub popllRetrieveAPETAG_Click()
  mnurRetrieveAPE_Click
End Sub

Private Sub popllRetrieveID3v1_Click()
  mnurRetrieveID3v1_Click
End Sub

Private Sub popllRetrieveID3v2_Click()
  mnurRetrieveID3v2_Click
End Sub

Private Sub popllRetrieveWMP_Click()
  mnurRetrieveWMP_Click
End Sub

Private Sub popllSort_Click()
  mnuSort_Click
End Sub

Private Sub popllSortRandimSel_Click()
  mnuOrderRandomSelection_Click
End Sub

Private Sub popllSortRandom_Click()
  mnuSortRandom_Click
End Sub

Private Sub popllSortSel_Click()
  mnuOrderSelection_Click
End Sub

Private Sub poptfaCreate_Click()
  mnuCreateDirectory_Click
End Sub

Private Sub poptfaDelete_Click()
  mnuDeleteDirectory_Click
End Sub

Private Sub poptfProperty_Click()
  mnuProperty_Click
End Sub

Private Sub poptlDelete_Click()
  mnuDeleteFolder_Click
End Sub

Private Sub poptlNewFolder_Click()
  mnuCreateFolder_Click
End Sub

Private Sub poptlPrevious_Click()
  mnuPreviousLevel_Click
End Sub

Private Sub poptlRename_Click()
  mnuRenameFolder_Click
End Sub

Private Sub poptpAdd_Click()
  mnuAdd_Click
End Sub

Private Sub poptpAddAll_Click()
  mnuAddAll_Click
End Sub

Private Sub poptpAddFav_Click()
  mnuAddToFavourite_Click
End Sub

Private Sub poptpInsert_Click()
  mnuInsert_Click
End Sub

Private Sub poptpOpen_Click()
  mnuOpen_Click
End Sub

Private Sub poptpOption_Click()
  dlgOption.ShowPage 5
End Sub

Private Sub poptpPlay_Click()
  mnuPlayBrowser_Click
End Sub

Private Sub poptpSelAll_Click()
  lvwProgram_KeyDown 65, 2
End Sub

Private Sub sldPos_Change()
  '�ı�
  If Not bInternal Then
    Me.MousePointer = 11
    ffmVideo.WMP.Controls.currentPosition = sldPos.value
    Me.MousePointer = 0
  End If
End Sub

Private Sub sldPos_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  sldPos.tag = 1
End Sub

Private Sub sldPos_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
  sldPos.tag = 0
End Sub

Private Sub stbDefault_PanelDblClick(ByVal Panel As MSComctlLib.Panel)
  Select Case Panel.Index
  Case 1
    SendKeys "^{A}"
  Case 2
    If (Me.ActiveControl Is lvwList) And (mnuPlayList.Enabled) Then mnuPlayList_Click: Exit Sub
    If mnuPlayBrowser.Enabled Then mnuPlayBrowser_Click: Exit Sub
  Case 3
    dlgSelDestDir.Show 1
  End Select
End Sub

Private Sub tbrBroswer_ButtonClick(ByVal Button As MSComctlLib.Button)
  Dim sPath As String
  Dim LastPath As New VBA.Collection
  Dim ParaPath As String
  
  Select Case Button.Index
  Case 1
    '����
    Select Case ActivePage
    Case 1
      Set tvwFolder.selectedItem = tvwFolder.selectedItem.Parent
      RefreshFile tvwFolder.selectedItem
    Case 2
      Set tvwMydoc.selectedItem = tvwMydoc.selectedItem.Parent
      RefreshFile tvwMydoc.selectedItem
    End Select
  Case 2
    '����ļ�
    sPath = BrowseFolder.BrowseForFolder(Me.hWnd, "����ļ���", icbBrowse.Text)
    
    If Len(sPath) > 0 Then
      icbBrowse.Text = sPath
      tbrBroswer_ButtonClick tbrBroswer.Buttons(4)
      Exit Sub
    End If
  Case 4
    'ת��
    sPath = icbBrowse.Text
    
    If FS.FolderExists(sPath) = False Then
      '�ļ���ί֪��
      MsgBox sPath & vbCrLf & vbCrLf & "�����·����Ч��", vbInformation
      Exit Sub
    End If
    
    '�Զ�����
    If Len(sPath) = 2 Then
      sPath = sPath & "\"
    ElseIf Right(sPath, 1) = "\" Then
      sPath = Left(sPath, Len(sPath) - 1)
    End If
    
    '�Զ���ȡ�Ƿ����ҵ��ĵ�·��
    If sPath = sMyDocPath Then
      tvwMydoc.Nodes(1).EnsureVisible
      DoEvents
      tvwMydoc.Nodes(1).Selected = True
      tbsFileBrowser.Tabs(2).Selected = True
    ElseIf InStr(1, sPath, sMyDocPath) = 1 Then
      '���ҵ��ĵ���
      ParaPath = FS.GetParentFolderName(sPath)
      
      Do Until Len(ParaPath) = Len(sMyDocPath)
        LastPath.Add ParaPath
        ParaPath = FS.GetParentFolderName(ParaPath)
      Loop
      
      For j = LastPath.Count To 1 Step -1
        tvwMydoc.Nodes(LastPath(j)).Expanded = True
        ExpandTree tvwMydoc, tvwMydoc.Nodes(LastPath(j))
      Next j
      
      tvwMydoc.Nodes(sPath).EnsureVisible
      DoEvents
      tvwMydoc.Nodes(sPath).Selected = True
      tbsFileBrowser.Tabs(2).Selected = True
    ElseIf Len(sPath) = 3 Then
      '�����ҵ��ĵ���
      tvwFolder.Nodes(sPath).EnsureVisible
      DoEvents
      tvwFolder.Nodes(sPath).Selected = True
      tbsFileBrowser.Tabs(1).Selected = True
    Else
      ParaPath = FS.GetParentFolderName(sPath)
      
      Do Until Len(ParaPath) = 0
        LastPath.Add ParaPath
        ParaPath = FS.GetParentFolderName(ParaPath)
      Loop
      
      For j = LastPath.Count To 1 Step -1
        tvwFolder.Nodes(LastPath(j)).Expanded = True
      Next j
    
      tvwFolder.Nodes(sPath).EnsureVisible
      DoEvents
      tvwFolder.Nodes(sPath).Selected = True
      tbsFileBrowser.Tabs(1).Selected = True
    End If
  End Select
End Sub

Private Sub tbrDefault_ButtonClick(ByVal Button As MSComctlLib.Button)
  Select Case Button.Index
  Case 1: mnuSelectMP3_Click
  Case 2: mnuDeleteBefore_Click
  Case 3: mnuCopyLyrics_Click
  Case 4: mnuChangeFileName_Click
  Case 5: mnuCopy_Click
  Case 7: mnuAdd_Click
  Case 8: mnuDelete_Click
  Case 9: mnuDeleteAll_Click
  Case 10: mnuProperty_Click
  Case 11: mnuSort_Click
  Case 13: mnuLoad_Click
  Case 14: mnuSave_Click
  Case 16: mnuFilter_Click
  Case 18: frmAbout.ShowDonation
  End Select
End Sub

Public Sub tbrDefault_ButtonMenuClick(ByVal ButtonMenu As MSComctlLib.ButtonMenu)
  Dim CurrentIndex As Long
  Dim CurrentKey As String

  Select Case ButtonMenu.Parent.Key
  Case "FILTER"
    If ButtonMenu.Index > 4 Then
      CurrentIndex = ButtonMenu.Index - 4
      CurrentKey = FilterKey(CurrentIndex)
      CurrentFilter = FilterSet(CurrentIndex)
      
      tbrDefault.Buttons("FILTER").ButtonMenus(1).Text = "��ǰ������: " & vbTab & CurrentFilter
      
      '����˳��
      FilterKey.Remove CurrentIndex
      FilterSet.Remove CurrentIndex
      
      If CurrentIndex > FilterKey.Count Then
        FilterKey.Add CurrentKey, , 1
        FilterSet.Add CurrentFilter, CurrentKey, 1
      Else
        FilterKey.Add CurrentKey, , 1
        FilterSet.Add CurrentFilter, CurrentKey, 1
      End If
      
      'ɾ�������
      For i = 21 To FilterKey.Count
        FilterKey.Remove 21
        FilterSet.Remove 21
      Next i
      
      For i = 1 To FilterKey.Count
        tbrDefault.Buttons("FILTER").ButtonMenus(i + 4).Text = FilterKey(i) & vbTab & FilterSet(i)
      Next i
      
      'ˢ��
      If (frmMain.ActivePage = 1) Or (frmMain.ActivePage = 2) Then
        frmMain.tbsFileBrowser_Click
      End If
    ElseIf ButtonMenu.Index = 3 Then
      dlgOption.ShowPage 2
    ElseIf ButtonMenu.Index = 1 Then
      dlgSelFilter.Show 1
    End If
  Case "SORTLIST"
    If ButtonMenu.Index > 2 Then
      CurrentIndex = ButtonMenu.Index - 2
      CurrentKey = SortKeySet(CurrentIndex)
      SortKeySet.Remove CurrentIndex
      
      If CurrentIndex > SortKeySet.Count Then
        SortKeySet.Add CurrentKey, , 1
      Else
        SortKeySet.Add CurrentKey, , 1
      End If
    
      For i = 1 To SortKeySet.Count
        tbrDefault.Buttons("SORTLIST").ButtonMenus(i + 2).Text = SortKeySet(i)
      Next i
      
      '��ʼ����
      If LastSortKey = CurrentKey Then
        LastAscending = Not LastAscending
        LastSortKey = CurrentKey
        SortList CurrentKey, LastAscending
      Else
        LastSortKey = CurrentKey
        SortList CurrentKey, LastAscending
      End If
    ElseIf ButtonMenu.Index = 1 Then
      dlgOption.ShowPage 3
    End If
  '=============
  Case "RENAME"
    '������
    Select Case ButtonMenu.Index
    Case 1
      mnuChangeFileName_Click
    Case 2, 5
    Case 3
      Call frmMain.SetRenameStatus(Not RenameEnabled)
    Case 4
      Call dlgOption.ShowPage(6)
    Case Else
      RenameCurrent = ButtonMenu.Index - 5
      
      '���û�п�����Ҫ����
      Call frmMain.SetRenameStatus(True)
    End Select
  End Select
End Sub

Private Sub tbrList_ButtonClick(ByVal Button As MSComctlLib.Button)
  Select Case Button.Index
  Case 1: mnuListFolder_Click
  Case 3: mnuPreviousLevel_Click
  Case 4: mnuCreateFolder_Click
  Case 5: mnuRenameFolder_Click
  Case 6: Me.PopupMenu mnuAutoCreateFolder: SwitchAutoFolder
  Case 7: mnuApplyFolderTemplate_Click
  Case 8: mnuDeleteFolder_Click
  Case 11: mnuMoveFirst_Click
  Case 12: mnuUp_Click
  Case 13: mnuDown_Click
  Case 14: mnuMoveLast_Click
  Case 16: mnuOrderSelection_Click
  Case 17: mnuOrderRandomSelection_Click
  Case 19: mnurRetrieveID3v1_Click
  Case 20: mnurRetrieveID3v2_Click
  Case 21: mnurRetrieveAPE_Click
  Case 22: mnurRetrieveWMP_Click
  End Select
End Sub

Private Sub tbrPlayer_ButtonClick(ByVal Button As MSComctlLib.Button)
  Select Case Button.Index
  Case 1: mnuPlayBrowser_Click
  Case 2: mnuPlayList_Click
  Case 3: mnuPause_Click
  Case 4: mnuStop_Click
  End Select
End Sub

Private Sub tbrSearch_ButtonClick(ByVal Button As MSComctlLib.Button)
  If Button.Index = 1 Then mnuResult_Click
End Sub

Public Sub tbsFileBrowser_Click()
  Select Case tbsFileBrowser.selectedItem.Index
  Case 1
    '�ҵĵ���
    tvwFolder.ZOrder 0
    lvwFile.ZOrder 0
    tvwFolder.Enabled = True
    tvwMydoc.Enabled = False
    tvwFavourite.Enabled = False
    lvwFile.Enabled = True
    lvwFavourite.Enabled = False
    tvwProgram.Enabled = False
    lvwProgram.Enabled = False
    mnuMyComputer.Checked = True
    mnuMyDocuments.Checked = False
    mnuFavourite.Checked = False
    mnuAppList.Checked = False
    mnuResult.Enabled = False
    
    mnuDeleteFromFavourite = False
    mnuDeleteAllFavourite = False
    mnuMoveToDirectory = False
    mnuCreateDirectory = False
    mnuDeleteDirectory = False
    mnuImportFromM3U = False
    mnuSaveToM3U = False

    tbrSearch.Visible = False
    tbrBroswer.Visible = True
    
    ActivePage = 1
    tvwFolder_NodeClick tvwFolder.selectedItem
    If Starting = False Then ffmSearch.ShowWindow False
  Case 2
    '�ҵ��ĵ�
    tvwMydoc.ZOrder 0
    lvwFile.ZOrder 0
    tvwFolder.Enabled = False
    tvwMydoc.Enabled = True
    tvwFavourite.Enabled = False
    lvwFile.Enabled = True
    lvwFavourite.Enabled = False
    tvwProgram.Enabled = False
    lvwProgram.Enabled = False
    mnuMyComputer.Checked = False
    mnuMyDocuments.Checked = True
    mnuFavourite.Checked = False
    mnuAppList.Checked = False
    mnuResult.Enabled = False
    
    mnuDeleteFromFavourite = False
    mnuDeleteAllFavourite = False
    mnuMoveToDirectory = False
    mnuCreateDirectory = False
    mnuDeleteDirectory = False
    mnuImportFromM3U = False
    mnuSaveToM3U = False

    tbrSearch.Visible = False
    tbrBroswer.Visible = True
    
    ffmSearch.ShowWindow False
    
    ActivePage = 2
    tvwMydoc_NodeClick tvwMydoc.selectedItem
  Case 3
    '�ղؼ�
    tvwFavourite.ZOrder 0
    lvwFavourite.ZOrder 0
    tvwFolder.Enabled = False
    tvwMydoc.Enabled = False
    tvwFavourite.Enabled = True
    lvwFile.Enabled = False
    lvwFavourite.Enabled = True
    tvwProgram.Enabled = False
    lvwProgram.Enabled = False
    mnuMyComputer.Checked = False
    mnuMyDocuments.Checked = False
    mnuFavourite.Checked = True
    mnuAppList.Checked = False
    mnuResult.Enabled = True
    
    mnuDeleteFromFavourite = True
    mnuDeleteAllFavourite = True
    mnuMoveToDirectory = True
    mnuCreateDirectory = True
    mnuDeleteDirectory = True
    mnuImportFromM3U = True
    mnuSaveToM3U = True

    tbrSearch.Visible = True
    tbrBroswer.Visible = False
    
    ActivePage = 3
    
    Set stbDefault.Panels(1).Picture = iltTabs.ListImages(3).Picture
    If tvwProgram.Nodes.Count Then lvwFavourite_ItemClick Nothing
    ffmSearch.UpdateHeader lvwFavourite
    ffmSearch.Research
    If mnuResult.Checked Then ffmSearch.ShowWindow True
  Case 4
    'Ӧ�ó����嵥
    tvwProgram.ZOrder 0
    lvwProgram.ZOrder 0
    tvwFolder.Enabled = False
    tvwMydoc.Enabled = False
    tvwFavourite.Enabled = False
    lvwFile.Enabled = False
    lvwFavourite.Enabled = False
    tvwProgram.Enabled = True
    lvwProgram.Enabled = True
    mnuMyComputer.Checked = False
    mnuMyDocuments.Checked = False
    mnuFavourite.Checked = False
    mnuAppList.Checked = True
    mnuResult.Enabled = True
    
    mnuDeleteFromFavourite = False
    mnuDeleteAllFavourite = False
    mnuMoveToDirectory = False
    mnuCreateDirectory = False
    mnuDeleteDirectory = False
    mnuImportFromM3U = False
    mnuSaveToM3U = False

    tbrSearch.Visible = True
    tbrBroswer.Visible = False
    
    ActivePage = 4
    Set stbDefault.Panels(1).Picture = iltTabs.ListImages(4).Picture
    If tvwProgram.Nodes.Count Then lvwProgram_ItemClick Nothing
    ffmSearch.UpdateHeader lvwProgram
    ffmSearch.Research
    If mnuResult.Checked Then ffmSearch.ShowWindow True
  End Select
End Sub

Private Sub tmrChangedEvent_Timer()
  '�ı��¼�
  If SearchKeyChanged Then
    Select Case ActivePage
    Case 3: ffmSearch.Search lvwFavourite, icbSearch.Text
    Case 4: ffmSearch.Search lvwProgram, icbSearch.Text
    End Select
    
    SearchKeyChanged = False
  End If
  
  If SelectionFavChanged Then
    Call UpdateStatusBarFavourite(lvwFavourite.selectedItem)
    SelectionFavChanged = False
  ElseIf SelectionPrgChanged Then
    Call UpdateStatusBarProgram(lvwProgram.selectedItem)
    SelectionPrgChanged = False
  ElseIf SelectionFilChanged Then
    Call UpdateStatusBarFile(lvwFile.selectedItem)
    SelectionFilChanged = False
  End If
  
  '�Ҽ��˵�
  'Dim Message As MSG
  
  'If PeekMessage(Message, lvwList.hwnd, WM_CONTEXTMENU, WM_CONTEXTMENU, PM_REMOVE) Then PopupMenu popLvwList
End Sub

Private Sub tmrPlayer_Timer()
  'ˢ��
  Dim lNewPos As Long
  Dim lTotal As Long
  
  If CInt(sldPos.tag) = 1 Then Exit Sub
  
  lNewPos = CLng(ffmVideo.WMP.Controls.currentPosition)
  lTotal = CLng(oPlayerMedia.Duration)
  
  If oPlayerMedia.Duration = 0 Then Exit Sub
  
  bInternal = True
  If sldPos.Max > lNewPos Then
    sldPos.Max = lTotal
    sldPos.value = lNewPos
  Else
    sldPos.Max = lTotal
    sldPos.value = lNewPos
  End If
  bInternal = False
  
  If Not picProgress.Visible Then
    stbDefault.Panels(2).Text = "(���ڲ��� " & ffmVideo.WMP.Controls.currentPositionString & _
                              "/" & oPlayerMedia.durationString & ")" & sMsg
    'stbDefault.Panels(2).Width = stbDefault.Panels(2).Width + 240
  End If
  
  If ffmVideo.WMP.playState = wmppsStopped Then
    '�������
    stbDefault.Panels(2).Text = "(ֹͣ)"
    mnuStop.Enabled = False
    mnuPause.Enabled = False
    sldPos.Enabled = False
    tbrPlayer.Buttons(3).Enabled = False
    tbrPlayer.Buttons(4).Enabled = False
    tmrPlayer.Enabled = False
  End If
End Sub

Private Sub tmrSetWidth_Timer()
  If lvwFile.ColumnHeaders(6).Width Then lvwFile.ColumnHeaders(6).Width = 0
End Sub

Private Sub tvwFavourite_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
    PopupMenu popTvwFavourite
  End If
End Sub

Public Sub tvwFavourite_NodeClick(ByVal Node As MSComctlLib.Node)
  'ˢ����Ŀ
  Dim oLI As MSComctlLib.ListItem
  Dim oFI As MP3PA.FAVItem
  Dim F As Scripting.File
  Dim sSpc As String
  Dim sTmp As String
  Dim sTrcSpc As String
  Dim Counter As Long
  
  '�����п�
  stbDefault.Panels(1).ToolTipText = "0 ���ļ�, �ܹ���С 0 KB"
  stbDefault.Panels(1).Text = "0 ���ļ�, �ܹ���С 0 KB"
  
  Select Case lvwFavourite.ColumnHeaders.Count
  Case 5
    lLVWDefault(1) = lvwFavourite.ColumnHeaders(1).Width
    lLVWDefault(2) = lvwFavourite.ColumnHeaders(2).Width
    lLVWDefault(3) = lvwFavourite.ColumnHeaders(3).Width
    lLVWDefault(4) = lvwFavourite.ColumnHeaders(4).Width
    lLVWDefault(5) = lvwFavourite.ColumnHeaders(5).Width
  Case 10
    lLVWMusic(1) = lvwFavourite.ColumnHeaders(1).Width
    lLVWMusic(2) = lvwFavourite.ColumnHeaders(2).Width
    lLVWMusic(3) = lvwFavourite.ColumnHeaders(3).Width
    lLVWMusic(4) = lvwFavourite.ColumnHeaders(4).Width
    lLVWMusic(5) = lvwFavourite.ColumnHeaders(5).Width
    lLVWMusic(6) = lvwFavourite.ColumnHeaders(6).Width
    lLVWMusic(7) = lvwFavourite.ColumnHeaders(7).Width
    lLVWMusic(8) = lvwFavourite.ColumnHeaders(8).Width
    lLVWMusic(9) = lvwFavourite.ColumnHeaders(9).Width
    lLVWMusic(10) = lvwFavourite.ColumnHeaders(10).Width
  End Select
  
  '��ʾ��ʾ
  ShowProgress True, "����ˢ���б�...", False
  Me.MousePointer = 11
  DoEvents
  lvwFavourite.ListItems.Clear
  Set lvwFavourite.SmallIcons = Nothing
  
  If ffmSearch.RWLoaded Then
    Set ffmSearch.lvwResult.SmallIcons = Nothing
  End If
  
  iltFav.ListImages.Clear
  
  '���µ�ǰ�󶨵Ķ���
  Set oCurFav = oFavCol(Node.Key)
  
  sSpc = Space(Len(CStr(oCurFav.FavouriteItems.Count)))
  Counter = Counter + 1
  
  '��������
  If oCurFav.MusicType Then
    '���������ģʽ
    If lvwFavourite.ColumnHeaders.Count <> 10 Then
      lvwFavourite.ColumnHeaders.Clear
      
      lvwFavourite.ColumnHeaders.Add , , "���", lLVWMusic(1)
      lvwFavourite.ColumnHeaders.Add , , "�ļ���", lLVWMusic(2)
      lvwFavourite.ColumnHeaders.Add , , "������", lLVWMusic(3)
      lvwFavourite.ColumnHeaders.Add , , "����", lLVWMusic(4)
      lvwFavourite.ColumnHeaders.Add , , "ר��", lLVWMusic(5)
      lvwFavourite.ColumnHeaders.Add , , "����", lLVWMusic(6), 1
      lvwFavourite.ColumnHeaders.Add , , "����", lLVWMusic(7), 1
      lvwFavourite.ColumnHeaders.Add , , "����", lLVWMusic(8)
      lvwFavourite.ColumnHeaders.Add , , "���", lLVWMusic(9)
      lvwFavourite.ColumnHeaders.Add , , "ע��", lLVWMusic(10)
      
      lvwFavourite.ColumnHeaders.Item(2).tag = "SEARCH_FIELD"
      lvwFavourite.ColumnHeaders.Item(3).tag = "SEARCH_FIELD"
      lvwFavourite.ColumnHeaders.Item(4).tag = "SEARCH_FIELD"
      lvwFavourite.ColumnHeaders.Item(5).tag = "SEARCH_FIELD"
      
      SortListView lvwFavourite, 0, lvwAscending
      If Not Starting Then ffmSearch.UpdateHeader lvwFavourite
    End If
    
    '�����Ŀ
    For i = 1 To oCurFav.FavouriteItems.Count
      Set oFI = oCurFav.FavouriteItems(i)
      
      '������Ϣ
      If FS.FileExists(oFI.FileName) Then
        sTmp = Counter
        Counter = Counter + 1
        RSet sSpc = sTmp
        
        Set oLI = lvwFavourite.ListItems.Add(, oFI.FileName, sSpc)
        
        oLI.SubItems(1) = FS.GetFileName(oFI.FileName)
        oLI.SubItems(2) = oFI.Artist
        oLI.SubItems(3) = oFI.Title
        oLI.SubItems(4) = oFI.Album
        If oFI.Track > 0 Then oLI.SubItems(5) = oFI.Track
        oLI.SubItems(6) = Format((oFI.Duration \ 60), "00") & ":" & Format(oFI.Duration Mod 60, "00")
        oLI.SubItems(7) = oFI.Genre
        oLI.SubItems(8) = oFI.Year
        oLI.SubItems(9) = oFI.Comment
        
        oLI.tag = FileLen(oFI.FileName)
      End If
    Next i
  Else
    '�������ͨģʽ
    If lvwFavourite.ColumnHeaders.Count <> 5 Then
      lvwFavourite.ColumnHeaders.Clear
      
      lvwFavourite.ColumnHeaders.Add , , "���", lLVWDefault(1)
      lvwFavourite.ColumnHeaders.Add , , "�ļ���", lLVWDefault(2)
      lvwFavourite.ColumnHeaders.Add , , "ע��", lLVWDefault(3)
      lvwFavourite.ColumnHeaders.Add , , "�ļ�����", lLVWDefault(4)
      lvwFavourite.ColumnHeaders.Add , , "�޸�ʱ��", lLVWDefault(5), 1
    
      lvwFavourite.ColumnHeaders.Item(2).tag = "SEARCH_FIELD"
      lvwFavourite.ColumnHeaders.Item(3).tag = "SEARCH_FIELD"
    
      SortListView lvwFavourite, 0, lvwAscending
      ffmSearch.UpdateHeader lvwFavourite
    End If
    
    '�����Ŀ
    For i = 1 To oCurFav.FavouriteItems.Count
      Set oFI = oCurFav.FavouriteItems(i)
      
      '������Ϣ
      If FS.FileExists(oFI.FileName) Then
        sTmp = Counter
        Counter = Counter + 1
        RSet sSpc = sTmp
          
        Set oLI = lvwFavourite.ListItems.Add(, oFI.FileName, sSpc)
        Set F = FS.GetFile(oFI.FileName)
        
        oLI.SubItems(1) = FS.GetFileName(oFI.FileName)
        oLI.SubItems(2) = oFI.Comment
        
        oLI.SubItems(3) = F.Type
        oLI.SubItems(4) = Format(F.DateLastModified, "yyyy-mm-dd hh:mm:ss")
        oLI.tag = F.Size
        
        oLI.tag = FileLen(oFI.FileName)
      End If
    Next i
  End If
  
  'ˢ��ͼ��
  Dim hSmall As Long
  Dim FINF1 As SHFILEINFO
  Dim FileExt As String
  Dim nItem As MSComctlLib.ListItem
  Dim CurrentFile As String
  
  For i = 1 To lvwFavourite.ListItems.Count
    Set nItem = lvwFavourite.ListItems(i)
    
    CurrentFile = nItem.Key
    FileExt = UCase(FS.GetExtensionName(CurrentFile))
    
    If (FileExt = "EXE") Or (FileExt = "SCR") Or (FileExt = "ICO") Then
      picPainter.Cls
      hSmall = SHGetFileInfo(CurrentFile, 0, FINF1, Len(FINF1), BASIC_SHGFI_FLAGS Or SHGFI_SMALLICON)
      r = ImageList_Draw(hSmall, FINF1.iIcon, picPainter.hdc, 0, 0, ILD_TRANSPARENT)
      iltFav.ListImages.Add , CurrentFile, picPainter.Image
      Set lvwFavourite.SmallIcons = iltFav
      nItem.SmallIcon = CurrentFile
    ElseIf Len(FileExt) = 0 Then
      On Error GoTo AddNoImage
      nItem.SmallIcon = "?NOEXTNAME"
      On Error GoTo ProcessEnd
    Else
      On Error GoTo AddImage
      nItem.SmallIcon = "EXT_" & FileExt
      On Error GoTo ProcessEnd
    End If
  Next i
  
ProcessEnd:
  '����
  lvwFavourite.Sorted = False
  lvwFavourite.Sorted = True
  ShowProgress False, ""
  If Not Starting Then ffmSearch.Research
  Me.MousePointer = 0
  
  If lvwFavourite.ListItems.Count > 0 Then
    lvwFavourite.ListItems(1).Selected = True
    lvwFavourite_ItemClick lvwFavourite.selectedItem
  End If
  
  Exit Sub
AddImage:
  picPainter.Cls
  hSmall = SHGetFileInfo(CurrentFile, 0, FINF1, Len(FINF1), BASIC_SHGFI_FLAGS Or SHGFI_SMALLICON)
  r = ImageList_Draw(hSmall, FINF1.iIcon, picPainter.hdc, 0, 0, ILD_TRANSPARENT)
  iltFav.ListImages.Add , "EXT_" & FileExt, picPainter.Image
  Set lvwFavourite.SmallIcons = iltFav
  Resume

AddNoImage:
  picPainter.Cls
  hSmall = SHGetFileInfo(CurrentFile, 0, FINF1, Len(FINF1), BASIC_SHGFI_FLAGS Or SHGFI_SMALLICON)
  r = ImageList_Draw(hSmall, FINF1.iIcon, picPainter.hdc, 0, 0, ILD_TRANSPARENT)
  iltFav.ListImages.Add , "?NOEXTNAME", picPainter.Image
  Set lvwFavourite.SmallIcons = iltFav
  Resume
  
End Sub

Private Sub tvwFavourite_OLEDragDrop(Data As MSComctlLib.DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
  '����ļ�
  Dim oFiles As New VBA.Collection
  Dim curFav As String
  
  If Data.GetFormat(vbCFFiles) Then
    If Not tvwFavourite.DropHighlight Is Nothing Then
      '���
      curFav = tvwFavourite.DropHighlight.Key
      Set tvwFavourite.DropHighlight = Nothing
      
      For i = 1 To Data.Files.Count
        oFiles.Add Data.Files(i)
      Next i
      
      dlgAddFavourite.ShowAddFavourite oFiles, curFav, False
      tvwFavourite.Nodes(curFav).Selected = True
      tvwFavourite_NodeClick tvwFavourite.Nodes(curFav)
    End If
  End If
End Sub

Private Sub tvwFavourite_OLEDragOver(Data As MSComctlLib.DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single, State As Integer)
  Dim nNode As MSComctlLib.Node

  On Error GoTo EndExit
  If Data.GetFormat(vbCFFiles) Then
    '�����ļ�
    Effect = vbDropEffectCopy
    
    Set nNode = tvwFavourite.HitTest(X, Y)
    
    If nNode Is Nothing Then
      Set nNode = tvwFavourite.Nodes(tvwFavourite.Nodes.Count)
    End If
    
    Set tvwFavourite.DropHighlight = nNode
  Else
    Set tvwFavourite.DropHighlight = Nothing
    Effect = vbDropEffectNone
  End If
EndExit:
End Sub

Private Sub tvwFolder_Expand(ByVal Node As MSComctlLib.Node)
  ExpandTree tvwFolder, Node
End Sub

Private Function GetFolderIconIndex(ByVal sPath As String) As String
  '���ͼ��
  Dim sDesFile As String
  Dim hSmall As Long
  Dim hLarge As Long
  Dim FINFO As SHFILEINFO
  Dim sTemp As String
  Dim iTemp As Integer
  Dim sIcoFile As String
  Dim lIndex As Long
  
  If Right(sPath, 1) = "\" Then sDesFile = sPath & "desktop.ini" Else sDesFile = sPath & "\desktop.ini"
  
  '�Ƿ��� Desktop.ini �ļ�
  If FS.FileExists(sDesFile) Then
    If ItemExistOBJ(sPath, iltFolder.ListImages) Then
      GetFolderIconIndex = sPath
    Else
      picPainter.Cls
      hSmall = 0
      INIAPI.FileName = sDesFile
      sIcoFile = INIAPI.GetIniString(".ShellClassInfo", "IconFile")
      lIndex = INIAPI.GetIniInteger(".ShellClassInfo", "IconIndex")
      
      If Not FS.FileExists(sIcoFile) Then GoTo SetDefault
      
      Call ExtractIconEx(sIcoFile, lIndex, hLarge, hSmall, 1)
      
      If hSmall = 0 Then
        sTemp = INIAPI.GetIniString(".ShellClassInfo", "SourceIcon")
        If InStr(1, sTemp, ",") = 0 Then GoTo SetDefault
        iTemp = CInt(Right(sTemp, Len(sTemp) - InStrRev(sTemp, ",")))
        sTemp = Left(sTemp, InStrRev(sTemp, ",") - 1)
        
        Call ExtractIconEx(sTemp, iTemp, hLarge, hSmall, 1)
        If hSmall = 0 Then GoTo SetDefault
      End If
      
      Call DrawIconEx(picPainter.hdc, 0, 0, hSmall, 16, 16, 0, 0, 3)
      DoEvents
      iltFolder.ListImages.Add , sPath, picPainter.Image
      GetFolderIconIndex = sPath
    End If
  Else
SetDefault:
    GetFolderIconIndex = "?FOLDER"
  End If
End Function

Private Sub RefreshFolder()
  'ˢ���ļ���
  Dim sPath As String
  Dim sImageKey As String
  Dim FINFO As SHFILEINFO
  Dim hSmall As Long, hLarge As Long
  Dim iIconIndex As Integer
  
  Call tvwFolder.Nodes.Clear
  Set tvwFolder.ImageList = Nothing
  Call iltFolder.ListImages.Clear
  
  '����ҵĵ���ͼ��
  On Error Resume Next
  sPath = Registry.GetStringValue("HKEY_CLASSES_ROOT\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\DefaultIcon", "")
  iIconIndex = CInt(Right(sPath, Len(sPath) - InStrRev(sPath, ",")))
  sPath = Left(sPath, InStrRev(sPath, ",") - 1)
  sPath = ExpandPath(sPath)
  
  Call picPainter.Cls
  Call ExtractIconEx(sPath, iIconIndex, hLarge, hSmall, 1)
  Call DrawIconEx(picPainter.hdc, 0, 0, hSmall, 16, 16, 0, 0, 3)
  Call iltFolder.ListImages.Add(, "?MYCOMPUTER", picPainter.Image)

  '����ҵ��ĵ�ͼ��
  sPath = Registry.GetStringValue("HKEY_CLASSES_ROOT\CLSID\{450D8FBA-AD25-11D0-98A8-0800361B1103}\DefaultIcon", "")
  iIconIndex = CInt(Right(sPath, Len(sPath) - InStrRev(sPath, ",")))
  sPath = Left(sPath, InStrRev(sPath, ",") - 1)
  sPath = ExpandPath(sPath)
  
  Call picPainter.Cls
  Call ExtractIconEx(sPath, iIconIndex, hLarge, hSmall, 1)
  Call DrawIconEx(picPainter.hdc, 0, 0, hSmall, 16, 16, 0, 0, 3)
  Call iltFolder.ListImages.Add(, "?MYDOCUMENTS", picPainter.Image)
  
  '����ļ���ͼ��
  picPainter.Cls
  hSmall = SHGetFileInfo(WinRoot, 0, FINFO, Len(FINFO), BASIC_SHGFI_FLAGS Or SHGFI_SMALLICON)
  r = ImageList_Draw(hSmall, FINFO.iIcon, picPainter.hdc, 0, 0, ILD_TRANSPARENT)
  iltFolder.ListImages.Add , "?FOLDER", picPainter.Image
  
  Set tvwFolder.ImageList = iltFolder
  
  '����ļ���չ��ͼ��
  sPath = Registry.GetStringValue("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons", "4")
  
  If sPath = "Error" Then
    sPath = Registry.GetStringValue("HKEY_CLASSES_ROOT\Directory\DefaultIcon", "")
    iIconIndex = CInt(Right(sPath, Len(sPath) - InStrRev(sPath, ","))) + 1
    sPath = Left(sPath, InStrRev(sPath, ",") - 1)
    sPath = ExpandPath(sPath)
  Else
    iIconIndex = CInt(Right(sPath, Len(sPath) - InStrRev(sPath, ",")))
    sPath = Left(sPath, InStrRev(sPath, ",") - 1)
    sPath = ExpandPath(sPath)
  End If
  On Error GoTo 0
  
  Call picPainter.Cls
  Call ExtractIconEx(sPath, iIconIndex, hLarge, hSmall, 1)
  Call DrawIconEx(picPainter.hdc, 0, 0, hSmall, 16, 16, 0, 0, 3)
  Call iltFolder.ListImages.Add(, "?FOLDERSEL", picPainter.Image)
  
  Set tvwFolder.ImageList = iltFolder
  
  '��ӵ� MSCombo
  Set icbBrowse.ImageList = iltFolder
  icbBrowse.ComboItems.Add , "?MYCOMPUTER", "�ҵĵ���", "?MYCOMPUTER"
  
  '��ȡ������
  Dim nNode As MSComctlLib.Node
  Dim nCombo As MSComctlLib.ComboItem
  Dim DS As Scripting.Drives
  Dim d As Scripting.Drive
  
  Set nNode = tvwFolder.Nodes.Add(, , "?MYCOMPUTER", "�ҵĵ���", "?MYCOMPUTER")
  nNode.tag = False
  nNode.Selected = True
  
  Set DS = FS.Drives
  
  On Error GoTo AddListImage
  For Each d In DS
    sPath = d.Path & "\"
    sImageKey = "?DISKIMG_" & d.Path
    
    Set nNode = tvwFolder.Nodes.Add("?MYCOMPUTER", tvwChild, sPath, GetDriveString(sPath, d))
    nNode.Image = sImageKey
    nNode.Sorted = True
    nNode.tag = False
    
    Set nCombo = icbBrowse.ComboItems.Add(, sPath)
    nCombo.Image = sImageKey
    nCombo.Indentation = 1
    nCombo.Text = nNode.Text
    nCombo.tag = sPath
  Next d
  On Error GoTo 0
  
  Exit Sub
  
AddListImage:
  picPainter.Cls
  hSmall = SHGetFileInfo(sPath, 0, FINFO, Len(FINFO), BASIC_SHGFI_FLAGS Or SHGFI_SMALLICON)
  r = ImageList_Draw(hSmall, FINFO.iIcon, picPainter.hdc, 0, 0, ILD_TRANSPARENT)
  iltFolder.ListImages.Add , sImageKey, picPainter.Image
  Resume
  
End Sub

Private Sub RefreshMyDoc()
  'ˢ���ļ���
  Dim sPath As String
  Dim sImageKey As String
  Dim FINFO As SHFILEINFO
  Dim hSmall As Long, hLarge As Long
  Dim iIconIndex As Integer
  Dim nCombo As MSComctlLib.ComboItem
  
  Call tvwMydoc.Nodes.Clear
  Set tvwMydoc.ImageList = Nothing
  Set tvwMydoc.ImageList = iltFolder
  
  '��ȡ������
  Dim nNode As MSComctlLib.Node
  Dim FOS As Scripting.Folders
  Dim FO As Scripting.Folder
  
  sMyDocPath = GetMyDocPath
  
  If sMyDocPath = "Error" Then
    tbsFileBrowser.Tabs(2).tag = "NOMYDOC"
    Exit Sub
  End If
  
  Set nNode = tvwMydoc.Nodes.Add(, , sMyDocPath, "�ҵ��ĵ�", "?MYDOCUMENTS")
  nNode.tag = False
  nNode.Selected = True
  nNode.Sorted = True
  
  Set nCombo = icbBrowse.ComboItems.Add(, "?MYDOCUMENTS", "�ҵ��ĵ�", "?MYDOCUMENTS")
  nCombo.tag = sMyDocPath
  
  Set FOS = FS.GetFolder(sMyDocPath).SubFolders
  
  For Each FO In FOS
    sImageKey = GetFolderIconIndex(FO.Path)
    
    Set nNode = tvwMydoc.Nodes.Add(sMyDocPath, tvwChild, FO.Path, FO.Name, sImageKey)
    nNode.Sorted = True
    nNode.tag = False
    
    If sImageKey = "?FOLDER" Then
      nNode.SelectedImage = "?FOLDERSEL"
    End If
  Next FO
  Exit Sub
End Sub

Public Sub ShowProgress(ByVal ShowProgress As Boolean, ByVal Text As String, Optional ByVal ShowProgressBar As Boolean = True)
  pbeDefault.value = 0
  picProgress.Visible = ShowProgress
  'stbDefault.Visible = Not ShowProgress
  pbeDefault.Visible = ShowProgressBar
  lblProgrss.Caption = Text
End Sub

Private Sub tvwFolder_GotFocus()
  '�л�����״̬
  Select Case ActivePage
  Case 1, 2: lvwFile_ItemClick Nothing
  Case 3
  End Select
End Sub

Private Sub tvwFolder_KeyDown(KeyCode As Integer, Shift As Integer)
  'Alt+Enter
  If (KeyCode = vbKeyReturn) And (Shift = vbAltMask) Then mnuProperty_Click

  'Ctrl+Enter
  If (KeyCode = vbKeyReturn) And (Shift = vbCtrlMask) Then mnuOpen_Click
End Sub

Private Sub tvwFolder_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
    PopupMenu popTvwFolder
  End If
End Sub

Private Sub tvwFolder_NodeClick(ByVal Node As MSComctlLib.Node)
  RefreshFile Node
  
  Dim ThisPath As String
  Dim ParaPath As String
  Dim LastPath As New VBA.Collection
  Dim ParaItem As MSComctlLib.ComboItem
  
  '��� Combo
  If Node.Key = "?MYCOMPUTER" Then
    Set icbBrowse.selectedItem = icbBrowse.ComboItems("?MYCOMPUTER")
  ElseIf FS.DriveExists(Node.Key) Then
    icbBrowse.Text = Node.Key
    Set icbBrowse.selectedItem = icbBrowse.ComboItems(Node.Key)
    SetWindowText icbBrowse.hWnd, Node.Key
    icbBrowse.SelStart = 0
    icbBrowse.SelLength = Len(Node.Key)
  Else
    '�����Ŀ
    ThisPath = Node.Key
    ParaPath = ThisPath
    
    Do
      LastPath.Add ParaPath
      ParaPath = FS.GetParentFolderName(ParaPath)
    Loop Until Len(ParaPath) = 0
    
    Set ParaItem = icbBrowse.ComboItems(VBA.Left(ThisPath, 3))
    
    For i = LastPath.Count - 1 To 1 Step -1
      ParaPath = LastPath(i)
      
      If Not ItemExistOBJ(ParaPath, icbBrowse.ComboItems) Then
        '���û�о�Ҫ���
        Set ParaItem = icbBrowse.ComboItems.Add(ParaItem.Index + 1, ParaPath, FS.GetFileName(ParaPath), GetFolderIconIndex(ParaPath), , ParaItem.Indentation + 1)
        Set icbBrowse.selectedItem = ParaItem
      Else
        Set ParaItem = icbBrowse.ComboItems(ParaPath)
        
        If ParaItem.Image = "?FOLDERSEL" Then ParaItem.Image = "?FOLDER"
        
        Set icbBrowse.selectedItem = ParaItem
      End If
    Next i
    
    If icbBrowse.ComboItems(ThisPath).Image = "?FOLDER" Then
      icbBrowse.ComboItems(ThisPath).Image = "?FOLDERSEL"
    End If
    
    SetWindowText icbBrowse.hWnd, ThisPath
    icbBrowse.SelStart = 0
    icbBrowse.SelLength = Len(ThisPath)
  End If
  
  'ɾ����Ŀ
  i = 2
  
  Do Until i >= icbBrowse.ComboItems("?MYDOCUMENTS").Index
    If Len(icbBrowse.ComboItems(i).Key) > 3 And (InStr(1, ThisPath, icbBrowse.ComboItems(i).Key) <> 1) Then
      icbBrowse.ComboItems.Remove i
    Else
      i = i + 1
    End If
  Loop
  
  i = i + 1
  
  Do Until i > icbBrowse.ComboItems.Count
    icbBrowse.ComboItems.Remove i
  Loop
End Sub


Private Sub tvwList_KeyDown(KeyCode As Integer, Shift As Integer)
  '���ÿ�ݼ�
  If (KeyCode = vbKeyDelete) And (Shift = 0) Then mnuDeleteFolder_Click
  If (KeyCode = vbKeyBack) And (Shift = 0) Then mnuPreviousLevel_Click
  If (KeyCode = vbKeyF2) And (Shift = 0) Then mnuRenameFolder_Click
End Sub

Private Sub tvwList_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
    PopupMenu popTvwLIst
  End If
End Sub

Private Sub tvwList_NodeClick(ByVal Node As MSComctlLib.Node)
  '���ѡ����ǵ�ǰ����Ŀ�Ͳ�����
  Dim sSTBText As String
  
  If Node.tag Is CurrentListFolder Then Exit Sub
  
  '����ԭ��������
  UpdateList
  
  '��ʾ����ļ����е�����
  Set PlayListInfo = New VBA.Collection
  Set PlayListKeys = New VBA.Collection
  Set CurrentListFolder = Node.tag
  Set PlayListInfo = CurrentListFolder.ListFiles
  
  Call lvwList.ListItems.Clear
  
  '��ʵ�б�
  Dim nItem As MSComctlLib.ListItem
  Dim nList As MP3PA.ListInfo
  
  ShowProgress True, "���ڸ����б�...", False
  Me.MousePointer = 11
  'lvwList.Visible = False
  
  For i = 1 To PlayListInfo.Count
    Set nItem = lvwList.ListItems.Add(, , i)
    Set nList = PlayListInfo(i)
    
    nItem.SmallIcon = nList.IconIndex
    nItem.SubItems(1) = vbNullString
    nItem.SubItems(3) = FS.GetFileName(nList.FileName)
    nItem.SubItems(4) = nList.Artist
    nItem.SubItems(5) = nList.Title
    nItem.SubItems(6) = nList.Album
    nItem.SubItems(7) = nList.Genre
    nItem.SubItems(8) = nList.LengthString
    nItem.SubItems(9) = IIf(nList.Track < 1, vbNullString, nList.Track)
    nItem.SubItems(10) = nList.Year
    nItem.SubItems(11) = FormatNumber(nList.Size \ 1024, 0, vbTrue, vbTrue) & " KB"
    nItem.SubItems(12) = nList.CreateDate
    nItem.tag = nList.FileName
    
    If nList.AudioFile Then
      If nList.Lyric Then
        nItem.ListSubItems(1).ReportIcon = IIf(UCase(FS.GetExtensionName(nList.LyricFile)) = "LRC", "?LYRICS", "?LYRICEXRACTED")
      Else
        nItem.ListSubItems(1).ReportIcon = "?NOLYRICS"
      End If
    Else
      nItem.ListSubItems(1).ReportIcon = Empty
    End If
  
    If nList.TagExist Then
      nItem.ListSubItems(2).ReportIcon = nList.TagImlKey
      nItem.ListSubItems(2).Text = nList.TagText
      nItem.ListSubItems(2).ForeColor = nList.TagColor
    Else
      nItem.ListSubItems(2).ReportIcon = Empty
      nItem.ListSubItems(2).Text = vbNullString
    End If
  Next i

  '������ʾ
  UpdateListKeys
  ShowProgress False, vbNullString
  Me.MousePointer = 0
  'lvwList.Visible = True
  
  If lvwList.ListItems.Count Then lvwList.ListItems(1).Selected = True
  
  '����״̬��
  sSTBText = Left(stbDefault.Panels(3).Text, 2)
  sSTBText = Replace(tvwList.selectedItem.FullPath, "ROOT", sSTBText, 1, 1)
  stbDefault.Panels(3).Text = sSTBText
End Sub

Private Sub tvwList_OLEDragDrop(Data As MSComctlLib.DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
  '����Ϸŵ��ļ�
  Dim nNode As MSComctlLib.Node
  Dim nFile As New VBA.Collection
  Dim i As Long
  
  On Error GoTo EndExit
  If Data.GetFormat(vbCFFiles) Then
    '�����ļ�
    If tvwList.DropHighlight Is Nothing Then GoTo EndExit
    If Not (tvwList.selectedItem Is tvwList.DropHighlight And DragSender = "lvwList") Then
      If DragSender = "lvwList" And Shift <> 1 Then
        '����������� List �б��Ҫɾ��ԭ���Ķ���
        mnuDelete_Click
      End If
    
      '���õ�ǰ��ѡ��
      Set tvwList.selectedItem = tvwList.DropHighlight
      Call tvwList_NodeClick(tvwList.DropHighlight)
      
      '��ʼ����ļ�
      For i = 1 To Data.Files.Count
        nFile.Add Data.Files.Item(i)
      Next i
      
      '��������ļ�����
      Call AddFile(nFile)
    ElseIf DragSender <> "lvwList" Then
      
    End If
  End If
  
EndExit:
  Set tvwList.DropHighlight = Nothing
End Sub

Private Sub tvwList_OLEDragOver(Data As MSComctlLib.DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single, State As Integer)
  Dim nNode As MSComctlLib.Node

  On Error GoTo EndExit
  If Data.GetFormat(vbCFFiles) Then
    '�����ļ�
    If DragSender = "lvwList" And Shift <> 1 Then
      Effect = vbDropEffectMove
    Else
      Effect = vbDropEffectCopy
    End If
    
    Set nNode = tvwList.HitTest(X, Y)
    
    If nNode Is Nothing Then
      Set nNode = tvwList.Nodes(tvwList.Nodes.Count)
    End If
    
    Set tvwList.DropHighlight = nNode
  Else
    Set tvwList.DropHighlight = Nothing
    Effect = vbDropEffectNone
  End If
EndExit:
End Sub

Private Sub tvwMydoc_Expand(ByVal Node As MSComctlLib.Node)
  ExpandTree tvwMydoc, Node
End Sub

Private Sub tvwMydoc_KeyDown(KeyCode As Integer, Shift As Integer)
  'Alt+Enter
  If (KeyCode = vbKeyReturn) And (Shift = vbAltMask) Then mnuProperty_Click

  'Ctrl+Enter
  If (KeyCode = vbKeyReturn) And (Shift = vbCtrlMask) Then mnuOpen_Click
End Sub

Private Sub tvwMydoc_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
    PopupMenu popTvwFolder
  End If
End Sub

Private Sub tvwMydoc_NodeClick(ByVal Node As MSComctlLib.Node)
  RefreshFile Node

  Dim ThisPath As String
  Dim ParaPath As String
  Dim LastPath As New VBA.Collection
  Dim ParaItem As MSComctlLib.ComboItem
  Dim lMyDocPath As Long
  
  '��� Combo
  If Node Is Node.Root Then
    Set icbBrowse.selectedItem = icbBrowse.ComboItems("?MYDOCUMENTS")
  Else
    '�����Ŀ
    ThisPath = Node.Key
    ParaPath = ThisPath
    lMyDocPath = Len(sMyDocPath)
    
    Do Until Len(ParaPath) = lMyDocPath
      LastPath.Add ParaPath
      ParaPath = FS.GetParentFolderName(ParaPath)
    Loop
    
    Set ParaItem = icbBrowse.ComboItems("?MYDOCUMENTS")
    LastPath.Add sMyDocPath
    
    For i = LastPath.Count - 1 To 1 Step -1
      ParaPath = LastPath(i)
      
      If Not ItemExistOBJ(ParaPath, icbBrowse.ComboItems) Then
        '���û�о�Ҫ���
        Set ParaItem = icbBrowse.ComboItems.Add(ParaItem.Index + 1, ParaPath, FS.GetFileName(ParaPath), GetFolderIconIndex(ParaPath), , ParaItem.Indentation + 1)
        Set icbBrowse.selectedItem = ParaItem
      Else
        Set ParaItem = icbBrowse.ComboItems(ParaPath)
        Set icbBrowse.selectedItem = ParaItem
      End If
    Next i
    
    SetWindowText icbBrowse.hWnd, ThisPath
    icbBrowse.SelStart = 0
    icbBrowse.SelLength = Len(ThisPath)
    
    If icbBrowse.ComboItems(ThisPath).Image = "?FOLDER" Then
      icbBrowse.ComboItems(ThisPath).Image = "?FOLDERSEL"
    End If
  End If
  
  'ɾ����Ŀ
  i = 2
  
  Do Until i >= icbBrowse.ComboItems("?MYDOCUMENTS").Index
    If Len(icbBrowse.ComboItems(i).Key) > 3 Then
      icbBrowse.ComboItems.Remove i
    Else
      i = i + 1
    End If
  Loop
  
  i = i + 1
  
  Do Until i > icbBrowse.ComboItems.Count
    If InStr(1, ThisPath, icbBrowse.ComboItems(i).Key) <> 1 Then
      icbBrowse.ComboItems.Remove i
    Else
      i = i + 1
    End If
  Loop
End Sub

Public Sub RefreshChart()
  cbgDisk.Max = SpaceTotal
  cbgDisk.Original = SpaceUsed
  cbgDisk.value = SpaceAdded
  
  lblTotal.Caption = FormatNumber(SpaceTotal, 0, vbTrue)
  lblOrigial.Caption = FormatNumber(SpaceUsed, 0, vbTrue)
  lblAdded.Caption = FormatNumber(SpaceUsed + SpaceAdded, 0, vbTrue)
  
  lblOrigial.Top = (cbgDisk.Height - 90) * (1 - (SpaceUsed / (SpaceTotal))) + 120
  lblAdded.Top = (cbgDisk.Height - 90) * (1 - (SpaceUsed + SpaceAdded) / SpaceTotal) + 120
  
  lblOrigial.Visible = Not (SpaceUsed = 0)
  
  If (lblOrigial.Top - lblAdded.Top < 240) And (lblOrigial.Visible) Then
    lblAdded.Top = lblOrigial.Top - 240
  End If
  
  If lblAdded.Top < 360 Then
    lblAdded.Top = 360
    
    If (lblOrigial.Top < 600) And lblOrigial.Visible Then
      lblOrigial.Top = 600
    End If
  ElseIf (lblOrigial.Top > lblZero.Top - 240) And lblOrigial.Visible Then
    lblOrigial.Top = lblZero.Top - 240
    
    If lblAdded.Top - lblOrigial.Top < 240 Then
      lblAdded.Top = lblOrigial.Top - 240
    End If
  ElseIf (Not lblOrigial.Visible) And (lblAdded.Top > lblZero.Top - 240) Then
    lblAdded.Top = lblZero.Top - 240
  End If
  
  '�������������Ϣ
  If mnuFloatWindow.Checked Then
    ffmBacket.UpdateDiskBar (SpaceAdded / (SpaceTotal - SpaceUsed))
  End If
End Sub

'����ļ�
Public Sub AddFile(ByVal oFile As VBA.Collection, Optional lCount As Long = -1, Optional Inherit As Boolean = False, Optional InheritInfo As Collection)
  Dim oInfo As Object
  Dim CurrentFile As String
  Dim FileExt As String
  Dim LyricFile As String
  Dim LyricNo As Boolean
  Dim LyricSize As Double
  Dim sIconKey As String
  Dim sSubFolder As String
  Dim oSubObj As VBA.Collection
  Dim hSmall As Long
  Dim hLarge As Long
  Dim FINF1 As SHFILEINFO
  Dim FINF2 As SHFILEINFO
  Dim F As Scripting.File
  Dim oMedia As WMPLibCtl.IWMPMedia
  Dim nList As MP3PA.ListInfo
  Dim nInherit As MP3PA.ListInfo
  Dim oRemoveDulp As VBA.Collection
  Dim oRemoveInfo As VBA.Collection
  Dim i As Long
  Dim j As Long
  
  'ɾ�������ļ�
  Set oRemoveDulp = New VBA.Collection
  Set oRemoveInfo = New VBA.Collection
  
  On Error Resume Next
  Me.MousePointer = 11
  ShowProgress True, "���ڲ����ظ��ļ�...", False
  
  If Inherit Then
    For i = 1 To oFile.Count
      If FS.FileExists(oFile(i)) Then
        If Not ItemExist(oFile(i), oRemoveDulp) Then
          '��������ļ���δ��Ӿ�����
          oRemoveDulp.Add oFile(i), oFile(i)
          oRemoveInfo.Add InheritInfo(i)
        End If
      End If
    Next i
  Else
    For i = 1 To oFile.Count
      If FS.FileExists(oFile(i)) Then
        If Not ItemExist(oFile(i), oRemoveDulp) Then
          '��������ļ���δ��Ӿ�����
          oRemoveDulp.Add oFile(i), oFile(i)
        End If
      End If
    Next i
  End If
  
  Set oFile = oRemoveDulp
  Set InheritInfo = oRemoveInfo
  
  ShowProgress True, "��������ļ����б�..."
  pbeDefault.value = 0
  pbeDefault.Max = oFile.Count
  
  If lCount = -1 Then
    lCount = lvwList.ListItems.Count + 1
  End If
  
  lCount = lCount - 1
  
  Inherit = Inherit And CBool(InheritInfo.Count)
  
  'ȡ��ѡ��
  For i = 1 To lvwList.ListItems.Count
    lvwList.ListItems(i).Selected = False
  Next i
    
  '����ļ�
  lvwList.Visible = False
  On Error GoTo ErrorResume
  
  i = 1
  
  For i = 1 To oFile.Count
ReadInfo:
    pbeDefault.value = pbeDefault.value + 1
    
    CurrentFile = oFile(i)
    
    Set nList = New MP3PA.ListInfo
'    Set nItem = lvwList.ListItems.Add(lCount + i, , lCount + i)
    Set F = FS.GetFile(CurrentFile)
    
    '���ͼ��
    Select Case UCase(FS.GetExtensionName(CurrentFile))
    Case "EXE", "SCR", "ICL", "ICO"
      sIconKey = UCase(FS.GetFileName(CurrentFile))

      If Not ItemExistOBJ(sIconKey, iltList.ListImages) Then
        'ͼ�겻����
        picPainter.Cls
        hSmall = SHGetFileInfo(CurrentFile, 0, FINF1, Len(FINF1), BASIC_SHGFI_FLAGS Or SHGFI_SMALLICON)
        r = ImageList_Draw(hSmall, FINF1.iIcon, picPainter.hdc, 0, 0, ILD_TRANSPARENT)
        DoEvents
        iltList.ListImages.Add , sIconKey, picPainter.Image
      End If
    Case ""
      sIconKey = "?NOEXTNAME"

      If Not ItemExistOBJ(sIconKey, iltList.ListImages) Then
        'ͼ�겻����
        picPainter.Cls
        hSmall = SHGetFileInfo(CurrentFile, 0, FINF1, Len(FINF1), BASIC_SHGFI_FLAGS Or SHGFI_SMALLICON)
        r = ImageList_Draw(hSmall, FINF1.iIcon, picPainter.hdc, 0, 0, ILD_TRANSPARENT)
        DoEvents
        iltList.ListImages.Add , sIconKey, picPainter.Image
      End If
    Case Else
      sIconKey = UCase(FS.GetExtensionName(CurrentFile))

      If Not ItemExistOBJ(sIconKey, iltList.ListImages) Then
        'ͼ�겻����
        picPainter.Cls
        hSmall = SHGetFileInfo(CurrentFile, 0, FINF1, Len(FINF1), BASIC_SHGFI_FLAGS Or SHGFI_SMALLICON)
        r = ImageList_Draw(hSmall, FINF1.iIcon, picPainter.hdc, 0, 0, ILD_TRANSPARENT)
        DoEvents
        iltList.ListImages.Add , sIconKey, picPainter.Image
      End If
    End Select

    nList.IconIndex = sIconKey
    nList.Index = lCount + i
    
    'д���ļ���
    nList.FileName = CurrentFile
    
    'д����Ϣ
    FileExt = UCase(FS.GetExtensionName(CurrentFile))
    nList.AudioFile = False
    
    Select Case FileExt
    Case "MP3"
      If Inherit Then
        '�̳�����
        Set nInherit = InheritInfo.Item(i)
        
'        nItem.SubItems(4) = nInherit.Artist
'        nItem.SubItems(5) = nInherit.Title
'        nItem.SubItems(6) = nInherit.Album
'        nItem.SubItems(7) = nInherit.Genre
'        nItem.SubItems(9) = IIf(CInt(Val(nInherit.Track)) < 1, vbNullString, nInherit.Track)
'        nItem.SubItems(10) = nInherit.Year
        
        nList.Artist = nInherit.Artist
        nList.Title = nInherit.Title
        nList.Album = nInherit.Album
        nList.Genre = nInherit.Genre
        nList.Track = Abs(Val(nInherit.Track))
        nList.Year = nInherit.Year
        
        nList.TagExist = True
        nList.TagColor = 16739511
        nList.TagImlKey = ">INHERIT"
        nList.TagText = "�̳е���Ϣ"
        
'        nItem.ListSubItems(2).ReportIcon = ">INHERIT"
'        nItem.ListSubItems(2).Text = "�̳е���Ϣ"
'        nItem.ListSubItems(2).ForeColor = 16739511
'
'        nItem.SubItems(8) = nInherit.LengthString
        nList.LengthString = nInherit.LengthString
        nList.Length = nInherit.Length
      Else
        For j = 0 To 2
          Set oInfo = InfoReadObj(j)
          
          oInfo.LoadInfo CurrentFile
          
          If oInfo.Exist Then
'            nItem.SubItems(4) = oInfo.Artist
'            nItem.SubItems(5) = oInfo.Title
'            nItem.SubItems(6) = oInfo.Album
'            nItem.SubItems(7) = oInfo.Genre
'            nItem.SubItems(9) = IIf(CInt(Val(oInfo.Track)) < 1, vbNullString, oInfo.Track)
'            nItem.SubItems(10) = oInfo.Year
            
            nList.Artist = oInfo.Artist
            nList.Title = oInfo.Title
            nList.Album = oInfo.Album
            nList.Genre = oInfo.Genre
            nList.Track = Val(oInfo.Track)
            nList.Year = oInfo.Year
            
            nList.TagExist = True
            nList.TagColor = oInfo.idCellColor
            nList.TagImlKey = oInfo.idImlKey
            nList.TagText = oInfo.idLstText
            
'            nItem.ListSubItems(2).ReportIcon = nList.TagImlKey
'            nItem.ListSubItems(2).Text = nList.TagText
'            nItem.ListSubItems(2).ForeColor = nList.TagColor
            Exit For
          End If
        Next j
        
        '����ļ�����
        If Not NoDuration Then
          Set oMedia = ffmVideo.WMP.newMedia(CurrentFile)
'          nItem.SubItems(8) = oMedia.durationString
          nList.LengthString = oMedia.durationString
          nList.Length = oMedia.Duration
        End If
      End If
      
      nList.AudioFile = True
    Case "WMA"
      Set oMedia = ffmVideo.WMP.newMedia(CurrentFile)
          
      On Error Resume Next
'      nItem.SubItems(4) = oMedia.getItemInfo("Title")
'      nItem.SubItems(5) = oMedia.getItemInfo("Author")
'      nItem.SubItems(6) = oMedia.getItemInfo("WM/AlbumTitle")
'      nItem.SubItems(10) = oMedia.getItemInfo("WM/Year")
'      nItem.SubItems(9) = CInt(oMedia.getItemInfo("WM/TrackNumber"))
'      nItem.SubItems(7) = oMedia.getItemInfo("WM/Genre")
'
      nList.Artist = oMedia.getItemInfo("Author")
      nList.Title = oMedia.getItemInfo("Title")
      nList.Album = oMedia.getItemInfo("WM/AlbumTitle")
      nList.Genre = oMedia.getItemInfo("WM/Genre")
      nList.Track = CInt(oMedia.getItemInfo("WM/TrackNumber"))
      nList.Year = oMedia.getItemInfo("WM/Year")
      
      nList.TagExist = True
      nList.TagColor = oReaderWMPTAG.idCellColor
      nList.TagImlKey = oReaderWMPTAG.idImlKey
      nList.TagText = oReaderWMPTAG.idLstText
      
'      nItem.ListSubItems(2).ReportIcon = nList.TagImlKey
'      nItem.ListSubItems(2).Text = nList.TagText
'      nItem.ListSubItems(2).ForeColor = nList.TagColor
      On Error GoTo 0
          
      '����ļ�����
      If Not NoDuration Then
'        nItem.SubItems(8) = oMedia.durationString
        nList.LengthString = oMedia.durationString
        nList.Length = oMedia.Duration
      End If
      
      nList.AudioFile = True
    End Select
    
    '���Ҹ���ļ�
    Select Case FileExt
    Case "MP3", "WMA"
      LyricNo = Not SearchLyric(CurrentFile, LyricFile, LyricSize)
    
      If LyricNo Then
'        nItem.SubItems(1) = ""
'        nItem.ListSubItems(1).ReportIcon = "?NOLYRICS"
        nList.Lyric = False
        nList.LyricSize = 0
      Else
'        nItem.SubItems(1) = ""
'        nItem.ListSubItems(1).ReportIcon = IIf(UCase(FS.GetExtensionName(LyricFile)) = "LRC", "?LYRICS", "?LYRICEXRACTED")
        nList.Lyric = True
        nList.LyricSize = LyricSize
        nList.LyricFile = LyricFile
      End If
    Case Else
      '��ʲ�����
      nList.Lyric = False
      nList.LyricSize = 0
      nList.LyricFile = vbNullString
    End Select
    
    '����ļ���С�ʹ���ʱ��
    nList.Size = F.Size
    
    If Not NoTime Then
'      nItem.SubItems(12) = F.DateCreated
      nList.CreateDate = F.DateCreated
      nList.CreateDateW = Format(F.DateCreated, "yyyymmddhhmmss")
    End If
    
    '��ӵ�����
    If (PS_AutoFolderTree) And (CBool(PS_AutoFolderIndex)) Then
      '�����Ҫ�Զ������ļ���
      Select Case PS_AutoFolderIndex
      Case 1
        'ʹ�������Ҵ����ļ���
        sSubFolder = IIf(Len(nList.Artist) > 0, nList.Artist, "(δ֪������)")
      Case 2
        'ʹ��ר�������ļ���
        sSubFolder = IIf(Len(nList.Album) > 0, nList.Album, "(δ֪ר��)")
      Case 3
        'ʹ��ʱ�䴴���ļ���
        Select Case DateDiff("d", nList.CreateDate, Now)
        Case 0: sSubFolder = "����"
        Case 1 To 7: sSubFolder = "����"
        Case 7 To 31: sSubFolder = "����"
        Case 31 To 356: sSubFolder = "����"
        Case Else: sSubFolder = "(����ʱ��)"
        End Select
      Case 4
        'ʹ�����ɴ����ļ���
        sSubFolder = IIf(Len(nList.Genre) > 0, nList.Genre, "(δ֪����)")
      End Select
      
      '��ʼ���
      Dim nNode As MSComctlLib.Node
      Dim nListInfo As MP3PA.ListFolder
      
      '����Ƿ�����ļ���
      If Not CurrentListFolder.SubFolders.Exist(sSubFolder) Then
        '�����û�о����һ�����ļ���
        Set nListInfo = CurrentListFolder.SubFolders.Add(CurrentListFolder, sSubFolder)
        Set nNode = tvwList.Nodes.Add(tvwList.selectedItem.Index, tvwChild, , sSubFolder, 5)
        nNode.SelectedImage = 6
        nNode.Sorted = True
        Set nNode.tag = nListInfo
      End If
        
      '��������ӵ�����
      If Not CheckForDuplicate(CurrentListFolder.SubFolders(sSubFolder).ListFiles, nList.FileName) Then
        CurrentListFolder.SubFolders(sSubFolder).ListFiles.Add nList
      End If
    Else
      '�������Ҫ�Զ������ļ���
      If nList.Index > PlayListInfo.Count Then
        PlayListInfo.Add nList
      Else
        PlayListInfo.Add nList, , nList.Index
      End If
    End If
  Next i
  On Error GoTo 0
  
  '�����б�
  Dim nItem As MSComctlLib.ListItem
  
  ShowProgress True, "���ڸ����б�...", False
    
'  If PlayListInfo.Count <= lCount Then
'    lCount = 0
'  End If
  
  If Not ((PS_AutoFolderTree) And (CBool(PS_AutoFolderIndex))) Then
    For i = lCount + 1 To oFile.Count + lCount
      Set nItem = lvwList.ListItems.Add(i, , i)
      Set nList = PlayListInfo(i)
      
      nItem.SmallIcon = nList.IconIndex
      nItem.SubItems(1) = vbNullString
      nItem.SubItems(3) = FS.GetFileName(nList.FileName)
      nItem.SubItems(4) = nList.Artist
      nItem.SubItems(5) = nList.Title
      nItem.SubItems(6) = nList.Album
      nItem.SubItems(7) = nList.Genre
      nItem.SubItems(8) = nList.LengthString
      nItem.SubItems(9) = IIf(nList.Track < 1, vbNullString, nList.Track)
      nItem.SubItems(10) = nList.Year
      nItem.SubItems(11) = FormatNumber(nList.Size \ 1024, 0, vbTrue, vbTrue) & " KB"
      nItem.SubItems(12) = nList.CreateDate
      nItem.tag = nList.FileName
      nItem.Selected = True
      
      If nList.AudioFile Then
        If nList.Lyric Then
          nItem.ListSubItems(1).ReportIcon = IIf(UCase(FS.GetExtensionName(nList.LyricFile)) = "LRC", "?LYRICS", "?LYRICEXRACTED")
        Else
          nItem.ListSubItems(1).ReportIcon = "?NOLYRICS"
        End If
      Else
        nItem.ListSubItems(1).ReportIcon = Empty
      End If
    
      If nList.TagExist Then
        nItem.ListSubItems(2).ReportIcon = nList.TagImlKey
        nItem.ListSubItems(2).Text = nList.TagText
        nItem.ListSubItems(2).ForeColor = nList.TagColor
      Else
        nItem.ListSubItems(2).ReportIcon = Empty
        nItem.ListSubItems(2).Text = vbNullString
      End If
    Next i
  End If
  
  '����ͼ��
  Set PlayListKeys = New VBA.Collection
  
  For i = 1 To PlayListInfo.Count
    PlayListInfo(i).Index = i
    lvwList.ListItems(i).Text = i
    PlayListKeys.Add i, PlayListInfo(i).FileName
  Next i
  
  DoEvents
  RecalcSize ((PS_AutoFolderTree) And (CBool(PS_AutoFolderIndex)))
  RefreshChart
  
  Set oMedia = Nothing
  Me.MousePointer = 0
  lvwList.Visible = True
  ShowProgress False, ""
  
  Exit Sub
ErrorResume:
  '��������������һ��
  i = i + 1
  GoTo ReadInfo
End Sub

Private Sub tvwProgram_GotFocus()
  Select Case ActivePage
  Case 4: lvwProgram_ItemClick Nothing
  End Select
End Sub

Private Sub tvwProgram_KeyDown(KeyCode As Integer, Shift As Integer)
  'Alt+Enter
  If (KeyCode = vbKeyReturn) And (Shift = vbAltMask) Then mnuProperty_Click

  'Ctrl+Enter
  If (KeyCode = vbKeyReturn) And (Shift = vbCtrlMask) Then mnuOpen_Click
End Sub

Private Sub tvwProgram_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
  If Button = 2 And Shift = 0 Then
    PopupMenu popTvwProgram
  End If
End Sub

Private Sub tvwProgram_NodeClick(ByVal Node As MSComctlLib.Node)
  'ˢ���ļ�
  Dim nItem As MSComctlLib.ListItem
  Dim sPath As String
  Dim fplItem As MP3PA.PlaylistReader.FPL_ITEM_INFO
  Dim m3uItem As MP3PA.PlaylistReader.M3U_ITEM_INFO
  Dim sIconKey As String
  Dim hSmall As Long
  Dim hLarge As Long
  Dim FINF1 As SHFILEINFO
  Dim FINF2 As SHFILEINFO
  Dim CurrentFile As String
  
  stbDefault.Panels(1).ToolTipText = "0 ���ļ�, �ܹ���С 0 KB"
  stbDefault.Panels(1).Text = "0 ���ļ�, �ܹ���С 0 KB"
  
  '�����п�
  Select Case lvwProgram.tag
  Case "FOOBAR"
    For i = 1 To 12
      lLVWFoobarWidth(i) = lvwProgram.ColumnHeaders(i).Width
    Next i
  Case "WINAMP", "TTPLAYER"
    For i = 1 To 3
      lLVWWinampWidth(i) = lvwProgram.ColumnHeaders(i).Width
    Next i
  Case "WMP"
    For i = 1 To 8
      lLVWWMPWidth(i) = lvwProgram.ColumnHeaders(i).Width
    Next i
  End Select
  
  lvwProgram.ListItems.Clear

  If Node.Children = 0 Then
    '���ӽڵ�
    Me.MousePointer = 11
    
    Select Case Node.Image
    Case "FOOBAR_LIST"
      '���� FOOBAR ���б�
      If lvwProgram.tag <> "FOOBAR" Then
        lvwProgram.ColumnHeaders.Clear
        lvwProgram.ColumnHeaderIcons = iltAppHeader
        lvwProgram.tag = "FOOBAR"
        
        With lvwProgram.ColumnHeaders
          .Add , , "���", lLVWFoobarWidth(1), , "NUMBER"
          .Add , , "������", lLVWFoobarWidth(2), , "ARTIST"
          .Add , , "����", lLVWFoobarWidth(3), , "TITLE"
          .Add , , "ר��", lLVWFoobarWidth(4), , "ALBUM"
          .Add , , "����", lLVWFoobarWidth(5), lvwColumnRight, "TRACKNUMBER"
          .Add , , "���", lLVWFoobarWidth(6), lvwColumnRight, "DATE"
          .Add , , "����", lLVWFoobarWidth(7), , "GENRE"
          .Add , , "������", lLVWFoobarWidth(8), , "BITRATE"
          .Add , , "������", lLVWFoobarWidth(9), lvwColumnRight, "SAMPLERATE"
          .Add , , "����", lLVWFoobarWidth(10), lvwColumnRight, "CHANNELS"
          .Add , , "����", lLVWFoobarWidth(11), , "CODEC"
          .Add , , "������ģʽ", lLVWFoobarWidth(12), , "MP3STEREOMODE"
          
          .Item(2).tag = "SEARCH_FIELD"
          .Item(3).tag = "SEARCH_FIELD"
          .Item(4).tag = "SEARCH_FIELD"
        End With
      
        ffmSearch.UpdateHeader lvwProgram
      End If
      
      '��ȡ�ļ�
      ShowProgress False, "���ڶ�ȡ Foobar �����嵥..."
      DoEvents
      
      If PlaylistReader.ReadFplInfo(Node.tag) Then
        '�����Ŀ
        ShowProgress True, "���ڸ����б�...", False
        
        If PlaylistReader.FplListCount > 0 Then
          ReDim AppFileSize(1 To PlaylistReader.FplListCount) As Double
          
          On Error Resume Next
          For i = 1 To PlaylistReader.FplListCount
            Set nItem = lvwProgram.ListItems.Add
            fplItem = PlaylistReader.GetFplInfoItem(i)
            
            If Left(fplItem.FileName, 7) = "file://" Then
              sPath = Right(fplItem.FileName, Len(fplItem.FileName) - 7)
              
              nItem.Text = i
              nItem.SubItems(1) = fplItem.Artist
              nItem.SubItems(2) = fplItem.Title
              nItem.SubItems(3) = fplItem.Album
              nItem.SubItems(4) = IIf(fplItem.TrackNumber > 0, fplItem.TrackNumber, "")
              nItem.SubItems(5) = fplItem.DateYear
              nItem.SubItems(6) = fplItem.Genre
              nItem.SubItems(7) = fplItem.Bitrate & " kbps" & IIf(fplItem.VBR, " VBR", "")
              nItem.SubItems(8) = Format(fplItem.SampleRate / 1000, "#00.0 kHz")
              nItem.SubItems(9) = fplItem.Channels
              nItem.SubItems(10) = fplItem.Codec
              nItem.SubItems(11) = fplItem.Mp3StereoMode
              nItem.tag = sPath
              AppFileSize(i) = fplItem.FileSize
            End If
          Next i
          On Error GoTo 0
        End If
      End If
      
      ShowProgress False, vbNullString
    '==================================
    Case "WINAMP_LIST"
      '���� WINAMP ���б�
      If lvwProgram.tag <> "WINAMP" Then
        lvwProgram.ColumnHeaders.Clear
        lvwProgram.ColumnHeaderIcons = iltAppHeader
        lvwProgram.tag = "WINAMP"
        
        With lvwProgram.ColumnHeaders
          .Add , , "���", lLVWWinampWidth(1), , "NUMBER"
          .Add , , "��ʾ����", lLVWWinampWidth(2), , "DISP_TITLE"
          .Add , , "����", lLVWWinampWidth(3), lvwColumnRight, "TIME"
        
          .Item(2).tag = "SEARCH_FIELD"
        End With
      
        ffmSearch.UpdateHeader lvwProgram
      End If
      
      '��ȡ�ļ�
      ShowProgress True, "���ڶ�ȡ Winamp �����嵥..."
      
      On Error Resume Next
      If PlaylistReader.ReadM3UInfo(Node.tag) Then
        '�����Ŀ
        ShowProgress True, "���ڸ����б�...", False
        
        If PlaylistReader.M3UListCount Then
          ReDim AppFileSize(1 To PlaylistReader.M3UListCount) As Double
          
          For i = 1 To PlaylistReader.M3UListCount
            Set nItem = lvwProgram.ListItems.Add
            m3uItem = PlaylistReader.GetM3UInfoItem(i)
            
            nItem.Text = i
            nItem.SubItems(1) = m3uItem.DispTitle
            nItem.SubItems(2) = IIf(m3uItem.Length > 0, (m3uItem.Length \ 60) & ":" & Format((m3uItem.Length Mod 60), "00"), "")
            nItem.tag = m3uItem.FileName
            AppFileSize(i) = FS.GetFile(m3uItem.FileName).Size
          Next i
        End If
      End If
      On Error GoTo 0
      
      ShowProgress False, vbNullString
    '==================================
    Case "TTPLAYER_LIST"
      '������쾲�����б�
      If lvwProgram.tag <> "TTPLAYER" Then
        lvwProgram.ColumnHeaders.Clear
        lvwProgram.ColumnHeaderIcons = iltAppHeader
        lvwProgram.tag = "WINAMP"
        
        With lvwProgram.ColumnHeaders
          .Add , , "���", lLVWWinampWidth(1), , "NUMBER"
          .Add , , "��ʾ����", lLVWWinampWidth(2), , "DISP_TITLE"
          .Add , , "����", lLVWWinampWidth(3), lvwColumnRight, "TIME"
        
          .Item(2).tag = "SEARCH_FIELD"
        End With
      
        ffmSearch.UpdateHeader lvwProgram
      End If
      
      '��ȡ�ļ�
      ShowProgress True, "���ڶ�ȡ���쾲�������嵥..."
      
      On Error Resume Next
      If Len(PlaylistReader.ReadTTPLInfo(Node.tag)) Then
        '�����Ŀ
        ShowProgress True, "���ڸ����б�...", False
        
        If PlaylistReader.M3UListCount Then
          ReDim AppFileSize(1 To PlaylistReader.M3UListCount) As Double
          
          For i = 1 To PlaylistReader.M3UListCount
            Set nItem = lvwProgram.ListItems.Add
            m3uItem = PlaylistReader.GetM3UInfoItem(i)
            
            nItem.Text = i
            nItem.SubItems(1) = m3uItem.DispTitle
            nItem.SubItems(2) = IIf(m3uItem.Length > 0, (m3uItem.Length \ 60) & ":" & Format((m3uItem.Length Mod 60), "00"), "")
            nItem.tag = m3uItem.FileName
            AppFileSize(i) = FS.GetFile(m3uItem.FileName).Size
          Next i
        End If
      End If
      On Error GoTo 0
      
      ShowProgress False, vbNullString
    '==================================
    Case "WMP_LIST", "WMP_AUTOLIST"
      '���� WMP ���б�
      If lvwProgram.tag <> "WMP" Then
        lvwProgram.ColumnHeaders.Clear
        lvwProgram.ColumnHeaderIcons = iltAppHeader
        lvwProgram.tag = "WMP"
        
        With lvwProgram.ColumnHeaders
          .Add , , "���", lLVWFoobarWidth(1), , "NUMBER"
          .Add , , "������", lLVWFoobarWidth(2), , "ARTIST"
          .Add , , "����", lLVWFoobarWidth(3), , "TITLE"
          .Add , , "ר��", lLVWFoobarWidth(4), , "ALBUM"
          .Add , , "����", lLVWFoobarWidth(5), lvwColumnRight, "TRACKNUMBER"
          .Add , , "����", lLVWFoobarWidth(6), lvwColumnRight, "TIME"
          .Add , , "���", lLVWFoobarWidth(7), lvwColumnRight, "DATE"
          .Add , , "����", lLVWFoobarWidth(8), , "GENRE"
        
          .Item(2).tag = "SEARCH_FIELD"
          .Item(3).tag = "SEARCH_FIELD"
          .Item(4).tag = "SEARCH_FIELD"
        End With
      
        ffmSearch.UpdateHeader lvwProgram
      End If
      
      '��ʾ�ļ�
      Dim WLArray As WMPLibCtl.IWMPPlaylistArray
      Dim WList As WMPLibCtl.IWMPPlaylist
      Dim WMedia As WMPLibCtl.IWMPMedia
      
      Set WLArray = ffmVideo.WMP.playlistCollection.getByName(Node.Text)
      Set WList = WLArray.Item(0)
      
      If WList.Count = 0 Then
        ffmSearch.Research
        Me.MousePointer = 0
        Exit Sub
      End If
      
      ReDim AppFileSize(1 To WList.Count) As Double
      
      ShowProgress True, "���ڶ�ȡ WMP �����嵥...", True
      pbeDefault.Max = WList.Count
      pbeDefault.value = 0
      picBack.ZOrder 0
      picBack.Visible = True
      lvwProgram.Visible = False
      
      On Error GoTo AddIcon
      For i = 0 To WList.Count - 1
        Set WMedia = WList.Item(i)
        
        If FS.FileExists(WMedia.sourceURL) Then
          Set nItem = lvwProgram.ListItems.Add
  
          nItem.Text = i + 1
          nItem.SubItems(1) = WMedia.getItemInfo("Author")
          nItem.SubItems(2) = WMedia.getItemInfo("Title")
          nItem.SubItems(3) = WMedia.getItemInfo("WM/AlbumTitle")
          nItem.SubItems(4) = WMedia.getItemInfo("WM/TrackNumber")
          nItem.SubItems(5) = WMedia.durationString
          nItem.ListSubItems(5).tag = WMedia.Duration
          nItem.SubItems(6) = WMedia.getItemInfo("WM/Year")
          nItem.SubItems(7) = WMedia.getItemInfo("WM/Genre")
          nItem.tag = WMedia.sourceURL
          AppFileSize(i + 1) = WMedia.getItemInfo("FileSize")
        End If
          
        pbeDefault.value = pbeDefault.value + 1
      Next i
      
      picBack.ZOrder 1
      picBack.Visible = False
      lvwProgram.Visible = True
      lvwProgram.ZOrder 0
      ShowProgress False, ""
      On Error GoTo 0
    End Select
    
AddIcon:    '���ͼ��
    For i = 1 To lvwProgram.ListItems.Count
      CurrentFile = lvwProgram.ListItems(i).tag

      Select Case UCase(FS.GetExtensionName(CurrentFile))
      Case "EXE", "SCR", "ICL", "ICO"
        sIconKey = UCase(FS.GetFileName(CurrentFile))

        If Not ItemExistOBJ(sIconKey, iltList.ListImages) Then
          'ͼ�겻����
          picPainter.Cls
          hSmall = SHGetFileInfo(CurrentFile, 0, FINF1, Len(FINF1), BASIC_SHGFI_FLAGS Or SHGFI_SMALLICON)
          r = ImageList_Draw(hSmall, FINF1.iIcon, picPainter.hdc, 0, 0, ILD_TRANSPARENT)
          iltList.ListImages.Add , sIconKey, picPainter.Image
        End If
      Case ""
        sIconKey = "?NOEXTNAME"

        If Not ItemExistOBJ(sIconKey, iltList.ListImages) Then
          'ͼ�겻����
          picPainter.Cls
          hSmall = SHGetFileInfo(CurrentFile, 0, FINF1, Len(FINF1), BASIC_SHGFI_FLAGS Or SHGFI_SMALLICON)
          r = ImageList_Draw(hSmall, FINF1.iIcon, picPainter.hdc, 0, 0, ILD_TRANSPARENT)
          iltList.ListImages.Add , sIconKey, picPainter.Image
        End If
      Case Else
        sIconKey = UCase(FS.GetExtensionName(CurrentFile))

        If Not ItemExistOBJ(sIconKey, iltList.ListImages) Then
          'ͼ�겻����
          picPainter.Cls
          hSmall = SHGetFileInfo(CurrentFile, 0, FINF1, Len(FINF1), BASIC_SHGFI_FLAGS Or SHGFI_SMALLICON)
          r = ImageList_Draw(hSmall, FINF1.iIcon, picPainter.hdc, 0, 0, ILD_TRANSPARENT)
          iltList.ListImages.Add , sIconKey, picPainter.Image
        End If
      End Select
      
      On Error GoTo InitILT
      lvwProgram.ListItems(i).SmallIcon = sIconKey
      On Error GoTo 0
    Next i
    
    DoEvents
  Else
    lvwProgram.tag = vbNullString
  End If
  
  If lvwProgram.ListItems.Count > 0 Then
    lvwProgram.ListItems(1).Selected = True
    lvwProgram_ItemClick lvwProgram.selectedItem
  End If
  
  ffmSearch.Research
  Me.MousePointer = 0
  Exit Sub
InitILT:
  lvwProgram.SmallIcons = iltList
End Sub

Private Sub MoveItems(ByVal pos As Long)
  '�ƶ���Ŀ
  Dim xInfo As MP3PA.ListInfo
  Dim xItem As MSComctlLib.ListItem
  Dim nItem As MSComctlLib.ListItem
  Dim SubItem(1 To 12) As String
  Dim LyricIcon As Long
  Dim SmallIcon As String
  
  If pos < 0 Then
    For i = 1 To lvwList.ListItems.Count
      If lvwList.ListItems(i).Selected Then
        '�ƶ������е���Ŀ
        Set xInfo = PlayListInfo(i)
        LyricIcon = IIf(xInfo.Lyric, 1, 2)
        PlayListInfo.Remove i
        
        If (i + pos) > PlayListInfo.Count Then
          PlayListInfo.Add xInfo, xInfo.FileName
        Else
          PlayListInfo.Add xInfo, xInfo.FileName, i + pos
        End If
        
        '�ƶ��б�
        Set xItem = lvwList.ListItems(i)
        SubItem(1) = xItem.SubItems(1)
        SubItem(2) = xItem.SubItems(2)
        SubItem(3) = xItem.SubItems(3)
        SubItem(4) = xItem.SubItems(4)
        SubItem(5) = xItem.SubItems(5)
        SubItem(6) = xItem.SubItems(6)
        SubItem(7) = xItem.SubItems(7)
        SubItem(8) = xItem.SubItems(8)
        SubItem(9) = xItem.SubItems(9)
        SubItem(10) = xItem.SubItems(10)
        SubItem(11) = xItem.SubItems(11)
        SubItem(12) = xItem.SubItems(12)
        SmallIcon = lvwList.ListItems(i).SmallIcon
        
        lvwList.ListItems.Remove i
        
        Set xItem = lvwList.ListItems.Add(i + pos)
        xItem.SubItems(1) = SubItem(1)
        xItem.SubItems(2) = SubItem(2)
        xItem.SubItems(3) = SubItem(3)
        xItem.SubItems(4) = SubItem(4)
        xItem.SubItems(5) = SubItem(5)
        xItem.SubItems(6) = SubItem(6)
        xItem.SubItems(7) = SubItem(7)
        xItem.SubItems(8) = SubItem(8)
        xItem.SubItems(9) = SubItem(9)
        xItem.SubItems(10) = SubItem(10)
        xItem.SubItems(11) = SubItem(11)
        xItem.SubItems(12) = SubItem(12)
        xItem.SmallIcon = SmallIcon
        xItem.Selected = True
        
        Select Case UCase(FS.GetExtensionName(xInfo.FileName))
        Case "MP3", "WMA"
          xItem.ListSubItems(1).ReportIcon = CLng(LyricIcon)
          xItem.ListSubItems(2).ForeColor = xInfo.TagColor
          xItem.ListSubItems(2).ReportIcon = IIf(Len(xInfo.TagImlKey), xInfo.TagImlKey, Empty)
        End Select
      End If
    Next i
  ElseIf pos > 0 Then
    For i = lvwList.ListItems.Count To 1 Step -1
      If lvwList.ListItems(i).Selected Then
        '�ƶ������е���Ŀ
        Set xInfo = PlayListInfo(i)
        LyricIcon = IIf(xInfo.Lyric, 1, 2)
        PlayListInfo.Remove i
        
        If (i + pos) > PlayListInfo.Count Then
          PlayListInfo.Add xInfo, xInfo.FileName
        Else
          PlayListInfo.Add xInfo, xInfo.FileName, i + pos
        End If
        
        '�ƶ��б�
        Set xItem = lvwList.ListItems(i)
        SubItem(1) = xItem.SubItems(1)
        SubItem(2) = xItem.SubItems(2)
        SubItem(3) = xItem.SubItems(3)
        SubItem(4) = xItem.SubItems(4)
        SubItem(5) = xItem.SubItems(5)
        SubItem(6) = xItem.SubItems(6)
        SubItem(7) = xItem.SubItems(7)
        SubItem(8) = xItem.SubItems(8)
        SubItem(9) = xItem.SubItems(9)
        SubItem(10) = xItem.SubItems(10)
        SubItem(11) = xItem.SubItems(11)
        SubItem(12) = xItem.SubItems(12)
        SmallIcon = lvwList.ListItems(i).SmallIcon
        
        lvwList.ListItems.Remove i
        
        Set xItem = lvwList.ListItems.Add(i + pos)
        xItem.SubItems(1) = SubItem(1)
        xItem.SubItems(2) = SubItem(2)
        xItem.SubItems(3) = SubItem(3)
        xItem.SubItems(4) = SubItem(4)
        xItem.SubItems(5) = SubItem(5)
        xItem.SubItems(6) = SubItem(6)
        xItem.SubItems(7) = SubItem(7)
        xItem.SubItems(8) = SubItem(8)
        xItem.SubItems(9) = SubItem(9)
        xItem.SubItems(10) = SubItem(10)
        xItem.SubItems(11) = SubItem(11)
        xItem.SubItems(12) = SubItem(12)
        xItem.ListSubItems(1).ReportIcon = LyricIcon
        xItem.SmallIcon = SmallIcon
        xItem.Selected = True
      
        Select Case UCase(FS.GetExtensionName(xInfo.FileName))
        Case "MP3", "WMA"
          xItem.ListSubItems(1).ReportIcon = CLng(LyricIcon)
          xItem.ListSubItems(2).ForeColor = xInfo.TagColor
          xItem.ListSubItems(2).ReportIcon = IIf(Len(xInfo.TagImlKey), xInfo.TagImlKey, Empty)
        End Select
      End If
    Next i
  End If
  
  '�����������
  Set PlayListKeys = New VBA.Collection
  
  For i = 1 To PlayListInfo.Count
    PlayListInfo(i).Index = i
    PlayListKeys.Add i, PlayListInfo(i).FileName
    lvwList.ListItems(i).Text = i
  Next i
End Sub

Private Sub ExpandTree(ByVal TreeView As MSComctlLib.TreeView, ByVal Node As MSComctlLib.Node)
  Dim NodeChildren As New Collection
  Dim CurrentNode As MSComctlLib.Node
  Dim FOS As Scripting.Folders
  Dim FO As Scripting.Folder
  Dim nNode As MSComctlLib.Node
  
  '�����һ���ļ���
  If (Not CBool(Node.Children)) Or (Node.tag) Then
    Exit Sub
  End If
  
  Me.MousePointer = 11
  Me.Enabled = False
  TreeView.Enabled = False
  'tmrRefresh.Enabled = False
  DoEvents
  
  '������е��ӽڵ������
  Set CurrentNode = Node.Child
  
  Do Until CurrentNode.LastSibling = CurrentNode
    NodeChildren.Add CurrentNode
    Set CurrentNode = CurrentNode.Next
  Loop
  
  NodeChildren.Add CurrentNode
  ShowProgress True, "���ڶ�ȡĿ¼..."
  pbeDefault.value = 0
  pbeDefault.Max = NodeChildren.Count
  
  '����ӽڵ���ļ���
  For i = 1 To NodeChildren.Count
    Set CurrentNode = NodeChildren(i)
    
    If FS.GetDrive(Left(CurrentNode.Key, 2)).IsReady Then
      Set FOS = FS.GetFolder(CurrentNode.Key).SubFolders
      
      '���
      For Each FO In FOS
        If Not ItemExist(FO.Path, TreeView.Nodes) Then
          If (Not CBool(FO.Attributes And Hidden)) And (Not CBool(FO.Attributes And System)) And (Not UCase(FO.Name) = "RECYCLED") Then
            Set nNode = TreeView.Nodes.Add(CurrentNode.Key, tvwChild, FO.Path, FO.Name)
            nNode.tag = False
            nNode.Image = GetFolderIconIndex(FO.Path)
            nNode.Sorted = True
            If nNode.Image = "?FOLDER" Then nNode.SelectedImage = "?FOLDERSEL"
          End If
        End If
      Next FO
    End If
    
    pbeDefault.value = pbeDefault.value + 1
  Next i
  On Error GoTo 0
  
  Node.tag = True
  ShowProgress False, ""
  Me.MousePointer = 0
  Me.Enabled = True
  TreeView.Enabled = True
  'tmrRefresh.Enabled = True
  
  SetObjectFocus TreeView.hWnd
End Sub

Private Sub RefreshFile(ByVal Node As MSComctlLib.Node)
  'ˢ���ļ�
  Dim nItem As MSComctlLib.ListItem
  Dim CurrentFile As String
  Dim FileExt As String
  Dim hSmall As Long
  Dim hLarge As Long
  Dim FINF1 As SHFILEINFO
  Dim FINF2 As SHFILEINFO
  Dim F As Scripting.File
  Dim ts As Variant
  'Me.Enabled = False
  'tmrRefresh.Enabled = False
  
  tbrBroswer.Buttons(1).Enabled = Not (Node Is Node.Root)
  
  If Node.Key = "?MYCOMPUTER" Then
    'ѡ����Ǹ�
    lvwFile.ListItems.Clear
    Set lvwFile.Icons = Nothing
    Set lvwFile.SmallIcons = Nothing
    iltLarge.ListImages.Clear
    iltSmall.ListImages.Clear
  Else
    '���
    If ProcessRunning Then
      CancelProcess = True
    End If
    
    If Right(Node.Key, 1) = "\" Then
      CurrentPath = Node.Key
    Else
      CurrentPath = Node.Key & "\"
    End If
    
    If (UCase(IIf(Right(flFile.Path, 1) = "\", flFile.Path, flFile.Path & "\")) = UCase(CurrentPath)) And (flFile.Pattern = CurrentFilter) Then GoTo ProcessEnd
    
StartFillFile:
    lvwFile.ListItems.Clear
    Set lvwFile.Icons = Nothing
    Set lvwFile.SmallIcons = Nothing
    iltLarge.ListImages.Clear
    iltSmall.ListImages.Clear
    
    flFile.Pattern = CurrentFilter
    On Error GoTo ProcessEnd
    flFile.Path = CurrentPath
    
    If Right(Node.Key, 1) = "\" Then
      CurrentPath = Node.Key
    Else
      CurrentPath = Node.Key & "\"
    End If
    
    If flFile.ListCount = 0 Then GoTo ProcessEnd
    
    '���ý�����
    Me.MousePointer = 11
    ShowProgress True, "�����г��ļ�..."
    pbeDefault.Max = flFile.ListCount
    pbeDefault.value = 1
    lvwFile.Visible = False
    picBack.Visible = True
    picBack.ZOrder 0
    ProcessRunning = True
    
    '���ô�С�ı���
    For i = 0 To flFile.ListCount - 1
      '���
      CurrentFile = CurrentPath & flFile.List(i)
      FileExt = UCase(FS.GetExtensionName(CurrentFile))
      
      Set nItem = lvwFile.ListItems.Add(, UCase(CurrentFile), flFile.List(i))
      
      If (FileExt = "EXE") Or (FileExt = "SCR") Or (FileExt = "ICO") Then
        picPainter.Cls
        picPainterL.Cls
        hSmall = SHGetFileInfo(CurrentFile, 0, FINF1, Len(FINF1), BASIC_SHGFI_FLAGS Or SHGFI_SMALLICON)
        hLarge = SHGetFileInfo(CurrentFile, 0, FINF2, Len(FINF2), BASIC_SHGFI_FLAGS Or SHGFI_LARGEICON)
        r = ImageList_Draw(hSmall, FINF1.iIcon, picPainter.hdc, 0, 0, ILD_TRANSPARENT)
        r = ImageList_Draw(hLarge, FINF2.iIcon, picPainterL.hdc, 0, 0, ILD_TRANSPARENT)
        iltLarge.ListImages.Add , CurrentFile, picPainterL.Image
        iltSmall.ListImages.Add , CurrentFile, picPainter.Image
        
        Set lvwFile.Icons = iltLarge
        Set lvwFile.SmallIcons = iltSmall
        
        nItem.SmallIcon = CurrentFile
        nItem.Icon = CurrentFile
      ElseIf Len(FileExt) = 0 Then
        On Error GoTo AddNoImage
        nItem.SmallIcon = "?NOEXTNAME"
        nItem.Icon = "?NOEXTNAME"
        On Error GoTo ProcessEnd
      Else
        On Error GoTo AddImage
        nItem.SmallIcon = "EXT_" & FileExt
        nItem.Icon = "EXT_" & FileExt
        On Error GoTo ProcessEnd
      End If
      
'      If CancelProcess Then
'        CancelProcess = False
'        ProcessRunning = False
'        Exit Sub
'      End If
      
      Set F = FS.GetFile(CurrentFile)
      
      nItem.SubItems(5) = Format(F.Size, String(12, "0"))
      nItem.SubItems(1) = FormatNumber(F.Size \ 1024, 0, vbTrue) & " KB"
      nItem.SubItems(2) = F.Type
      nItem.SubItems(3) = Format(F.DateLastModified, "yyyy-mm-dd hh:mm:ss")
      nItem.SubItems(4) = Format(F.DateCreated, "yyyy-mm-dd hh:mm:ss")
      nItem.ListSubItems(1).tag = F.Path
      
      pbeDefault.value = pbeDefault.value + 1
      ts = lvwFile.ListItems(i + 1).tag
    Next i
  End If
  
ProcessEnd:
  On Error Resume Next
  Me.MousePointer = 0
  ShowProgress False, ""
  lvwFile.Visible = True
  picBack.Visible = False
  picBack.ZOrder 1
  CancelProcess = False
  ProcessRunning = False
  Me.Enabled = True
  'tmrRefresh.Enabled = True
  lvwFile_ItemClick lvwFile.selectedItem
  Exit Sub
  
AddImage:
  picPainter.Cls
  picPainterL.Cls
  hSmall = SHGetFileInfo(CurrentFile, 0, FINF1, Len(FINF1), BASIC_SHGFI_FLAGS Or SHGFI_SMALLICON)
  hLarge = SHGetFileInfo(CurrentFile, 0, FINF2, Len(FINF2), BASIC_SHGFI_FLAGS Or SHGFI_LARGEICON)
  r = ImageList_Draw(hSmall, FINF1.iIcon, picPainter.hdc, 0, 0, ILD_TRANSPARENT)
  r = ImageList_Draw(hLarge, FINF2.iIcon, picPainterL.hdc, 0, 0, ILD_TRANSPARENT)
  iltLarge.ListImages.Add , "EXT_" & FileExt, picPainterL.Image
  iltSmall.ListImages.Add , "EXT_" & FileExt, picPainter.Image
  Set lvwFile.Icons = iltLarge
  Set lvwFile.SmallIcons = iltSmall
  Resume

AddNoImage:
  picPainter.Cls
  picPainterL.Cls
  hSmall = SHGetFileInfo(CurrentFile, 0, FINF1, Len(FINF1), BASIC_SHGFI_FLAGS Or SHGFI_SMALLICON)
  hLarge = SHGetFileInfo(CurrentFile, 0, FINF2, Len(FINF2), BASIC_SHGFI_FLAGS Or SHGFI_LARGEICON)
  r = ImageList_Draw(hSmall, FINF1.iIcon, picPainter.hdc, 0, 0, ILD_TRANSPARENT)
  r = ImageList_Draw(hLarge, FINF2.iIcon, picPainterL.hdc, 0, 0, ILD_TRANSPARENT)
  iltLarge.ListImages.Add , "?NOEXTNAME", picPainterL.Image
  iltSmall.ListImages.Add , "?NOEXTNAME", picPainter.Image
  Set lvwFile.Icons = iltLarge
  Set lvwFile.SmallIcons = iltSmall
  Resume
End Sub

Public Sub SortList(ByVal SortKey As String, Optional SortAscending As Boolean = True, Optional SortItems As VBA.Collection, Optional SortSelection As Boolean = True)
  '����
  Dim OriList As New VBA.Collection
  Dim NewList As New VBA.Collection
  Dim nList As MP3PA.ListInfo
  Dim nItem As MSComctlLib.ListItem
  Dim SK As String
  Dim Added As Boolean
  Dim lCount As Long
  
  Dim MDFileName As Long
  Dim MDArtist As Long
  Dim MDTitle As Long
  Dim MDAlbum As Long
  Dim MDGenre As Long
  Dim MDLength As Long
  Dim MDTrack As Long
  Dim MDYear As Long
  Dim MDSize As Long
  
  Dim sFileName As String
  Dim SArtist As String
  Dim sTitle As String
  Dim SAlbum As String
  Dim FTGenre As String
  Dim FTLength As String
  Dim FTTrack As String
  Dim FTYear As String
  Dim FTSize As String
  
  lCount = PlayListInfo.Count
  
  '׼����Ŀ
  If SortItems Is Nothing Then
    Set SortItems = New VBA.Collection
  
    For i = 1 To lCount
      If (Not SortSelection) Or (lvwList.ListItems(i).Selected) Then
        SortItems.Add i
        OriList.Add PlayListInfo.Item(i)
      End If
    Next i
  Else
    For i = 1 To SortItems.Count
      OriList.Add PlayListInfo(SortItems(i))
    Next i
  End If
  
  '���С������Ŀ���˳�
  If OriList.Count < 2 Then Exit Sub

  '�򿪽�����ʾ
  ShowProgress True, "��������..."
  Me.Enabled = False
  Me.MousePointer = 11
  pbeDefault.value = 0
  pbeDefault.Max = OriList.Count * 7
  
  '���������Ŀ
  For i = 1 To OriList.Count
    pbeDefault.value = pbeDefault.value + 1
    
    '��ʼ�ȶ�
    Set nList = OriList(i)
    
    If MDFileName < Len(nList.FileName) Then MDFileName = Len(nList.FileName)
    If MDArtist < Len(nList.Artist) Then MDArtist = Len(nList.Artist)
    If MDTitle < Len(nList.Title) Then MDTitle = Len(nList.Title)
    If MDAlbum < Len(nList.Album) Then MDAlbum = Len(nList.Album)
    If MDYear < Len(nList.Year) Then MDYear = Len(nList.Year)
    
    If MDGenre < Len(CStr(nList.Genre)) Then MDGenre = Len(CStr(nList.Genre))
    If MDLength < Len(CStr(nList.Length)) Then MDLength = Len(CStr(nList.Length))
    If MDTrack < Len(CStr(nList.Track)) Then MDTrack = Len(CStr(nList.Track))
    If MDSize < Len(CStr(nList.Size)) Then MDSize = Len(CStr(nList.Size))
    
    '����һЩ����
    nList.Selected = lvwList.ListItems(i).Selected
  Next i
  
  FTGenre = String(MDGenre, "0")
  FTLength = String(MDLength, "0")
  FTTrack = String(MDTrack, "0")
  FTYear = String(MDYear, "0")
  FTSize = String(MDSize, "0")
  
  '������������
  For i = 1 To OriList.Count
    pbeDefault.value = pbeDefault.value + 1
    
    '������������
    Set nList = OriList(i)
    
    sFileName = Space(MDFileName)
    SArtist = Space(MDArtist)
    sTitle = Space(MDTitle)
    SAlbum = Space(MDAlbum)
    
    LSet sFileName = nList.FileName
    LSet SArtist = nList.Artist
    LSet SAlbum = nList.Album
    LSet sTitle = nList.Title
    
    SK = SortKey
    SK = Replace(SK, "%FILENAME%", sFileName)
    SK = Replace(SK, "%ARTIST%", SArtist)
    SK = Replace(SK, "%ALBUM%", SAlbum)
    SK = Replace(SK, "%TITLE%", sTitle)
    SK = Replace(SK, "%GENRE%", Format(nList.Genre, FTGenre))
    SK = Replace(SK, "%LENGTH%", Format(nList.Length, FTLength))
    SK = Replace(SK, "%TRACKNUMBER%", Format(nList.Track, FTTrack))
    SK = Replace(SK, "%YEAR%", Format(nList.Year, FTYear))
    SK = Replace(SK, "%FILESIZE%", Format(nList.Size, FTSize))
    SK = Replace(SK, "%DATECREATED%", nList.CreateDateW)
    
    nList.tag = SK
    DoEvents
  Next i
  
  '��ʼ���� (��������)
  Set nList = OriList(1)
  NewList.Add nList
  OriList.Remove 1
  
  Do
    pbeDefault.value = pbeDefault.value + 3
    
    Set nList = OriList(1)
    Let SK = nList.tag
    Let Added = False
    
    '����ȶ�
    For i = 1 To NewList.Count
      If CompareString(SK, NewList(i).tag) = SortAscending Then
        '��������
        NewList.Add nList, , i
        Added = True
        Exit For
      End If
    Next i
    
    '���û���ҵ�������ľͼӵ����
    If Not Added Then
      NewList.Add nList
    End If
    
    '��һ��
    OriList.Remove 1
    Added = False
  Loop Until OriList.Count = 0
  
  '���Ƶ�ԭ������
'  If SortAscending Then
    For i = 1 To SortItems.Count
      j = SortItems(i)
      PlayListInfo.Remove j
      
      If j = lCount Then
        PlayListInfo.Add NewList(i)
      Else
        PlayListInfo.Add NewList(i), , j
      End If
      
      PlayListInfo(j).Index = j
    Next i
'  Else
'    For i = SortItems.Count To 1 Step -1
'      j = SortItems(i)
'      PlayListInfo.Remove j
'
'      If j = lCount Then
'        PlayListInfo.Add NewList(i)
'      Else
'        PlayListInfo.Add NewList(i), , j
'      End If
'
'      PlayListInfo(j).Index = j
'      j = j + 1
'    Next i
'  End If
  
  Set NewList = Nothing
  
  '�����б�
  lvwList.Visible = False
  
  For i = 1 To SortItems.Count
    j = SortItems(i)
    pbeDefault.value = pbeDefault.value + 2
      
    Set nList = PlayListInfo(j)
    Set nItem = lvwList.ListItems(j)
    
    nItem.SmallIcon = nList.IconIndex
    nItem.SubItems(1) = vbNullString
    nItem.SubItems(3) = FS.GetFileName(nList.FileName)
    nItem.SubItems(4) = nList.Artist
    nItem.SubItems(5) = nList.Title
    nItem.SubItems(6) = nList.Album
    nItem.SubItems(7) = nList.Genre
    nItem.SubItems(8) = nList.LengthString
    nItem.SubItems(9) = IIf(nList.Track < 1, vbNullString, nList.Track)
    nItem.SubItems(10) = nList.Year
    nItem.SubItems(11) = FormatNumber(nList.Size \ 1024, 0, vbTrue, vbTrue) & " KB"
    nItem.SubItems(12) = nList.CreateDate
    nItem.tag = nList.FileName
    
    If nList.AudioFile Then
      If nList.Lyric Then
        nItem.ListSubItems(1).ReportIcon = IIf(UCase(FS.GetExtensionName(nList.LyricFile)) = "LRC", "?LYRICS", "?LYRICEXRACTED")
      Else
        nItem.ListSubItems(1).ReportIcon = "?NOLYRICS"
      End If
    Else
      nItem.ListSubItems(1).ReportIcon = Empty
    End If
    
    If nList.TagExist Then
      nItem.ListSubItems(2).ReportIcon = nList.TagImlKey
      nItem.ListSubItems(2).Text = nList.TagText
      nItem.ListSubItems(2).ForeColor = nList.TagColor
    Else
      nItem.ListSubItems(2).ReportIcon = Empty
      nItem.ListSubItems(2).Text = vbNullString
    End If
  Next i
  
  '�رս�����
  UpdateListKeys
  lvwList.Visible = True
  ShowProgress False, ""
  Me.Enabled = True
  lvwList.Visible = True
  Me.MousePointer = 0
End Sub

Public Sub SortListRandom(Optional ByVal SortItems As VBA.Collection)
  '�������
  Dim nOriItems As New VBA.Collection
  Dim nNewItems As New VBA.Collection
  Dim nList As MP3PA.ListInfo
  Dim nItem As MSComctlLib.ListItem
  Dim lTotal As Long
  Dim lPos As Long
  
  '��������
  If SortItems Is Nothing Then
    Set SortItems = New VBA.Collection
    
    For i = 1 To PlayListInfo.Count
      SortItems.Add i
      nOriItems.Add PlayListInfo(i)
    Next i
  Else
    For i = 1 To SortItems.Count
      nOriItems.Add PlayListInfo(SortItems(i))
    Next i
  End If
  
  '���С������Ŀ���˳�
  If nOriItems.Count < 2 Then Exit Sub
  
  '�򿪽�����ʾ
  ShowProgress True, "��������..."
  Me.Enabled = False
  Me.MousePointer = 11
  pbeDefault.value = 0
  pbeDefault.Max = SortItems.Count * 2
  
  '�����������
  lTotal = nOriItems.Count
  
  For i = lTotal To 1 Step -1
    '���ȡ��һ������
    Randomize
    lPos = Int(Rnd * i + 1)
    Set nList = nOriItems(lPos)
    nNewItems.Add nList
    nOriItems.Remove lPos
    
    '���½���
    pbeDefault.value = pbeDefault.value + 1
  Next i
  
  '�����б�
  lvwList.Visible = False
  
  For i = 1 To SortItems.Count
    pbeDefault.value = pbeDefault.value + 1
    
    '���¼���
    lPos = SortItems(i)
    PlayListInfo.Remove lPos
    
    If lPos > PlayListInfo.Count Then
      PlayListInfo.Add nNewItems(i)
    Else
      PlayListInfo.Add nNewItems(i), , lPos
    End If
    
    '�����б�
    Set nList = PlayListInfo(lPos)
    Set nItem = lvwList.ListItems(lPos)
    
    nItem.SmallIcon = nList.IconIndex
    nItem.SubItems(1) = vbNullString
    nItem.SubItems(3) = FS.GetFileName(nList.FileName)
    nItem.SubItems(4) = nList.Artist
    nItem.SubItems(5) = nList.Title
    nItem.SubItems(6) = nList.Album
    nItem.SubItems(7) = nList.Genre
    nItem.SubItems(8) = nList.LengthString
    nItem.SubItems(9) = IIf(nList.Track < 1, vbNullString, nList.Track)
    nItem.SubItems(10) = nList.Year
    nItem.SubItems(11) = FormatNumber(nList.Size \ 1024, 0, vbTrue, vbTrue) & " KB"
    nItem.SubItems(12) = nList.CreateDate
    nItem.tag = nList.FileName
    
    If nList.AudioFile Then
      If nList.Lyric Then
        nItem.ListSubItems(1).ReportIcon = IIf(UCase(FS.GetExtensionName(nList.LyricFile)) = "LRC", "?LYRICS", "?LYRICEXRACTED")
      Else
        nItem.ListSubItems(1).ReportIcon = "?NOLYRICS"
      End If
    Else
      nItem.ListSubItems(1).ReportIcon = Empty
    End If
  
    If nList.TagExist Then
      nItem.ListSubItems(2).ReportIcon = nList.TagImlKey
      nItem.ListSubItems(2).Text = nList.TagText
      nItem.ListSubItems(2).ForeColor = nList.TagColor
    Else
      nItem.ListSubItems(2).ReportIcon = Empty
      nItem.ListSubItems(2).Text = vbNullString
    End If
  Next i
  
  '�رս�����
  UpdateListKeys
  lvwList.Visible = True
  ShowProgress False, ""
  Me.Enabled = True
  Me.MousePointer = 0
End Sub

Public Function CheckDiskSize(ByVal NewSize As Double) As Boolean
  '����µ������Ƿ񳬳��˿ռ�
  Dim DelListStart As Long
  Dim SpaceCalc As Double
  Dim FreeSpace As Double
  Dim MSG As String
  
  If SpaceAdded > NewSize Then
    '�����˿ռ�
    FreeSpace = NewSize
    
    For i = 1 To PlayListInfo.Count
      SpaceCalc = SpaceCalc + PlayListInfo(i).Size + PlayListInfo(i).LyricSize
      
      If SpaceCalc > FreeSpace Then
        DelListStart = i
        Exit For
      End If
    Next i
    
    If DelListStart = 0 Then DelListStart = PlayListInfo.Count
    
    '��ʾ��ʾ��Ϣ
'    MSG = "���̿ռ䲻�㣬����ɾ����Щ�ļ���������մ˴����е����ݡ�" & vbCrLf & vbCrLf
'
'    For i = DelListStart To PlayListInfo.Count
'      MSG = MSG & PlayListInfo(i).FileName & vbCrLf
'    Next i
'
'    MSG = MSG & vbCrLf & "ѡ��ȷ�������б���ɾ����Щ�ļ�" & vbCrLf
'    MSG = MSG & vbCrLf & "ѡ��ȡ����ȡ����β�����"
'
'    If MsgBox(MSG, vbYesNo + vbQuestion + vbDefaultButton2) = vbYes Then
'      Do Until PlayListInfo.Count = DelListStart - 1
'        PlayListInfo.Remove DelListStart
'        lvwList.ListItems.Remove DelListStart
'      Loop
'      CheckDiskSize = True
'    Else
'      CheckDiskSize = False
'    End If
    MSG = "���̿ռ䲻�㣬����ɾ��һЩ�ļ��ſ��Լ�����"
    MsgBox MSG, vbInformation
    CheckDiskSize = False
  Else
    CheckDiskSize = True
  End If
End Function

Public Sub RefreshAppList()
  'ˢ��Ӧ�ó����б�
  Dim oWMPList As WMPLibCtl.IWMPPlaylist
  Dim oWMPLstCol As WMPLibCtl.IWMPPlaylistArray
  Dim oNode As MSComctlLib.Node
  Dim sPath As String
  Dim sListFile As String
  Dim sFullPath As String
  Dim sTitle As String
  Dim iniML As New MP3PA.INIAPI
  Dim iCounter As Integer
  Dim asTitle() As String
  Dim bContent() As Byte
  Dim lLength As Long
  
  '��ʼ��
  tvwProgram.Nodes.Clear
  Set tvwProgram.ImageList = iltProgram
  
  'ˢ�� Windows Media Player �е��б�
  If AppWmp Then
    '��Ӹ��ڵ�
    tvwProgram.Nodes.Add , , "APP_WMP", "Windows Media Player", "WMP"
    tvwProgram.Nodes.Add "APP_WMP", tvwChild, "APP_WMP_LIST", "�ҵĲ����б�", "WMP_LIST_COLLECTION"
    tvwProgram.Nodes.Add "APP_WMP", tvwChild, "APP_WMP_AUTOLIST", "�Զ������б�", "WMP_AUTOLIST_COLLECTION"
    tvwProgram.Nodes("APP_WMP_LIST").Sorted = True
    tvwProgram.Nodes("APP_WMP_AUTOLIST").Sorted = True
    tvwProgram.Nodes("APP_WMP").Expanded = True
    
    '��Ӳ����б�
    Set oWMPLstCol = ffmVideo.WMP.playlistCollection.getAll
    
    On Error Resume Next
    
    For i = 0 To oWMPLstCol.Count - 1
      Set oWMPList = oWMPLstCol.Item(i)
      
      If oWMPList.getItemInfo("PlaylistType") = "Auto" Then
        tvwProgram.Nodes.Add "APP_WMP_AUTOLIST", tvwChild, , oWMPList.Name, "WMP_AUTOLIST"
      ElseIf oWMPList.getItemInfo("PlaylistType") = "M3U" Then
        tvwProgram.Nodes.Add "APP_WMP_LIST", tvwChild, , oWMPList.Name, "WMP_LIST"
      End If
    Next i
    
    On Error GoTo 0
  End If
  
  'ˢ�� Winamp �Ĳ����б�
  If FS.FolderExists(AppWinamp) Then
    '��Ӹ��ڵ�
    tvwProgram.Nodes.Add , , "APP_WINAMP", "Winamp", "WINAMP"
    tvwProgram.Nodes("APP_WINAMP").Expanded = True
    
    '��ӻ�����б�
    sPath = AppendPath(AppWinamp, "winamp.m3u")
    
    If FS.FileExists(sPath) Then
      Set oNode = tvwProgram.Nodes.Add("APP_WINAMP", tvwChild, , "��ǰ�����б�", "WINAMP_LIST")
      oNode.tag = sPath
    End If
    
    '���ý����е��б�
    sFullPath = AppendPath(AppWinamp, "Plugins\gen_ml.ini")
    
    If FS.FileExists(sFullPath) Then
      iniML.FileName = sFullPath
      iCounter = CInt(iniML.GetIniString("gen_ml_config", "query_num", 0))
      sPath = AppendPath(AppWinamp, "Plugins\ml")
      
      If iCounter > 1 Then
        Set oNode = tvwProgram.Nodes.Add("APP_WINAMP", tvwChild, "WINAMP_ML", "ý����е��б�", "WINAMP_LIST_COLLECTION")
        oNode.Sorted = True
      End If
      
      For i = 1 To iCounter
        If CInt(iniML.GetIniString("gen_ml_config", "query" & i & "_mode", 0)) = 32 Then
          '��ʾ�����б�
          sListFile = iniML.GetIniString("gen_ml_config", "query" & i & "_val", "?NONE?")
          sTitle = iniML.GetIniString("gen_ml_config", "query" & i & "_name", "?NONE?")
          sFullPath = AppendPath(sPath, sListFile)
          
          '���
          If FS.FileExists(sFullPath) Then
            Set oNode = tvwProgram.Nodes.Add("WINAMP_ML", tvwChild, , sTitle, "WINAMP_LIST")
            oNode.tag = sFullPath
          End If
        End If
      Next i
    End If
  End If
  
  'ˢ�� Foobar �Ĳ����嵥
  If FS.FolderExists(AppFoobar) Then
    '��Ӹ��ڵ�
    sPath = AppendPath(AppFoobar, "playlists")
    
    If FS.FolderExists(sPath) Then
      '��Ӹ��ڵ�
      tvwProgram.Nodes.Add , , "APP_FOOBAR", "Foobar2000 0.8.x", "FOOBAR"
      tvwProgram.Nodes("APP_FOOBAR").Expanded = True
      
      flFile.Path = sPath
      flFile.Pattern = "*.fpl"
      
      If flFile.ListCount Then
        ReDim asTitle(flFile.ListCount - 1) As String

        For i = 0 To flFile.ListCount - 1
          asTitle(i) = flFile.List(i)
        Next i
        
        '����
        QuickSort.QuickSort asTitle, 0, UBound(asTitle)
        
        '���
        For i = 0 To UBound(asTitle)
          Set oNode = tvwProgram.Nodes.Add("APP_FOOBAR", tvwChild)
          oNode.Text = Trim(Right(asTitle(i), Len(asTitle(i)) - InStr(1, asTitle(i), "-")))
          oNode.Text = FS.GetBaseName(oNode.Text)
          oNode.Image = "FOOBAR_LIST"
          oNode.tag = AppendPath(sPath, asTitle(i))
        Next i
      End If
    End If
  End If
 
  'ˢ�� foobar 0.9x �Ĳ����嵥
  If FS.FolderExists(AppFoobar9) Then
    '��� Foobar 0.9x �Ĳ����б�
    sPath = AppendPath(AppFoobar9, "playlists")
    
    If FS.FileExists(AppendPath(sPath, "index.dat")) Then
      '��Ӹ����
      tvwProgram.Nodes.Add , , "APP_FOOBAR9", "Foobar2000 0.9.x", "FOOBAR9"
      tvwProgram.Nodes("APP_FOOBAR9").Expanded = True
      
      '�������ļ�
      Dim iFile As Integer
      
      iFile = FreeFile
      
      Open AppendPath(sPath, "index.dat") For Binary Access Read Lock Write As iFile
      
      '����һЩ�ֽ�
      Seek #iFile, 17
      
      '��ȡ������
      Get #iFile, , iCounter
      
      '����һЩ�ֽ�
      Seek #iFile, Seek(iFile) + 6
      
      '��ȡÿ���ļ���
      For i = 1 To iCounter
        '����ļ��еĳ���
        Get #iFile, , lLength
        
        '����ַ��� UTF-8
        ReDim bContent(lLength - 1) As Byte
        Get #iFile, , bContent
        
        'ת���ַ���
        sFullPath = AppendPath(sPath, UTF8Conv.UTF8_Decode(bContent, True))
        
        '���߲����б������
        Get #iFile, , lLength
        ReDim bContent(lLength - 1) As Byte
        Get #iFile, , bContent
        
        'ת���ַ���
        sTitle = UTF8Conv.UTF8_Decode(bContent, True)
        
        '��ӵ� Node
        Set oNode = tvwProgram.Nodes.Add("APP_FOOBAR9", tvwChild)
        oNode.Text = sTitle
        oNode.Image = "FOOBAR9_LIST"
        oNode.tag = sFullPath
        
        '����һЩ�ֽ�
        Seek #iFile, Seek(iFile) + 12
      Next i
      
      Close iFile
    End If
  End If
  
  'ˢ�� TTPlayer �Ĳ����б�
  If FS.FolderExists(AppTTPlayer) Then
    '���ǧǧ�������б�
    sPath = AppendPath(AppTTPlayer, "PlayList")
    
    If FS.FolderExists(sPath) Then
      '��Ӹ��ڵ�
      tvwProgram.Nodes.Add , , "APP_TTPLAYER", "ǧǧ����", "TTPLAYER"
      tvwProgram.Nodes("APP_TTPLAYER").Expanded = True
      
      flFile.Path = sPath
      flFile.Pattern = "*.ttbl"
      
      'һ����������б�
      For i = 0 To flFile.ListCount - 1
        Set oNode = tvwProgram.Nodes.Add("APP_TTPLAYER", tvwChild)
        oNode.Text = PlaylistReader.ReadTTPLInfo(AppendPath(sPath, flFile.List(i)), True)
        oNode.Image = "TTPLAYER_LIST"
        oNode.tag = AppendPath(sPath, flFile.List(i))
      Next i
    End If
  End If
 
 'ѡ��һ����Ŀ
 If tvwProgram.Nodes.Count Then tvwProgram.Nodes(1).Selected = True
End Sub

Public Sub RefreshStyle()
  'ˢ����ʽ
  If ActiveLVW Is Nothing Then
    mnuFullRow.Enabled = False
    mnuGrid.Enabled = False
    mnuHotSelect.Enabled = False
    mnuLargeIcon.Enabled = False
    mnuSmallIcon.Enabled = False
    mnuList.Enabled = False
    mnuReport.Enabled = False
  Else
    mnuFullRow.Enabled = True
    mnuGrid.Enabled = True
    mnuHotSelect.Enabled = True
    
    If ActiveLVW.Name = "lvwFile" Then
      mnuLargeIcon.Enabled = True
      mnuSmallIcon.Enabled = True
      mnuList.Enabled = True
      mnuReport.Enabled = True
    Else
      mnuLargeIcon.Enabled = False
      mnuSmallIcon.Enabled = False
      mnuList.Enabled = False
      mnuReport.Enabled = False
    End If
    
    mnuFullRow.Checked = ActiveLVW.FullRowSelect
    mnuHotSelect.Checked = ActiveLVW.HotTracking
    mnuGrid.Checked = ActiveLVW.GridLines
  End If
End Sub

Public Sub RefreshFavourite()
  'ˢ���ղؼ�
  Dim oNode As MSComctlLib.Node
  
  '���ļ������»�ȡ�ļ�
  Set iniFav = New MP3PA.INIOperation
  Set oFav = New MP3PA.FAVFolder
  Set oFavCol = New VBA.Collection
  iniFav.FileName = AppendPath(App.Path, "Favourite.ini")
  
  '����׸���Ŀ
  Call tvwFavourite.Nodes.Clear
  Set oNode = tvwFavourite.Nodes.Add(, , "Favourite", "�ղؼ�", 1)
  oFav.Key = "Favourite"
  oFav.MusicType = Not CBool(StrComp("MP3PA.FAVOURITE.MUSIC", iniFav.GetIniString("Favourite", "Type", "MP3PA.FAVOURITE.MUSIC"), vbTextCompare))
  oNode.Selected = True
  oNode.Sorted = True
  oNode.Expanded = True
  
  '��������
  oFavCol.Add oFav, "Favourite"
  
  '�ݹ������Ŀ
  Call AddFavItem(tvwFavourite, oNode, oFav)
  
  'ѡ���һ����Ŀ
  Call tvwFavourite_NodeClick(oNode)
End Sub

Public Function GetAppFileSize(ByVal Index As Long) As Double
  GetAppFileSize = AppFileSize(Index)
End Function

Private Sub UpdateStatusBarFavourite(ByVal Item As MSComctlLib.ListItem)
  '����״̬��
  Dim SelCount As Long
  Dim SelByte As Double
  Dim AllByte As Double
  
  On Error Resume Next
  For i = 1 To lvwFavourite.ListItems.Count
    If lvwFavourite.ListItems(i).Selected Then
      SelCount = SelCount + 1
      SelByte = SelByte + lvwFavourite.ListItems(i).tag
    End If
    
    AllByte = AllByte + lvwFavourite.ListItems(i).tag
  Next i
  
  stbDefault.Panels(1).ToolTipText = lvwFavourite.ListItems.Count & " ���ļ�, �ܹ���С " & DisplaySize(AllByte)
  
  If SelCount = 0 Then
    stbDefault.Panels(1).Text = stbDefault.Panels(1).ToolTipText
    tbrPlayer.Buttons(1).Enabled = False
    mnuPlayBrowser.Enabled = False
    stbDefault.Panels(1).Text = "ѡ���� 0 ���ļ�, �ܹ���С 0 KB"
  Else
    If SelByte > (SpaceTotal - SpaceUsed - SpaceAdded) Then
      stbDefault.Panels(1).Text = "[�ռ䲻��]ѡ���� " & SelCount & " ���ļ�, �ܹ���С " & DisplaySize(SelByte)
    Else
      stbDefault.Panels(1).Text = "ѡ���� " & SelCount & " ���ļ�, �ܹ���С " & DisplaySize(SelByte)
    End If
    
    On Error GoTo ExitSub
      Select Case UCase(FS.GetExtensionName(Item.Key))
      Case "WAV", "MP3", "WMA", "MPG", "AVI", "ASF", "WMV"
        tbrPlayer.Buttons(1).Enabled = True
        mnuPlayBrowser.Enabled = True
      Case Else
        tbrPlayer.Buttons(1).Enabled = False
        mnuPlayBrowser.Enabled = False
      End Select
    On Error GoTo ExitSub
  End If
  
  Set stbDefault.Panels(1).Picture = iltTabs.ListImages(3).Picture
  Set ActiveLVW = lvwFavourite
  Call RefreshStyle
ExitSub:
  On Error GoTo 0
End Sub

Private Sub UpdateStatusBarProgram(ByVal Item As MSComctlLib.ListItem)
  '����״̬��
  Dim SelCount As Long
  Dim SelByte As Double
  Dim AllByte As Double
  
  On Error Resume Next
  'ͳ���ļ���С
  
  For i = 1 To lvwProgram.ListItems.Count
    If lvwProgram.ListItems(i).Selected Then
      If AppFileSize(i) < 0 Then
        AppFileSize(i) = FS.GetFile(lvwProgram.ListItems(i).tag).Size
      End If
      
      SelCount = SelCount + 1
      SelByte = SelByte + AppFileSize(i)
    End If
    
    AllByte = AllByte + AppFileSize(i)
  Next i
  
  stbDefault.Panels(1).ToolTipText = lvwProgram.ListItems.Count & " ���ļ�, �ܹ���С " & DisplaySize(AllByte)
  
  If SelCount = 0 Then
    stbDefault.Panels(1).Text = stbDefault.Panels(1).ToolTipText
    tbrPlayer.Buttons(1).Enabled = False
    mnuPlayBrowser.Enabled = False
    stbDefault.Panels(1).Text = "ѡ���� 0 ���ļ�, �ܹ���С 0 KB"
  Else
    If SelByte > (SpaceTotal - SpaceUsed - SpaceAdded) Then
      stbDefault.Panels(1).Text = "[�ռ䲻��]ѡ���� " & SelCount & " ���ļ�, �ܹ���С " & DisplaySize(SelByte)
    Else
      stbDefault.Panels(1).Text = "ѡ���� " & SelCount & " ���ļ�, �ܹ���С " & DisplaySize(SelByte)
    End If
    
    On Error GoTo ExitSub
      Select Case UCase(FS.GetExtensionName(Item.tag))
      Case "WAV", "MP3", "WMA", "MPG", "AVI", "ASF", "WMV"
        tbrPlayer.Buttons(1).Enabled = True
        mnuPlayBrowser.Enabled = True
      Case Else
        tbrPlayer.Buttons(1).Enabled = False
        mnuPlayBrowser.Enabled = False
      End Select
    On Error GoTo ExitSub
  End If
  
  Set stbDefault.Panels(1).Picture = iltTabs.ListImages(4).Picture
  Set ActiveLVW = lvwProgram
  Call RefreshStyle
ExitSub:
    On Error GoTo 0
End Sub

Public Sub UpdateStatusBarFile(ByVal Item As MSComctlLib.ListItem)
  Dim SelCount As Long
  Dim SelByte As Double
  Dim AllByte As Double
  
  On Error GoTo ExitSub
  For i = 1 To lvwFile.ListItems.Count
    If lvwFile.ListItems(i).Selected Then
      SelCount = SelCount + 1
      SelByte = SelByte + CDbl(lvwFile.ListItems(i).SubItems(5))
    End If
    
    AllByte = AllByte + CDbl(lvwFile.ListItems(i).SubItems(5))
  Next i
  
  stbDefault.Panels(1).ToolTipText = lvwFile.ListItems.Count & " ���ļ�, �ܹ���С " & DisplaySize(AllByte)
  
  If SelCount = 0 Then
    stbDefault.Panels(1).Text = stbDefault.Panels(1).ToolTipText
    tbrPlayer.Buttons(1).Enabled = False
    mnuPlayBrowser.Enabled = False
  Else
    If SelByte > (SpaceTotal - SpaceUsed - SpaceAdded) Then
      stbDefault.Panels(1).Text = "[�ռ䲻��]ѡ���� " & SelCount & " ���ļ�, �ܹ���С " & DisplaySize(SelByte)
    Else
      stbDefault.Panels(1).Text = "ѡ���� " & SelCount & " ���ļ�, �ܹ���С " & DisplaySize(SelByte)
    End If
    
    On Error GoTo ExitSub
      Select Case UCase(FS.GetExtensionName(Item.ListSubItems(1).tag))
      Case "WAV", "MP3", "WMA", "MPG", "AVI", "ASF", "WMV"
        tbrPlayer.Buttons(1).Enabled = True
        mnuPlayBrowser.Enabled = True
      Case Else
        tbrPlayer.Buttons(1).Enabled = False
        mnuPlayBrowser.Enabled = False
      End Select
    On Error GoTo ExitSub
  End If
  
  Set ActiveLVW = lvwFile
  Set stbDefault.Panels(1).Picture = iltTabs.ListImages(ActivePage).Picture
  Call RefreshStyle
ExitSub:
    On Error GoTo 0
End Sub

Public Sub PlayMusicFile(ByVal sFileName As String)
  Dim SArtist As String
  Dim SAlbum As String
  Dim sTitle As String
  Dim iTrack As Integer
  
  '���������ļ�
  Set oPlayerMedia = ffmVideo.WMP.newMedia(sFileName)
  
  mnuPause.Enabled = True
  mnuStop.Enabled = True
  tbrPlayer.Buttons(3).Enabled = True
  tbrPlayer.Buttons(4).Enabled = True
  
  '����������
  If ffmSearch.RWLoaded Then
    ffmSearch.tbrSearch.Buttons(18).Enabled = True
    ffmSearch.tbrSearch.Buttons(19).Enabled = True
  End If
  
  sldPos.Enabled = True
  sldPos.value = 0
  On Error Resume Next
  sldPos.Max = CLng(oPlayerMedia.Duration)
  
  '����ļ���Ϣ
  sTitle = oPlayerMedia.getItemInfo("Title")
  SArtist = oPlayerMedia.getItemInfo("Author")
  SAlbum = oPlayerMedia.getItemInfo("WM/AlbumTitle")
  iTrack = CInt(oPlayerMedia.getItemInfo("WM/TrackNumber"))
  On Error GoTo 0
  
  sMsg = IIf(Len(SArtist), SArtist & " - ", "")
  sMsg = sMsg & IIf(Len(SAlbum), SAlbum & " - ", "")
  sMsg = sMsg & IIf(iTrack > 0, iTrack & ".", "")
  sMsg = sMsg & IIf(Len(sTitle), sTitle, FS.GetBaseName(sFileName))
  
  Me.MousePointer = 11
  ffmVideo.WMP.currentMedia = oPlayerMedia
  tmrPlayer.Enabled = True
  ffmVideo.tmrResize.Enabled = True
  
  'Sleep 1000
  
'  ' ���� oMedia
'  For i = 0 To oPlayerMedia.attributeCount - 1
'    Debug.Print oPlayerMedia.getAttributeName(i), oPlayerMedia.getItemInfo(oPlayerMedia.getAttributeName(i))
'  Next i
  
'  Debug.Print oPlayerMedia.imageSourceHeight
  
  Me.MousePointer = 0
End Sub

Public Sub RetrieveTag(ByVal oReader As Object)
  '���¼����ļ��ı�ǩ
  Dim oSelItem As New VBA.Collection
  Dim sErrFile As String
  Dim bErr As Boolean
  Dim nList As MP3PA.ListInfo
  Dim nItem As MSComctlLib.ListItem
  Dim oMedia As WMPLibCtl.IWMPMedia
  Dim F As Scripting.File
  
  '���ұ�ѡ�����Ŀ
  For i = 1 To lvwList.ListItems.Count
    If (lvwList.ListItems(i).Selected) And (PlayListInfo(i).AudioFile) Then
      oSelItem.Add i
    End If
  Next i
  
  '���¼���
  Me.Enabled = False
  Me.MousePointer = 11
  lvwList.Visible = False
  Me.ShowProgress True, "�������¼�����ǩ..."
  pbeDefault.Max = oSelItem.Count
  pbeDefault.value = 0
  
  sErrFile = "�����ļ�û�п��õ� " & oReader.idLstText & " ��ǩ�������Ѿ���������" & vbCrLf
  
  For i = 1 To oSelItem.Count
    j = oSelItem(i)
  
    '��ȡ��Ϣ
    With oReader
      oReader.LoadInfo PlayListInfo(j).FileName
      
      If oReader.Exist Then
        '������Ϣ
        Set nList = PlayListInfo(j)
        Set F = FS.GetFile(nList.FileName)
        
        'TAG ��Ϣ
        nList.Album = oReader.Album
        nList.Artist = oReader.Artist
        nList.Genre = oReader.Genre
        nList.Title = oReader.Title
        nList.Track = CInt(Val(oReader.Track))
        nList.Year = oReader.Year
        
        '�ļ���Ϣ
        nList.CreateDate = F.DateCreated
        nList.CreateDateW = Format(F.DateCreated, "yyyymmddhhmmss")
        nList.Size = F.Size
        nList.tag = vbNullString
        
        'TAG ��ʶ��
        nList.TagColor = oReader.idCellColor
        nList.TagExist = True
        nList.TagImlKey = oReader.idImlKey
        nList.TagText = oReader.idLstText
        
        '���ֳ���
        Set oMedia = ffmVideo.WMP.newMedia(nList.FileName)
        nList.Length = oMedia.Duration
        nList.LengthString = oMedia.durationString
        
        '�����б�
        Set nItem = lvwList.ListItems(j)
        
        nItem.SmallIcon = nList.IconIndex
        nItem.SubItems(1) = vbNullString
        nItem.SubItems(3) = FS.GetFileName(nList.FileName)
        nItem.SubItems(4) = nList.Artist
        nItem.SubItems(5) = nList.Title
        nItem.SubItems(6) = nList.Album
        nItem.SubItems(7) = nList.Genre
        nItem.SubItems(8) = nList.LengthString
        nItem.SubItems(9) = IIf(nList.Track < 1, vbNullString, nList.Track)
        nItem.SubItems(10) = nList.Year
        nItem.SubItems(11) = FormatNumber(nList.Size \ 1024, 0, vbTrue, vbTrue) & " KB"
        nItem.SubItems(12) = nList.CreateDate
        
        If nList.AudioFile Then
          nItem.ListSubItems(1).ReportIcon = IIf(nList.Lyric, "?LYRICS", "?NOLYRICS")
        Else
          nItem.ListSubItems(1).ReportIcon = Empty
        End If
        
        nItem.ListSubItems(2).ReportIcon = nList.TagImlKey
        nItem.ListSubItems(2).Text = nList.TagText
        nItem.ListSubItems(2).ForeColor = nList.TagColor
      Else
        sErrFile = sErrFile & vbCrLf & PlayListInfo(j).FileName
        bErr = True
      End If
    End With
  
    pbeDefault.value = pbeDefault.value + 1
  Next i
  
  Me.Enabled = True
  Me.MousePointer = 0
  lvwList.Visible = True
  Me.ShowProgress False, vbNullString
  
  If bErr Then
    MsgBox sErrFile, vbInformation
  End If
End Sub

Public Sub UpdateListKeys()
  '�����б��еĹؼ���
  Set PlayListKeys = New VBA.Collection
  
  For i = 1 To PlayListInfo.Count
    PlayListKeys.Add i, PlayListInfo(i).FileName
  Next i
End Sub

'Public Sub AddSelItem(Optional ByVal InsertIndex As Long = -1)
'  '����ļ�
'  Dim oFiles As New VBA.Collection
'  Dim oExist As New VBA.Collection
'  Dim oInheritInfo As New VBA.Collection
'  Dim oMP3Info As MP3PA.ListInfo
'  Dim oCurItem As MP3PA.FAVItem
'  Dim sAddNo As String
'  Dim sName As String
'  Dim iItem As MSComctlLib.ListItem
'  Dim bNoSpace As Boolean
'  Dim dSpace As Double
'  Dim iAppType As Integer
'
'  dSpace = SpaceTotal - SpaceUsed - SpaceAdded
'
'  sAddNo = "û���㹻�Ŀռ���������ļ���" & vbCrLf & vbCrLf
'
'  'Ԥ������ļ�
'  If ActivePage = 4 Then
'    Select Case lvwProgram.Tag
'    Case "FOOBAR": iAppType = 1
'    Case "WINAMP": iAppType = 2
'    Case "WMP": iAppType = 3
'    End Select
'
'    For i = 1 To lvwProgram.ListItems.Count
'      If lvwProgram.ListItems(i).Selected Then
'        sName = lvwProgram.ListItems(i).Tag
'
'        If FS.FileExists(sName) Then
'          If ItemExist(sName, PlayListKeys) Then
'            oExist.Add sName
'          Else
'            dSpace = dSpace - AppFileSize(i)
'
'            If dSpace < 0 Then
'              'û�пռ���
'              bNoSpace = True
'              sAddNo = sAddNo & lvwProgram.ListItems(i).Tag & vbCrLf
'            Else
'              oFiles.Add sName
'
'              '�̳�����
'              If InheritInfo Then
'                Set oMP3Info = New MP3PA.ListInfo
'                Set iItem = lvwProgram.ListItems(i)
'
'                Select Case iAppType
'                Case 1
'                  oMP3Info.Album = iItem.SubItems(3)
'                  oMP3Info.Artist = iItem.SubItems(1)
'                  oMP3Info.Genre = iItem.SubItems(6)
'                  oMP3Info.Length = 0
'                  oMP3Info.LengthString = "--:--"
'                  oMP3Info.Title = iItem.SubItems(2)
'                  oMP3Info.Track = Val(iItem.SubItems(4))
'                  oMP3Info.Year = iItem.SubItems(5)
'
'                  oInheritInfo.Add oMP3Info
'                Case 3
'                  oMP3Info.Album = iItem.SubItems(3)
'                  oMP3Info.Artist = iItem.SubItems(1)
'                  oMP3Info.Genre = iItem.SubItems(7)
'                  oMP3Info.Length = iItem.ListSubItems(5).Tag
'                  oMP3Info.LengthString = iItem.SubItems(5)
'                  oMP3Info.Title = iItem.SubItems(2)
'                  oMP3Info.Track = Val(iItem.SubItems(4))
'                  oMP3Info.Year = iItem.SubItems(6)
'
'                  oInheritInfo.Add oMP3Info
'                End Select
'              End If
'            End If
'          End If
'        End If
'      End If
'    Next i
'  ElseIf ActivePage = 3 Then
'    For i = 1 To lvwFavourite.ListItems.Count
'      If lvwFavourite.ListItems(i).Selected Then
'        sName = lvwFavourite.ListItems(i).Key
'
'        If FS.FileExists(sName) Then
'          If ItemExist(sName, PlayListKeys) Then
'            oExist.Add sName
'          Else
'            dSpace = dSpace - CDbl(lvwFavourite.ListItems(i).Tag)
'
'            If dSpace < 0 Then
'              'û�пռ���
'              bNoSpace = True
'              sAddNo = sAddNo & lvwFavourite.ListItems(i).SubItems(1) & vbCrLf
'            Else
'              oFiles.Add sName
'
'              '�̳�����
'              If InheritInfo And oCurFav.MusicType Then
'                Set oMP3Info = New MP3PA.ListInfo
'                Set oCurItem = oCurFav.FavouriteItems(i)
'
'                oMP3Info.Album = oCurItem.Album
'                oMP3Info.Artist = oCurItem.Artist
'                oMP3Info.Genre = oCurItem.Genre
'                oMP3Info.Length = oCurItem.Duration * 1000
'                oMP3Info.LengthString = Format("00", oCurItem.Duration \ 60) & ":" & oCurItem.Duration Mod 60
'                oMP3Info.Title = oCurItem.Title
'                oMP3Info.Track = oCurItem.Track
'                oMP3Info.Year = oCurItem.Year
'
'                oInheritInfo.Add oMP3Info
'              End If
'            End If
'          End If
'        End If
'      End If
'    Next i
'  Else
'    For i = 1 To lvwFile.ListItems.Count
'      If lvwFile.ListItems(i).Selected Then
'        sName = lvwFile.ListItems(i).ListSubItems(1).Tag
'
'        If ItemExist(sName, PlayListKeys) Then
'          oExist.Add sName
'        Else
'          dSpace = dSpace - CDbl(lvwFile.ListItems(i).SubItems(5))
'
'          If dSpace < 0 Then
'            'û�пռ���
'            bNoSpace = True
'            sAddNo = sAddNo & lvwFile.ListItems(i).Text & vbCrLf
'          Else
'            oFiles.Add sName
'          End If
'        End If
'      End If
'    Next i
'  End If
'
'  If bNoSpace Then
'    sAddNo = sAddNo & vbCrLf & "�Ƿ������"
'    If MsgBox(sAddNo, vbQuestion + vbYesNo) = vbNo Then Exit Sub
'  End If
'
'  '����ļ�
'  If oFiles.Count Then AddFile oFiles, InsertIndex, InheritInfo, oInheritInfo
'
'  '����ѡ��
'  For i = 1 To oExist.Count
'    lvwList.ListItems(PlayListKeys(oExist(i))).Selected = True
'  Next i
'
'  If oExist.Count Then lvwList.selectedItem.EnsureVisible
'End Sub
'
'Public Sub AddAllItem(Optional ByVal InsertIndex As Long = -1)
'  '��������ļ�
'  Dim oFiles As New VBA.Collection
'  Dim oExist As New VBA.Collection
'  Dim oInheritInfo As New VBA.Collection
'  Dim oMP3Info As MP3PA.ListInfo
'  Dim oCurItem As MP3PA.FAVItem
'  Dim sAddNo As String
'  Dim sName As String
'  Dim iItem As MSComctlLib.ListItem
'  Dim bNoSpace As Boolean
'  Dim dSpace As Double
'  Dim iAppType As Integer
'
'  dSpace = SpaceTotal - SpaceUsed - SpaceAdded
'
'  sAddNo = "û���㹻�Ŀռ���������ļ���" & vbCrLf & vbCrLf
'
'  'Ԥ������ļ�
'  Select Case ActivePage
'  Case 1, 2
'    For i = 1 To lvwFile.ListItems.Count
'      sName = lvwFile.ListItems(i).ListSubItems(1).Tag
'
'      If ItemExist(sName, PlayListKeys) Then
'        oExist.Add sName
'      Else
'        dSpace = dSpace - CDbl(lvwFile.ListItems(i).SubItems(5))
'
'        If dSpace < 0 Then
'          'û�пռ���
'          bNoSpace = True
'          sAddNo = sAddNo & lvwFile.ListItems(i).Text & vbCrLf
'        Else
'          oFiles.Add sName
'        End If
'      End If
'    Next i
'  Case 3
'    For i = 1 To lvwFavourite.ListItems.Count
'      sName = lvwFavourite.ListItems(i).Key
'
'      If ItemExist(sName, PlayListKeys) Then
'        oExist.Add sName
'      Else
'        dSpace = dSpace - CDbl(lvwFavourite.ListItems(i).Tag)
'
'        If dSpace < 0 Then
'          'û�пռ���
'          bNoSpace = True
'          sAddNo = sAddNo & lvwFavourite.ListItems(i).SubItems(1) & vbCrLf
'        Else
'          oFiles.Add sName
'
'          '�̳�����
'          If InheritInfo And oCurFav.MusicType Then
'            Set oMP3Info = New MP3PA.ListInfo
'            Set oCurItem = oCurFav.FavouriteItems(i)
'
'            oMP3Info.Album = oCurItem.Album
'            oMP3Info.Artist = oCurItem.Artist
'            oMP3Info.Genre = oCurItem.Genre
'            oMP3Info.Length = oCurItem.Duration * 1000
'            oMP3Info.LengthString = Format("00", oCurItem.Duration \ 60) & ":" & oCurItem.Duration Mod 60
'            oMP3Info.Title = oCurItem.Title
'            oMP3Info.Track = oCurItem.Track
'            oMP3Info.Year = oCurItem.Year
'
'            oInheritInfo.Add oMP3Info
'          End If
'        End If
'      End If
'    Next i
'  Case 4
'    Select Case lvwProgram.Tag
'    Case "FOOBAR": iAppType = 1
'    Case "WINAMP": iAppType = 2
'    Case "WMP": iAppType = 3
'    End Select
'
'    For i = 1 To lvwProgram.ListItems.Count
'      sName = lvwProgram.ListItems(i).Tag
'
'      If ItemExist(sName, PlayListKeys) Then
'        oExist.Add sName
'      Else
'        dSpace = dSpace - CDbl(AppFileSize(i))
'
'        If dSpace < 0 Then
'          'û�пռ���
'          bNoSpace = True
'          sAddNo = sAddNo & sName & vbCrLf
'        Else
'          oFiles.Add sName
'
'          '�̳�����
'          If InheritInfo Then
'            Set oMP3Info = New MP3PA.ListInfo
'            Set iItem = lvwProgram.ListItems(i)
'
'            Select Case iAppType
'            Case 1
'              oMP3Info.Album = iItem.SubItems(3)
'              oMP3Info.Artist = iItem.SubItems(1)
'              oMP3Info.Genre = iItem.SubItems(6)
'              oMP3Info.Length = 0
'              oMP3Info.LengthString = "--:--"
'              oMP3Info.Title = iItem.SubItems(2)
'              oMP3Info.Track = Val(iItem.SubItems(4))
'              oMP3Info.Year = iItem.SubItems(5)
'
'              oInheritInfo.Add oMP3Info
'            Case 3
'              oMP3Info.Album = iItem.SubItems(3)
'              oMP3Info.Artist = iItem.SubItems(1)
'              oMP3Info.Genre = iItem.SubItems(7)
'              oMP3Info.Length = iItem.ListSubItems(5).Tag
'              oMP3Info.LengthString = iItem.SubItems(5)
'              oMP3Info.Title = iItem.SubItems(2)
'              oMP3Info.Track = Val(iItem.SubItems(4))
'              oMP3Info.Year = iItem.SubItems(6)
'
'              oInheritInfo.Add oMP3Info
'            End Select
'          End If
'        End If
'      End If
'    Next i
'  End Select
'
'  If bNoSpace Then
'    sAddNo = sAddNo & vbCrLf & "�Ƿ������"
'    If MsgBox(sAddNo, vbQuestion + vbYesNo) = vbNo Then Exit Sub
'  End If
'
'  '����ļ�
'  If oFiles.Count Then AddFile oFiles, InsertIndex, InheritInfo, oInheritInfo
'
'  '����ѡ��
'  For i = 1 To oExist.Count
'    lvwList.ListItems(PlayListKeys(oExist(i))).Selected = True
'  Next i
'
'  If oExist.Count Then lvwList.selectedItem.EnsureVisible
'End Sub

Public Sub AddFileItems(ByVal ItemIndex As VBA.Collection, Optional ByVal InsertIndex As Long = -1)
  '��������ļ�
  Dim oFiles As New VBA.Collection
  Dim oExist As New VBA.Collection
  Dim oInheritInfo As New VBA.Collection
  Dim oMP3Info As MP3PA.ListInfo
  Dim oCurItem As MP3PA.FAVItem
  Dim sAddNo As String
  Dim sName As String
  Dim iItem As MSComctlLib.ListItem
  Dim bNoSpace As Boolean
  Dim dSpace As Double
  Dim iAppType As Integer
  
  dSpace = SpaceTotal - SpaceUsed - SpaceAdded
  
  sAddNo = "û���㹻�Ŀռ���������ļ���" & vbCrLf & vbCrLf
  
  If ItemIndex Is Nothing Then Exit Sub
  If ItemIndex.Count = 0 Then Exit Sub
  
  'Ԥ������ļ�
  Select Case ActivePage
  Case 1, 2
    For j = 1 To ItemIndex.Count
      i = ItemIndex(j)
      sName = lvwFile.ListItems(i).ListSubItems(1).tag
      
      If ItemExist(sName, PlayListKeys) Then
        oExist.Add sName
      Else
        dSpace = dSpace - CDbl(lvwFile.ListItems(i).SubItems(5))
        
        If dSpace < 0 Then
          'û�пռ���
          bNoSpace = True
          sAddNo = sAddNo & lvwFile.ListItems(i).Text & vbCrLf
        Else
          oFiles.Add sName
        End If
      End If
    Next j
  Case 3
    For j = 1 To ItemIndex.Count
      i = ItemIndex(j)
      sName = lvwFavourite.ListItems(i).Key
      
      If ItemExist(sName, PlayListKeys) Then
        oExist.Add sName
      Else
        dSpace = dSpace - CDbl(lvwFavourite.ListItems(i).tag)
        
        If dSpace < 0 Then
          'û�пռ���
          bNoSpace = True
          sAddNo = sAddNo & lvwFavourite.ListItems(i).SubItems(1) & vbCrLf
        Else
          oFiles.Add sName
            
          '�̳�����
          If InheritInfo And oCurFav.MusicType Then
            Set oMP3Info = New MP3PA.ListInfo
            Set oCurItem = oCurFav.FavouriteItems(i)
            
            oMP3Info.Album = oCurItem.Album
            oMP3Info.Artist = oCurItem.Artist
            oMP3Info.Genre = oCurItem.Genre
            oMP3Info.Length = oCurItem.Duration * 1000
            oMP3Info.LengthString = Format("00", oCurItem.Duration \ 60) & ":" & oCurItem.Duration Mod 60
            oMP3Info.Title = oCurItem.Title
            oMP3Info.Track = oCurItem.Track
            oMP3Info.Year = oCurItem.Year
            
            oInheritInfo.Add oMP3Info
          End If
        End If
      End If
    Next j
  Case 4
    Select Case lvwProgram.tag
    Case "FOOBAR": iAppType = 1
    Case "WINAMP": iAppType = 2
    Case "WMP": iAppType = 3
    End Select
    
    For j = 1 To ItemIndex.Count
      i = ItemIndex(j)
      sName = lvwProgram.ListItems(i).tag
      
      If ItemExist(sName, PlayListKeys) Then
        oExist.Add sName
      Else
        dSpace = dSpace - CDbl(AppFileSize(i))
        
        If dSpace < 0 Then
          'û�пռ���
          bNoSpace = True
          sAddNo = sAddNo & sName & vbCrLf
        Else
          oFiles.Add sName
        
          '�̳�����
          If InheritInfo Then
            Set oMP3Info = New MP3PA.ListInfo
            Set iItem = lvwProgram.ListItems(i)
            
            Select Case iAppType
            Case 1
              oMP3Info.Album = iItem.SubItems(3)
              oMP3Info.Artist = iItem.SubItems(1)
              oMP3Info.Genre = iItem.SubItems(6)
              oMP3Info.Length = 0
              oMP3Info.LengthString = "--:--"
              oMP3Info.Title = iItem.SubItems(2)
              oMP3Info.Track = Val(iItem.SubItems(4))
              oMP3Info.Year = iItem.SubItems(5)
              
              oInheritInfo.Add oMP3Info
            Case 3
              oMP3Info.Album = iItem.SubItems(3)
              oMP3Info.Artist = iItem.SubItems(1)
              oMP3Info.Genre = iItem.SubItems(7)
              oMP3Info.Length = iItem.ListSubItems(5).tag
              oMP3Info.LengthString = iItem.SubItems(5)
              oMP3Info.Title = iItem.SubItems(2)
              oMP3Info.Track = Val(iItem.SubItems(4))
              oMP3Info.Year = iItem.SubItems(6)
              
              oInheritInfo.Add oMP3Info
            End Select
          End If
        End If
      End If
    Next j
  End Select
  
  If bNoSpace Then
    sAddNo = sAddNo & vbCrLf & "�Ƿ������"
    If MsgBox(sAddNo, vbQuestion + vbYesNo) = vbNo Then Exit Sub
  End If
  
  '����ļ�
  If oFiles.Count Then AddFile oFiles, InsertIndex, InheritInfo, oInheritInfo
  
  '����ѡ��
  For i = 1 To oExist.Count
    lvwList.ListItems(PlayListKeys(oExist(i))).Selected = True
  Next i
  
  If oExist.Count Then lvwList.selectedItem.EnsureVisible
End Sub

Public Function SearchLyric(ByVal AudioFile As String, ByRef LyricFile As String, ByRef LyricSize As Double) As Boolean
  '���Ҹ�ʵĺ���
  Dim j As Long
  Dim LyricName As String
  Dim AudioPath As String
  Dim sReturn As String
  
  LyricName = FS.GetBaseName(AudioFile) & ".LRC"
  AudioPath = FS.GetParentFolderName(AudioFile)
  LyricSize = 0
  SearchLyric = False
  
  '���Ҹ����ļ����Ƿ���
  If bLyricFromFile Then
    LyricFile = ExractLyric(AudioFile)
    
    If Len(LyricFile) Then
      SearchLyric = True
      LyricSize = FS.GetFile(LyricFile).Size
      Exit Function
    End If
  End If
  
  '���ҹ����б�
  If bLYCIIAssociationList Then
    If ItemExist(LCase(AudioFile), LyricIIAssociationList) Then
      SearchLyric = True
      LyricFile = LyricIIAssociationList(LCase(AudioFile))
      LyricSize = FS.GetFile(LyricFile).Size
      Exit Function
    End If
  End If
  
  '��������Ŀ¼
  If bLYCIIDownDir Then
    LyricFile = AppendPath(LyricsIIDownDir, LyricName)
    
    If FS.FileExists(LyricFile) Then
      SearchLyric = True
      LyricSize = FS.GetFile(LyricFile).Size
      Exit Function
    End If
  End If
  
  '���Ҹ���Ŀ¼
  If FindLyricInSongDir Then
    LyricFile = AppendPath(AudioPath, LyricName)
    
    If FS.FileExists(LyricFile) Then
      SearchLyric = True
      LyricSize = FS.GetFile(LyricFile).Size
      Exit Function
    End If
  End If
  
  '���� Lyrics Ŀ¼
  If bLYCIISearchDir Then
    For j = 1 To LyricIIDirs.Count
      LyricFile = AppendPath(LyricIIDirs(j), LyricName)
      
      If FS.FileExists(LyricFile) Then
        SearchLyric = True
        LyricSize = FS.GetFile(LyricFile).Size
        Exit Function
      End If
    Next j
  End If
  
  '�����Զ���Ŀ¼
  For j = 1 To LyricDir.Count
    LyricFile = AppendPath(LyricDir(j), LyricName)
    
    If FS.FileExists(LyricFile) Then
      SearchLyric = True
      LyricSize = FS.GetFile(LyricFile).Size
      Exit Function
    End If
  Next j
  
  'δ�ҵ�
  SearchLyric = False
  LyricSize = 0
End Function

Public Sub SetRenameStatus(Optional Enabled As Boolean)
  '������ر��������Ĺ���
  RenameEnabled = Enabled
  mnuChangeFileName.Checked = Enabled
  
  If Enabled Then
    tbrDefault.Buttons("RENAME").ButtonMenus(1).Text = "��ǰģ��: " & RenameKey(RenameCurrent)
    tbrDefault.Buttons("RENAME").ButtonMenus(3).Text = "�ر�����������(&E)"
  Else
    tbrDefault.Buttons("RENAME").ButtonMenus(1).Text = "��ǰģ��: <�ر�>"
    tbrDefault.Buttons("RENAME").ButtonMenus(3).Text = "��������������(&E)"
  End If
End Sub

Public Sub UpdateList()
  '��������д���б�
  Dim i As Long
  
  Set CurrentListFolder.ListFiles = New VBA.Collection
  
  For i = 1 To PlayListInfo.Count
    CurrentListFolder.ListFiles.Add PlayListInfo(i)
  Next i
  
  CurrentListFolder.Recalculate mnuCopyLyrics.Checked
End Sub

Public Sub SwitchAutoFolder()
  '�����л��Զ��ļ��й���
  If Not PS_AutoFolderTree Then
    mnuCreateNo.Checked = True
    mnuCreateArtist.Checked = False
    mnuCreateAlbum.Checked = False
    mnuCreateModify.Checked = False
    mnuCreateGenre.Checked = False
    tbrList.Buttons("AUTOFOLDER").value = tbrUnpressed
  Else
    mnuCreateNo.Checked = False
    mnuCreateArtist.Checked = (PS_AutoFolderIndex = 1)
    mnuCreateAlbum.Checked = (PS_AutoFolderIndex = 2)
    mnuCreateModify.Checked = (PS_AutoFolderIndex = 3)
    mnuCreateGenre.Checked = (PS_AutoFolderIndex = 4)
    tbrList.Buttons("AUTOFOLDER").value = tbrPressed
  End If
End Sub

Private Function CheckForDuplicate(ByRef ListFiles As VBA.Collection, ByVal FilePath As String) As Boolean
  '������ͬ�ĸ���
  Dim i As Long
  
  For i = 1 To ListFiles.Count
    If StrComp(ListFiles(i).FileName, FilePath, vbTextCompare) = 0 Then
      CheckForDuplicate = True
      Exit Function
    End If
  Next i
End Function
