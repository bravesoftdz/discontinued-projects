unit uFrmIntroPage;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, Buttons, StdCtrls, jpeg, ExtCtrls, OBRARCompress;

type
  TfrmIntroPage = class(TForm)
    lblSetPassword: TLabel;
    btnSetPassword: TBitBtn;
    btnFixCompress: TBitBtn;
    lblCompress: TLabel;
    lblBackup: TLabel;
    btnBcakup: TBitBtn;
    btnRestore: TBitBtn;
    lblRestore: TLabel;
    lblSetPassInfo: TLabel;
    lblFixCompressinfo: TLabel;
    lblBackupInfo: TLabel;
    lblRestoreInfo: TLabel;
    btnNewDB: TBitBtn;
    lblNewDB: TLabel;
    lblNewDBInfo: TLabel;
    btnClose: TBitBtn;
    bvlTop: TBevel;
    imgSplash: TImage;
    bvlBottom: TBevel;
    rarBackup: TOBRARCompress;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSetPasswordClick(Sender: TObject);
    procedure btnFixCompressClick(Sender: TObject);
    procedure btnBcakupClick(Sender: TObject);
    procedure btnRestoreClick(Sender: TObject);
    procedure btnNewDBClick(Sender: TObject);
  private
    { Private declarations }
    procedure DoBeforeOpera;
    procedure DoAfterOpera;
  public
    { Public declarations }
    SkipIntroPage: Boolean;
    RunApp: Boolean;
    QuietMode: Boolean;
    function BackupDatabase: Boolean;
  end;

var
  frmIntroPage: TfrmIntroPage;
  DBPaths: TStringList;

implementation

{$R *.dfm}

uses
  StrUtils, uDlgSetPassword, uDlgPassword, uGeneral, uDlgRestore, uDlgCreateDB, uDlgUpdateDB;

procedure TfrmIntroPage.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmIntroPage.DoBeforeOpera;
begin
  Self.Hide;
end;

procedure TfrmIntroPage.DoAfterOpera;
begin
  if not SkipIntroPage then
    Self.Show
  else
    Close;
end;

procedure TfrmIntroPage.FormCreate(Sender: TObject);
var
  DLGUpdateDB: TdlgUpdateDB;
begin
  DBPaths := TStringList.Create;
  DBPaths.Add(AppendPath(ExtractFilePath(ParamStr(0)), 'settings.mdb'));
  DBPaths.Add(AppendPath(ExtractFilePath(ParamStr(0)), 'contact.mdb'));
  DBPaths.Add(AppendPath(ExtractFilePath(ParamStr(0)), 'sms.mdb'));

  SkipIntroPage := FindCmdLineSwitch('SKIPINTROPAGE');
  RunApp := FindCmdLineSwitch('RUNAPP');
  QuietMode := FindCmdLineSwitch('QUIET');

  if SkipIntroPage then
  begin
    if FindCmdLineSwitch('ALTERPASSWORD') then btnSetPassword.Click;
    if FindCmdLineSwitch('FIXCOMPRESS') then btnFixCompress.Click;
    if FindCmdLineSwitch('BACKUP') then btnBcakup.Click;
    if FindCmdLineSwitch('RESTORE') then btnRestore.Click;
    if FindCmdLineSwitch('CREATEDATABASE') then btnNewDB.Click;

    if FindCmdLineSwitch('UPDATEDB') then
    begin
      DoBeforeOpera;
      DLGUpdateDB := TdlgUpdateDB.Create(Self);
      DLGUpdateDB.UpdateDatabase(ParamStr(1), AppendPath(ExtractFilePath(ParamStr(0)), 'sms.mdb'));
      DoAfterOpera;
    end;
  end
  else
    WindowState := wsNormal;
end;

procedure TfrmIntroPage.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  DBPaths.Free;

  if RunApp then
    WinExec(PChar(AppendPath(ExtractFilePath(ParamStr(0)), 'ultrasms.exe')), SW_SHOWDEFAULT);

  TerminateProcess(GetCurrentProcess, 0);
end;

procedure TfrmIntroPage.btnSetPasswordClick(Sender: TObject);
var
  DLGSetPass: TdlgSetPassword;
begin
  DoBeforeOpera;
  DLGSetPass := TdlgSetPassword.Create(Self);
  DLGSetPass.ShowModal;
  DoAfterOpera;
end;

procedure TfrmIntroPage.btnFixCompressClick(Sender: TObject);
var
  APasswod: string;
  pwdDialog: TPasswordDlg;
  i: Integer;
begin
  // ȷ���Ƿ����
  DoBeforeOpera;

  if (not QuietMode) and (MessageBox(Handle,
    '�Ƿ�Ҫѹ���޸����ݿ⣬�������ڴ˲���֮ǰ���ȱ���һ�����ݿ⡣',
    PChar(Application.Title), MB_YESNO + MB_ICONQUESTION) = IDNO) then
  begin
    DoAfterOpera;
    Exit;
  end;

  // ������ݿ�����
  pwdDialog := TPasswordDlg.Create(nil);

  if not pwdDialog.GetPassword(APasswod, DBPaths[0]) then
  begin
    DoAfterOpera;
    Exit;
  end;

  pwdDialog.Free;

  // ѹ���޸����ݿ�
  for i := 0 to DBPaths.Count - 1 do
    DBCompress(PChar(DBPaths[i]), PChar(''), PChar(APasswod));

  if QuietMode then
    MessageBox(Handle, 'ѹ�����޸����ݿ�ɹ���', PChar(Application.Title), MB_OK
      + MB_ICONINFORMATION);

  DoAfterOpera;  
end;

procedure TfrmIntroPage.btnBcakupClick(Sender: TObject);
begin
  DoBeforeOpera;

  if not QuietMode then
  begin
    if BackupDatabase then
      MessageBox(Handle,
        PChar('�������ݿ�ɹ��������ʹ�� WinRAR �ֶ��ָ������ļ���Ҳ�����ñ�����ָ����ݡ�'
        + #13#10#13#10 + rarBackup.RARFileName), PChar(Application.Title), MB_OK + MB_ICONINFORMATION)
    else
      MessageBox(Handle,
        '�������ݿ�ʧ�ܡ������ʹ�� WinRAR �ֶ������ļ���������� Backup �ļ����£�����������Ϳ����Զ�ʶ�𱸷��ĵ���'
        , PChar(Application.Title), MB_OK + MB_ICONSTOP);
  end;

  DoAfterOpera;
end;

procedure TfrmIntroPage.btnRestoreClick(Sender: TObject);
var
  DLGSetPass: TdlgRestore;
begin
  DoBeforeOpera;
  DLGSetPass := TdlgRestore.Create(Self);
  DLGSetPass.ShowModal;
  DLGSetPass.Free;
  DoAfterOpera;
end;

procedure TfrmIntroPage.btnNewDBClick(Sender: TObject);
var
  DLGNewDB: TdlgCreateDatabase;
begin
  DoBeforeOpera;
  DLGNewDB := TdlgCreateDatabase.Create(Self);
  if not QuietMode then DLGNewDB.ShowModal;
  DoAfterOpera;
end;

function TfrmIntroPage.BackupDatabase: Boolean;
var
  sFilePath, sFileName: string;
begin
  // �������ݿ�
  sFilePath := ExtractFilePath(ParamStr(0));
  sFileName := FormatDateTime('yyyy-mm-dd hh.mm.ss', Now) + '.RAR';
  sFilePath := AppendPath(sFilePath, 'Backup');

  if not DirectoryExists(sFilePath) then
    CreateDir(sFilePath);

  rarBackup.RARFileName := '"' + AppendPath(sFilePath, sFileName) + '"';
  rarBackup.SourceFiles.Clear;
  rarBackup.SourceFiles.Assign(DBPaths);

  Result := rarBackup.Compress;
end;

end.
