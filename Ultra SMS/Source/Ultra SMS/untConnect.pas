unit untConnect;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, untSelModem, Registry, ComCtrls, untTestPort,
  untwizOption, uniwizAddition, SPComm, ShellAPI, GerneralFunc;

type
  TwizConnect = class(TForm)
    btnPrevious: TBitBtn;
    btnNext: TBitBtn;
    btnFinish: TBitBtn;
    btnCancel: TBitBtn;
    btnHelp: TBitBtn;
    shpTitle: TShape;
    bvlBottom: TBevel;
    bvlTop: TBevel;
    lblTitle: TLabel;
    lblInfo: TLabel;
    imgTitle: TImage;
    fraSelectModem: TfraSelectModem;
    fraTestPort: TfraTestPort;
    fraOption: TfrawizOption;
    fraAdditionTask: TfraAdditionTask;
    procedure btnCancelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure btnFinishClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnHelpClick(Sender: TObject);
    procedure fraSelectModemlvwModemChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
  private
    { Private declarations }
    CurrentPage: Integer;
    Titles: array[1..4] of String;
    Hits: array[1..4] of String;
    FOnClosing: Boolean;
    FOriPortList: TPortList;
    FOriByteSize: TByteSize;
    FOriSpeed: Cardinal;
    FOriStopBits: TStopBits;
    FOriParity: TParity;
    Ok: Boolean;
    procedure ShowPage;
    procedure CheckPage;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}
uses
  UserInterfaces, Configuration, DGL_String;

procedure TwizConnect.btnCancelClick(Sender: TObject);
begin
  FOnClosing := True;
  Close; 
end;

procedure TwizConnect.FormCreate(Sender: TObject);
begin
  // �����ʼ��
  Titles[1] := 'ѡ����ƽ����';
  Titles[2] := '���Ե��ƽ����';
  Titles[3] := '�������ĵ��ƽ����';
  Titles[4] := '�������ӵ�����';

  // ��ʾ��ʼ��
  Hits[1] := '�����������ƶ��绰�͵������ӵ�ʱ�򣬵��Ի���ʾ���ҵ�һ����Ӳ������һ����һ�����ƽ����������Ҫ��װ������ƽ���������������������ʹ���������ƽ�����������밲װ�������͵������';
  Hits[2] := '���ڶ����ĵ��ƽ�������в��ԣ�����������Ҫ���ǿ�ʱ�������ֻ�֧��ʹ�� GSM ��׼���Ƿ���������ͨ�š�';
  Hits[3] := '��������������������ĵ��ƽ�����ģ������������ʲô����������ȫ���Բ������ã���Ϊʹ��Ĭ�ϵ����ã����򶼿��Թ����úܺá�';
  Hits[4] := '�������ú�����֮�󣬿���ͨ��һ�¸��ӵĹ��������̴��ƶ��绰�ж�ȡ��Ϣ��';

  // �����ص���Ϣ
  fraSelectModem.btnRefreshClick(nil);
  fraAdditionTask.RefreshCategory;

  // �洢����
  FOriPortList.Index := PortList.Index;
  FOriPortList.PortList := TStringList.Create;
  FOriPortList.PortList.Assign(PortList.PortList);

  FOriSpeed := frmMain.cmModem.BaudRate;
  FOriByteSize := frmMain.cmModem.ByteSize;
  FOriStopBits := frmMain.cmModem.StopBits;
  FOriParity := frmMain.cmModem.Parity;

  // ��ʾҳ��
  CurrentPage := 1;
  ShowPage;

  SetListViewStyleVista(fraTestPort.lvwResult);
end;

procedure TwizConnect.fraSelectModemlvwModemChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  if Change = ctState then
    if not FOnClosing then
      CheckPage;
end;

procedure TwizConnect.ShowPage;
begin
  fraSelectModem.Visible := False;
  fraTestPort.Visible := False;
  fraOption.Visible := False;
  fraAdditionTask.Visible := False;
  lblTitle.Caption := Titles[CurrentPage];
  lblInfo.Caption := Hits[CurrentPage];

  case CurrentPage of
    1: fraSelectModem.Visible := True;
    2: fraTestPort.Visible := True;
    3: fraOption.Visible := True;
    4: fraAdditionTask.Visible := True;
  end;

  Application.ProcessMessages;
  CheckPage;
end;

procedure TwizConnect.CheckPage;
  function IsChecked(AListView: TListView): Boolean;
  var
    i: Cardinal;
  begin
    if AListView.Items.Count = 0 then
    begin
      Result := False;
      Exit;
    end;

    for i := 0 to AListView.Items.Count - 1 do
      if AListView.Items[i].Checked then
      begin
        Result := True;
        Exit;
      end;

      Result := False;
  end;

begin
  btnPrevious.Enabled := (CurrentPage > 1);
  btnNext.Enabled := (CurrentPage < High(Titles));
  btnFinish.Enabled := (CurrentPage = High(Titles));

  case CurrentPage of
    1:  btnNext.Enabled := IsChecked(fraSelectModem.lvwModem);
    2:
    begin
      btnNext.Enabled := False;
      btnNext.Enabled := fraTestPort.DoMultipleTest;
    end;
  end;

end;

procedure TwizConnect.btnNextClick(Sender: TObject);

  function GetAllPorts: string;
  var
    ssPortNames: TStrSet;
    i: Cardinal;
    itr: _IIterator;
  begin
    ssPortNames := TStrSet.Create;
    Result := '';

    for i := 0 to fraSelectModem.lvwModem.Items.Count - 1 do
      if fraSelectModem.lvwModem.Items[i].Checked then
        ssPortNames.Insert(fraSelectModem.lvwModem.Items[i].SubItems[0]);

    itr := ssPortNames.ItBegin;

    while not itr.IsEqual(ssPortNames.ItEnd) do
    begin
      if Result = '' then
        Result := itr.GetValue
      else
        Result := Result + STPortDelimiter + itr.GetValue;
      itr.Next;
    end;
  end;

begin
  case CurrentPage of
    1:
    begin
      fraTestPort.Port := GetAllPorts;

      if fraTestPort.Port = '' then
      begin
        MessageBox(Handle,
          '��δѡ��һ���˿ڣ����Ҫ�������ӣ�������ѡ������һ���˿ڡ�',
          'ѡ��˿�', MB_OK + MB_ICONSTOP);
        Exit;
      end;
    end;
    2: fraOption.SetBaudrateList(fraTestPort.BaudRates);
  end;

  Inc(CurrentPage);
  ShowPage;
end;

procedure TwizConnect.btnPreviousClick(Sender: TObject);
begin
  // ��һ��
  if CurrentPage = 3 then Dec(CurrentPage);
  Dec(CurrentPage);
  ShowPage; 
end;

procedure TwizConnect.btnFinishClick(Sender: TObject);
var
  config: TConfig;
begin
  // ��ȡ�����ļ�
  if fraAdditionTask.chkEnablePreset.Checked then
  begin
    config := TConfig.Create;
    config.LoadConfiguration(
      fraAdditionTask.cboCategory.Text,
      fraAdditionTask.cboModel.Text);
    config.Free;
  end;

  // �������
  frmMain.lvwPhoneInfo.Items[0].SubItems[0] := fraTestPort.IMEI;
  frmMain.lvwPhoneInfo.Items[1].SubItems[0] := fraTestPort.IMSI;
  frmMain.lvwPhoneInfo.Items[2].SubItems[0] := fraTestPort.PhoneSoft;
  frmMain.lvwPhoneInfo.Items[3].SubItems[0] := fraTestPort.InfoCentre;
  frmMain.lvwPhoneInfo.Items[4].SubItems[0] := fraTestPort.PhoneNumber;
  frmMain.cmModem.BaudRate := StrToInt(fraOption.lvwBaudRate.Selected.Caption);
  frmMain.cmModem.ByteSize := TByteSize(fraOption.rgByteSize.ItemIndex);
  frmMain.cmModem.Parity := TParity(fraOption.rgParityCheck.ItemIndex);
  frmMain.cmModem.ParityCheck := (fraOption.rgByteSize.ItemIndex > 0);
  frmMain.cmModem.StopBits := TStopBits(fraOption.rgStopBits.ItemIndex);
  PortList.Index := 0;
  PortList.PortList := SplitString(fraTestPort.Port, STPortDelimiter);
  OpenPortDef;
  FOnClosing := True;

  // ��Ӹ�������
  JobThread.InfoCenter := fraTestPort.InfoCentre;

  if fraAdditionTask.chkPhoneBook.State = cbChecked then
    JobThread.JobContent.AddReadPhonebBook;

  if fraAdditionTask.chkSMS.State = cbChecked then
    JobThread.JobContent.AddReceiveJob;

  // ���汾������
  if fraOption.chkSaveToLocal.Checked then
    frmMain.SaveConnectionSettings;

  // �رնԻ���
  Ok := True;
  Close;

  if JobThread.JobContent.Count > 0 then
    JobThread.Suspended := False;


end;

procedure TwizConnect.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not OK then
  begin
    frmMain.cmModem.ByteSize := FOriByteSize;
    PortList.Index := FOriPortList.Index;
    PortList.PortList.Clear;
    PortList.PortList.AddStrings(FOriPortList.PortList);

    frmMain.cmModem.Parity := FOriParity;
    frmMain.cmModem.ParityCheck := FOriParity <> None;
    frmMain.cmModem.BaudRate := FOriSpeed;
    frmMain.cmModem.StopBits := FOriStopBits;
    frmMain.stbMain.Panels[2].Text := frmMain.cmModem.CommName + ' �ѹر�';
  end;

  FOriPortList.PortList.Free;
end;

procedure TwizConnect.btnHelpClick(Sender: TObject);
var
  FileName: String;
begin
  // �����߷��ʼ�
  FileName := AppendPath(sPath, 'connect.pdf');

  if FileExists(FileName) then
    ShellExecute(Handle, 'open', PChar(FileName), nil, nil, SW_SHOW);
end;

end.
