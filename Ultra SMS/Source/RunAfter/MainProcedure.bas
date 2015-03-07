Attribute VB_Name = "MainProcedure"
Option Explicit
Option Base 1

' �����и�ʽ
' RUNAFTER hProcess dwMilliseconds lpCmdLine
' hProcess        ��ǰ���̵ľ��
' dwMilliseconds  ��ʱ
' lpCmdLine       ������

Public Declare Function WaitForSingleObject Lib "kernel32" (ByVal hHandle As Long, ByVal dwMilliseconds As Long) As Long
Public Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessId As Long) As Long
Public Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Public Const SYNCHRONIZE = &H100000

Public Function GetCommandLine(Optional MaxArgs As Long = 0)
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

