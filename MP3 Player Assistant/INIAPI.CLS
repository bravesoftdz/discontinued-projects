VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "INIAPI"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "INI �ļ��� API ����ͨ��������װ�� 6 �� API ������ʹ�������Է���ط��ʡ�д�� INI �ļ���"
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'**********************************************************************
'                                                          INIAPI ����
'                                                         -------------
'    ����ͨ�� API �򵥵ط��� INI �ļ���
'**********************************************************************
Private Declare Function GetPrivateProfileInt Lib "kernel32" Alias "GetPrivateProfileIntA" (ByVal lpApplicationName As String, ByVal lpKeyName As String, ByVal nDefault As Long, ByVal lpFileName As String) As Long
Private Declare Function GetPrivateProfileSection Lib "kernel32" Alias "GetPrivateProfileSectionA" (ByVal lpAppName As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Private Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Private Declare Function GetPrivateProfileSectionNames Lib "kernel32" Alias "GetPrivateProfileSectionNamesA" (ByVal lpszReturnBuffer As String, ByVal nSize As Long, ByVal lpFileName As String) As Long

Private Declare Function WritePrivateProfileSection Lib "kernel32" Alias "WritePrivateProfileSectionA" (ByVal lpAppName As String, ByVal lpString As String, ByVal lpFileName As String) As Long
Private Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long

Private vFileName As String

'======================================================================
'FileName ����
'--------------
'����Ҫ���� API �� INI �ļ������֡�
'======================================================================
Public Property Get FileName() As String
Attribute FileName.VB_Description = "���ء�����Ҫ�������ļ������������һ�������ڵ��ļ�������һ������ʱ����"
Attribute FileName.VB_UserMemId = 0
  FileName = vFileName
End Property

Public Property Let FileName(ByVal vNewValue As String)
  vFileName = vNewValue
End Property

'======================================================================
'GetIniInteger ����
'-------------------
'Ϊ��ʼ���ļ���ָ������Ŀ��ȡһ������ֵ��
'======================================================================
Public Function GetIniInteger(ByVal Section As String, ByVal Key As String, Optional ByVal Default As Long = 0) As Long
Attribute GetIniInteger.VB_Description = "����һ��������(Long)�������� API �� INI �ļ��ж�ȡ�����ݡ���������򷵻� 0��"
  Dim Result As Long
  
  Result = GetPrivateProfileInt(Section, Key, Default, vFileName)
  
  GetIniInteger = Result
End Function

'======================================================================
'GetIniKeys ����
'----------------
'��ȡָ��С������������ֵ��һ���б���
'======================================================================
Public Function GetIniKeys(ByVal Section As String) As Collection
Attribute GetIniKeys.VB_Description = "����һ�����϶���(Collection ����)�������� API �� INI �ļ��ж�ȡ�Ľ��м������ƣ�ÿһ�����ƶ���¼�ڷ��صļ��϶����С���������򷵻� Nothing��"
  Dim Result As Long
  Dim Keys As String
  Dim KeyList() As String
  Dim i As Long
  Dim Returen As New Collection
  
  Keys = Space(32767)
  
  Result = GetPrivateProfileSection(Section, Keys, 32767, vFileName)
  
  Keys = Trim(Keys)
  
  If Len(Keys) > 2 Then
    Keys = Left(Keys, Len(Keys) - 2)
  End If
  
  KeyList = Split(Keys, Chr(0))
  
  For i = 0 To UBound(KeyList)
    Returen.Add KeyList(i)
  Next i
  
  Set GetIniKeys = Returen
End Function

'======================================================================
'GetIniString ����
'------------------
'Ϊ��ʼ���ļ���ָ������Ŀȡ���ִ���
'======================================================================
Public Function GetIniString(ByVal Section As String, ByVal Key As String, Optional ByVal Default As String = vbNullString) As String
Attribute GetIniString.VB_Description = "����һ���ַ���(String)�������� API �� INI �ļ��ж�ȡ���ַ������ݡ���������򷵻� vbNullString��"
  Dim Result As Long
  Dim StrItem As String
  
  StrItem = Space(32767)
  Result = GetPrivateProfileString(Section, Key, Default, StrItem, 32767, vFileName)
  
  If Result Then
    StrItem = Left(StrItem, InStr(1, StrItem, Chr(0), vbTextCompare) - 1)
    GetIniString = StrItem
  Else
    GetIniString = vbNullString
  End If
End Function

'======================================================================
'GetIniString ����
'------------------
'Ϊ��ʼ���ļ���ָ������Ŀȡ���ִ���
'======================================================================
Public Function GetIniSections() As Collection
Attribute GetIniSections.VB_Description = "����һ�����϶���(Collection ����)�������� API �� INI �ļ��ж�ȡ�Ľڵ����ƣ�ÿһ���ڵ����ƶ���¼�ڷ��صļ��϶����С���������򷵻� Nothing��"
  Dim Result As Long
  Dim Sections As String
  Dim SectionList() As String
  Dim i As Long
  Dim ReturnCol As New Collection
  
  Sections = Space(32767)
  Result = GetPrivateProfileSectionNames(Sections, 32767, vFileName)
  Sections = Trim(Sections)
  If Len(Sections) > 2 Then Sections = Left(Sections, Len(Sections) - 2)
  SectionList = Split(Sections, Chr(0))
  
  For i = 0 To UBound(SectionList)
    ReturnCol.Add SectionList(i)
  Next i
  
  Set GetIniSections = ReturnCol
End Function

'======================================================================
'SetIniSection ����
'-------------------
'Ϊһ����ʼ���ļ���.ini����ָ����С����������������ֵ��
'======================================================================
Public Function SetIniKeys(ByVal Section As String, ByVal KeyList As Collection) As Boolean
Attribute SetIniKeys.VB_Description = "ָ��һ�����϶���(Collection ����)���� API ��ÿһ��������д�뵽ָ���� INI �ļ��С�ʧ�ܻ����� GetLastError��"
  Dim Result As Long
  Dim KeyData As String
  Dim i As Long
  
  For i = 1 To KeyList.Count
    KeyData = KeyList(i) & Chr(0)
  Next i
  
  KeyData = KeyData & Chr(0)
  
  Result = WritePrivateProfileSection(Section, KeyData, vFileName)
  
  SetIniKeys = IIf(Result = 0, False, True)
End Function

'======================================================================
'SetIniString ����
'------------------
'�ڳ�ʼ���ļ�ָ��С��������һ���ִ���
'======================================================================
Public Function SetIniString(ByVal Section As String, ByVal Key As String, ByVal Value As String) As Boolean
Attribute SetIniString.VB_Description = "ָ��һ���ַ���(String)���� API ��ÿ���ַ���������д�뵽ָ���� INI ��ָ���ڵ�ָ�����С�ʧ�ܻ����� GetLastError��"
  Dim Result As Long
  
  Result = WritePrivateProfileString(Section, Key, Value, vFileName)
  
  SetIniString = IIf(Result = 0, False, True)
End Function