unit untTestPort;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, ComCtrls, StdCtrls, ImgList;

type
  TfraTestPort = class(TFrame)
    lblInfo: TLabel;
    lvwResult: TListView;
    iltTesting: TImageList;
    lblPort: TLabel;
    procedure lvwResultCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure lvwResultResize(Sender: TObject);
  private
    { Private declarations }
    FBaudRates: string;
    function DoSingleTest(UseDefault: Boolean = True): Boolean;
  public
    { Public declarations }
    Port: String;
    IMEI: String;
    IMSI: String;
    InfoCentre: String;
    PhoneSoft: String;
    BaudRates: TStringList;
    PhoneNumber: String;
    function DoMultipleTest(UseDefault: Boolean = True): Boolean;
  end;

implementation

uses SPComm, UserInterfaces, StrUtils, GerneralFunc;

{$R *.dfm}

function TfraTestPort.DoMultipleTest(UseDefault: Boolean = True): Boolean;
var
  slMultiPort: TStringList;
  slPortsAvailable: TStringList;
  sPort: string;
begin
  Result := False;
  slMultiPort := SplitString(Port, STPortDelimiter);
  slPortsAvailable := TStringList.Create;

  for sPort in slMultiPort do
  begin
    Port := sPort;
    lblPort.Caption := sPort;
    Application.ProcessMessages;
    frmMain.cmModem.CommName := sPort;
    if DoSingleTest(UseDefault) then
      slPortsAvailable.Add(sPort);
  end;

  Result := slPortsAvailable.Count > 0;
  Port := JoinStrings(slPortsAvailable, STPortDelimiter);

  slMultiPort.Free;
  slPortsAvailable.Free;
end;

function TfraTestPort.DoSingleTest(UseDefault: Boolean = True): Boolean;
label
  ErrorTest;
const
  sStep: array[0..9] of string = (
    '�򿪶˿�',
    '���͸�λָ��',
    '�����ַ���',
    '��ȡ�ֻ������Ϣ',
    '�����ź�ǿ��',
    '��ȡ�������ĺ���',
    '��ȡIMEI�ͺ�IMSI����',
    '���Ա�����(��ѡ)',
    '��ȡ��������(��ѡ)',
    '�رն˿�');
var
  i: Integer;
begin
  // frmMain.dxmnuViewModem.Click;
  if Assigned(frmMain.dxdpModem.TabContainer) then
    frmMain.dxdpModem.TabContainer.ActiveChild := frmMain.dxdpModem;

  with frmMain.cmModem do
  begin
    if UseDefault then
    begin
      BaudRate := 9600;
      ByteSize := _8;
      DtrControl := DtrEnable;
      DsrSensitivity := False;
      IgnoreNullChar := False;
      Inx_XonXoffFlow := True;
      Parity := None;
      ParityCheck := False;
      RtsControl := RtsEnable;
      StopBits := _1;
    end;

    // ��ʼ���б�
    lvwResult.Clear;

    for i := 0 to 9 do
    begin
      lvwResult.AddItem('����', nil);
      lvwResult.Items[i].ImageIndex := 0;
      lvwResult.Items[i].SubItems.Add(sStep[i]);
    end;

    // �򿪶˿�
    i:=0;
    lvwResult.Items[0].Caption := '���ڲ���';
    lvwResult.Items[0].ImageIndex := 1;
    Application.ProcessMessages;
    if UseDefault then
    begin
      if not OpenPort(Port) then goto ErrorTest;
    end
    else
    begin
      if not OpenPort then goto ErrorTest;
    end;

    lvwResult.Items[0].Caption := 'ͨ��';
    lvwResult.Items[0].ImageIndex := 2;

    // ���͸�λָ��
    Sleep(opConnectWating);
    Inc(i);
    lvwResult.Items[1].Caption := '���ڲ���';
    lvwResult.Items[1].ImageIndex := 1;
    Application.ProcessMessages;
    SendCommand('ATE0');
    if WaitingForReturn then
    begin
      lvwResult.Items[1].Caption := 'ͨ��';
      lvwResult.Items[1].ImageIndex := 2;
    end
    else
      goto ErrorTest;

    // ���Ͳ����ַ���
    Inc(i);
    lvwResult.Items[2].Caption := '���ڲ���';
    lvwResult.Items[2].ImageIndex := 1;
    Application.ProcessMessages;
    sBuffers.Clear;
    SendCommand('AT+CSCS=?');
    if WaitingForMessage(2) then
    begin
      if (Pos('GSM', sBuffers[0]) > 0) and  (Pos('UCS2', sBuffers[0]) > 0) and
        (sBuffers[1] = 'OK') then
      begin
        lvwResult.Items[2].Caption := 'ͨ��';
        lvwResult.Items[2].ImageIndex := 2;
      end
      else
        goto ErrorTest;
    end
    else
      goto ErrorTest;

    // �����ֻ������Ϣ
    Inc(i);
    sBuffers.Clear;
    lvwResult.Items[3].Caption := '���ڲ���';
    lvwResult.Items[3].ImageIndex := 1;
    Application.ProcessMessages;
    SendCommand('AT+CGMI');
    if WaitingForReturn then
    begin
        lvwResult.Items[3].Caption := 'ͨ��';
        lvwResult.Items[3].ImageIndex := 2;
        PhoneSoft := ExtractParameter(sBuffers[0]);
    end
    else
    begin
      lvwResult.Items[3].Caption := '��֧��';
      lvwResult.Items[3].ImageIndex := 3;
    end;

    sBuffers.Clear;
    SendCommand('AT+CGMR');
    if WaitingForReturn then
      PhoneSoft := PhoneSoft + ' (' + ExtractParameter(sBuffers[0]) + ')';

    // �����ź�ǿ��
    Inc(i);
    sBuffers.Clear;
    lvwResult.Items[4].Caption := '���ڲ���';
    lvwResult.Items[4].ImageIndex := 1;
    Application.ProcessMessages;
    SendCommand('AT+CSQ');
    if WaitingForMessage(2) and (sBuffers[1] = 'OK') then
    begin
      lvwResult.Items[4].Caption := 'ͨ��';
      lvwResult.Items[4].ImageIndex := 2;
    end
    else
      goto ErrorTest;

    // ��ȡ�������ĺ���
    Inc(i);
    sBuffers.Clear;
    lvwResult.Items[5].Caption := '���ڲ���';
    lvwResult.Items[5].ImageIndex := 1;
    Application.ProcessMessages;
    SendCommand('AT+CSCS="GSM"');
    if not WaitingForReturn then goto ErrorTest;
    
    sBuffers.Clear;
    SendCommand('AT+CSCA?');
    if WaitingForMessage(2) and (sBuffers[1] = 'OK') then
    begin
      lvwResult.Items[5].Caption := 'ͨ��';
      lvwResult.Items[5].ImageIndex := 2;
      InfoCentre := ExtractParameter(sBuffers[0]);
      if ExtractParameter(sBuffers[0], 1) = '145' then
        if InfoCentre[1] <> '+' then
          InfoCentre := '+' + InfoCentre;
    end
    else
      goto ErrorTest;

    // ��ȡIMEI IMSI
    Inc(i);
    sBuffers.Clear;
    lvwResult.Items[6].Caption := '���ڲ���';
    lvwResult.Items[6].ImageIndex := 1;
    Application.ProcessMessages;
    SendCommand('AT+CGSN');
    if not WaitingForReturn() then goto ErrorTest;
    IMEI := ExtractPhoneNumber(ExtractParameter(sBuffers[0]));

    sBuffers.Clear;
    SendCommand('AT+CIMI');
    if not WaitingForReturn() then goto ErrorTest;
    IMSI := ExtractPhoneNumber(ExtractParameter(sBuffers[0]));
    lvwResult.Items[6].Caption := 'ͨ��';
    lvwResult.Items[6].ImageIndex := 2;

    // ��ȡ BiteRate
    Inc(i);
    sBuffers.Clear;
    lvwResult.Items[7].Caption := '���ڲ���';
    lvwResult.Items[7].ImageIndex := 1;
    Application.ProcessMessages;
    SendCommand('AT+IPR=?');
    if WaitingForReturn then
    begin
      if sBuffers.Count > 1 then
      begin
        lvwResult.Items[7].Caption := 'ͨ��';
        lvwResult.Items[7].ImageIndex := 2;
//        FBaudRates := Trim(RightStr(sBuffers[0], Length(sBuffers[0]) - Pos(#$3A, sBuffers[0])));
//        FBaudRates := Copy(FBaudRates, 2, Length(FBaudRates) - 2);
        FBaudRates := ExtractParameterRev(sBuffers[0], 0);
        if LeftStr(FBaudRates, 1) = '(' then Delete(FBaudRates, 1, 1);
        if RightStr(FBaudRates, 1) = ')' then Delete(FBaudRates, Length(FBaudRates), 1);

        BaudRates := SplitString(FBaudRates, ',', 0, True);
      end
      else
        lvwResult.Items[7].Caption := '��֧��';
    end
    else
      lvwResult.Items[7].Caption := '��֧��';

    // ��ȡ��������
    Inc(i);
    sBuffers.Clear;
    lvwResult.Items[8].Caption := '���ڲ���';
    lvwResult.Items[8].ImageIndex := 1;
    Application.ProcessMessages;
    SendCommand('AT+CNUM?');
    if WaitingForReturn then
    begin
      lvwResult.Items[8].Caption := 'ͨ��';
      lvwResult.Items[8].ImageIndex := 2;
      PhoneNumber := ExtractParameter(sBuffers[0]);
      PhoneNumber := ExtractPhoneNumber(PhoneNumber);
    end
    else
    begin
      lvwResult.Items[8].Caption := 'δ����';
      lvwResult.Items[8].ImageIndex := 3;
    end;

    // �رն˿�
    Inc(i);
    if ClosePort then
    begin
      lvwResult.Items[9].Caption := 'ͨ��';
      lvwResult.Items[9].ImageIndex := 2;
    end
    else
      goto ErrorTest;

    Result := True;
  end;
  Exit;

  // ��������
ErrorTest:
  lvwResult.Items[i].Caption := 'ʧ��';
  lvwResult.Items[i].ImageIndex := 3;
  Application.ProcessMessages;
  Result := False;
  ClosePort;
  Exit;
end;

procedure TfraTestPort.lvwResultCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
const
  cUpload: TColor = $00C4FCFC;
  cDownload: TColor = $00D3F7E0;
  cError: TColor = $00DAE0FF;
var
  cColor: array[0..3] of TColor;
  i: Integer;
begin
  cColor[0] := $FFFFFF;
  cColor[1] := cUpload;
  cColor[2] := cDownload;
  cColor[3] := cError;

  // ���Ʊ�����ɫ
  if (Item <> nil) and (Word(State) > 0) then
  begin
    i := Item.ImageIndex;
    Sender.Canvas.Brush.Color := cColor[i];
    Sender.Canvas.FillRect(Item.DisplayRect(drBounds));
  end;

end;

procedure TfraTestPort.lvwResultResize(Sender: TObject);
begin
  lvwResult.Columns[1].Width := lvwResult.Width - 84;
end;

end.
