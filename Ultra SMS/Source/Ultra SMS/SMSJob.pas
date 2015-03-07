unit SMSJob;

// SMS Job ��Ԫ���������ŵ�һЩʹ�õĶ����Ķ�̬�洢

//{$DEFINE SNYC}

// ************
// * �ӿڲ��� *
// ************
interface

uses
  Classes, ADODB, Windows, SysUtils, DateUtils, DGL_Integer;          // ���ڶ��� TCollection �� TCollectionItem ��

type
  // ----- TJobKind ö�٣���ʾÿ����ҵ������ ----
  TJobKind = (
    jkSend,                          // ���Ͷ���Ϣ
    jkReceive,                       // ��ȡ����Ϣ
    jkReadPhoneBook,                 // ��ȡ�绰��
    jkQueryNew,                      // ��ѯ�¶���
    jkSetCALLBACK,                   // �����Զ�����
    jkClearSMS,                      // ����ֻ��еĶ���
    jkQueryInfo,                     // ��ѯ�ֻ���״̬
    jkQueryTime,
    jkSetTime,
    jkCycleQuery,
    jkRemoveSMS
  );

  TRemoveSMSKind = (
    rskKeepPercent,                   // ���ְٷֱ�
    rskKeepNumber,                    // ���̶ֹ�����
    rskKeepRecentDay,                 // �����������
    rskKeepDay                        // ���ֵ�����
  );

  TJobExtraInfo = packed record
  private
    case JobKind: TJobKind of
      jkQueryTime: (
        PPCTime: PDateTime;
        PPhoneTime: PDateTime;
        PRequestResult: PBoolean;
        hWindow: HWND);
      jkRemoveSMS: (
        RemoveUNREAD: Boolean;
        RemoveREAD: Boolean;
        RemoveDraft: Boolean;
        RemoveSent: Boolean;
        case KeepKind: TRemoveSMSKind of
          rskKeepPercent: (KPPercent: Real);
          rskKeepNumber: (KPNumber: Integer);
          rskKeepRecentDay: (KPRDay: Integer);
          rskKeepDay: (KPDDate: TDateTime);
        );
  end;

  TNotificationInfo = record
    WindowType: Integer;
    InternalID: Integer;
    ReceiveDate: TDateTime;
    SenderString: String;
  end;

  TMsgContent = record
    ID: Integer;
    Number: TStringList;
    Content: String;
    DateTime: TDateTime;
    IsReport: Boolean;
  end;

  //---- TSMSJob �ࣺ��ʾÿһ����ҵ�ľ������� ----
  TSMSJob = class(TCollectionItem)
  public
    JobKind: TJobKind;
    FinishID: Integer;
    QueryID: Integer;
    Destination: string;
    Content: string;
    Name: String;
    Deletion: Boolean;
    RequireReport: Boolean;

    ExtraInfo: TJobExtraInfo;
  end;

  //---- TSMSJobQueue �ࣺ��ʾÿһ����ҵ�ļ��� ----
  TSMSJobQueue = class(TCollection)
  // ����˽�г�Ա
  private                     
    function FGetCount: Integer;
    function FGetLastMember: TSMSJob;
    function FGetFirstMember: TSMSJob;
    function FGetItem(Index: Integer): TSMSJob;
    procedure FSetItem(Index: Integer; Value: TSMSJob);

  // ���г�Ա
  public
    function AddTop(AJobKind: TJobKind = jkSend): TSMSJob; virtual;
    function Add(AJobKind: TJobKind = jkSend): TSMSJob; virtual;
    function AddSendJob(sDest, sContent, sName: string; iFinishID: Integer = 0): TSMSJob; virtual;
    function AddReceiveJob: TSMSJob; virtual;
    function AddReadPhonebBook: TSMSJob; virtual;
    property Count: integer read FGetCount;
    property LastItem: TSMSJob read FGetLastMember;
    property FirstItem: TSMSJob read FGetFirstMember;
    property Items[Index: Integer]: TSMSJob read FGetItem write FSetItem;
//    procedure Delete(Index: Integer);
  end;

  //----- TJobs �ࣺ �߳���صļ��� --------
  TJobs =  Class(TSMSJobQueue)
  private
    procedure FAddListViewItem(Job: TSMSJob; IsTop: Boolean = False);
  public
    MaxRecord: Integer;
    function Add(AJobKind: TJobKind = jkSend): TSMSJob; override;
    function AddTop(AJobKind: TJobKind = jkSend): TSMSJob; override; 
    function AddSendJob(sDest, sContent, sName: string; iFinishID: Integer = 0): TSMSJob; override;
    function AddReceiveJob: TSMSJob; override;
    function AddReadPhonebBook: TSMSJob; override;
    procedure ClearAll;
    //procedure Delete(Index: Integer);
    procedure ChangeState;
    procedure RemoveFirst;
  end;

  //---- TJobThread �ࣺ���ж��̲߳��� ----
  TJobThread = class(TThread)
  private
    { Private declarations }
    CurrentJobKind: TJobKind;
    CurrentNewNW: TNotificationInfo;
    function FSendSMS(ADestination, AMessage, AReceiver: string; Report: Boolean): Boolean;
    procedure QueryTime(APhoneTime: PDateTime; APCTime: PDateTime; Result: PBoolean; hWindow: HWND);
    function EnumerateSMSId(var slRecRead: TStringList; var slRecUnread: TStringList; var slStoSend: TStringList; var slStoUnsend: TStringList; bNewMessage: Boolean = False): Boolean;
    procedure FSetAnimation;
    function TestPort: Boolean;
    procedure FOpenNotificationWnd;
  protected
    procedure Execute; override;
    procedure Synchronize(Method: TThreadMethod; SyncMainThread: Boolean = False); overload;
  public
    JobContent: TJobs;
    InfoCenter: String;
    Abortion: Boolean;
    CycleQuery: Boolean;
    TimeZone: String;
    constructor Create(CreateSuspended: Boolean);
    function QuestName(dbContact: TADOTable; sSender: String; var Folder: String): String; overload;
    function QuestName(dbContact: TADOTable; sSender: TStringList): TStringList; overload;
    procedure ReadPhoneBook;
    procedure ReadSMS;
    procedure SendSMS;
    procedure QueryNew;
    procedure SetQueryCALLBACK;
    procedure ClearSMS;
    procedure QueryState;
    procedure FQueryTime;
    procedure SetPhoneTime;
    procedure QueryMessage;
    procedure RemoveSMS;
  end;

  //---- TJobThread �ࣺ���ж��̲߳��� ----
  TRunCmd = class(TThread)
  protected
    procedure Execute; override;
  public
    Cmd: String;
  end;

  //---- EUserAbortion �ࣺ�û�ȡ������ -----
  EUserAbortion = class(Exception)
  end;

//  EConnectionLost = class(Exception)
//  end;

  ECNMIUnsupported = class(Exception)
  end;

  // һЩ���õĺ���
  type
    TSMSCharset = (GSM, UCS2);

  function IsShowPopup: Boolean;
  function SetCharset(ACharset: TSMSCharset = UCS2): Boolean;
  function GetMemoryLocation(LocType: Integer = 0): TStringList;
  function ReadOneMessage(var slMsgList: TStringList; var messageContent: TMsgContent;
    PDUMode: Boolean; SendCommandRequired: Boolean = False): Boolean;

var
  defaultCNMI: String;
  CMTIBuffers: TStringList;
  MsgRefIDMap: TIntMap;
  
// ************
// * ʵ�ֲ��� *
// ************

implementation

uses
  UserInterfaces, Messages, ComCtrls, DB, GerneralFunc, StrUtils,
  GSMChar, Variants, Forms, uFrmNotification, dxStatusBar, CryptoAPI,
  DGL_String, MultiSMS, Math;

function IsShowPopup: Boolean;
var
  bFullScreen: Boolean;
begin
  bFullScreen := IsFullScreen;
  Result := opShowNewMSG and ((not opShowNoFullScreen) or (opShowNoFullScreen and (not bFullScreen)));
end;

//  TSMSJobQueue ��
// -----------------
// [˽�г�Ա]
// �����ҵ�ĸ���
function TSMSJobQueue.FGetCount: Integer;
begin
  Result := inherited Count;
end;

// ������һ����ҵ
function TSMSJobQueue.FGetLastMember: TSMSJob;
var
  iCount: integer;
begin
  iCount := FGetCount;

  if iCount > 0 then
    Result := TSMSJob(inherited GetItem(iCount))
  else
    Result := nil;
end;

// ��õ�һ����ҵ
function TSMSJobQueue.FGetFirstMember: TSMSJob;
var
  iCount: integer;
begin
  iCount := FGetCount;

  if iCount > 0 then
    Result := TSMSJob(inherited GetItem(1))
  else
    Result := nil;
end;

function TSMSJobQueue.FGetItem(Index: Integer): TSMSJob;
begin
  Result := TSMSJob(inherited GetItem(Index));
end;

procedure TSMSJobQueue.FSetItem(Index: Integer; Value: TSMSJob);
begin
  inherited SetItem(Index, Value);
end;

// [���к���]
// ���һ������
function TSMSJobQueue.Add(AJobKind: TJobKind = jkSend): TSMSJob;
begin
  Result := TSMSJob(inherited Add);
end;

function TSMSJobQueue.AddTop(AJobKind: TJobKind = jkSend): TSMSJob;
begin
  if Count >= 2 then
    Result := TSMSJob(inherited Insert(1))
  else
    Result := TSMSJob(inherited Add);
end;

// ���һ����ȡ�绰������ҵ
function TSMSJobQueue.AddReadPhonebBook: TSMSJob;
begin
  Result := TSMSJob(inherited Add);
  Result.JobKind := jkReadPhoneBook;
end;

// ���һ����ȡ�绰������ҵ
function TSMSJobQueue.AddReceiveJob: TSMSJob;
begin
  Result := TSMSJob(inherited Add);
  Result.JobKind := jkReceive;
end;

// ���һ�����͵绰����ҵ
function TSMSJobQueue.AddSendJob(sDest, sContent, sName: string; iFinishID: Integer = 0): TSMSJob;
begin
  Result := TSMSJob(inherited Add);
  Result.JobKind := jkSend;
  Result.Destination := sDest;
  Result.Content := sContent;
  Result.FinishID := iFinishID;
  Result.Name := sName;
end;

function TJobs.Add(AJobKind: TJobKind = jkSend): TSMSJob;
begin
  Result := inherited Add;
  Result.JobKind := AJobKind;
  FAddListViewItem(Result);
end;

function TJobs.AddTop(AJobKind: TJobKind = jkSend): TSMSJob;
begin
  Result := inherited AddTop;
  Result.JobKind := AJobKind;
  FAddListViewItem(Result);
end;

function TJobs.AddSendJob(sDest, sContent, sName: string; iFinishID: Integer = 0): TSMSJob;
begin
  Result := inherited AddSendJob(sDest, sContent, sName, iFinishID);
  Result.RequireReport := wsReport;
  FAddListViewItem(Result);
end;

function TJobs.AddReceiveJob: TSMSJob;
begin
  Result := inherited AddReceiveJob;
  FAddListViewItem(Result);
end;

function TJobs.AddReadPhonebBook: TSMSJob;
begin
  Result := inherited AddReadPhonebBook;
  FAddListViewItem(Result);
end;

procedure TJobs.ClearAll;
begin
  inherited Clear;
end;

procedure TJobs.ChangeState;
begin
  if Count > 0 then
  begin
    frmMain.lvwJob.Items[0].ImageIndex := 1;
    frmMain.lvwJob.Items[0].SubItems[0] := '����ִ��';
    frmMain.stbMain.Panels[1].Text := frmMain.lvwJob.Items[0].SubItems[1];
  end;
  frmMain.RefreshJobMenuState;
end;

procedure TJobs.RemoveFirst;
var
  i: Integer;
begin
  if Count > 0 then
  begin
    Delete(0);
    frmMain.lvwJob.Items.Delete(0);

    for i := 0 to frmMain.lvwJob.Items.Count - 1 do
      frmMain.lvwJob.Items[i].Caption := IntToStr(i + 1);

    frmMain.stbMain.Panels[1].Text := '(����)';
    frmMain.RefreshJobMenuState;
    frmMain.ShowTrayAnimation;
  end;
end;

procedure TJobs.FAddListViewItem(Job: TSMSJob; IsTop: Boolean = False);
var
  xItem: TListItem;
  Dest: String;
begin
  if frmMain.lvwJob.Items.Count > MaxRecord then
    frmMain.lvwJob.Items.Clear; 

  if (not IsTop) or (frmMain.lvwJob.Items.Count < 2) then
    xItem := frmMain.lvwJob.Items.Add
  else
    xItem := frmMain.lvwJob.Items.Insert(1);

  xItem.Caption := IntToStr(xItem.Index + 1);
  xItem.SubItems.Add('�ȴ�');

  if Length(Job.Name) > 0 then
    Dest := Job.Name + ' (' + Job.Destination + ')'
  else
    Dest := Job.Destination;

  case Job.JobKind of
    jkSend: xItem.SubItems.Add('���Ͷ�����' + Dest);
    jkReceive: xItem.SubItems.Add('�����ƶ��绰�еĶ���');
    jkReadPhoneBook: xItem.SubItems.Add('���µ绰��');
    jkQueryNew: xItem.SubItems.Add('��������Ϣ');
    jkSetCALLBACK: xItem.SubItems.Add('�����Զ�����');
    jkClearSMS: xItem.SubItems.Add('����ֻ��еĶ���');
    jkQueryInfo: xItem.SubItems.Add('��ѯ�ֻ�״̬');
    jkQueryTime: xItem.SubItems.Add('��ѯ�ֻ�����ʱ��');
    jkSetTime: xItem.SubItems.Add('�����ֻ�����ʱ��');
    jkCycleQuery: xItem.SubItems.Add('��ѯ����Ϣ');
    jkRemoveSMS: xItem.SubItems.Add('�����ֻ��еĶ���');
  end;

  frmMain.RefreshJobMenuState;
end;

// ��ʼִ���µ��߳�
constructor TJobThread.Create(CreateSuspended: Boolean);
begin
  inherited Create(CreateSuspended);
  JobContent := TJobs.Create(TSMSJob);
  JobContent.MaxRecord := 2000;
end;

procedure TJobThread.Synchronize(Method: TThreadMethod; SyncMainThread: Boolean = False);
begin
{$IFDEF SNYC}
  inherited Synchronize(Method);
{$ELSE}
  if SyncMainThread then
    inherited Synchronize(Method)
  else
    Method;
{$ENDIF}
end;

procedure TJobThread.Execute;
begin
  { Place thread code here }
  while not Terminated do
  begin
    if JobContent.Count > 0 then
    begin
//      Synchronize(DisableTimer);
      try
        Abortion := False;
        CurrentJobKind := JobContent.Items[0].JobKind;
        Synchronize(FSetAnimation);
        Synchronize(JobContent.ChangeState);
        case JobContent.Items[0].JobKind of
          jkReadPhoneBook: Synchronize(ReadPhoneBook);
          jkReceive: Synchronize(ReadSMS);
          jkSend: Synchronize(SendSMS);
          jkQueryNew:
          begin
            Sleep(opCallbackInterval);
            Synchronize(QueryNew);
          end;
          jkSetCALLBACK: Synchronize(SetQueryCALLBACK);
          jkClearSMS: Synchronize(ClearSMS);
          jkQueryInfo: Synchronize(QueryState);
          jkQueryTime: Synchronize(FQueryTime);
          jkSetTime: Synchronize(SetPhoneTime);
          jkCycleQuery: Synchronize(QueryMessage);
          jkRemoveSMS: Synchronize(RemoveSMS);
        end;
        frmMain.stbMain.Panels[1].Text := '(����)';

        if varLastCommResult.ResultType = lartTimeout  then
        begin
          AddModemStaus(tsInfo, '���ֻ������ѶϿ���');
          frmMain.ShowPopHit('���ӶϿ�', 'Ultra SMS �������ֻ������Ѿ��Ͽ���' +
            '��ȷ�������������Ƿ�������ȷ�����������ֻ��Ƿ񳬳��������ķ�Χ��', True);
          sBuffers.Clear;
          ClosePort(False);
          if opDCReconnect then
          begin
            Sleep(opDCReconInterval);
            frmMain.tmrReconnect.Tag := 0;
            frmMain.tmrReconnect.Enabled := True;
          end;
          Suspended := True;
          Continue;
        end;
      except
//        on E: EConnectionLost do
//        begin
//          AddModemStaus(tsInfo, '���ֻ������ѶϿ���');
//          frmMain.ShowPopHit('���ӶϿ�', 'Ultra SMS �������ֻ������Ѿ��Ͽ���' +
//            '��ȷ�������������Ƿ�������ȷ�����������ֻ��Ƿ񳬳��������ķ�Χ��', True);
//          sBuffers.Clear;
//          ClosePort(False);
//          if opDCReconnect then
//          begin
//            Sleep(opDCReconInterval);
//            frmMain.tmrReconnect.Tag := 0;
//            frmMain.tmrReconnect.Enabled := True;
//          end;
//          Suspended := True;
//          Continue;
//        end;
        on E: Exception do AddModemStaus(tsError, E.Message);
      end;

      // ɾ����ҵ
      try
        if JobContent.Count > 1 then
        begin
          AddModemStaus(tsInfo, '�ȴ� ' + IntToStr(opTaskInterval)  + ' ms');
          Sleep(opTaskInterval);
        end;
      except
         on E: Exception do AddModemStaus(tsError, E.Message);
      end;

      if Connected then JobContent.RemoveFirst;
    end
    else
    begin
      Suspended := True;
    end;
  end;
end;

// ��ȡ�绰��
procedure TJobThread.ReadPhoneBook;
var
  tbPhoneBook: TADOTable;
  lBound, uBound: Integer;
  x, y: Integer;
  tmp: TStringList;
  tmpStr: String;
  tmpInt: Integer;
  InternationalIdentifier: String;
  slFaciliy: TStringList;
  i: Integer;
label
  OccurError, DBOccurError;
begin
  AddModemStaus(tsInfo, '��ʼ��ȡ�绰��');

  // ֹͣ����
  sBuffers.Clear;
  SendCommand('ATE0');
  if not WaitingForReturn then goto OccurError;
  sBuffers.Clear;
  if Abortion then raise EUserAbortion.Create('�û��жϲ���');

  // �����ַ���Ϊ GSM
  if not SetCharset(GSM) then goto OccurError;
  sBuffers.Clear;
  if Abortion then raise EUserAbortion.Create('�û��жϲ���');

  // ��ѯ���õ��豸
  slFaciliy := TStringList.Create;

  SendCommand('AT+CPBS=?');
  if WaitingForMessage(2) then
    if Pos('MT', sBuffers[0]) > 0 then
      slFaciliy.Add('MT')
    else
    begin
      tmpStr := ExtractParameter(sBuffers[0]);
      if tmpStr[1] = '(' then Delete(tmpStr, 1, 1);
      if tmpStr[Length(tmpStr)] = ')' then Delete(tmpStr, Length(tmpStr), 1);
      tmp := ExtractAllParameter(tmpStr);

      for i := 0 to tmp.Count - 1 do
      begin
        tmp[i] := AnsiDequotedStr(tmp[i], '"');
        if  tmp[i] = 'ME' then
          slFaciliy.Add('ME')
        else if AnsiStartsText(tmp[i], 'SM') then
          slFaciliy.Add(tmp[i]);
      end;
    end;

  for i := 0 to slFaciliy.Count - 1 do
  begin
    // �л���������
    sBuffers.Clear;
    SendCommand('AT+CPBS="' + slFaciliy[i] + '"');
    if not WaitingForReturn then
      Continue;
    sBuffers.Clear;

    if not SetCharset(UCS2) then goto OccurError;
    sBuffers.Clear;

    // ��ȡ�绰����Ŀ��Ŀ
    SendCommand('AT+CPBR=?');
    if not WaitingForReturn then goto OccurError;
    tmpStr := sBuffers[0];
    x :=  Pos(#40, tmpStr);
    tmpStr := MidStr(tmpStr, x + 1, Pos(#41, tmpStr) - x - 1);
    tmp := SplitString(tmpStr, '-');
    lBound := StrToInt(tmp[0]);
    uBound := StrToInt(tmp[1]);
    sBuffers.Clear;

    // ��ȡ�绰��
    x := lBound;
    tbPhoneBook := TADOTable.Create(nil);
    tbPhoneBook.Connection := frmMain.adoContacts;
    tbPhoneBook.TableName := 'contact';
    tbPhoneBook.Open;
    repeat
      // ��ȡ 10 ����Ŀ
      y := 0;
      if x + 9 > uBound then
        SendCommand(Format('AT+CPBR=%d,%d', [x, uBound]))
      else
        SendCommand(Format('AT+CPBR=%d,%d', [x, x + 9]));

      // ������õ�����
      if not WaitingForReturn(2000) then goto DBOccurError;
      while (sBuffers[y] <> 'OK') and (sBuffers[y] <> 'ERROR') do
      begin
        tmp := ExtractAllParameter(sBuffers[y]);
        tmpInt := StrToInt(ExtractPhoneNumber(tmp[0]));

        if opSEPhoneBookUCS2 then
          tmpStr := DecodeUnicodeBE(AnsiDequotedStr(tmp[1], '"'))
        else
          tmpStr := ConvertUCS2PhoneNumber(AnsiDequotedStr(tmp[1], '"'));

        InternationalIdentifier := ExtractParameter(tmp[2]);

        if ((StrToInt(InternationalIdentifier) and $70) = $10) and (tmpStr[1] <> '+') then
          tmpStr := '+' + tmpStr;

        if tbPhoneBook.Locate('phonenumber', tmpStr, []) then
          tbPhoneBook.Edit
        else
        begin
          tbPhoneBook.Append;
          tbPhoneBook.FieldByName('phonenumber').AsString := tmpStr;
        end;

        tbPhoneBook.FieldByName('id').AsInteger := tmpInt;
        if tmp.Count > 3 then
        begin
          tmpStr := DecodeUnicodeBE(AnsiDequotedStr(tmp[3], '"'));

          // ȥ�� Sony Ericsson ��б��
          if opSEPhoneBookSuffix then
          begin
            tmpInt := LastDelimiter('/' ,tmpStr);
            if tmpInt > 0 then
              tmpStr := Copy(tmpStr, 1, tmpInt - 1);
          end;

          tbPhoneBook.FieldByName('name').AsString := tmpStr;
        end;
        tbPhoneBook.Post;
        Inc(y);
      end;

      Inc(x, 10);
      sBuffers.Clear;

      // ȡ������
      if Abortion then
      begin
        tbPhoneBook.Close;
        tbPhoneBook.Free;
        slFaciliy.Free;
        raise EUserAbortion.Create('�û��жϲ���');
      end;
    until x > uBound;

    if not SetCharset(GSM) then goto OccurError;
    sBuffers.Clear;
  end;

  // ������ʾ
  AddModemStaus(tsInfo, '�绰���Ѹ���', True, '�绰��ͬ��');
  PostMessage(frmMain.Handle, WM_UPDATE_PHONEBOOK, 0, 0);

  Exit;
DBOccurError:
  tbPhoneBook.Free;
  slFaciliy.Free;
OccurError:
  AddModemStaus(tsError, '�д�����', True, '�绰��ͬ��');
end;

function TJobThread.QuestName(dbContact: TADOTable; sSender: String; var Folder: String): String;
begin
  Result := '';
  Folder := '';
  if dbContact.RecordCount > 0 then
  begin
    dbContact.First;
    while not dbContact.Eof do
    begin
      if PhoneNumberSimilar(sSender, dbContact.FieldByName('phonenumber').AsString) then
      begin
        Result := dbContact.FieldByName('name').AsString;
        Folder := dbContact.FieldByName('folder').AsString;
        break;
      end;
      dbContact.Next;
    end;
  end;
end;

function TJobThread.QuestName(dbContact: TADOTable; sSender: TStringList): TStringList;
var
  i: Integer;
  strtmp: String;
begin
  Result := TStringList.Create;
  for i := 0 to sSender.Count - 1 do
    Result.Add(QuestName(dbContact, sSender[i], strtmp));
end;

// ��ȡȫ������Ϣ
procedure TJobThread.ReadSMS;
label
  OccurError, FreeObjects;
var
  dbSMS: TADOTable;
  dbSMSItem: TADOTable;
  dbContact: TADOTable;
  qryHashset: TADOQuery;
  i, j, k: Integer;
  InternalId: Integer;
  pdu: String;
  sFolder: String;
  slRecRead: TStringList;
  slRecUnread: TStringList;
  slStoSend: TStringList;
  slStoUnsend: TStringList;
  slTmp: TStringList;
  slHashSet: TStringList;
  hash: String;
  slStroageDevice: TStringList;
  msg: TMsgContent;

  function SearchForSame(sPhone: TStringList; sMsg: String): Boolean;
  var
    tItemList: TStringList;
  begin
    tItemList := TStringList.Create;
    tItemList.Assign(sPhone);
    tItemList.Sort;
    tItemList.Add(sMsg);
    HashStr(HASH_MD5, tItemList.Text, hash);
    tItemList.Free;

    Result := (slHashSet.IndexOf(hash) > -1);

  end;

begin
  // �����Ϣ
  AddModemStaus(tsInfo, '��ȡ���ж�����Ŀ');

  // ֹͣ����
  sBuffers.Clear;
  SendCommand('ATE0');
  if not WaitingForReturn then goto OccurError;
  sBuffers.Clear;

  // ��ʼ��ȡδ����Ϣ
  slRecRead := TStringList.Create;
  slRecUnread := TStringList.Create;
  slStoSend := TStringList.Create;
  slStoUnsend := TStringList.Create;
  slTmp := TStringList.Create;

  // ��ȡ�豸��Ŀ
  SetCharset(GSM);
  slStroageDevice := GetMemoryLocation;

  for k := 0 to slStroageDevice.Count - 1 do
  begin
    // ���ô洢װ��
    if k > 0 then
      SetCharset(GSM);

    sBuffers.Clear;
    SendCommand('AT+CPMS=' + slStroageDevice[k]);
    WaitingForReturn;

    // �����ַ���Ϊ Unicode Big Endian
    if not SetCharset(UCS2) then goto OccurError;
    sBuffers.Clear;

    // ��ȡ���
    try
      if not EnumerateSMSId(slRecRead, slRecUnread, slStoSend, slStoUnsend) then
        raise Exception.Create('��ȡ���ű�ŵ�ʱ��������');

      if Abortion then raise EUserAbortion.Create('�û��жϲ���');
    except
      on EUserAbortion do
      begin
        dbSMS.Free;
        dbSMSItem.Free;
        dbContact.Free;
        slTmp.Free;
        slRecRead.Free;
        slRecUnread.Free;
        slStoSend.Free;
        slStoUnsend.Free;
        AddModemStaus(tsError, '�û��жϲ���');
        Exit;
      end;
      on E: Exception do
      begin
        AddModemStaus(tsError, E.Message);
        AddModemStaus(tsError, '�ڶ�ȡ������ŵ�ʱ��������');
      end;
    end;

    // ������Ϣ�ı��뷽ʽ
    if Abortion then raise EUserAbortion.Create('�û��жϲ���');

    // �򿪵绰��
    try
      dbContact := TADOTable.Create(nil);
      dbContact.Connection := frmMain.adoContacts;
      dbContact.TableName := 'contact';
      dbContact.Open;
    except
      on E: Exception do
      begin
        AddModemStaus(tsError, E.Message);
        AddModemStaus(tsError, '�ڴ򿪵绰����ʱ��������');
      end;
    end;

    // ��ȡ�Ѷ�����Ϣ
    try
      sBuffers.Clear;
      dbSMS := TADOTable.Create(nil);
      dbSMS.Connection := frmMain.adoSMS;
      dbSMS.TableName := 'receive';
      dbSMS.Open;

      while ReadOneMessage(slRecRead, msg, opIScmgl = 1) do
      begin
        if not (msg.IsReport and opReceiveReportOnlyNew) then
        begin
          // ���� hash
          slTmp.Clear;
          slTmp.Add(msg.Number[0]);
          slTmp.Add(msg.Content);
          HashStr(HASH_MD5, slTmp.Text, hash);

          if not dbSMS.Locate('receivedate;hash', VarArrayOf([msg.DateTime,
            hash]), []) then
          begin
            dbSMS.Append;
            dbSMS.FieldByName('receivedate').AsDateTime := msg.DateTime;
            dbSMS.FieldByName('sender').AsString := QuestName(dbContact, msg.Number[0], sFolder);
            dbSMS.FieldByName('sendernumber').AsString := msg.Number[0];
            dbSMS.FieldByName('read').AsBoolean := True;
            dbSMS.FieldByName('replied').AsBoolean := opRepliedReceive;
            if not msg.IsReport then
              dbSMS.FieldByName('content').AsString := msg.Content;
            dbSMS.FieldByName('id').AsInteger := msg.ID;
            if Length(sFolder) > 0 then dbSMS.FieldByName('folder').AsString := sFolder;
            dbSMS.FieldByName('hash').AsString := hash;
            dbSMS.Post;
          end;
        end;

        if Abortion then raise EUserAbortion.Create('�û��жϲ���');
      end;

      dbSMS.Close;
    except
      on EUserAbortion do
      begin
        dbSMS.Free;
        dbSMSItem.Free;
        dbContact.Free;
        slTmp.Free;
        slRecRead.Free;
        slRecUnread.Free;
        slStoSend.Free;
        slStoUnsend.Free;
        AddModemStaus(tsError, '�û��жϲ���');
        Exit;
      end;
      on E: Exception do
      begin
        AddModemStaus(tsError, E.Message);
        AddModemStaus(tsError, '�ڽ����Ѷ�ȡ����Ϣʱ��������');
      end;
    end;

    // ��ȡδ������Ϣ
    try
      dbSMS.Open;
      sBuffers.Clear;

      while ReadOneMessage(slRecUnread, msg, opIScmgl = 1) do
      begin
        if not (msg.IsReport and opReceiveReportOnlyNew) then
        begin
          // ���� hash
          slTmp.Clear;
          slTmp.Add(msg.Number[0]);
          slTmp.Add(msg.Content);
          HashStr(HASH_MD5, slTmp.Text, hash);

          if not dbSMS.Locate('receivedate;hash', VarArrayOf([msg.DateTime,
            hash]), []) then
          begin
            dbSMS.Append;
            dbSMS.FieldByName('receivedate').AsDateTime := msg.DateTime;
            dbSMS.FieldByName('sender').AsString := QuestName(dbContact, msg.Number[0], sFolder);
            dbSMS.FieldByName('sendernumber').AsString := msg.Number[0];
            dbSMS.FieldByName('read').AsBoolean := False;
            if not msg.IsReport then
              dbSMS.FieldByName('content').AsString := msg.Content;
            dbSMS.FieldByName('id').AsInteger := msg.ID;
            if Length(sFolder) > 0 then dbSMS.FieldByName('folder').AsString := sFolder;
            dbSMS.FieldByName('hash').AsString := hash;
            dbSMS.Post;
          end;
        end;

        if Abortion then raise EUserAbortion.Create('�û��жϲ���');
      end;

      dbSMS.Close;
    except
      on EUserAbortion do
      begin
        dbSMS.Free;
        dbSMSItem.Free;
        dbContact.Free;
        slTmp.Free;
        slRecRead.Free;
        slRecUnread.Free;
        slStoSend.Free;
        slStoUnsend.Free;
        AddModemStaus(tsError, '�û��жϲ���');
        Exit;
      end;
      on E: Exception do
      begin
        AddModemStaus(tsError, E.Message);
        AddModemStaus(tsError, '�ڽ���δ��ȡ����Ϣʱ��������');
      end;
    end;

    // ��ȡ�ݸ�
    try
      sBuffers.Clear;
      dbSMSItem := TADOTable.Create(nil);
      dbSMSItem.Connection := frmMain.adoSMS;
      dbSMS.TableName := 'draft';
      dbSMSItem.TableName := 'draft_item';
      dbSMSItem.Open;
      dbSMS.Open;
      dbSMS.Sort := 'date DESC';

      // ��� HashSet
      slHashSet := TStringList.Create;
      slHashSet.Sorted := True;

      if slStoUnsend.Count <> 0 then
      begin
        qryHashset := TADOQuery.Create(nil);
        qryHashset.Connection := frmMain.adoSMS;
        qryHashset.SQL.Text := 'SELECT TOP ' + IntToStr(slStoUnsend.Count) + ' [hash] FROM [draft] WHERE [id]<>0 ORDER BY [date] DESC;';
        qryHashset.Open;

        while not qryHashset.Eof do
        begin
          slHashSet.Add(qryHashset.FieldByName('hash').AsString);
          qryHashset.Next;
        end;

        qryHashset.Close;
        qryHashset.Free;
      end;

      while ReadOneMessage(slStoUnsend, msg, opIScmgl = 1) do
      begin
        if not SearchForSame(msg.Number, msg.Content) then
        begin
          dbSMS.Append;
          dbSMS.FieldByName('id').AsInteger := msg.ID;
          dbSMS.FieldByName('content').AsString := msg.Content;
          dbSMS.FieldByName('hash').AsString := hash;
          dbSMS.FieldByName('date').AsDateTime := msg.DateTime;
          dbSMS.Post;
          InternalId := dbSMS.FieldByName('internalid').AsInteger;

          slTmp := QuestName(dbContact, msg.Number);

          for j := 0 to msg.Number.Count - 1 do
          begin
            dbSMSItem.Append;
            dbSMSItem.FieldByName('associatedid').AsInteger := InternalId;
            dbSMSItem.FieldByName('name').AsString := slTmp[j];
            if Length(msg.Number[j]) > 0 then
              dbSMSItem.FieldByName('number').AsString := msg.Number[j]
            else
              dbSMSItem.FieldByName('number').Clear;
            dbSMSItem.Post;
          end;
        end;

        sBuffers.Clear;
        if Abortion then raise EUserAbortion.Create('�û��жϲ���');
      end;

      slHashSet.Free;
      dbSMS.Close;
      dbSMSItem.Close;
    except
      on EUserAbortion do
      begin
        dbSMS.Free;
        dbSMSItem.Free;
        dbContact.Free;
        slTmp.Free;
        slRecRead.Free;
        slRecUnread.Free;
        slStoSend.Free;
        slStoUnsend.Free;
        slHashSet.Free;
        AddModemStaus(tsError, '�û��жϲ���');
        Exit;
      end;
      on E: Exception do
      begin
        AddModemStaus(tsError, E.Message);
        AddModemStaus(tsError, '�ڽ��ղݸ�ʱ��������');
      end;
    end;

    // ��ȡ�ѷ��ʼ�
    try
      sBuffers.Clear;
      dbSMS.TableName := 'finish';
      dbSMS.Open;
      dbSMS.Sort := 'senderdate DESC';
      dbSMS.Filter := 'id > 0';
      dbSMS.Filtered := True;

      dbSMSItem.TableName := 'finish_item';
      dbSMSItem.Open;

      // ��� HashSet
      slHashSet := TStringList.Create;

      if slStoSend.Count <> 0 then
      begin
        qryHashset := TADOQuery.Create(nil);
        qryHashset.Connection := frmMain.adoSMS;
        qryHashset.SQL.Text := 'SELECT TOP ' + IntToStr(slStoSend.Count * 4) + ' [hash] FROM [finish] '{'WHERE [id]>0'} + ' ORDER BY [senderdate] DESC;';
        qryHashset.Open;

        while not qryHashset.Eof do
        begin
          slHashSet.Add(qryHashset.FieldByName('hash').AsString);
          qryHashset.Next;
        end;

        qryHashset.Close;
        qryHashset.Free;
      end;

      while ReadOneMessage(slStoSend, msg, opIScmgl = 1) do
      begin
        if not SearchForSame(msg.Number, msg.Content) then
        begin
          dbSMS.Append;
          dbSMS.FieldByName('id').AsInteger := msg.ID;
          dbSMS.FieldByName('content').AsString := msg.Content;
          dbSMS.FieldByName('senderdate').AsDateTime := msg.DateTime;
          dbSMS.FieldByName('hash').AsString := hash;
          dbSMS.Post;
          InternalId := dbSMS.FieldByName('internalid').AsInteger;

          slTmp := QuestName(dbContact, msg.Number);

          for j := 0 to msg.Number.Count - 1 do
          begin
            dbSMSItem.Append;
            dbSMSItem.FieldByName('associatedid').AsInteger := InternalId;
            dbSMSItem.FieldByName('name').AsString := slTmp[j];
            dbSMSItem.FieldByName('number').AsString := msg.Number[j];
            dbSMSItem.Post;
          end;
        end;

        sBuffers.Clear;
        if Abortion then raise EUserAbortion.Create('�û��жϲ���');
      end;

      slHashSet.Free;
      dbSMS.Close;
      dbSMSItem.Close;
      dbSMSItem.Free;
    except
      on EUserAbortion do
      begin
        dbSMS.Free;
        dbSMSItem.Free;
        dbContact.Free;
        slTmp.Free;
        slRecRead.Free;
        slRecUnread.Free;
        slStoSend.Free;
        slStoUnsend.Free;
        AddModemStaus(tsError, '�û��жϲ���');
        Exit;
      end;
      on E: Exception do
      begin
        AddModemStaus(tsError, E.Message);
        AddModemStaus(tsError, '�ڽ����ѷ��͵���Ϣʱ��������');
      end;
    end;

    // ɾ����ȡ�Ķ���
    if opDelMessage then
      try
        slTmp.Clear;
        slTmp.AddStrings(slRecRead);
        slTmp.AddStrings(slRecUnread);
        slTmp.AddStrings(slStoSend);
        if opDelDraft then slTmp.AddStrings(slStoUnsend);

        for i := 0 to slTmp.Count - 1 do
        begin
          sBuffers.Clear;
          SendCommand('AT+CMGD=' + slTmp[i]);
          WaitingForReturn;
        end;  
      except
        on EUserAbortion do
        begin
          dbSMS.Free;
          dbSMSItem.Free;
          dbContact.Free;
          slTmp.Free;
          slRecRead.Free;
          slRecUnread.Free;
          slStoSend.Free;
          slStoUnsend.Free;
          AddModemStaus(tsError, '�û��жϲ���');
          Exit;
        end;
        on E: Exception do
        begin
          AddModemStaus(tsError, E.Message);
          AddModemStaus(tsError, '��ɾ����Ϣʱ��������');
        end;
      end;
  end;

  AddModemStaus(tsInfo,'ȫ�����Ž������', True, '������Ϣ');
  dbContact.Close;

FreeObjects:
  dbSMS.Free;
  dbContact.Free;
  slTmp.Free;
  slRecRead.Free;
  slRecUnread.Free;
  slStoSend.Free;
  slStoUnsend.Free;

  if opShowTrayIcon then
    frmMain.RefreshNewTray;

  if frmMain.CurrentView <> cvSend then
    frmMain.RefreshView;
    
  Exit;
OccurError:
  AddModemStaus(tsError, '�д�����', True, '������Ϣ');
end;

procedure TJobThread.ClearSMS;
label
  OccurError;
var
  i, k: Integer;
  slRecRead: TStringList;
  slRecUnread: TStringList;
  slStoSend: TStringList;
  slStoUnsend: TStringList;
  slTmp: TStringList;
  slStroageDevice: TStringList;
  msg: TMsgContent;
begin
  // �����Ϣ
  AddModemStaus(tsInfo, 'ɾ���ֻ������ж�����Ŀ');

  // ֹͣ����
  sBuffers.Clear;
  SendCommand('ATE0');
  if not WaitingForReturn then goto OccurError;
  sBuffers.Clear;

  // �����ַ���Ϊ GSM
  SetCharset(GSM);
  slStroageDevice := GetMemoryLocation;

  slRecRead := TStringList.Create;
  slRecUnread := TStringList.Create;
  slStoSend := TStringList.Create;
  slStoUnsend := TStringList.Create;
  slTmp := TStringList.Create;
  
  // ��ȡ���
  for k := 0 to slStroageDevice.Count - 1 do
  begin
    sBuffers.Clear;
    SendCommand('AT+CPMS=' + slStroageDevice[k]);
    WaitingForReturn;

    try
      if not EnumerateSMSId(slRecRead, slRecUnread, slStoSend, slStoUnsend) then
        raise Exception.Create('��ȡ���ű�ŵ�ʱ��������');
      
      if Abortion then raise EUserAbortion.Create('�û��жϲ���');
    except
      on EUserAbortion do
      begin
        slTmp.Free;
        slRecRead.Free;
        slRecUnread.Free;
        slStoSend.Free;
        slStoUnsend.Free;
        AddModemStaus(tsError, '�û��жϲ���');
        Exit;
      end;
      on E: Exception do
      begin
        AddModemStaus(tsError, E.Message);
        AddModemStaus(tsError, '�ڶ�ȡ������ŵ�ʱ��������');
      end;
    end;

    // ɾ���ֻ��еĶ���
    try
      slTmp.Clear;
      slTmp.AddStrings(slRecRead);
      slTmp.AddStrings(slRecUnread);
      slTmp.AddStrings(slStoSend);
      if opDelDraft then slTmp.AddStrings(slStoUnsend);

      for i := 0 to slTmp.Count - 1 do
      begin
        sBuffers.Clear;
        SendCommand('AT+CMGD=' + slTmp[i]);
        WaitingForReturn;
      end;
    except
      on EUserAbortion do
      begin
        slTmp.Free;
        slRecRead.Free;
        slRecUnread.Free;
        slStoSend.Free;
        slStoUnsend.Free;
        AddModemStaus(tsError, '�û��жϲ���');
        Exit;
      end;
      on E: Exception do
      begin
        AddModemStaus(tsError, E.Message);
        AddModemStaus(tsError, '��ɾ����Ϣʱ��������');
      end;
    end;
  end;

  AddModemStaus(tsInfo,'���ж����Ѿ����', True, '����ֻ�����');
  slTmp.Free;
  slRecRead.Free;
  slRecUnread.Free;
  slStoSend.Free;
  slStoUnsend.Free;

  Exit;
OccurError:
  AddModemStaus(tsError, '�д�����', True, '����ֻ�����');
end;

// ���Ͷ���Ϣ
function TJobThread.FSendSMS(ADestination, AMessage, AReceiver: string; Report: Boolean): Boolean;
var
  sCmd: String;
  iMaxChar: Integer;
  iPdu: Integer;
  bUnicode: Boolean;
  bLongSMS: Boolean;
  slSeparated: TStringList;
  i, j: Integer;
  iSMSReferenceNumber: Integer;
  iStorageNumber: Integer;
  sMsg: WideString;
  slLocation: TStringList;
const
  slAvailableStorage: array[0..3] of string
    = ('"ME"', '"004D0045"',
       '"MT"', '"004D0054"');
begin
  // ׼��һЩ����
  Result := False;
  bUnicode := IsSpecificTest(AMessage);
  sMsg := WideString(AMessage);
  sBuffers.Clear;

  if Length(AReceiver) > 0 then
    AReceiver := AReceiver + ' (' + ADestination + ')'
  else
    AReceiver := ADestination;

  if bUnicode then
    iMaxChar := 70
  else
    iMaxChar := 160;

  // �����ŷָʽ
  if opLongSMS and (Length(sMsg) > iMaxChar) then
  begin
    if bUnicode then
      iMaxChar := 67
    else
      iMaxChar := 153;

    bLongSMS := True;
    Randomize;
    iSMSReferenceNumber := Trunc(Random(256));
  end
  else
    bLongSMS := False;

  // ֹͣ����
  SendCommand('ATE0');
  if not WaitingForReturn then Exit;
  sBuffers.Clear;

  // �л�Ϊ GSM �ַ���
  AddModemStaus(tsInfo, '������Ϣ��' + AReceiver);
  if not SetCharset(UCS2) then Exit;
  sBuffers.Clear;

  // �л�Ϊ PDU ģʽ
  SendCommand('AT+CMGF=0');
  if not WaitingForReturn then Exit;
  sBuffers.Clear;

  if Abortion then
  begin
    sBuffers.Clear;
    AddModemStaus(tsError, '���Ͷ��ű�ȡ��', True, '����Ϣ');
    Exit;
  end;

  // ���ö��Ŵ洢�ط�
  slLocation := GetMemoryLocation(1);
  j := -1;

  for i := 0 to 4 - 1 do
  begin
    j := slLocation.IndexOf(slAvailableStorage[i]);

    if (j >= 0) then
    begin
      sBuffer := slAvailableStorage[i];
      Break;
    end;
  end;

  slLocation.Free;

  if (j >= 0) then
  begin
    sBuffers.Clear;
    SendCommand(Format('AT+CPMS=%s,%s', [sBuffer, sBuffer]));
    if not WaitingForReturn then Exit;
  end;

  // �ָ��
  slSeparated := TStringList.Create;

  while Length(sMsg) > 0 do
  begin
    if Length(sMsg) > iMaxChar then
    begin
      slSeparated.Add(LeftStr(sMsg, iMaxChar));
      Delete(sMsg, 1, iMaxChar);
    end
    else
    begin
      slSeparated.Add(sMsg);
      sMsg := '';
    end;
  end;

  for i := 0 to slSeparated.Count - 1 do
  begin
    // PDU ����
    sBuffer := '';
    Inc(MessageReference);
    
    if Report then
      sCmd := PDUSendString(iPdu, InfoCenter, ADestination, slSeparated[i], bUnicode, 17 + 32, MessageReference, 0, bLongSMS, slSeparated.Count, i, iSMSReferenceNumber)
    else
      sCmd := PDUSendString(iPdu, InfoCenter, ADestination, slSeparated[i], bUnicode, 17, MessageReference, 0, bLongSMS, slSeparated.Count, i, iSMSReferenceNumber);  // +32 ���ͱ���
      
    sBuffer := '';
    sBuffers.Clear;

    // ���ͻ��Ǵ洢
    if opWritePhoneMemoy then
      SendCommand(Format('AT+CMGW=%d',[iPdu]))
    else
      SendCommand(Format('AT+CMGS=%d',[iPdu]));

    // ����ȷ��
    if not WaitingForInput then
    begin
      // ȡ������
      SendCommand(#$1B);
      slSeparated.Free;
      Exit;
    end;

    // �û�ȡ��
    if Abortion then
    begin
      // ȡ������
      SendCommand(#$1B);
      sBuffers.Clear;
      AddModemStaus(tsError, '���Ͷ��ű�ȡ��', True, '����Ϣ');
      slSeparated.Free;
      Exit;
    end;  

    // д��PDU
    SendCommand(sCmd + #$1A);

    if opWritePhoneMemoy then
    begin
      // �����ֱ��д��洢��
      if not WaitingForReturnValue('+CMGW:', sBuffer) then
        Exit;

      // ������Ϣ
      sBuffers.Clear;
      SendCommand(Format('AT+CMSS=%s', [sBuffer]));

      // ��ý��
      if not WaitingForReturnValue('+CMSS:', sBuffer, 30000) then
        Exit;

      MessageReference := StrToInt(sBuffer);
    end
    else
    begin
      // ��� ��ֱ�ӷ���
      if not WaitingForReturn(30000) then Exit;
      if Pos('+CMGS:', sBuffers.Text) = 0 then
        Exit
      else
      begin
        for j := 0 to sBuffers.Count - 1 do
          if AnsiStartsStr('+CMGS:', sBuffers[j]) then
          begin
            sBuffer := sBuffers[j];
            Break;
          end;

        sBuffer := ExtractParameter(sBuffer);
        MessageReference := StrToInt(sBuffer);
      end;
    end;

    sBuffers.Clear;
  end;

  AddModemStaus(tsInfo, '���Ͷ��ųɹ���' + AReceiver, True, '����Ϣ');
  Result := True;
  slSeparated.Free;
end;

// ������Ϣ
procedure TJobThread.SendSMS;
var
//  dbFinish: TADOTable;
  dbOutbox: TADOTable;
//  sOriPhone: String;
//  sOriName: String;
  SQL: TADOQuery;
  AJob: TSMSJob;
  slHash: TStringList;
  hash: String;
//  noticewnd: TNotice;
  InternalID: Integer;
begin
  AJob := JobContent.Items[0];
  SQL := TADOQuery.Create(nil);
  SQL.Connection := frmMain.adoSMS;
  AJob.Content := AnsiReplaceText(AJob.Content, #$D#$A, #$D);

  if FSendSMS(AJob.Destination, AJob.Content, AJob.Name , AJob.RequireReport) then
  // ���ͳɹ�
  begin
    // ��� Message Reference �����ݿ�ID ��ӳ��
    MsgRefIDMap.Insert(MessageReference, AJob.FinishID);

    // ���·����¼���ʱ��
    SQL.SQL.Add(Format('UPDATE finish SET finish.senderdate = "%s"', [DateTimeToStr(Now)]));
    SQL.SQL.Add(Format('WHERE finish.internalid = %s;', [IntToStr(AJob.FinishID)]));
    SQL.ExecSQL;

    // ��ӷ�����Ϣ
    SQL.SQL.Clear;
    SQL.SQL.Add('INSERT INTO finish_item (associatedid, name, [number])');
    SQL.SQL.Add(Format('VALUES (%d, "%s", "%s");', [AJob.FinishID, AJob.Name, AJob.Destination]));
    SQL.ExecSQL;

    // ���¼��� Hash
    SQL.SQL.Clear;
    SQL.SQL.Add('SELECT finish_item.number');
    SQL.SQL.Add('FROM finish_item');
    SQL.SQL.Add(Format('WHERE (((finish_item.associatedid)=%d))', [AJob.FinishID]));
    SQL.SQL.Add('ORDER BY finish_item.number;');
    SQL.Open;

    slHash := TStringList.Create;

    while not SQL.Eof do
    begin
      slHash.Add(SQL.FieldByName('number').AsString);
      SQL.Next;
    end;

    SQL.Close;

    slHash.Add(AJob.Content);
    HashStr(HASH_MD5, slHash.Text, hash);
    slHash.Free;

    // ���·��͵����ݵ� HASH
    SQL.SQL.Clear;
    SQL.SQL.Add(Format('UPDATE finish SET finish.hash = "%s"', [hash]));
    SQL.SQL.Add(Format('WHERE finish.internalid = %d;', [AJob.FinishID]));
    SQL.ExecSQL;

    if (frmMain.CurrentView = cvFinish) or (frmMain.CurrentView = cvNone) then
      frmMain.RefreshView(AJob.FinishID);
  end
  // ����ʧ�ܣ���ӵ�������
  else
  begin
    AddModemStaus(tsError, '����ʧ�ܣ�������������', True, '����Ϣ');
    dbOutbox := TADOTable.Create(nil);
    dbOutbox.Connection := frmMain.adoSMS;
    dbOutbox.TableName := 'send';
    dbOutbox.Open;
    dbOutbox.Append;
    dbOutbox.FieldByName('senderdate').AsDateTime := Now;
    dbOutbox.FieldByName('addressee').AsString := AJob.Name;
    dbOutbox.FieldByName('number').AsString := AJob.Destination;
    dbOutbox.FieldByName('content').AsString := AJob.Content;
    dbOutbox.FieldByName('finishid').AsInteger := AJob.FinishID;
    dbOutbox.Post;
    InternalID := dbOutbox.FieldByName('internalid').AsInteger;
    dbOutbox.Close;
    dbOutbox.Free;

    if opAutoReconnect and (not Abortion) then
    begin
      Sleep(opTaskInterval);
      ClosePort(False);
      Sleep(opTaskInterval);
      OpenPortDef;
    end;      

    // ��ʾ��ʾ����
    if IsShowPopup then
      try
        CurrentNewNW.WindowType := Integer(ntMsgError);
        CurrentNewNW.InternalID := InternalID;
        CurrentNewNW.ReceiveDate := Now;
        CurrentNewNW.SenderString := AJob.Name;
        Synchronize(FOpenNotificationWnd, True);
      finally
        ;
      end;

    if (frmMain.CurrentView = cvSend) or (frmMain.CurrentView = cvNone) then
      frmMain.RefreshView;
  end;

  SQL.Free;
end;

// ��ѯ����Ϣ
procedure TJobThread.QueryMessage;
var
//  pdu: String;
  i: Integer;
  slRecUnread: TStringList;
  dbSMS: TADOTable;
  dbContact: TADOTable;
  sFolder: String;
  slTmp: TStringList;
  hash: string;
//  noticewnd: TNotice;
  bUpdated: Boolean;
  msg: TMsgContent;
begin
  // �����Ϣ
  AddModemStaus(tsInfo, '��ȡ���ж�����Ŀ');

  // ֹͣ����
  sBuffers.Clear;
  SendCommand('ATE0');
  if not WaitingForReturn then
  begin
    AddModemStaus(tsError, '�д�����', True, '������Ϣ');
//    if ConnectionLost then
//      raise EConnectionLost.Create('���Ӷ�ʧ');
    Exit;
  end;
  sBuffers.Clear;

  // ���ô洢��
  sBuffers.Clear;
  SendCommand('AT+CPMS?');
  WaitingForReturn;
  slTmp := ExtractAllParameter(sBuffers[0]);
  if slTmp.Count >=9 then
  begin
    if (StrToIntDef(slTmp[8], 1000) - StrToIntDef(slTmp[7], 0) < 4) then
      frmMain.ShowPopHit('�ֻ��ռ䲻��', '���Ķ��Ŵ洢�������Ѿ����㣬' +
      '����ֻ���ɾ��ĳЩ���š�', True);

    sBuffers.Clear;
    SendCommand('AT+CPMS=' + slTmp[6]);
    WaitingForReturn;
  end;  

  slRecUnread := TStringList.Create;
  i := 0;
  bUpdated := False;

  if not EnumerateSMSId(slRecUnread, slRecUnread, slRecUnread, slRecUnread, True) then
  begin
    slRecUnread.Free;
    if CycleQuery then
      UserInterfaces.JobThread.JobContent.Add(jkCycleQuery);
    Exit;
  end;

  if slRecUnread.Count = 0 then
  begin
    slRecUnread.Free;
    if CycleQuery then
      UserInterfaces.JobThread.JobContent.Add(jkCycleQuery);
    Exit;
  end;

  // ��ʾ����ͼ��Ķ���Ч��
  frmMain.ShowTrayAnimation(True, jkQueryNew);

  // �򿪵绰��
  try
    dbContact := TADOTable.Create(nil);
    dbContact.Connection := frmMain.adoContacts;
    dbContact.TableName := 'contact';
    dbContact.Open;
  except
    on E: Exception do
    begin
      AddModemStaus(tsError, E.Message);
      AddModemStaus(tsError, '�ڴ򿪵绰����ʱ��������');
    end;
  end;

  // ��ȡ�¶���
  try
    dbSMS := TADOTable.Create(nil);
    dbSMS.Connection := frmMain.adoSMS;
    dbSMS.TableName := 'receive';
    dbSMS.Open;
    sBuffers.Clear;

    while ReadOneMessage(slRecUnread, msg, opIScmgl = 1) do
    begin
      // ���� hash
      slTmp.Clear;
      slTmp.Add(msg.Number[0]);
      slTmp.Add(msg.Content);
      HashStr(HASH_MD5, slTmp.Text, hash);

      if not dbSMS.Locate('receivedate;hash', VarArrayOf([msg.DateTime,
        hash]), []) then
        if (opQueryNewModel = 3) or ((opQueryNewModel = 1) and msg.IsReport) or ((opQueryNewModel = 2) and (not msg.IsReport)) then
        begin
          dbSMS.Append;
          dbSMS.FieldByName('receivedate').AsDateTime := msg.DateTime;
          dbSMS.FieldByName('sender').AsString := QuestName(dbContact, msg.Number[0], sFolder);
          dbSMS.FieldByName('sendernumber').AsString := msg.Number[0];
          dbSMS.FieldByName('read').AsBoolean := False;
          if not msg.IsReport then
            dbSMS.FieldByName('content').AsString := msg.Content;
          dbSMS.FieldByName('id').AsInteger := 0;
          if Length(sFolder) > 0 then dbSMS.FieldByName('folder').AsString := sFolder;
          dbSMS.FieldByName('hash').AsString := hash;
          dbSMS.Post;

          bUpdated := True;

          if IsShowPopup then
            try
              if msg.IsReport then
                CurrentNewNW.WindowType := Integer(ntMsgReport)
              else
                CurrentNewNW.WindowType := Integer(ntNewMsg);

              CurrentNewNW.InternalID := dbSMS.FieldByName('internalid').AsInteger;
              CurrentNewNW.ReceiveDate := msg.DateTime;
              CurrentNewNW.SenderString := dbSMS.FieldByName('sender').AsString;
              Synchronize(FOpenNotificationWnd, True);
            finally
              ;
            end;
        end;

        // ɾ����Ϣ
        if opDelMessage or (opDeleteReport and msg.IsReport) then
        begin
          sBuffers.Clear;
          SendCommand('AT+CMGD=' + slRecUnread[i]);
          WaitingForReturn;
        end;

        sBuffers.Clear;
      if Abortion then raise EUserAbortion.Create('�û��жϲ���');
    end;
  except
    on EUserAbortion do
    begin
      dbSMS.Free;
      dbContact.Free;
      slTmp.Free;
      slRecUnread.Free;
      AddModemStaus(tsError, '�û��жϲ���');
      Exit;
    end;
    on E: Exception do
    begin
      AddModemStaus(tsError, E.Message);
      AddModemStaus(tsError, '�ڽ���δ��ȡ����Ϣʱ��������');
    end;
  end;

  AddModemStaus(tsInfo,'��ѯ�¶������');
  dbSMS.Close;
  dbContact.Close;

  dbSMS.Free;
  dbContact.Free;

  if bUpdated and opShowTrayIcon then
    frmMain.RefreshNewTray;

  if bUpdated and (frmMain.CurrentView = cvReceive) then
    frmMain.RefreshView;

  slRecUnread.Free;

//  if CycleQuery then
//    JobThread.JobContent.Add(jkCycleQuery);

  Exit;


end;

// ��ѯ�¶���
procedure TJobThread.QueryNew;
label
  OccurError;
var
  dbSMS: TADOTable;
  dbContact: TADOTable;
  dbOrigin: TADOQuery;
  sFolder: String;
  msg: TMsgContent;
  slSender: TStringList;
  slRecUnread: TStringList;
  slTmp: TStringList;
  DisplayStr: String;
  MsgReport: Boolean;
  hash: String;
  bUpdated: Boolean;
begin
  // �����Ϣ
  AddModemStaus(tsInfo, '�����µĶ���');
  MsgReport := False;
  bUpdated := False;

  // ֹͣ����
  sBuffers.Clear;
  SendCommand('ATE0');
  if not WaitingForReturn(10000) then goto OccurError;
  sBuffers.Clear;
  if Abortion then raise EUserAbortion.Create('�û��жϲ���');

  // ���ô洢װ��
  SendCommand('AT+CPMS=' + JobContent.Items[0].Destination);
  WaitingForReturn;
  sBuffers.Clear;

  // �����ַ���Ϊ Unicode Big Endian
  if not SetCharset(UCS2) then goto OccurError;
  sBuffers.Clear;
  if Abortion then raise EUserAbortion.Create('�û��жϲ���');

  // ������Ϣ�ı��뷽ʽ
  if opIScmgl = 1 then
    SendCommand('AT+CMGF=0')
  else
    SendCommand('AT+CMGF=1');
    
  if (not WaitingForReturn(10000)) then goto OccurError;
  sBuffers.Clear;
  if Abortion then raise EUserAbortion.Create('�û��жϲ���');

  // �򿪵绰��
  if JobContent.Items[0].QueryID > 0 then
  begin
    sBuffers.Clear;
    dbSMS := TADOTable.Create(nil);
    dbSMS.Connection := frmMain.adoSMS;
    dbSMS.TableName := 'receive';
    dbSMS.Open;
    dbContact := TADOTable.Create(nil);
    dbContact.Connection := frmMain.adoContacts;
    dbContact.TableName := 'contact';
    dbContact.Open;
    slTmp := TStringList.Create;

    if not Assigned(CMTIBuffers) then
      CMTIBuffers := TStringList.Create;

    CMTIBuffers.Add(IntToStr(JobContent.Items[0].QueryID));

    // ��ȡδ������Ϣ
    while ReadOneMessage(CMTIBuffers, msg, opIScmgl = 1, True) do
    begin
      slTmp.Clear;
      slTmp.Add(msg.Number[0]);
      slTmp.Add(msg.Content);
      HashStr(HASH_MD5, slTmp.Text, hash);

      if not dbSMS.Locate('receivedate;hash', VarArrayOf([msg.DateTime,
        hash]), []) then
      begin
        dbSMS.Append;
        dbSMS.FieldByName('receivedate').AsDateTime := msg.DateTime;
        dbSMS.FieldByName('sender').AsString := QuestName(dbContact, msg.Number[0], sFolder);
        dbSMS.FieldByName('sendernumber').AsString := msg.Number[0];
        dbSMS.FieldByName('read').AsBoolean := False;
        dbSMS.FieldByName('hash').AsString := hash;
        if not MsgReport then
          dbSMS.FieldByName('content').AsString := msg.Content;
        if Length(sFolder) > 0 then dbSMS.FieldByName('folder').AsString := sFolder;
        dbSMS.Post;

        msg.ID := dbSMS.FieldByName('internalid').AsInteger;

        if Length(dbSMS.FieldByName('sender').AsString) = 0 then
          DisplayStr := msg.Number[0]
        else
          DisplayStr := dbSMS.FieldByName('sender').AsString;

        bUpdated := True;
      end;

      sBuffers.Clear;
    end;

    dbSMS.Close;
    dbContact.Close;
    dbSMS.Free;
    dbContact.Free;
    slTmp.Free;
  end;

  // ɾ����Ϣ
  if opDelMessage or (opDeleteReport and MsgReport) then
  begin
    sBuffers.Clear;
    SendCommand('AT+CMGD=' + IntToStr(JobContent.Items[0].QueryID));
    WaitingForReturn;
  end;

  AddModemStaus(tsInfo,'��ѯ���');
  slSender.Free;
  slRecUnread.Free;

  if bUpdated then
  begin
    if opShowTrayIcon then
      frmMain.RefreshNewTray;

    if (frmMain.CurrentView = cvReceive) or (frmMain.CurrentView = cvNone) then
      frmMain.RefreshView(msg.ID);

    // ��ʾ��ʾ����
    if IsShowPopup then
      try
        if MsgReport then
          CurrentNewNW.WindowType := Integer(ntMsgReport)
        else
          CurrentNewNW.WindowType := Integer(ntNewMsg);

        CurrentNewNW.InternalID := msg.ID;
        CurrentNewNW.ReceiveDate := msg.DateTime;
        CurrentNewNW.SenderString := DisplayStr;
        Synchronize(FOpenNotificationWnd, True);
      finally
        ;
      end;
  end;      

//  CMTIBuffers.Free;
  Exit;

OccurError:
  AddModemStaus(tsError, '��ѯ���, ���д�����');
end;

// ���� Modem �ص�
procedure TJobThread.SetQueryCALLBACK;
var
  CMD: String;
  Params: TStringList;
  Result: TIntSet;

  function ParseNumberList(Parameter: String): TIntSet;
  var
    sPart: TStringList;
    i: Integer;
    iPos : Integer;
    a, b, c: Integer;
  begin
    if Parameter[1] = '(' then
      Delete(Parameter, 1, 1);

    if Parameter[Length(Parameter)] = ')' then
      Delete(Parameter, Length(Parameter), 1);

    Result := TIntSet.Create;
    sPart := SplitString(Parameter, ',');

    for i := 0 to sPart.Count - 1 do
    begin
      iPos := Pos('-', sPart[i]);

      if iPos = 0 then
        Result.Insert(StrToIntDef(sPart[i], 0))
      else
      begin
        a := StrToIntDef(LeftStr(sPart[i], iPos - 1), 0);
        b := StrToIntDef(RightStr(sPart[i], Length(sPart[i]) - iPos), 0);

        for c := a to b do
          Result.Insert(c); 
      end;
    end;
  end;

//����Ϣ��(class)�ĸ������ָ�������λ�ã�����Ϣ��Ϊclass 0 �C 3�ĸ��ࡣҲ���Բ�ָ����(no class)����ME��Ĭ�����ý��д����洢���ڴ����SIM���С���TPDU��TP-DCS�ֽ��У���bit7-bit4Ϊ00x1, 01x1, 1111ʱ��bit1-bit0ָ����Ϣ�����ࣺ
//00 �C class 0��ֻ��ʾ��������
//01 �C class 1��������ME�ڴ���
//02 �C class 2��������SIM����
//03 �C class 3��ֱ�Ӵ��䵽TE
//GSM Modemһ�㶼֧��һ����AT+CNMI��ָ��������趨����ĳ�����Ϣ����ʱ����δ�������ֻ������ָ�����ڴ�(��ʧ��/����ʧ��)�У��ȴ����֪ͨTE������ֱ��ת����TE���ȵȡ�
//
//��AT+CNMI��ָ���﷨Ϊ
//
//AT+CNMI=[<mode>[,<mt>[,<bm>[,<ds>[,<bfr>]]]]]
//mode - ֪ͨ��ʽ��
//
//0 �C ��֪ͨTE��
//1 �C ֻ�������߿��е�����£�֪ͨTE������֪ͨTE��
//2 �C ֪ͨTE���������߱�ռ�õ�����£��Ȼ����������������߿��У�����֪ͨ��
//3 �C ֪ͨTE���������߱�ռ�õ�����£�֪ͨ�����������һ���䡣
//mt - ��Ϣ�����ֱ��ת����TE��
//
//0 �C ���浽Ĭ�ϵ��ڴ�λ��(����class 3)
//1 �C ���浽Ĭ�ϵ��ڴ�λ�ã�������TE����֪ͨ(����class 3)
//2 �C ����class 2�����浽SIM����������TE����֪ͨ����������class��ֱ�ӽ���Ϣת���� TE
//3 �C ����class 3��ֱ�ӽ���Ϣת���� TE����������class��ͬmt=1
//bm, ds, bfr�ĺ��壬��ο���ر�׼�ĵ���һ�㲻��Ҫȥ�������ǡ�

begin
  // ֹͣ����
  sBuffers.Clear;
  SendCommand('ATE0');
  if not WaitingForReturn then Exit;
  sBuffers.Clear;

  if AutoReceive then
  begin
    AddModemStaus(tsInfo, '�����Զ���������Ϣ');

    try
      // ���ԭ����ģʽ
      SendCommand('AT+CNMI?');
      if WaitingForReturn then
      begin
        CMD := sBuffers[0];
        defaultCNMI := Trim(RightStr(CMD, Length(CMD) - Pos(#$3A, CMD)));
      end
      else
        defaultCNMI := '0';

      // ����ֻ�֧�ֵ�ģʽ
      sBuffers.Clear;
      SendCommand('AT+CNMI=?');
      if WaitingForReturn then
      begin
        Params := ExtractAllParameter(sBuffers[0]);

        // ���� mode �ֶ�
        Result := ParseNumberList(Params[0]);
        if not Result.Find(2).IsEqual(Result.ItEnd) then
          CMD := '2'
        else if not Result.Find(3).IsEqual(Result.ItEnd) then
          CMD := '3'
        else
          CMD := '0';

        // ���� mt �ֶ�
        if (opQueryNewModel = 0) or (opQueryNewModel = 1) then
        begin
          Result := ParseNumberList(Params[1]);

          if not Result.Find(1).IsEqual(Result.ItEnd) then
            CMD := CMD + ',1'
          else
            CMD := CMD + ',0';
        end  
        else
          CMD := CMD + ',0';

        // ���� bm �ֶ�
        CMD := CMD + ',0';

        // ���� ds �ֶ�
        if (opQueryNewModel = 0) or (opQueryNewModel = 2) then
        begin
          Result := ParseNumberList(Params[3]);

          if not Result.Find(1).IsEqual(Result.ItEnd) then
            CMD := CMD + ',1'
          else
            CMD := CMD + ',0';
        end
        else
          CMD := CMD + ',0';
      end
      else
        raise ECNMIUnsupported.Create('��֧�� AT+CNMI');

      if opQueryNewModel <> 0 then
        frmMain.tmrQueryNewSMS.Enabled := True;

      // ����
      sBuffers.Clear;
      SendCommand('AT+CNMI=' + CMD);
      if WaitingForReturn then
        AddModemStaus(tsInfo, '�Զ���������Ϣ������')
      else
        raise ECNMIUnsupported.Create('���� ERROR ��ʱ');
    except
      on E: ECNMIUnsupported do
      begin
        AddModemStaus(tsError, '�Զ���������Ϣ����ʧ�ܣ��ֻ���֧�֣�: ' + E.Message, True, '�Զ�����');
        frmMain.dxbtnAutoReceive.Down := False;
        frmMain.dxmnuSMSAutoReceive.Down := False;
      end;
      on E: Exception do
      begin
        AddModemStaus(tsError, '�Զ���������Ϣ����ʧ��: ' + E.Message, True, '�Զ�����');
        frmMain.dxbtnAutoReceive.Down := False;
        frmMain.dxmnuSMSAutoReceive.Down := False;
      end;
    end;
  end
  else
  begin
    AddModemStaus(tsInfo, '�ر��Զ���������Ϣ');
    SendCommand('AT+CNMI=' + defaultCNMI);
    AddModemStaus(tsInfo, '�Զ���������Ϣ�ѹر�', True, '�Զ�����');
  end;

  sBuffers.Clear;
end;

procedure TJobThread.FSetAnimation;
begin
  frmMain.ShowTrayAnimation(True, CurrentJobKind);
end;

procedure TRunCmd.Execute;
begin
  Self.FreeOnTerminate := True;
  WinExec(PChar(Cmd), 0);
end;

procedure TJobThread.QueryState;
var
  iBMode: Integer;
  iBCapacity: Integer;
  iBImageIndex: Integer;
  iSRSSI: Integer;
  iSFer: Integer;
  iSImageIndex: Integer;
begin
  // ֹͣ����
  sBuffers.Clear;
  SendCommand('ATE0');
  if not WaitingForReturn then
  begin
//    if ConnectionLost then
//      raise EConnectionLost.Create('���Ӷ�ʧ');
    Exit;
  end;
  sBuffers.Clear;
                            
  // ��ѯ�ֻ���״̬
  if opQSBattery then
  begin
    sBuffers.Clear;
    SendCommand('AT+CBC');
    if WaitingForReturn and AnsiStartsText('+CBC:', sBuffers[0]) then
    begin
      iBMode := StrToInt(ExtractParameter(sBuffers[0], 0));
      iBCapacity := StrToInt(ExtractParameter(sBuffers[0], 1));

      // ���״̬����
      if iBMode = 0 then
        frmMain.stbMain.Panels[3].Text := '�ŵ�: '
      else if iBMode = 1 then
        frmMain.stbMain.Panels[3].Text := '���: '
      else
        frmMain.stbMain.Panels[3].Text := '���״̬δ֪';

      // ���״̬ͼ��
      if iBMode < 2 then
      begin
        frmMain.stbMain.Panels[3].Text := frmMain.stbMain.Panels[3].Text +
          IntToStr(iBCapacity) + '%';
        iBImageIndex := Min(iBCapacity div 20, 4) + 12;
        if iBMode = 1 then iBImageIndex := iBImageIndex + 5;
      end
      else
        iBImageIndex := 11;

      (frmMain.stbMain.Panels[3].PanelStyle as
        TdxStatusBarTextPanelStyle).ImageIndex := iBImageIndex;

      // �����������ʾ��ʾ��Ϣ
      if iBCapacity < opQSAlert then
      begin
        AddModemStaus(tsInfo, '��ص����ͣ��뼰ʱ���', True, '������');
        frmMain.ShowPopHit('��ص�����', 'Ultra SMS ��⵽�����ֻ��ĵ�ص����ͣ�' +
          '������ʱ��磬����ʹ�� USB ���ӡ�', True);
      end;
    end;
  end;

  // ��ѯ�ֻ��ź�״̬
  if opQSSignal then
  begin
    sBuffers.Clear;
    SendCommand('AT+CSQ');
    if WaitingForReturn and AnsiStartsText('+CSQ:', sBuffers[0]) then 
    begin
      iSRSSI := StrToInt(ExtractParameter(sBuffers[0], 0));
      iSFer := StrToInt(ExtractParameter(sBuffers[0], 1));

      // �ź�״̬����
      if iSFer <> 99 then
        frmMain.stbMain.Panels[4].Text := '�ź�δ֪';

      // ���״̬ͼ��
      if iSFer = 99 then
      begin
        frmMain.stbMain.Panels[4].Text := '�ź�ǿ��: ' +
          IntToStr(Trunc(iSRSSI / 0.31)) + '%';
        iSImageIndex := iSRSSI div 8 + 24;
        if iSRSSI = 0 then iSImageIndex := 23;
      end
      else
        iSImageIndex := 22;

      (frmMain.stbMain.Panels[4].PanelStyle as
        TdxStatusBarTextPanelStyle).ImageIndex := iSImageIndex;

      // �����������ʾ��ʾ��Ϣ
      if iSImageIndex = 0 then
      begin
        AddModemStaus(tsError, '�ֻ��������������ź�״̬', True, '���ź�');
        frmMain.ShowPopHit('���ź�', 'Ultra SMS ��⵽�����ֻ������źŻ��źź�����' +
          '�����ƶ������ֻ������ź�����', True);
      end;
    end;
  end;

  AddModemStaus(tsInfo, '�ֻ�״̬��ѯ���');
end;

function TJobThread.TestPort: Boolean;
begin
  sBuffers.Clear;
  SendCommand('ATE0');
  Result := WaitingForReturn;
  sBuffers.Clear;
end;  

// �г����ŵı��
function TJobThread.EnumerateSMSId(var slRecRead: TStringList;
  var slRecUnread: TStringList; var slStoSend: TStringList;
  var slStoUnsend: TStringList; bNewMessage: Boolean = False): Boolean;
label
  OccurError;
const
  sFormat: array[0..2] of string = ('AT+CMGF=1', 'AT+CMGF=0', 'AT+CMGF=1');
  sCommander: array[0..2] of string = ('AT+CMGL="ALL"', 'AT+CMGL=4', 'AT+MMGL="HEADER ONLY"');
  sNewMsg: array[0..2] of string = ('AT+CMGL="REC UNREAD"', 'AT+CMGL=0', 'AT+MMGL="REC UNREAD"');
  sCmdHeader: array[0..2] of string = ('+CMGL:', '+CMGL:', '+MMGL:');
  sRecUnead: array[0..2] of string = ('REC UNREAD', '0', 'REC UNREAD');
  sRecRead: array[0..2] of string = ('REC READ', '1', 'REC READ');  
  sStoUnsend: array[0..2] of string = ('STO UNSENT', '2', 'STO UNSENT');  
  sStoSend: array[0..2] of string = ('STO SENT', '3', 'STO SENT');  
var
  i: Integer;
  id: string;
  msgtype: string;

  function IsHex(S: String): Boolean;
  var
    i: Integer;
    ch: Char;
  begin
    Result := True;
    for ch in S do
      if not (((ch >= '0') and (ch <= '9')) or ((ch >= 'A') and (ch <= 'F'))) then
      begin
        Result := False;
        Exit;
      end;  
  end;
  
begin
  // ������Ϣ�ı��뷽ʽ
  sBuffers.Clear;
  SendCommand(sFormat[opIScmgl]);
  if (not WaitingForReturn) then goto OccurError;
  sBuffers.Clear;

  // ��ʼ��ȡδ����Ϣ
  if bNewMessage then
    SendCommand(sNewMsg[opIScmgl])
  else
    SendCommand(sCommander[opIScmgl]);

  if (not WaitingForReturn(30000)) then goto OccurError;

  // ��ȡ��Ϣ
  i := 0;

  slRecUnread.Clear;
  slRecRead.Clear;
  slStoSend.Clear;
  slStoUnsend.Clear;

  while sBuffers.Count > i do
  begin
    if AnsiStartsText(sCmdHeader[opIScmgl], sBuffers[i]) then
    begin
      id := ExtractParameter(sBuffers[i], 0);
      msgtype := ExtractParameter(sBuffers[i], 1);

      if msgtype = sRecUnead[opIScmgl] then
        slRecUnread.Add(id)
      else if msgtype = sRecRead[opIScmgl] then
        slRecread.Add(id)
      else if msgtype = sStoUnsend[opIScmgl] then
        slStoUnsend.Insert(0, id)
      else if msgtype = sStoSend[opIScmgl] then
        slStoSend.Insert(0, id);
    end
    else
    if IsHex(sBuffers[i]) then
    begin
      if msgtype = sRecUnead[opIScmgl] then
        slRecUnread.Objects[slRecUnread.Count - 1] := TObject(sBuffers[i])
      else if msgtype = sRecRead[opIScmgl] then
        slRecread.Objects[slRecread.Count - 1] := TObject(sBuffers[i])
      else if msgtype = sStoUnsend[opIScmgl] then
        slStoUnsend.Objects[0] := TObject(sBuffers[i])
      else if msgtype = sStoSend[opIScmgl] then
        slStoSend.Objects[0] := TObject(sBuffers[i]);
    end;

    Inc(i);
  end;

  Result := True;

  Exit;  

  // �д��󷵻�
OccurError:
  Result := False;
end;  

procedure TJobThread.QueryTime(APhoneTime: PDateTime; APCTime: PDateTime; Result: PBoolean; hWindow: HWND);
const
  WM_QUERY_SUCCESSFUL = WM_USER + 471;
var
  ReturnVal: string;
begin
  // ��ѯʱ��Ĺ���
  AddModemStaus(tsInfo, '��ѯ�ֻ�����ʱ��');

  Result^ := False;
  SetCharset(GSM);
  sBuffers.Clear;
  SendCommand('AT+CCLK?');
  APCTime^ := RecodeDateTime(Now, RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs, RecodeLeaveFieldAsIs, 0);
  if WaitingForReturn then
  begin
    ReturnVal := sBuffers[0];
    if AnsiStartsText('+CCLK', ReturnVal) then
    begin
      Delete(ReturnVal, 1, Pos(#34, ReturnVal));
      Delete(ReturnVal, Pos(#34, ReturnVal), 1);
      TimeZone := RightStr(ReturnVal, Length(ReturnVal) - LastDelimiter('+', ReturnVal) + 1);
      APhoneTime^ := ParseDateTime(ReturnVal);
      Result^ := True;
    end;  
  end;

  // ���ؽ��
  if Result^ then
    AddModemStaus(tsInfo, '��ѯ�ֻ�����ʱ��ɹ�')
  else
    AddModemStaus(tsError, '��ѯ�ֻ�����ʱ��ʧ��');

  if IsWindow(hWindow) then
    PostMessage(hWindow, WM_QUERY_SUCCESSFUL, 0, 0)
end;

procedure TJobThread.FQueryTime;
var
  AJob: TSMSJob;
begin
  AJob := JobContent.Items[0];
  QueryTime(AJob.ExtraInfo.PPhoneTime, AJob.ExtraInfo.PPCTime,
    AJob.ExtraInfo.PRequestResult, AJob.ExtraInfo.hWindow);
end;

procedure TJobThread.SetPhoneTime;
var
  sTime: String;
begin
  AddModemStaus(tsInfo, '�����ֻ�����ʱ��');

  sTime := Format('AT+CCLK="%2.2d/%2.2d/%2.2d,%2.2d:%2.2d:%2.2d%s"',
    [YearOf(Date) mod 100,
    MonthOf(Date),
    DayOf(Date),
    HourOf(Time),
    MinuteOf(Time),
    SecondOf(Time),
    TimeZone]);

  sBuffers.Clear;
  SendCommand(sTime);
  if WaitingForReturn then
    AddModemStaus(tsInfo, '�����ֻ�����ʱ��ɹ�')
  else
    AddModemStaus(tsError, '�����ֻ�����ʱ��ʧ��');

end;

procedure TJobThread.RemoveSMS;
label
  OccurError;
type TIDDatePair = record
  AID: string;
  ADate: TDateTime;
end;
type PIDDatePair = ^TIDDatePair;

var
  i, k: Integer;
  slRecRead: TStringList;
  slRecUnread: TStringList;
  slStoSend: TStringList;
  slStoUnsend: TStringList;
  slTmp: TStringList;
  slStorageDevice: TStringList;
  pdu: string;
  AJob: TSMSJob;
  lSortList: TList;

  // ���͵ıȽϺ���
  function CompareIDDatePair(Item1, Item2: Pointer): Integer;
  begin
    Result := CompareDateTime(PIDDatePair(Item1).ADate, PIDDatePair(Item2).ADate);
  end;

  // ��䶼�б���
  procedure FillList(var slSrc: TStringList; var lDest: TList);
  var
    PItem: PIDDatePair;
    i: Integer;
    slTmp: TStringList;
    sSender: String;
  begin
    for i := slSrc.Count -1 downto 0 do
    begin
      New(PItem);
      PItem.AID := slSrc[i];
      sBuffers.Clear;
      SendCommand('AT+CMGR=' + PItem.AID);
      if WaitingForReturn then
      if opIScmgl = 1 then
        PItem.ADate := PDUReceiveDate(sBuffers[1])
      else
      begin
        slTmp := SplitString(sBuffers[0], ',', 3, True);
        if (slTmp.Count > 2) then
          PItem.ADate := ParseDateTime(MidStr(slTmp[2], 2, Length(slTmp[2]) - 2))
        else
          PItem.ADate := Now;
      end;
      lDest.Add(PItem);
    end;
  end;

  procedure FilterID(var slIDList: TStringList; var slDest: TStringList);
  var
    lSortList: TList;
    i: Integer;
    iTotal: Integer;
    dExpireDate: TDateTime;
  begin
    lSortList := TList.Create;
    FillList(slIDList, lSortList);
    lSortList.Sort(@CompareIDDatePair);
    iTotal := slIDList.Count;

    case AJob.ExtraInfo.KeepKind of
    rskKeepPercent:
      begin
        iTotal := Trunc((1 - AJob.ExtraInfo.KPPercent) * iTotal);
        for i := 0 to iTotal - 1 do
          slDest.Add(PIDDatePair(lSortList[i]).AID);
      end;
    rskKeepNumber:
      begin
        iTotal := iTotal - AJob.ExtraInfo.KPNumber;
        for i := 0 to iTotal - 1 do
          slDest.Add(PIDDatePair(lSortList[i]).AID);
      end;
    rskKeepRecentDay:
      begin
        dExpireDate := Now() - AJob.ExtraInfo.KPRDay;
        i := 0;
        while (i < iTotal) and (PIDDatePair(lSortList[i]).ADate >= dExpireDate) do
        begin
          slDest.Add(PIDDatePair(lSortList[i]).AID);
          Inc(i);
        end;
      end;
    rskKeepDay:
      begin
        dExpireDate := AJob.ExtraInfo.KPDDate;
        i := 0;
        while (i < iTotal) and (PIDDatePair(lSortList[i]).ADate >= dExpireDate) do
        begin
          slDest.Add(PIDDatePair(lSortList[i]).AID);
          Inc(i);
        end;
      end;
    end;

    lSortList.Clear;
    lSortList.Free;
  end;

begin
  AJob := JobContent.Items[0];

  slRecRead := TStringList.Create;
  slRecUnread := TStringList.Create;
  slStoSend := TStringList.Create;
  slStoUnsend := TStringList.Create;
  slTmp := TStringList.Create;

  // �����Ϣ
  AddModemStaus(tsInfo, '�����ֻ��еĶ���');

  // ֹͣ����
  sBuffers.Clear;
  SendCommand('ATE0');
  if not WaitingForReturn then goto OccurError;
  sBuffers.Clear;

  // �����豸�洢��
  SetCharset(GSM);
  slStorageDevice := GetMemoryLocation;

  for k := 0 to slStorageDevice.Count - 1 do
  begin
    // ���ô洢װ��
    if k > 0 then
      SetCharset(GSM);

    sBuffers.Clear;
    SendCommand('AT+CPMS=' + slStorageDevice[k]);
    WaitingForReturn;

    // �����ַ���Ϊ Unicode Big Endian
    if not SetCharset(UCS2) then goto OccurError;
    sBuffers.Clear;

    // ��ȡ���
    try
      if not EnumerateSMSId(slRecRead, slRecUnread, slStoSend, slStoUnsend) then
        raise Exception.Create('��ȡ���ű�ŵ�ʱ��������');

      if Abortion then raise EUserAbortion.Create('�û��жϲ���');
    except
      on EUserAbortion do
      begin
        slTmp.Free;
        slRecRead.Free;
        slRecUnread.Free;
        slStoSend.Free;
        slStoUnsend.Free;
        AddModemStaus(tsError, '�û��жϲ���');
        Exit;
      end;
      on E: Exception do
      begin
        AddModemStaus(tsError, E.Message);
        AddModemStaus(tsError, '�ڶ�ȡ������ŵ�ʱ��������');
      end;
    end;

    if AJob.ExtraInfo.RemoveUNREAD then FilterID(slRecUnread, slTmp);
    if AJob.ExtraInfo.RemoveREAD then FilterID(slRecRead, slTmp);
    if AJob.ExtraInfo.RemoveDraft then FilterID(slStoUnsend, slTmp);
    if AJob.ExtraInfo.RemoveSent then FilterID(slStoSend, slTmp);

    // ɾ���ֻ��еĶ���
    try
      for i := 0 to slTmp.Count - 1 do
      begin
        sBuffers.Clear;
        SendCommand('AT+CMGD=' + slTmp[i]);
        WaitingForReturn;
      end;
    except
      on EUserAbortion do
      begin
        slTmp.Free;
        slRecRead.Free;
        slRecUnread.Free;
        slStoSend.Free;
        slStoUnsend.Free;
        AddModemStaus(tsError, '�û��жϲ���');
        Exit;
      end;
      on E: Exception do
      begin
        AddModemStaus(tsError, E.Message);
        AddModemStaus(tsError, '��ɾ����Ϣʱ��������');
      end;
    end;

    slTmp.Clear;
  end;

  AddModemStaus(tsInfo,'һЩ�����Ѿ����', True, '����ֻ�����');
  slTmp.Free;
  slRecRead.Free;
  slRecUnread.Free;
  slStoSend.Free;
  slStoUnsend.Free;

  Exit;
OccurError:
  AddModemStaus(tsError, '�д�����', True, '����ֻ�����');
end;

procedure TJobThread.FOpenNotificationWnd;
var
  noticewnd: TNotice;
begin
  // ���һ����ʾ����
  noticewnd := MessageWnd.Add;
  noticewnd.FormItem.WndType := TNoticeType(CurrentNewNW.WindowType);
  noticewnd.FormItem.InternalID := CurrentNewNW.InternalID;
  noticewnd.FormItem.ReceiveDate := CurrentNewNW.ReceiveDate;
  noticewnd.FormItem.SenderString := CurrentNewNW.SenderString;
  noticewnd.FormItem.ShowWindow;
end;

function SetCharset(ACharset: TSMSCharset = UCS2): Boolean;
var
  CharsetList: TStringList;
  params: string;
begin
  sBuffers.Clear;
  Result := False;

  // ��ѯ֧�ֵı�׼
  SendCommand('AT+CSCS=?');
  if not WaitingForReturn then Exit;
  params := sBuffers[0];
  params := Trim(RightStr(params, Length(params) - Pos(#$3A, params)));
  if params[1] = '(' then Delete(params, 1, 1);
  if params[Length(params)] = ')' then Delete(params, Length(params), 1);
  CharsetList := ExtractAllParameter(params, False);

  // ����
  case ACharset of
  GSM:
    if CharsetList.IndexOf('"GSM"') > -1 then
      params := '"GSM"'
    else if CharsetList.IndexOf('"00470053004D"') > -1 then
      params := '"00470053004D"'
    else
      Exit;

  UCS2:
    if CharsetList.IndexOf('"UCS2"') > -1 then
      params := '"UCS2"'
    else if CharsetList.IndexOf('"0055004300530032"') > -1 then
      params := '"0055004300530032"'
    else
      Exit;

  end;

  sBuffers.Clear;
  SendCommand('AT+CSCS=' + params);
  Result := WaitingForReturn;
  sBuffers.Clear;
end;

function GetMemoryLocation(LocType: Integer = 0): TStringList;
var
  CMD: string;
begin
  sBuffers.Clear;
  SendCommand('AT+CPMS=?');
  WaitingForReturn;

  CMD := sBuffers[0];
  CMD := ExtractParameter(CMD, LocType);
  if CMD[1] = '(' then Delete(CMD, 1, 1);
  if CMD[Length(CMD)] = ')' then Delete(CMD, Length(CMD), 1);

  Result := ExtractAllParameter(CMD, False);

  if Result.IndexOf('"MT"') <> -1 then
  begin
    Result.Clear;
    Result.Add('"MT"');
  end
  else if Result.IndexOf('"004D0054"') <> -1 then
  begin
    Result.Clear;
    Result.Text := '"004D0054"';
  end;
end;

function ReadOneMessage(var slMsgList: TStringList; var messageContent: TMsgContent;
  PDUMode: Boolean; SendCommandRequired: Boolean = False): Boolean;
label
  beginning;
var
  msgCode: string;
  params: TStringList;
  sICN: string;
  bMoreMsg: Boolean;
  sNumber: string;
  bMultiSMS: Boolean;
  oMultiSMS: TMultiSection;
  dTemp: TDateTime;
  pdu: String;
begin
beginning:
  // ���û�и��������ˣ����� False;
  if slMsgList.Count = 0 then
  begin
    Result := False;
    Exit;
  end;

  Result := True;
  msgCode := slMsgList[slMsgList.Count - 1];
  pdu := string(slMsgList.Objects[slMsgList.Count - 1]);
  slMsgList.Delete(slMsgList.Count - 1);
  messageContent.ID := StrToIntDef(msgCode, 0);

  if SendCommandRequired or not PDUMode then
  begin
    // ���Ͷ�ȡָ��
    sBuffers.Clear;
    SendCommand('AT+CMGR=' + msgCode);
    if not WaitingForReturn then goto beginning;
    params := ExtractAllParameter(sBuffers[0]);

    if sBuffers.Count > 2 then
      pdu := sBuffers[1];
  end;

  // ��ʼ����
  if PDUMode then
  begin
    // ����PDU����
    PDUReceiveString(pdu, sICN, bMoreMsg, sNumber,
      dTemp, messageContent.Content,
      bMultiSMS, oMultiSMS);
    if Assigned(messageContent.Number) then
      messageContent.Number.Clear
    else
      messageContent.Number := TStringList.Create;
    messageContent.Number.Add(sNumber);

    // ��������
//    if (not bMultiSMS) or (oMultiSMS.Index = 0) then
      messageContent.DateTime := dTemp; 

    // ��������
    if bMultiSMS then
      Result := AMultiSMSStorage.AddMessagePiece(oMultiSMS.Reference,
        oMultiSMS.Total, oMultiSMS.Index, messageContent.Content,
        messageContent.Content);

    if not Result then
      goto beginning;
  end
  else
  begin
    // ��������
    messageContent.Number.Free;
    messageContent.Number := SplitString(AnsiDequotedStr(Trim(params[1]), '"'), ' ');

    // ���� UCS2
    messageContent.IsReport := False;

    if AnsiStartsStr(sBuffers[1], 'OK') then
      messageContent.Content := ''
    else if AnsiSameStr(sBuffers[1], '0020') then
    begin
      messageContent.Content := '';
      messageContent.IsReport := True;
    end
    else
      messageContent.Content := DecodeUnicodeBE(sBuffers[1]);

    // ����ʱ���ֶ�
    if params.Count >= 3 then
      messageContent.DateTime := ParseDateTime(AnsiDequotedStr(params[2], '"'))
    else
      messageContent.DateTime := Now;
  end;
end;

{ TJobExtraInfo }


end.
