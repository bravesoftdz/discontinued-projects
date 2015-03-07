Attribute VB_Name = "Favourite"
Option Explicit

'Fav LVW
Public lLVWDefault(1 To 5) As Long
Public lLVWMusic(1 To 10) As Long
Public oFav As New MP3PA.FAVFolder
Public oFavCol As New VBA.Collection

'IO API
Private Declare Function DeleteFile Lib "kernel32" Alias "DeleteFileA" (ByVal lpFileName As String) As Long

Public Sub AddFavItem(ByVal TVW As MSComctlLib.TreeView, ByVal Node As MSComctlLib.Node, ByVal FI As MP3PA.FAVFolder)
  'ˢ����Ŀ
  Dim oFI As MP3PA.FAVItem
  Dim oFF As MP3PA.FAVFolder
  Dim oND As MSComctlLib.Node
  Dim iCounter As Long
  Dim fCounter As Long
  Dim sStr() As String
  Dim sName As String
  Dim i As Long
  
  '�������ж�ȡ��Ŀ
  iCounter = iniFav.GetIniInteger(FI.Key, "Item")
  fCounter = iniFav.GetIniInteger(FI.Key, "SubFolder")
  
  '�����Ŀ
  For i = 1 To iCounter
    sStr = Split(iniFav.GetIniString(FI.Key, "Item" & i), "|")
    
    If FI.MusicType Then
      '����������ļ�����
      ReDim Preserve sStr(8) As String
      
      Set oFI = FI.FavouriteItems.Add(sStr(0), sStr(0))
      oFI.FileName = sStr(0)
      oFI.Artist = sStr(1)
      oFI.Title = sStr(2)
      oFI.Album = sStr(3)
      oFI.Track = CLng(sStr(4))
      oFI.Year = sStr(5)
      oFI.Genre = sStr(6)
      oFI.Duration = CLng(sStr(7))
      oFI.Comment = sStr(8)
    Else
      '�������ͨ����
      ReDim Preserve sStr(1) As String
      
      Set oFI = FI.FavouriteItems.Add(sStr(0), sStr(0))
      oFI.FileName = sStr(0)
      oFI.Comment = sStr(1)
    End If
  Next i
  
  '������ļ���
  For i = 1 To fCounter
    sName = iniFav.GetIniString(FI.Key, "SubFolder" & i)
    
    '��ӵ���һѭ������
    Set oFF = FI.FavouriteSubFolders.Add(AppendPath(FI.Key, sName), New FAVItems, AppendPath(FI.Key, sName))
    oFF.MusicType = Not CBool(StrComp("MP3PA.FAVOURITE.MUSIC", iniFav.GetIniString(oFF.Key, "Type", "MP3PA.FAVOURITE.MUSIC"), vbTextCompare))
    
    '��ӵ���ͼ��
    Set oND = TVW.Nodes.Add(FI.Key, tvwChild, oFF.Key, sName, IIf(oFF.MusicType, 2, 3))
    oND.Sorted = True
    oND.Expanded = True
    
    '�� Key �� FAVFolder ����
    oFavCol.Add oFF, oFF.Key
    
    '�ݹ�ѭ��
    Call AddFavItem(TVW, oND, oFF)
  Next i
End Sub

Public Sub SaveFavItem(ByVal FF As MP3PA.FAVFolder, Optional ByVal DeleteOriFile As Boolean = False)
  '�����ղؼ�
  Dim FI As MP3PA.FAVItem
  Dim S As String
  Const Divider As String = "|"
  Dim i As Long
  
  If DeleteOriFile Then
    'ɾ���ļ�
    Reset
    Call DeleteFile(iniFav.FileName)
    Set iniFav = New MP3PA.INIOperation
    iniFav.FileName = AppendPath(App.Path, "Favourite.ini")
  End If
  
  '��������
  If FF.MusicType Then
    Call iniFav.SetIniString(FF.Key, "Type", "MP3PA.FAVOURITE.MUSIC")
  Else
    Call iniFav.SetIniString(FF.Key, "Type", "MP3PA.FAVOURITE.NORMAL")
  End If
  
  '������Ŀ
  Call iniFav.SetIniString(FF.Key, "Item", FF.FavouriteItems.Count)
  
  For i = 1 To FF.FavouriteItems.Count
    Set FI = FF.FavouriteItems(i)
    
    '׼������
    If FF.MusicType Then
      S = FI.FileName & Divider & FI.Artist & Divider & FI.Title & Divider & FI.Album & Divider
      S = S & FI.Track & Divider & FI.Year & Divider & FI.Genre & Divider & FI.Duration & Divider & FI.Comment
    Else
      S = FI.FileName & Divider & FI.Comment
    End If
    
    Call iniFav.SetIniString(FF.Key, "Item" & i, S)
  Next i
  
  '������Ŀ¼
  Call iniFav.SetIniString(FF.Key, "SubFolder", FF.FavouriteSubFolders.Count)
  
  For i = 1 To FF.FavouriteSubFolders.Count
    Call iniFav.SetIniString(FF.Key, "SubFolder" & i, FS.GetFileName(FF.FavouriteSubFolders(i).Key))
    
    '�ݹ�ѭ��
    Call SaveFavItem(FF.FavouriteSubFolders(i), False)
  Next i
End Sub

