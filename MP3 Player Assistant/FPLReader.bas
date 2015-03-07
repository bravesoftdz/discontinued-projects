Attribute VB_Name = "PlaylistReader"
'**************************************************************
'Foobar2000 �����б�(*.FPL)��ȡģ��
'-----------------------------------
'BY Alexander Chen
'**************************************************************

Option Explicit

'ͷ����
Private Type FPL_HEADER
  Identifier(1 To 20) As Byte
  Number As Long
End Type

'��Ŀ��Ϣ
Public Type FPL_ITEM_INFO
  FileName As String
  Title As String
  Artist As String
  Album As String
  TrackNumber As Long
  Bitrate As Long
  VBR As Boolean
  Channels As Integer
  SampleRate As Long
  Mp3StereoMode As String
  Codec As String
  PlayCounter As Long
  DateYear As String
  Genre As String
  FileSize As Long
End Type

'��Ŀ��Ϣ
Public Type M3U_ITEM_INFO
  FileName As String
  DispTitle As String
  Length As Long
End Type

Private FPLAudioList() As FPL_ITEM_INFO
Private M3UAudioList() As M3U_ITEM_INFO

Public Function ReadFplInfo(ByVal FileName As String) As Boolean
  '��������
  Dim AudioItem As New VBA.Collection
  Dim AudioSeek As FPL_ITEM_INFO
  Dim FileHeader As FPL_HEADER
  Dim F As Integer
  Dim lIdentifier As Long
  Dim lLength As Long
  Dim bData() As Byte
  Dim sField As String
  Dim sValue As String
  Dim e As Long               '��ʱ������
  Dim d As Long               '��ʱ������
  Dim lCounter As Long        'ѭ������
  Dim lFileSize As Long       '�ļ���С
  
  '���ļ�
  F = FreeFile
  Open FileName For Binary Access Read Shared As F
  
  '��ȡͷ��Ϣ
  Get #F, , FileHeader
  
  '�ж��Ƿ��� FPL �ļ�
  '8268 D0E3 4B87 E343 9825 4E42 020A F543 0000 0000       .h..K..C.%NB...C....
  If FileHeader.Identifier(1) <> &H82 Then Exit Function
  If FileHeader.Identifier(2) <> &H68 Then Exit Function
  If FileHeader.Identifier(3) <> &HD0 Then Exit Function
  If FileHeader.Identifier(4) <> &HE3 Then Exit Function
  If FileHeader.Identifier(5) <> &H4B Then Exit Function
  If FileHeader.Identifier(6) <> &H87 Then Exit Function
  If FileHeader.Identifier(7) <> &HE3 Then Exit Function
  If FileHeader.Identifier(8) <> &H43 Then Exit Function
  If FileHeader.Identifier(9) <> &H98 Then Exit Function
  If FileHeader.Identifier(10) <> &H25 Then Exit Function
  If FileHeader.Identifier(11) <> &H4E Then Exit Function
  If FileHeader.Identifier(12) <> &H42 Then Exit Function
  If FileHeader.Identifier(13) <> &H2 Then Exit Function
  If FileHeader.Identifier(14) <> &HA Then Exit Function
  If FileHeader.Identifier(15) <> &HF5 Then Exit Function
  If FileHeader.Identifier(16) <> &H43 Then Exit Function
  If FileHeader.Identifier(17) <> &H0 Then Exit Function
  If FileHeader.Identifier(18) <> &H0 Then Exit Function
  If FileHeader.Identifier(19) <> &H0 Then Exit Function
  If FileHeader.Identifier(20) <> &H0 Then Exit Function
  
  '��ȡ�б���Ŀ
  On Error Resume Next
  
  ReDim FPLAudioList(1 To FileHeader.Number) As FPL_ITEM_INFO
  
  For e = 1 To FileHeader.Number
    '��ȡ�ļ���
    Get #F, , lIdentifier
    Get #F, , lLength
    ReDim bData(lLength - 1) As Byte
    Get #F, , bData
    
    sValue = UTF8Conv.UTF8_Decode(bData, True)
    FPLAudioList(e).FileName = sValue
    sField = ""
    sValue = ""
    
    If lIdentifier = 13 Then
      '����ļ���С
      Get #F, , lFileSize
      Get #F, , lFileSize
      
      FPLAudioList(e).FileSize = lFileSize
      
      '������Ч������
      Seek #F, Seek(F) + 20
      
      '��û�����Ϣ�ĸ���
      Get #F, , lCounter
      
      For d = 1 To lCounter
        '����ֶ�����
        Get #F, , lLength
        ReDim bData(lLength - 1) As Byte
        Get #F, , bData
        sField = UTF8Conv.UTF8_Decode(bData, True)
        
        '���ֵ
        Get #F, , lLength
        ReDim bData(lLength - 1) As Byte
        Get #F, , bData
        sValue = UTF8Conv.UTF8_Decode(bData, True)
        
        '�����ֶ�
        Select Case UCase(sField)
        Case "TITLE": FPLAudioList(e).Title = sValue
        Case "ARTIST": FPLAudioList(e).Artist = sValue
        Case "ALBUM": FPLAudioList(e).Album = sValue
        Case "TRACKNUMBER": FPLAudioList(e).TrackNumber = CLng(sValue)
        Case "DATE": FPLAudioList(e).DateYear = sValue
        Case "GENRE": FPLAudioList(e).Genre = sValue
        Case "PLAY_COUNTER": FPLAudioList(e).PlayCounter = CLng(sValue)
        End Select
      Next d
      
      '��ü�����Ϣ
      Get #F, , lCounter
      
      For d = 1 To lCounter
        '����ֶ�����
        Get #F, , lLength
        ReDim bData(lLength - 1) As Byte
        Get #F, , bData
        sField = UTF8Conv.UTF8_Decode(bData, True)
        
        '���ֵ
        Get #F, , lLength
        ReDim bData(lLength - 1) As Byte
        Get #F, , bData
        sValue = UTF8Conv.UTF8_Decode(bData, True)
        
        '�����ֶ�
        Select Case UCase(sField)
        Case "BITRATE": FPLAudioList(e).Bitrate = CLng(sValue)
        Case "CHANNELS": FPLAudioList(e).Channels = CInt(sValue)
        Case "SAMPLERATE": FPLAudioList(e).SampleRate = CLng(sValue)
        Case "EXTRAINFO": FPLAudioList(e).VBR = Not CBool(StrComp(sValue, "VBR", vbTextCompare))
        Case "MP3_STEREO_MODE": FPLAudioList(e).Mp3StereoMode = sValue
        Case "CODEC": FPLAudioList(e).Codec = sValue
        End Select
      Next d
      
      '��ӵ�����
      AudioItem.Add e, FPLAudioList(e).FileName
    ElseIf lIdentifier = 12 Then
      '������Ч���ַ�
      Seek #F, Seek(F) + 20
      
      '��ѯ��Ϣ
      sValue = FPLAudioList(e).FileName
      
      For d = 1 To UBound(FPLAudioList)
        If FPLAudioList(d).FileName = sValue Then
          AudioSeek = FPLAudioList(d)
          Exit For
        End If
      Next d
      
      FPLAudioList(e) = AudioSeek
    ElseIf lIdentifier = 0 Then
      '������Ч���ַ�
      Seek #F, Seek(F) + 4
    End If
  Next e
  On Error GoTo 0
  
  Close #F
  
  ReadFplInfo = True
End Function

Public Function ReadM3UInfo(ByVal FileName As String) As Boolean
  '��ȡ M3U ��Ϣ
  Dim F As Integer
  Dim sLine As String
  Dim sTmp() As String
  Dim bExtended As Boolean
  Dim lCounter As Long
  
  '���ļ�
  F = FreeFile
  Open FileName For Input Access Read Shared As #F
  
  '�������
  Line Input #F, sLine
  
  bExtended = (UCase(sLine) = "#EXTM3U")
  
  '�������
  If (Not bExtended) And (Left(sLine, 1) <> "#") Then
    lCounter = 1
    ReDim M3UAudioList(1 To lCounter) As M3U_ITEM_INFO
    M3UAudioList(lCounter).FileName = sLine
  End If
  
  '��ȡ������Ŀ
  Do Until EOF(F)
    '������ 1
    lCounter = lCounter + 1
    ReDim Preserve M3UAudioList(1 To lCounter) As M3U_ITEM_INFO
    
    '�����
    Line Input #F, sLine
    
    If (Left(sLine, 8) = "#EXTINF:") Then
      '������Ϣ
      sLine = Right(sLine, Len(sLine) - 8)
      
      '�ָ���Ϣ
      sTmp = Split(sLine, ",", 2)
      
      '����
      M3UAudioList(lCounter).Length = Val(sTmp(0))
      M3UAudioList(lCounter).DispTitle = sTmp(1)
      
      '�����һ��
      Line Input #F, sLine
    End If
    
    M3UAudioList(lCounter).FileName = sLine
  Loop
  
  '�ر��ļ�
  Close #F
  
  ReadM3UInfo = True
End Function

Public Function FplListCount() As Long
  On Error Resume Next
  FplListCount = UBound(FPLAudioList)
  On Error GoTo 0
End Function

Public Function GetFplInfoItem(ByVal Index As Long) As FPL_ITEM_INFO
  GetFplInfoItem = FPLAudioList(Index)
End Function

Public Function M3UListCount() As Long
  On Error Resume Next
  M3UListCount = UBound(M3UAudioList)
  On Error GoTo 0
End Function

Public Function GetM3UInfoItem(ByVal Index As Long) As M3U_ITEM_INFO
  GetM3UInfoItem = M3UAudioList(Index)
End Function

'��ȡ�ļ� CUE
Public Function CUE_GetItems(ByVal FileName As String) As VBA.Collection
  '��� CUE ���ݵ�
  Dim F As Integer
  Dim Files As New VBA.Collection
  Dim sLine As String
  Dim lLen As Long
  
  F = FreeFile
  Open FileName For Input Access Read Shared As #F
  
  '��ȡ�ļ�
  On Error GoTo NextLine
  Do Until EOF(F)
    Line Input #1, sLine
    
    If Left(sLine, 4) = "FILE" Then
      sLine = Right(sLine, Len(sLine) - InStr(1, sLine, Chr(34)))
      sLine = Left(sLine, InStrRev(sLine, Chr(34)) - 1)
      Files.Add sLine
    End If
NextLine:
  Loop
  On Error GoTo 0
  
  Close #F
  
  Set CUE_GetItems = Files
End Function

'��ȡ�ļ� PLS
Public Function PLS_GetItems(ByVal FileName As String) As VBA.Collection
  Dim Count As Long
  Dim IniPls As New MP3PA.INIAPI
  Dim sfile As String
  Dim e As Long
  
  Set PLS_GetItems = New VBA.Collection
  
  '����ļ���Ŀ
  IniPls.FileName = FileName
  Count = IniPls.GetIniInteger("playlist", "NumberOfEntries", 0)
  
  '�ֱ��ȡ
  For e = 1 To Count
    sfile = IniPls.GetIniString("playlist", "File" & e)
    PLS_GetItems.Add sfile
  Next e
End Function

'��ȡ�ļ� M3U8
Public Function M3U8_GetItems(ByVal FileName As String) As VBA.Collection
  Dim sStr() As Byte
  Dim sByte As Byte
  Dim sNLine As Byte
  Dim sString As String
  Dim lFile As Long
  Dim lPos As Long
  Dim iBound As Integer
  Dim F As Integer
  
  Set M3U8_GetItems = New VBA.Collection
  
  '���ļ�
  F = FreeFile
  Open FileName For Binary Access Read Shared As #F
  lFile = LOF(F)
  
  lPos = 4
  iBound = 0
  
  Do Until lPos > lFile
    '��ȡ�ַ�
    Get #F, lPos, sByte
    
    '�ж��Ƿ��ǻ��з�
    If (sByte = 13) And (lPos < lFile) Then
      Get #F, lPos + 1, sNLine
      
      If sNLine = 10 Then
        '���µ�һ��
        sString = UTF8_Decode(sStr, True)
        'sString = UTF8_DecodeAlt(sStr)
        M3U8_GetItems.Add sString
        
        '��һ����¼��
        ReDim sStr(0) As Byte
        iBound = 0
        lPos = lPos + 2
        GoTo NextChar
      End If
    End If
    
    '��ȡ����
    ReDim Preserve sStr(iBound) As Byte
    sStr(iBound) = sByte
    iBound = iBound + 1
    lPos = lPos + 1
    
    '��һ��
NextChar:
  Loop
  
  Close #F
End Function

'��ȡ�ļ� WPL
Public Function WPL_GetItems(ByVal FileName As String, ByVal WMP As WMPLibCtl.WindowsMediaPlayer) As VBA.Collection
  '��ȡ�����б�
  Dim oList As WMPLibCtl.IWMPPlaylist
  Dim oItem As WMPLibCtl.IWMPMedia
  Dim e As Long
  
  '���б�
  Set oList = WMP.newPlaylist("WPL_File", FileName)
  Set WPL_GetItems = New VBA.Collection
  
  For e = 0 To oList.Count - 1
    Set oItem = oList.Item(e)
    
    WPL_GetItems.Add oItem.sourceURL
  Next e
End Function

'��ȡ�ļ� ASX
Public Function ASX_GetItems(ByVal FileName As String, ByVal WMP As WMPLibCtl.WindowsMediaPlayer) As VBA.Collection
  '��ȡ�����б�
  Dim oList As WMPLibCtl.IWMPPlaylist
  Dim oItem As WMPLibCtl.IWMPMedia
  Dim e As Long
  
  '���б�
  Set oList = WMP.newPlaylist("ASX_File", FileName)
  Set ASX_GetItems = New VBA.Collection
  
  For e = 0 To oList.Count - 1
    Set oItem = oList.Item(e)
    
    ASX_GetItems.Add oItem.sourceURL
  Next e
End Function

'��ȡ M3U
Public Function M3U_GetItems(ByVal FileName As String) As VBA.Collection
  '��ȡ M3U ��Ϣ
  Dim F As Integer
  Dim sLine As String
  Dim sTmp() As String
  Dim bExtended As Boolean
  Dim lCounter As Long
  
  Set M3U_GetItems = New VBA.Collection
  
  '���ļ�
  F = FreeFile
  Open FileName For Input Access Read Shared As #F
  
  '��ȡ������Ŀ
  Do Until EOF(F)
    '�����
    Line Input #F, sLine
    
    If Not (Left(sLine, 1) = "#") Then
      M3U_GetItems.Add sLine
    End If
  Loop
  
  '�ر��ļ�
  Close #F
End Function

'��ȡǧǧ�������ļ�
Public Function ReadTTPLInfo(ByVal FileName As String, Optional ByVal OnlyReadTitle As Boolean = False) As String
  '��ȡǧǧ���б�
  Dim F As Integer
  Dim bHeader(3) As Byte
  Dim lVersion As Long
  Dim lNull As Long
  Dim lLastPlay As Long
  Dim iJunkByte As Integer
  
  Dim lStrLength As Long
  Dim bStrBuffer() As Byte
  Dim sReader As String
  Dim i As Long
  
  '���ļ�
  F = FreeFile
  Open FileName For Binary Access Read As #F
  
  '��ȡͷ����
  Get #F, , bHeader
  Get #F, , lVersion
  Get #F, , lNull
  Get #F, , lLastPlay
  
  '����Ƿ�����Ҫ�İ汾
  If StrConv(bHeader, vbUnicode) = "TTBL" And lVersion = 3 And lNull = -1 Then
    '��ȡ����
    Get #F, , lStrLength
    ReDim bStrBuffer(lStrLength - 1) As Byte
    Get #F, , bStrBuffer
    sReader = CStr(bStrBuffer)
    ReadTTPLInfo = sReader
    
    If OnlyReadTitle Then Exit Function
  Else
    ReadTTPLInfo = vbNullString
    Close #F
    Exit Function
  End If
  
  i = 0
    
  '��ȡ���е�����
  Do Until EOF(F)
    '����ļ���λ��
    Get #F, , lStrLength
    
    If lStrLength = 0 Then Exit Do
    
    ReDim bStrBuffer(lStrLength - 1) As Byte
    Get #F, , bStrBuffer
    sReader = CStr(bStrBuffer)
    ReDim Preserve M3UAudioList(i) As M3U_ITEM_INFO
    M3UAudioList(i).FileName = sReader
    
    '����ļ�����ʾ������
    Get #F, , iJunkByte
    
    If iJunkByte Then
      '�Ѿ���ȡ�ļ�����
      Get #F, , lStrLength
      ReDim bStrBuffer(lStrLength - 1) As Byte
      Get #F, , bStrBuffer
      sReader = CStr(bStrBuffer)
      M3UAudioList(i).DispTitle = sReader
      
      '����ļ��ĳ���
      If iJunkByte = 6 Then
        Get #F, , lStrLength
        M3UAudioList(i).Length = Int(lStrLength \ 1000)
      End If
    Else
      '��û�ж�ȡ�ļ�����
      M3UAudioList(i).DispTitle = FS.GetBaseName(sReader)
    End If
      
    '��һ���ļ�
    i = i + 1
  Loop
  
  Close #F
End Function


'��ȡ Foobar2000 0.9.x �Ĳ����б�
Public Function ReadFPL9Info(ByVal FileName As String) As Boolean
  
End Function
