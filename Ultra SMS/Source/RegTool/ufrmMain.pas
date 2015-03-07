unit ufrmMain;

{$WARN UNIT_PLATFORM OFF}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, XPMan, IniFiles, ShellCtrls, AES, DES,
  ImgList, DB, ADODB, Registry, DateUtils;

type
  TSecretKey = record
    KeyName: String;
    Value: String;
    DESCrypt: Boolean;
  end;

  TfrmMain = class(TForm)
    tabMain: TPageControl;
    tsFileProtection: TTabSheet;
    tsRegedit: TTabSheet;
    xpmMain: TXPManifest;
    lblLocation: TLabel;
    txtLocation: TEdit;
    btnBrowse: TBitBtn;
    lblFileName: TLabel;
    txtFileName: TEdit;
    lblFilePath: TLabel;
    txtFilePath: TEdit;
    btnExit: TButton;
    grpFiles: TGroupBox;
    lvwFile: TListView;
    btnFileAdd: TBitBtn;
    btnFileDel: TBitBtn;
    btnFileClear: TBitBtn;
    btnFileSortByName: TBitBtn;
    tsKey: TTabSheet;
    tbcKey: TTabControl;
    btnRandomKeyAll: TButton;
    lblType: TLabel;
    txtKeyType: TEdit;
    txtKeyLength: TEdit;
    lbl1: TLabel;
    txtKeyName: TEdit;
    lblKeyName: TLabel;
    lblKey: TLabel;
    txtKey: TEdit;
    lblPascal: TLabel;
    btnRandom: TBitBtn;
    btnCopyClipboard: TButton;
    btnSave: TButton;
    lblLastUpdate: TLabel;
    lblDBFile: TLabel;
    txtDBFile: TEdit;
    txtDBPath: TEdit;
    lblDBPath: TLabel;
    grpUser: TGroupBox;
    lvwUser: TListView;
    grpMachine: TGroupBox;
    txtUser: TEdit;
    txtMachine: TEdit;
    lvwMachine: TListView;
    btnUser: TButton;
    btnMachineAdd: TButton;
    btnUserDelete: TButton;
    btnMachineDel: TButton;
    scnFiles: TShellChangeNotifier;
    btnRefresh: TButton;
    lblRegUpdate: TLabel;
    btnRegSave: TButton;
    tsMachineCode: TTabSheet;
    lblIMEI: TLabel;
    txtIMEI: TEdit;
    txtMachineCode: TEdit;
    lblMachineCode: TLabel;
    mmoPascal: TMemo;
    iltFiles: TImageList;
    dlgOpen: TOpenDialog;
    chkLocked: TCheckBox;
    conReginfo: TADOConnection;
    tblCustomer: TADOTable;
    tblMachineCode: TADOTable;
    iltRegDb: TImageList;
    btnQuery: TButton;
    tsRegInfo: TTabSheet;
    lblPeriodDate: TLabel;
    dtpPeriodDate: TDateTimePicker;
    lblRemainSecond: TLabel;
    txtReaminSecond: TEdit;
    lblLastUse: TLabel;
    dtpLastUse: TDateTimePicker;
    lblTodaySecond: TLabel;
    txtTodaySecond: TEdit;
    btnTest: TButton;
    btnReadReg: TButton;
    btnWriteReg: TButton;
    btnDelRegInfo: TButton;
    procedure tsRegeditResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbcKeyChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ValidPaths(Sender: TObject);
    procedure btnBrowseClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnFileAddClick(Sender: TObject);
    procedure btnFileDelClick(Sender: TObject);
    procedure btnFileClearClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure btnFileSortByNameClick(Sender: TObject);
    procedure lvwFileCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure btnRandomClick(Sender: TObject);
    procedure btnCopyClipboardClick(Sender: TObject);
    procedure btnRandomKeyAllClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure chkLockedClick(Sender: TObject);
    procedure txtIMEIChange(Sender: TObject);
    procedure conReginfoAfterConnect(Sender: TObject);
    procedure txtUserChange(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
    procedure conReginfoAfterDisconnect(Sender: TObject);
    procedure tblCustomerAfterOpen(DataSet: TDataSet);
    procedure lvwUserChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure txtUserEnter(Sender: TObject);
    procedure txtUserExit(Sender: TObject);
    procedure btnMachineAddClick(Sender: TObject);
    procedure txtMachineChange(Sender: TObject);
    procedure lvwMachineChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure txtMachineEnter(Sender: TObject);
    procedure txtMachineExit(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
    procedure btnUserDeleteClick(Sender: TObject);
    procedure btnMachineDelClick(Sender: TObject);
    procedure btnRegSaveClick(Sender: TObject);
    procedure txtKeyExit(Sender: TObject);
    procedure txtKeyNameExit(Sender: TObject);
    procedure btnTestClick(Sender: TObject);
    procedure btnReadRegClick(Sender: TObject);
    procedure btnWriteRegClick(Sender: TObject);
    procedure btnDelRegInfoClick(Sender: TObject);
  private
    { Private declarations }
    Keys: array[0..5] of TSecretKey;
    sPath: String;
    iniSetting: TIniFile;
    function FGetFileVer(const FileName: String): String;
    function FAppendPath(const Path1, Path2: String): String;
    procedure FRefreshFileItem(Item: TListItem);
    procedure RamdomKey(const Index: Integer);
    procedure GeneratePascal;
  public
    { Public declarations }
  end;

procedure WriteRegInfo(const PeriodDate: TDateTime; const ReaminSecond: Cardinal;
  const LastUse: TDateTime; const TodaySecond: Cardinal; const EncryptKey: String);
procedure ReadRegInfo(var PeriodDate: TDateTime; var ReaminSecond: Cardinal;
  var LastUse: TDateTime; var TodaySecond: Cardinal; const EncryptKey: String);
procedure CreateRegInfo(const EncryptKey: String);
function ExistReginfo: Boolean;
procedure DeleteRegInfo;

var
  frmMain: TfrmMain;

implementation

uses StrUtils, ShellAPI, CommCtrl, Math, CryptoAPI;

{$R *.dfm}

//==============================================================================
// ȫ�ֺ���
//==============================================================================
{-------------------------------------------------------------------------------
  ������:    WriteRegInfo
  ����:      Administrator
  ����:      2007.08.27
  ����:      const PeriodDate: TDateTime; const ReaminSecond: Cardinal; const LastUse: TDateTime; const TodaySecond: Cardinal
  ����ֵ:    ��
  д��ע����Ϣ��ע�����
-------------------------------------------------------------------------------}
procedure WriteRegInfo(const PeriodDate: TDateTime; const ReaminSecond: Cardinal;
  const LastUse: TDateTime; const TodaySecond: Cardinal; const EncryptKey: String);
var
  rReg: TRegistry;
  sSource: TMemoryStream; 
  sEncrypted: TMemoryStream;
begin
  sSource := TMemoryStream.Create;
  sEncrypted := TMemoryStream.Create;
  sSource.WriteBuffer(PeriodDate, SizeOf(TDateTime));
  sSource.WriteBuffer(ReaminSecond, SizeOf(Cardinal));
  sSource.WriteBuffer(LastUse, SizeOf(TDateTime));
  sSource.WriteBuffer(TodaySecond, SizeOf(Cardinal));
  AES.EncryptStream(sSource, EncryptKey, TStream(sEncrypted), kb256);

  // д�뵽ע�����
  rReg := TRegistry.Create;
  rReg.RootKey := HKEY_CLASSES_ROOT;

  if rReg.OpenKey('\CLSID\{0872425E-33B3-4866-8492-5E86BC4DF1A4}', True) then
  begin
    rReg.WriteBinaryData('ProgInfo', sEncrypted.Memory^, sEncrypted.Size);
    rReg.CloseKey;
  end;  

  rReg.Free;
  sSource.Free;
  sEncrypted.Free;
end;  

{*******************************************************************************
  ������:    ReadRegInfo
  ����:      Administrator
  ����:      2007.08.27
  ����:      var PeriodDate: TDateTime; var ReaminSecond: Cardinal; var LastUse: TDateTime; var TodaySecond: Cardinal; const EncryptKey: String
  ����ֵ:    ��

  ˵��:
 -------
  ��ȡע����е�ע����Ϣ
*******************************************************************************}
procedure ReadRegInfo(var PeriodDate: TDateTime; var ReaminSecond: Cardinal;
  var LastUse: TDateTime; var TodaySecond: Cardinal; const EncryptKey: String);
var
  rReg: TRegistry;
  sSource: TMemoryStream; 
  sDecrypted: TMemoryStream;
  aData: array of Byte;
  iLen: Integer;
  CanGo: Boolean;
begin
  rReg := TRegistry.Create;
  rReg.RootKey := HKEY_CLASSES_ROOT;
  CanGo := False;

  if rReg.OpenKeyReadOnly('\CLSID\{0872425E-33B3-4866-8492-5E86BC4DF1A4}') then
  begin
    iLen := rReg.GetDataSize('ProgInfo');
    SetLength(aData, iLen);
    rReg.ReadBinaryData('ProgInfo', aData[0], iLen);
    rReg.CloseKey;
    CanGo := True;
  end;

  rReg.Free;

  if CanGo then  
  begin  
    // ����
    sSource := TMemoryStream.Create;
    sDecrypted := TMemoryStream.Create;
    sSource.WriteBuffer(aData[0], iLen);
    AES.DecryptStream(sSource, EncryptKey, TStream(sDecrypted), kb256);  
    sSource.Free;

    // ��ȡ����
    sDecrypted.ReadBuffer(PeriodDate, SizeOf(TDateTime));
    sDecrypted.ReadBuffer(ReaminSecond, SizeOf(Cardinal));
    sDecrypted.ReadBuffer(LastUse, SizeOf(TDateTime));
    sDecrypted.ReadBuffer(TodaySecond, SizeOf(Cardinal));
  end;    
    
end;  

{*******************************************************************************
  ������:    CreateRegInfo
  ����:      Administrator
  ����:      2007.08.27
  ����:      const EncryptKey: String
  ����ֵ:    ��

  ˵��:
 -------
  ����ע����Ϣ����������ڵĻ�
*******************************************************************************}
procedure CreateRegInfo(const EncryptKey: String);
var
  rReg: TRegistry;
begin
  rReg := TRegistry.Create;
  rReg.RootKey := HKEY_CLASSES_ROOT;

  if not rReg.KeyExists('\CLSID\{0872425E-33B3-4866-8492-5E86BC4DF1A4}') then
    WriteRegInfo(IncDay(Date, 15), 54000, Date, 600, EncryptKey);

  rReg.Free;
end;  

{*******************************************************************************
  ������:    ExistReginfo
  ����:      Administrator
  ����:      2007.08.27
  ����:      ��
  ����ֵ:    Boolean

  ˵��:
 -------
  ����Ƿ����ע����Ϣ
*******************************************************************************}
function ExistReginfo: Boolean;
var
  rReg: TRegistry;
begin
  rReg := TRegistry.Create;
  rReg.RootKey := HKEY_CLASSES_ROOT;
  Result := rReg.KeyExists('\CLSID\{0872425E-33B3-4866-8492-5E86BC4DF1A4}');
  rReg.Free;
end;  

{*******************************************************************************
  ������:    DeleteRegInfo
  ����:      Administrator
  ����:      2007.08.27
  ����:      ��
  ����ֵ:    ��

  ˵��:
 -------
  ɾ��ע����е�ע����Ϣ
*******************************************************************************}
procedure DeleteRegInfo;
var
  rReg: TRegistry;
begin
  rReg := TRegistry.Create;
  rReg.RootKey := HKEY_CLASSES_ROOT;
  if rReg.KeyExists('\CLSID\{0872425E-33B3-4866-8492-5E86BC4DF1A4}') then
    rReg.DeleteKey('\CLSID\{0872425E-33B3-4866-8492-5E86BC4DF1A4}');
  rReg.Free;
end;  

//==============================================================================
// TfrmMain �෽��
//==============================================================================
function GetFileLength(const FileName: String): LongInt;
var
  pFile: HFILE;  
begin  
  pFile := FileOpen(FileName, fmOpenRead);
  Result := GetFileSize(pFile, nil);
  FileClose(pFile);
end;

procedure TfrmMain.txtMachineChange(Sender: TObject);
begin
  // ���������Ŀ
  if Length(txtMachine.Text) = 0 then
    lvwMachine.Selected := nil
  else
    lvwMachine.Selected := lvwMachine.FindCaption(0, txtMachine.Text, True, False, True);
end;

{function StrToHex(const sSrc: string): String;
var
  i: Integer;
begin
  for i := 1 to Length(sSrc) do
    Result := Result + Format('%2.2X', [sSrc[i]]);
end;  

function HexToStr(sSrc: string): String;
var
  i: Integer;
begin
  if (Length(sSrc) mod 2) = 1 then
    sSrc := sSrc + '0';    

  SetLength(Result, Length(sSrc) div 2);
  for i := 1 to Length(sSrc) div 2 do
    Result[i] := Chr(StrToInt('$' + MidStr(sSrc, i * 2 - 1, 2)));
end;}  

function TfrmMain.FGetFileVer(const FileName: String):String;
var
  rc: Boolean;
  cDummy, cLength, cVerLen: Cardinal;
  sBuffer: PChar;
  udtVerBuffer: VS_FIXEDFILEINFO;
  lVerPointer: Pointer;
begin
  cLength := GetFileVersionInfoSize(PChar(FileName), cDummy);

  // û�п��õ���Ϣ
  if cLength < 1 then
  begin
    Result := '';
    Exit;
  end;

  // ��ð���Ϣ
  GetMem(sBuffer, cLength);
  rc := GetFileVersionInfo(PChar(FileName), 0, cLength, sBuffer);
  rc := VerQueryValue(sBuffer, '\', lVerPointer, cVerLen);
  MoveMemory(@udtVerBuffer, lVerPointer, SizeOf(VS_FIXEDFILEINFO));

  // ��������
  Result := IntToStr(udtVerBuffer.dwFileVersionMS shr 16) + '.' +
    IntToStr(udtVerBuffer.dwFileVersionMS and $FFFF) + '.' +
    IntToStr(udtVerBuffer.dwFileVersionLS shr 16) + '.' +
    IntToStr(udtVerBuffer.dwFileVersionLS and $FFFF);
end;

function TfrmMain.FAppendPath(const Path1, Path2: String): String;
begin
  if AnsiEndsText('\', Path1) then
    Result := Path1 + Path2
  else
    Result := Path1 + '\' + Path2;
end;  

procedure TfrmMain.tsRegeditResize(Sender: TObject);
begin
  grpUser.Width := (tsRegedit.Width - 23) div 2;
  grpMachine.Width := (tsRegedit.Width - 23) div 2;
  grpMachine.Left := grpUser.Width + 15;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  // ��ʼ������
  Keys[0].KeyName := 'KEY_CRYPTO_IMEI';
  Keys[1].KeyName := 'KEY_CRYPTO_REGINFO';
  Keys[2].KeyName := 'KEY_CRYPTO_REGITEM';
  Keys[3].KeyName := 'KEY_CRYPTO_FILE';
  Keys[4].KeyName := 'KEY_CRYPTO_FILEITEM';
  Keys[5].KeyName := 'KEY_CRYPTO_REGISTRY';

  Keys[0].DESCrypt := True;
  Keys[1].DESCrypt := False;
  Keys[2].DESCrypt := True;
  Keys[3].DESCrypt := False;
  Keys[4].DESCrypt := True;
  Keys[5].DESCrypt := False;
  
  // ��õ�ǰĿ¼��λ��
  sPath := ExtractFilePath(ParamStr(0));

  // �������ļ�
  iniSetting := TIniFile.Create(FAppendPath(sPath, 'regtool.ini'));

  // ��ȡ����λ��
  if iniSetting.ReadBool('Position', 'Maximized', False) then
    frmMain.WindowState := wsMaximized
  else
  begin
    frmMain.Left := iniSetting.ReadInteger('Position', 'Left', 60);
    frmMain.Top := iniSetting.ReadInteger('Position', 'Top', 60);
    frmMain.Width := iniSetting.ReadInteger('Position', 'Width', 664);
    frmMain.Height := iniSetting.ReadInteger('Position', 'Height', 507);
  end;

  // ��ȡ����λ��
  txtLocation.Text := iniSetting.ReadString('Settings', 'ProgDir', sPath);
  txtFileName.Text := iniSetting.ReadString('Settings', 'CheckSumFile', 'file.db');
  txtDBFile.Text := iniSetting.ReadString('Settings', 'RegInfoFile', 'reginfo.db');

  lvwFile.Columns[0].Width := iniSetting.ReadInteger('File ListView', 'ColumnWidth0', 120);
  lvwFile.Columns[1].Width := iniSetting.ReadInteger('File ListView', 'ColumnWidth1', 75);
  lvwFile.Columns[2].Width := iniSetting.ReadInteger('File ListView', 'ColumnWidth2', 100);
  lvwFile.Columns[3].Width := iniSetting.ReadInteger('File ListView', 'ColumnWidth3', 150);
  lvwFile.Columns[4].Width := iniSetting.ReadInteger('File ListView', 'ColumnWidth4', 130);

  lvwUser.Columns[0].Width := iniSetting.ReadInteger('Customer ListView', 'ColumnWidth0', 100);
  lvwUser.Columns[1].Width := iniSetting.ReadInteger('Customer ListView', 'ColumnWidth1', 75);
  lvwUser.Columns[2].Width := iniSetting.ReadInteger('Customer ListView', 'ColumnWidth2', 80);
  
  lvwMachine.Columns[0].Width := iniSetting.ReadInteger('MCode ListView', 'ColumnWidth0', 100);
  lvwMachine.Columns[1].Width := iniSetting.ReadInteger('MCode ListView', 'ColumnWidth1', 75);
  lvwMachine.Columns[2].Width := iniSetting.ReadInteger('MCode ListView', 'ColumnWidth2', 80);

  // ��ȡ�ؼ���
  for i := Low(Keys) to High(Keys) do
  begin
    Keys[i].KeyName := iniSetting.ReadString('Security Keys', 'KeyName' + IntToStr(i), Keys[i].KeyName);
    Keys[i].Value := iniSetting.ReadString('Security Keys', 'Value' + IntToStr(i), Keys[i].Value);
  end;

  // �����ݿ�
  conReginfo.Connected := False;
  conReginfo.ConnectionString := Format('Provider=Microsoft.Jet.OLEDB.4.0;Data Source=%s;Persist Security Info=False', [FAppendPath(sPath, 'reginfo.mdb')]);
  conReginfo.Connected := True;
  
  ValidPaths(nil);
  tbcKeyChange(nil);
end;

procedure TfrmMain.tbcKeyChange(Sender: TObject);
begin
  with Keys[tbcKey.TabIndex] do
  begin
    txtKeyName.Text := KeyName;
    txtKey.Text := '';
  
    if DESCrypt then
    begin
      txtKeyType.Text := 'DES';
      txtKeyLength.Text := '7 byte (56 bit)';
      txtkey.MaxLength := 14;
    end
    else
    begin
      txtKeyType.Text := 'ASE';
      txtKeyLength.Text := '32 byte (256 bit)';
      txtKey.MaxLength := 64;
    end;  

    txtKey.Text := Value;
    GeneratePascal;
  end;  
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  // �ر����ݿ�
  tblCustomer.Close;
  tblMachineCode.Close;
  conReginfo.Connected := False;

  iniSetting.WriteBool('Position', 'Maximized', frmMain.WindowState = wsMaximized);

  frmMain.WindowState := wsNormal;
  iniSetting.WriteInteger('Position', 'Left', frmMain.Left);
  iniSetting.WriteInteger('Position', 'Top', frmMain.Top);
  iniSetting.WriteInteger('Position', 'Width', frmMain.Width);
  iniSetting.WriteInteger('Position', 'Height', frmMain.Height);

  // �������λ��
  iniSetting.WriteString('Settings', 'ProgDir', txtLocation.Text);
  iniSetting.WriteString('Settings', 'CheckSumFile', txtFileName.Text);
  iniSetting.WriteString('Settings', 'RegInfoFile', txtDBFile.Text);

  iniSetting.WriteInteger('File ListView', 'ColumnWidth0', lvwFile.Columns[0].Width);
  iniSetting.WriteInteger('File ListView', 'ColumnWidth1', lvwFile.Columns[1].Width);
  iniSetting.WriteInteger('File ListView', 'ColumnWidth2', lvwFile.Columns[2].Width);
  iniSetting.WriteInteger('File ListView', 'ColumnWidth3', lvwFile.Columns[3].Width);
  iniSetting.WriteInteger('File ListView', 'ColumnWidth4', lvwFile.Columns[4].Width);

  iniSetting.WriteInteger('Customer ListView', 'ColumnWidth0', lvwUser.Columns[0].Width);
  iniSetting.WriteInteger('Customer ListView', 'ColumnWidth1', lvwUser.Columns[1].Width);
  iniSetting.WriteInteger('Customer ListView', 'ColumnWidth2', lvwUser.Columns[2].Width);

  iniSetting.WriteInteger('MCode ListView', 'ColumnWidth0', lvwMachine.Columns[0].Width);
  iniSetting.WriteInteger('MCode ListView', 'ColumnWidth1', lvwMachine.Columns[1].Width);
  iniSetting.WriteInteger('MCode ListView', 'ColumnWidth2', lvwMachine.Columns[2].Width);
  
  // ����ؼ���
  for i := Low(Keys) to High(Keys) do
  begin
    iniSetting.WriteString('Security Keys', 'KeyName' + IntToStr(i), Keys[i].KeyName);
    iniSetting.WriteString('Security Keys', 'Value' + IntToStr(i), Keys[i].Value);
  end;

  iniSetting.UpdateFile;
end;

procedure TfrmMain.ValidPaths(Sender: TObject);
var
  Enabled: Boolean;
  sFile: TFileStream;
  sMemory: TMemoryStream;
  sFileItem: TStringList;
  i: Integer;
  SplitPos: Integer;
  xItem: TListItem;
begin
  // �ж�·����ȷ��
  Enabled := FileExists(FAppendPath(txtLocation.Text, 'ultrasms.exe'));

  lblFilePath.Enabled := Enabled;
  txtFilePath.Enabled := Enabled;
  grpFiles.Enabled := Enabled;
  lvwFile.Enabled := Enabled;
  btnFileAdd.Enabled := Enabled;
  btnFileDel.Enabled := Enabled;
  btnFileClear.Enabled := Enabled;
  btnFileSortByName.Enabled := Enabled;
  btnRefresh.Enabled := Enabled;
  btnSave.Enabled := Enabled;
  lblLastUpdate.Enabled := Enabled;
  lblDBPath.Enabled := Enabled;
  txtDBPath.Enabled := Enabled;
  lblRegUpdate.Enabled := Enabled;
  btnRegSave.Enabled := Enabled and conReginfo.Connected;

  if Enabled then
  begin
    txtFilePath.Text := FAppendPath(txtLocation.Text, txtFileName.Text);

    if FileExists(txtFilePath.Text) then
    begin
      // ����ļ��޸�ʱ��
      lblLastUpdate.Caption := '������ʱ��: ' + 
        DateTimeToStr(FileDateToDateTime(FileAge(txtFilePath.Text)));
      
      // ��ȡУ���ļ�����
      sFile := TFileStream.Create(txtFilePath.Text, fmOpenRead);
      sMemory :=  TMemoryStream.Create;
      sFileItem := TStringList.Create;

      // ��һ�ν���
      AES.DecryptStream(sFile, HexToStr(Keys[3].Value), TStream(sMemory), kb256);

      // ���ÿ����Ϣ��Ŀ
      sFileItem.LoadFromStream(sMemory);

      lvwFile.Clear;

      for i := 0 to sFileItem.Count - 1 do
      begin
        sFileItem[i] := DES.DecryStrHex(sFileItem[i], HexToStr(Keys[4].Value));
        SplitPos :=  Pos('|', sFileItem[i]);

        if SplitPos > 0 then
        begin
          xItem := lvwFile.Items.Add;
          xItem.Caption := LeftStr(sFileItem[i], SplitPos - 1);
          FRefreshFileItem(xItem);
        end;  
      end;

      // �ر�
      sFileItem.Free;
      sMemory.Free;
      sFile.Free;
    end
      else
        lblLastUpdate.Caption := '�ļ�������';

    txtDBPath.Text := FAppendPath(txtLocation.Text, txtDBFile.Text);

    if FileExists(txtDBPath.Text) then
      lblRegUpdate.Caption := '������ʱ��: ' + 
        DateTimeToStr(FileDateToDateTime(FileAge(txtDBPath.Text)))
    else
      lblRegUpdate.Caption := '�ļ�������';
  end;  
  
end;

procedure TfrmMain.btnBrowseClick(Sender: TObject);
begin
  dlgOpen.Filter := 'Ultra SMS ������ (ultrasms.exe)|ultrasms.exe';
  dlgOpen.Options := dlgOpen.Options - [ofAllowMultiSelect]; 

  if dlgOpen.Execute then
  begin
    txtLocation.Text := ExtractFilePath(dlgOpen.FileName);
    ValidPaths(nil);
  end;  
end;

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.btnFileAddClick(Sender: TObject);
var
  i: Integer;
  xItem: TListItem;
begin
  // ����ļ����б�
  dlgOpen.Filter := '�����ļ�|*.*';
  dlgOpen.Options := dlgOpen.Options + [ofAllowMultiSelect];

  if dlgOpen.Execute then
    for i := 0 to dlgOpen.Files.Count - 1 do
    begin
      xItem := lvwFile.Items.Add;
      xItem.Caption := ExtractFileName(dlgOpen.Files[i]);
      FRefreshFileItem(xItem);
    end;
end;

procedure TfrmMain.FRefreshFileItem(Item: TListItem);
var
  FullName: String;
  udtFileInfo: SHFILEINFO;
  hImageList: Cardinal;
  handleIcon: HICON;
  AIcon: TIcon;
begin
  FullName := FAppendPath(txtLocation.Text, Item.Caption);

  while not (Item.SubItems.Count = 4) do
    Item.SubItems.Add('');
  
  // ����ļ�ͼ��
  if FileExists(FullName) then
  begin
    hImageList := SHGetFileInfo(PChar(FullName), 0, udtFileInfo, SizeOf(SHFILEINFO),
      SHGFI_TYPENAME Or SHGFI_SHELLICONSIZE Or SHGFI_SYSICONINDEX Or 
      SHGFI_DISPLAYNAME Or SHGFI_EXETYPE or SHGFI_SMALLICON);

    //handleIcon := ImageList_GetIcon(hImageList, udtFileInfo.iIcon, ILD_TRANSPARENT);
    handleIcon := ImageList_ExtractIcon(0, hImageList, udtFileInfo.iIcon);
    AIcon := TIcon.Create;
    AIcon.Handle := handleIcon;
    Item.ImageIndex := iltFiles.AddIcon(AIcon);
    Item.SubItems[0] := FormatFloat('#,##0', GetFileLength(FullName));
    Item.SubItems[1] := udtFileInfo.szTypeName;
    Item.SubItems[2] := DateTimeToStr(FileDateToDateTime(FileAge(FullName)));
    Item.SubItems[3] := FGetFileVer(FullName);
    Item.Cut := False;
    DestroyIcon(handleIcon);
    AIcon.Free;
  end
  else
  begin
    Item.Cut := True;
    Item.ImageIndex := -1;
    Item.SubItems[0] := '';
    Item.SubItems[1] := '';
    Item.SubItems[2] := '';
    Item.SubItems[3] := '';
  end;  
end;  

procedure TfrmMain.btnFileDelClick(Sender: TObject);
begin
  lvwFile.DeleteSelected;
end;

procedure TfrmMain.btnFileClearClick(Sender: TObject);
begin
  lvwFile.Clear;
  iltFiles.Clear;
end;

procedure TfrmMain.btnRefreshClick(Sender: TObject);
var
  i: Integer;
begin
  iltFiles.Clear;

  for i := 0 to lvwFile.Items.Count - 1 do
    FRefreshFileItem(lvwFile.Items[i]);
end;

procedure TfrmMain.btnFileSortByNameClick(Sender: TObject);
begin
  // ����������
  lvwFile.AlphaSort;
end;

procedure TfrmMain.lvwFileCompare(Sender: TObject; Item1, Item2: TListItem;
  Data: Integer; var Compare: Integer);
begin
  Compare := StrComp(PChar(Item1.Caption), PChar(Item2.Caption));
end;

procedure TfrmMain.RamdomKey(const Index: Integer);
var
  xRand: Byte;
  mByte: SmallInt;
  i: SmallInt;
  sKey: string;
begin
  mByte := IfThen(Keys[Index].DESCrypt, 7, 32);
  sKey := '';

  for i := 1 to mByte do
    sKey := sKey + Format('%2.2X', [Trunc(Random * 255 + 1)]);

  Keys[Index].Value := sKey;
end;  

procedure TfrmMain.GeneratePascal;
var
  i: Integer;
  sSpace: string;
  sLine: string;
begin
  mmoPascal.Clear;
  mmoPascal.Lines.Add('const');
  sLine := '  ' + txtKeyName.Text + ':String = '; 
  sSpace := StringOfChar(' ', Length(sLine));

  for i := 1 to (Length(txtKey.Text) div 2) do
  begin
    sLine := sLine + '#$' + MidStr(txtKey.Text, i * 2 - 1, 2);

    if i = (Length(txtKey.Text) div 2) then
      sLine := sLine + ';'
    else if (i mod 8) = 0 then
    begin
      mmoPascal.Lines.Add(sLine + ' +');
      sLine := sSpace;
    end;
  end; 

  if Length(Trim(sLine)) <> 0 then
    mmoPascal.Lines.Add(sLine);
end;  

procedure TfrmMain.btnRandomClick(Sender: TObject);
begin
  RamdomKey(tbcKey.TabIndex);
  txtKey.Text := Keys[tbcKey.TabIndex].Value;
  GeneratePascal;
end;

procedure TfrmMain.btnCopyClipboardClick(Sender: TObject);
begin
  mmoPascal.SelectAll;
  mmoPascal.CopyToClipboard;
end;

procedure TfrmMain.btnRandomKeyAllClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to 4 do
    RamdomKey(i);
  tbcKeyChange(nil);
end;

procedure TfrmMain.btnSaveClick(Sender: TObject);
var
  sLine: String;
  sMD5: String;  
  slFile: TStringList;
  sMemory: TMemoryStream;
  sOutPut: TFileStream;
  i: Integer;
  Key4, Key5: string;
begin
  if MessageBox(Handle, '�Ƿ񱣴��µ��ļ�У�����ݣ��⽫������ǰ���ļ���', 
    PChar(Caption), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO then
  begin
    Exit;
  end;

  Key4 := HexToStr(Keys[3].Value);
  Key5 := HexToStr(Keys[4].Value);

  // �洢�ļ�У��
  slFile := TStringList.Create;

  for i := 0 to lvwFile.Items.Count - 1 do
  begin
    HashFile(HASH_MD5, FAppendPath(txtLocation.Text, lvwFile.Items[i].Caption), sMD5);
    sLine := lvwFile.Items[i].Caption + '|' + UpperCase(sMD5);
    sLine := DES.EncryStrHex(sLine, Key5);
    slFile.Add(sLine);
  end;

  // �ļ�����
  sMemory := TMemoryStream.Create;
  sOutPut := TFileStream.Create(txtFilePath.Text, fmCreate);
  slFile.SaveToStream(sMemory);
  AES.EncryptStream(sMemory, Key4, TStream(sOutPut), kb256);
  sOutPut.Free;
  sMemory.Free;
  slFile.Free;

  MessageBox(Handle, '�ļ�����ɹ���', PChar(Caption), MB_OK + 
    MB_ICONINFORMATION);
end;

procedure TfrmMain.chkLockedClick(Sender: TObject);
begin
  if not chkLocked.Checked then
    if MessageBox(Handle, 
      '������ʼ��Կ�༭ģʽ���������Լ�֪���Լ��ڸ�ʲô������Ҫ�༭��Կ����ȷʵҪ���������'
      + #13#10#13#10 + '* ѡ���ǡ��������Կ�༭������' + #13#10 + 
      '* ѡ�񡰷񡱣�����������Կ�༭ģʽ��', PChar(Caption), MB_YESNO + 
      MB_ICONWARNING) = IDYES then
    begin
      chkLocked.Checked := True;
    end;

  btnRandomKeyAll.Enabled := not chkLocked.Checked;
  btnRandom.Enabled := not chkLocked.Checked;
  txtKey.Enabled := not chkLocked.Checked;
  txtKeyName.Enabled := not chkLocked.Checked;

  txtKey.Color := IfThen(chkLocked.Checked, clBtnFace, clWindow);
  txtKeyName.Color := IfThen(chkLocked.Checked, clBtnFace, clWindow);
end;

procedure TfrmMain.txtIMEIChange(Sender: TObject);
var
  sCRC: string;
begin
  // ���ɻ�����
  if Length(txtIMEI.Text) = 0 then
    txtMachineCode.Text := ''
  else
  begin
    CryptoAPI.HashStr(HASH_CRC32, txtIMEI.Text, sCRC);
    txtMachineCode.Text := DES.EncryStrHex(sCRC, HexToStr(Keys[0].Value));
  end;
end;

procedure TfrmMain.conReginfoAfterConnect(Sender: TObject);
begin
  // ����
  grpUser.Enabled := True;
  txtUser.Enabled := True;
  txtUser.Color := clWindow;
  btnUser.Enabled := True;
  lvwUser.Enabled := True;
  
  grpMachine.Enabled := True;
  txtMachineCode.Enabled := True;
  txtMachineCode.Color := clWindow;

  tblCustomer.Open;
  tblMachineCode.Open;
end;

procedure TfrmMain.txtUserChange(Sender: TObject);
begin
  // ���������Ŀ
  if Length(txtUser.Text) = 0 then
    lvwUser.Selected := nil
  else
    lvwUser.Selected := lvwUser.FindCaption(0, txtUser.Text, True, False, True);
end;

procedure TfrmMain.btnUserClick(Sender: TObject);
var
  xItem: TListItem;
begin
  if Length(txtUser.Text) = 0 then
  begin
    MessageBox(Handle, '��������дһ�����֡�', PChar(Caption), MB_OK + 
      MB_ICONWARNING);
    Windows.SetFocus(txtUser.Handle);
    Exit;  
  end;  

  // ���һ����Ŀ�����ݿ�
  tblCustomer.Append;
  tblCustomer.FieldByName('customer').AsString := txtUser.Text;
  tblCustomer.FieldByName('regdate').AsDateTime := Now;
  tblCustomer.Post;

  xItem := lvwUser.Items.Add;
  xItem.Caption := tblCustomer.FieldByName('customer').AsString;
  xItem.SubItems.Add(IntToStr(tblCustomer.FieldByName('id').AsInteger));
  xItem.SubItems.Add(FormatDateTime('yyyy-mm-dd hh:MM:ss', 
    tblCustomer.FieldByName('regdate').AsDateTime));
  xItem.Selected := True;
  
end;

procedure TfrmMain.conReginfoAfterDisconnect(Sender: TObject);
begin
  grpUser.Enabled := False;
  txtUser.Enabled := False;
  txtUser.Color := clBtnFace;
  lvwUser.Enabled := False;
  btnUserDelete.Enabled := False;

  grpMachine.Enabled := False;
  txtMachineCode.Enabled := False;
  txtMachineCode.Color := clBtnFace;
  btnMachineAdd.Enabled := False;
  btnMachineDel.Enabled := False;

  btnRegSave.Enabled := False;
end;

procedure TfrmMain.tblCustomerAfterOpen(DataSet: TDataSet);
var
  xItem: TListItem;
begin
  // ��ȡ��Ϣ
  if not tblCustomer.Bof then
    tblCustomer.First;

  lvwUser.Clear;
  
  while not tblCustomer.Eof do
  begin
    xItem := lvwUser.Items.Add;
    xItem.Caption := tblCustomer.FieldByName('customer').AsString;
    xItem.SubItems.Add(IntToStr(tblCustomer.FieldByName('id').AsInteger));
    xItem.SubItems.Add(FormatDateTime('yyyy-mm-dd hh:MM:ss', 
      tblCustomer.FieldByName('regdate').AsDateTime));
    xItem.ImageIndex := 0;
    tblCustomer.Next;
  end;
end;

procedure TfrmMain.lvwUserChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
var
  xItem: TListItem;
begin
  // �г�����
  if Change = ctState then
  begin
    btnUserDelete.Enabled := lvwUser.SelCount > 0;
    btnMachineAdd.Enabled := lvwUser.SelCount > 0;

    if btnUserDelete.Enabled then
    begin
      tblMachineCode.Filtered := False;
      tblMachineCode.Filter := 'customerid = ' +
        lvwUser.Selected.SubItems[0];
      tblMachineCode.Filtered := True;
    end                                                
    else
      tblMachineCode.Filtered := False;

    if not tblMachineCode.Bof then
      tblMachineCode.First;

    lvwMachine.Clear;

    while not tblMachineCode.Eof do
    begin
      xItem := lvwMachine.Items.Add;
      xItem.Caption := tblMachineCode.FieldByName('machinecode').AsString;
      xItem.SubItems.Add(IntToStr(tblMachineCode.FieldByName('customerid').AsInteger));
      xItem.SubItems.Add((FormatDateTime('yyyy-mm-dd hh:MM:ss',
        tblMachineCode.FieldByName('regdate').AsDateTime)));
      xItem.ImageIndex := Integer(tblMachineCode.FieldByName('locked').AsBoolean) + 1;
      xItem.Data := Pointer(tblMachineCode.FieldByName('itemid').AsInteger);
      tblMachineCode.Next;
    end;  
  end;
  
end;

procedure TfrmMain.txtUserEnter(Sender: TObject);
begin
  btnUser.Default := True;
end;

procedure TfrmMain.txtUserExit(Sender: TObject);
begin
  btnUser.Default := False;
end;

procedure TfrmMain.btnMachineAddClick(Sender: TObject);
var
  xItem: TListItem;
  sql: TADOQuery;
begin
  if Length(txtMachine.Text) = 0 then
  begin
    MessageBox(Handle, '��������дһ�����롣', PChar(Caption), MB_OK + 
      MB_ICONWARNING);
    Windows.SetFocus(txtMachineCode.Handle);
    Exit;  
  end;  

  // ����Ƿ�����ͬ����Ŀ
  sql := TADOQuery.Create(nil);
  sql.Connection := conReginfo;
  sql.SQL.Text := Format('SELECT [customerid] FROM [machinecode] WHERE [machinecode].[machinecode] = "%s";',
    [txtMachine.Text]);
  sql.Open;

  if not (sql.Bof and sql.Eof) then
  begin
    MessageBox(Handle, 
      PChar(Format('������Ļ����롰%s���Ѿ���������%d���Ĺ˿����ˡ�������ӡ�',
      [txtMachineCode.Text, sql.FieldByName('customerid').AsInteger])),
      PChar(Caption), MB_OK + MB_ICONWARNING);
    Windows.SetFocus(txtMachine.Handle);
    sql.Close;
    sql.Free;
    Exit;
  end;

  sql.Close;
  sql.Free;

  // ��ӻ�����
  tblMachineCode.Append;
  tblMachineCode.FieldByName('machinecode').AsString := txtMachine.Text;
  tblMachineCode.FieldByName('regdate').AsDateTime := Now;
  tblMachineCode.FieldByName('customerid').AsInteger := StrToInt(lvwUser.Selected.SubItems[0]);
  tblMachineCode.Post;

  xItem := lvwMachine.Items.Add;
  xItem.Caption := tblMachineCode.FieldByName('machinecode').AsString;
  xItem.SubItems.Add(IntToStr(tblMachineCode.FieldByName('customerid').AsInteger));
  xItem.SubItems.Add((FormatDateTime('yyyy-mm-dd hh:MM:ss',
    tblMachineCode.FieldByName('regdate').AsDateTime)));
  xItem.ImageIndex := Integer(tblMachineCode.FieldByName('locked').AsBoolean) + 1;
  xItem.Data := Pointer(tblMachineCode.FieldByName('itemid').AsInteger);
  xItem.Selected := True;
end;
procedure TfrmMain.lvwMachineChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  if Change = ctState then
    btnMachineDel.Enabled := lvwMachine.SelCount > 0;
end;

procedure TfrmMain.txtMachineEnter(Sender: TObject);
begin
  btnMachineAdd.Default := True;
end;

procedure TfrmMain.txtMachineExit(Sender: TObject);
begin
  btnMachineAdd.Default := False;
end;

procedure TfrmMain.btnQueryClick(Sender: TObject);
var
  sql: TADOQuery;
  i: Integer;
  CustomID: Integer;
begin
  sql := TADOQuery.Create(nil);
  sql.Connection := conReginfo;
  sql.SQL.Text := Format('SELECT [customerid] FROM [machinecode] WHERE [machinecode].[machinecode] = "%s";', 
    [txtMachine.Text]);
  sql.Open;

  if (sql.Bof and sql.Eof) then
  begin
    MessageBox(Handle, 
      PChar(Format('������Ļ����롰%s��û�м�¼��',
      [txtMachineCode.Text])),
      PChar(Caption), MB_OK + MB_ICONWARNING);
    Windows.SetFocus(txtMachine.Handle);
    sql.Close;
    sql.Free;
    Exit;
  end;

  CustomID := sql.FieldByName('customerid').AsInteger;
  
  for i := 0 to lvwUser.Items.Count - 1 do
    if StrToInt(lvwUser.Items[i].SubItems[0]) = CustomID then
      lvwUser.Selected := lvwUser.Items[i];

  txtMachineChange(nil);
end;

procedure TfrmMain.btnUserDeleteClick(Sender: TObject);
var
  sql: TADOQuery;
begin
  // ɾ����ѡ�Ŀͻ�
  if (lvwUser.Selected <> nil) and (MessageBox(Handle, '���Ƿ�Ҫɾ������û��������������еĻ����ţ�', 
    PChar(Caption), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES) then
  begin
    sql := TADOQuery.Create(nil);
    sql.Connection := conReginfo;
    sql.SQL.Text := Format('DELETE FROM [customer] WHERE [customer].[id] = %s;', 
      [lvwUser.Selected.SubItems[0]]);
    sql.ExecSQL;
    tblMachineCode.Close;
    tblMachineCode.Open;
    tblCustomer.Close;
    tblCustomer.Open;
    lvwUser.DeleteSelected;
  end;
end;

procedure TfrmMain.btnMachineDelClick(Sender: TObject);
var
  sql: TADOQuery;
begin
  // ��������״̬
  if (lvwMachine.Selected <> nil) then
  begin
    sql := TADOQuery.Create(nil);
    sql.Connection := conReginfo;
    sql.SQL.Text := Format('UPDATE [machinecode] SET [machinecode].[locked] = NOT [machinecode].[locked] WHERE [machinecode].[itemid] = %d;', 
      [Integer(lvwMachine.Selected.Data)]);
    sql.ExecSQL;
    tblMachineCode.Close;
    tblMachineCode.Open;
    lvwMachine.Selected.ImageIndex := (lvwMachine.Selected.ImageIndex) mod 2 + 1;
  end;
end;

procedure TfrmMain.btnRegSaveClick(Sender: TObject);
var
  Key2, Key3: String;
  slFile: TStringList;
  sMemory: TMemoryStream;
  sOutPut: TFileStream;
  sql: TADOQuery;  
begin
  // ����ע���ļ�
   if MessageBox(Handle, '�Ƿ񱣴��µ�ע�����ݿ⣬�⽫������ǰ���ļ���', 
    PChar(Caption), MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDNO then
  begin
    Exit;
  end;

  Key2 := HexToStr(Keys[1].Value);
  Key3 := HexToStr(Keys[2].Value);

  // ���ܻ�����
  slFile := TStringList.Create;
  sql := TADOQuery.Create(nil);
  sql.Connection := conReginfo;
  sql.SQL.Text := 'SELECT [machinecode].[machinecode] FROM [machinecode] WHERE [machinecode].[locked] = FALSE;';
  sql.Open;

  while not sql.Eof do
  begin
    slFile.Add(DES.EncryStrHex(sql.FieldByName('machinecode').AsString, Key3));
    sql.Next;
  end;  

  sql.Close;
  sql.Free;

  // �����ļ�
  sMemory := TMemoryStream.Create;
  sOutPut := TFileStream.Create(txtDBPath.Text, fmCreate);
  slFile.SaveToStream(sMemory);
  AES.EncryptStream(sMemory, Key2, TStream(sOutPut), kb256);
  sOutPut.Free;
  sMemory.Free;
  slFile.Free;

  MessageBox(Handle, '�ļ�����ɹ���', PChar(Caption), MB_OK + 
    MB_ICONINFORMATION);
  
end;

procedure TfrmMain.txtKeyExit(Sender: TObject);
begin
  Keys[tbcKey.TabIndex].Value := txtKey.Text;
  GeneratePascal;
end;

procedure TfrmMain.txtKeyNameExit(Sender: TObject);
begin
  Keys[tbcKey.TabIndex].KeyName := txtKeyName.Text;
  GeneratePascal;
end;

procedure TfrmMain.btnTestClick(Sender: TObject);
begin
  if ExistReginfo then
    MessageBox(Handle, '����ע����Ϣ��', PChar(Caption), MB_OK + 
      MB_ICONINFORMATION)
  else
    MessageBox(Handle, '����ע����Ϣ��', PChar(Caption), MB_OK + 
      MB_ICONINFORMATION);
end;  


procedure TfrmMain.btnReadRegClick(Sender: TObject);
var
  dPDate, dLastUse: TDateTime;
  iTotal, iToday: Cardinal;
begin
  if ExistReginfo then
  begin
    ReadRegInfo(dPDate, iTotal, dLastUse, iToday, HexToStr(Keys[5].Value));

    dtpPeriodDate.DateTime := dPDate;
    dtpLastUse.DateTime := dLastUse;
    txtReaminSecond.Text := IntToStr(iTotal);
    txtTodaySecond.Text := IntToStr(iToday);
  end;  
end;

procedure TfrmMain.btnWriteRegClick(Sender: TObject);
begin
  WriteRegInfo(dtpPeriodDate.DateTime, StrToInt(txtReaminSecond.Text),
    dtpLastUse.DateTime, StrToInt(txtTodaySecond.Text), HexToStr(Keys[5].Value));
end;

procedure TfrmMain.btnDelRegInfoClick(Sender: TObject);
begin
  DeleteRegInfo;
end;

end.
