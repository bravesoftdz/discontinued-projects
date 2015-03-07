unit uFrmNotification;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, uFrmWriteSMS, uFrmReadSMS,
  ComCtrls, StrUtils;

type
  TNoticeType = (ntNewMsg, ntMsgReport, ntMsgError);

type
  TfrmNotification = class(TForm)
    imgNew: TImage;
    btnRead: TBitBtn;
    btnReply: TBitBtn;
    tmrAnimation: TTimer;
    imgMsgReport: TImage;
    imgError: TImage;
    btnReview: TBitBtn;
    btnResent: TBitBtn;
    btnView: TBitBtn;
    btnDelete: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure tmrAnimationTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormPaint(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure btnReadClick(Sender: TObject);
    procedure btnReplyClick(Sender: TObject);
    procedure btnReviewClick(Sender: TObject);
    procedure btnResentClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
    imgBackground: TImage;
    NoticesCollection: TCollection;
    NotiesItem: TCollectionItem;
    FinalTop: Integer;
    procedure PaintText(AText: String; ARect: TRect; ACanvas: TCanvas; OtherStyle: LongInt = 0);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    { Public declarations }
    WndType: TNoticeType;
    InternalID: Integer;
    ReceiveDate: TDateTime;
    SenderString: String;
    SenderNumber: String;
    Showing: Boolean;
    Closing: Boolean;
    procedure ShowWindow;
  end;

  // ÿһ����Ŀ
  TNotice = class(TCollectionItem)
  public
    FormItem: TfrmNotification;
  end;

  // ��ʾ���ڼ���
  TNotices = class(TCollection)
  private
    function FGetCount: Integer;
    function FGetItem(Index: Integer): TNotice;
    procedure FSetItem(Index: Integer; Value: TNotice);
  public
    constructor Create; virtual;
    function Add: TNotice; virtual;
    property Count: Integer read FGetCount;
    property Items[Index: Integer]: TNotice read FGetItem write FSetItem;
  end;

implementation

{$R *.dfm}
uses
  UserInterfaces, GerneralFunc, ADODB;

function TNotices.FGetCount: Integer;
begin
  Result := inherited Count;
end;

function TNotices.FGetItem(Index: Integer): TNotice;
begin
  Result := TNotice(inherited GetItem(Index));
end;

procedure TNotices.FSetItem(Index: Integer; Value: TNotice);
begin
  inherited SetItem(Index, Value);
end;

function TNotices.Add: TNotice;
begin
  Result := TNotice(inherited Add);
  Result.FormItem := TfrmNotification.Create(nil);
  Result.FormItem.NoticesCollection := Self;
  Result.FormItem.NotiesItem := Result;
end;

constructor TNotices.Create;
begin
  inherited Create(TNotice);
end;

// ���岿��
procedure TfrmNotification.CreateParams(var Params: TCreateParams);
begin
  inherited;
  Params.Style := Params.Style or WS_BORDER - WS_BORDER;
  Params.ExStyle := Params.ExStyle or WS_EX_TOPMOST;
end;

procedure TfrmNotification.FormCreate(Sender: TObject);
begin
  // ��������
  Width := 240;
  Height := 160;
end;

procedure TfrmNotification.ShowWindow;
var
  LastFocus: HWND;
begin
  case WndType of
    ntNewMsg: imgBackground := imgNew;
    ntMsgReport: imgBackground := imgMsgReport;
    ntMsgError: imgBackground := imgError;
  end;

  Left := Screen.WorkAreaWidth - Width - 1;
  Top := Screen.WorkAreaHeight + 1;
  FinalTop := Screen.WorkAreaHeight - Height - 1;
  LastFocus := Windows.GetForegroundWindow;
  Visible := True;
  if not opShowFocus then
    Windows.SetForegroundWindow(LastFocus);
  
  SetWindowPos(Handle, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or
    SWP_NOACTIVATE or SWP_NOSIZE or SWP_NOOWNERZORDER); // ������ʾ������������}

  tmrAnimation.Enabled := True;

  btnRead.Left := 13;
  btnReply.Left := 13;
  btnResent.Left := 13;
  btnReview.Left := 13;
  btnView.Left := 13;
  btnDelete.Left := 13;

  btnRead.Visible := WndType = ntNewMsg;
  btnReply.Visible := WndType = ntNewMsg;
  btnView.Visible := WndType = ntMsgReport;
  btnDelete.Visible := WndType = ntMsgReport;
  btnResent.Visible := WndType = ntMsgError;
  btnReview.Visible := WndType = ntMsgError;

  if opNWAlphaBlend then
  begin
    AlphaBlendValue := opNWAlphaValue;
    AlphaBlend := True;
  end;

  Showing := True;
  Closing := False;
end;

procedure TfrmNotification.tmrAnimationTimer(Sender: TObject);
begin
  if Showing then
  begin
    Top := Top - 10;
    if Top <= FinalTop then
    begin
      Showing := False;
      Closing := False;
      tmrAnimation.Interval := 6000;
      Top := FinalTop;
    end;
  end
  else if Closing then
  begin
    Top := Top + 10;
    if Top >= FinalTop then
    begin
      Showing := False;
      Closing := False;
      tmrAnimation.Interval := 0;
      tmrAnimation.Enabled := False;
      Close;
      Exit;
    end;
  end
  else
  begin
    Showing := False;
    Closing := True;
    tmrAnimation.Interval := 1;
    FinalTop := Screen.WorkAreaHeight + 1;
  end;

  Refresh;
end;

procedure TfrmNotification.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  NotiesItem.Free;
  Self.Release;
end;

procedure TfrmNotification.FormPaint(Sender: TObject);
var
  ARect: TRect;
  MSG: string;
  address: string;
begin
  case WndType of
    ntNewMsg:
    begin
      MSG := '���յ������� %s ��һ�����š�';
      address := '������:   ';
    end;
    ntMsgReport:
    begin
      MSG := '�����͸� %s �Ķ����ѳɹ��ʹ';
      address := '�ռ���:   ';
    end;
    ntMsgError:
    begin
      MSG := '�����͸� %s �Ķ����޷����ʹ';
      address := '�ռ���:   ';
    end;
  end;

  Canvas.Font.Style := Canvas.Font.Style - [fsBold];
  Canvas.Font.Name := '����';
  Canvas.Pen.Color := clBlack;
  Canvas.PenPos := Point(0, 0);
  Canvas.Draw(0, 0, imgBackground.Picture.Graphic);
  ARect := Bounds(83, 83, 133, 30);
  PaintText(Format(MSG, [SenderString]), ARect, Canvas);
  ARect := Bounds(83, 112, 133, 12);
  PaintText(address + SenderString, ARect, Canvas);
  ARect := Bounds(83, 128, 133, 12);
  PaintText('�յ�ʱ��: ' + TimeToStr(ReceiveDate), ARect, Canvas);
  Canvas.Font.Style := Canvas.Font.Style + [fsBold];
  Canvas.Font.Name := 'Arial';
  Canvas.Font.Size := 9;
  ARect := Bounds(16, 80, 49, 12);
  PaintText(Format('%d/%d', [NotiesItem.Index + 1, NoticesCollection.Count]), ARect, Canvas, DT_CENTER);
  Canvas.Pen.Color := $00FDDFCE;
  Canvas.Pen.Style := psDot;
  Canvas.Brush.Color := $00FFFAF7;
  Canvas.PenPos := Point(80, 109);
  Canvas.LineTo(220, 109);
end;

procedure TfrmNotification.PaintText(AText: String; ARect: TRect; ACanvas: TCanvas; OtherStyle: LongInt = 0);
begin
  ACanvas.Brush.Style := bsClear;
  DrawText(Canvas.Handle, PChar(AText), Length(AText), ARect, DT_WORDBREAK or OtherStyle);
end;

procedure TfrmNotification.FormClick(Sender: TObject);
begin
  //�رմ���
  Closing := True;
  Showing := False;
  tmrAnimation.Interval := 1;
  tmrAnimation.Enabled := True;
end;

procedure TfrmNotification.btnReadClick(Sender: TObject);
var
//  wWriteSMSWnd: TfrmWriteSMS;
  wReadSMSWnd: TfrmReadSMS;
  xItem: TListItem;
begin
  // ����Ϣ
  if frmMain.QueryWindow('receive', IntToStr(InternalID)) then
  begin
    FormClick(nil);
    Exit;
  end;

  // �򿪲ݸ���
  wReadSMSWnd := TfrmReadSMS.Create(nil);
  xItem := frmMain.lvwWindow.Items.Add;
  xItem.ImageIndex := 2;
  xItem.Data := Pointer(wReadSMSWnd.Handle);
  xItem.Caption := '�Ķ����� (�ռ���)';

  // ���һЩ��Ϣ
  wReadSMSWnd.OpenSMS(bReceive, InternalID);
  wReadSMSWnd.Show;
//  wReadSMSWnd.BringToFront;
  SetForegroundWindow(wReadSMSWnd.Handle);
  xItem.SubItems.Add('receive');
  xItem.SubItems.Add(IntToStr(InternalID));

  // �رմ���
  FormClick(nil);
end;

procedure TfrmNotification.btnReplyClick(Sender: TObject);
var
  wWriteSMSWnd: TfrmWriteSMS;
  xItem: TListItem;
begin
  // �򿪲ݸ���
  wWriteSMSWnd := TfrmWriteSMS.Create(nil);
  xItem := frmMain.lvwWindow.Items.Add;
  xItem.ImageIndex := 1;
  xItem.Data := Pointer(wWriteSMSWnd.Handle);

  if WndType = ntNewMsg then
  begin
    xItem.Caption := '�ظ�����';
    wWriteSMSWnd.NewReply(InternalID);
  end
  else
  begin
    xItem.Caption := '׫д����';
    wWriteSMSWnd.NewSMS;
  end;

  // ���һЩ��Ϣ
  xItem.SubItems.Add('draft');
  xItem.SubItems.Add(IntToStr(0));
//  wWriteSMSWnd.BringToFront;
  SetForegroundWindow(wWriteSMSWnd.Handle);

  // �Ƴ�
  FormClick(nil);
end;

procedure TfrmNotification.btnReviewClick(Sender: TObject);
var
  wReadSMSWnd: TfrmReadSMS;
  xItem: TListItem;
  sIdentifier: String;
begin
  if WndType = ntMsgError then
    sIdentifier := 'send'
  else
    sIdentifier := 'finish';

  if frmMain.QueryWindow(sIdentifier, IntToStr(InternalID)) then
    Exit;

  // �򿪲ݸ���
  wReadSMSWnd := TfrmReadSMS.Create(nil);
  xItem := frmMain.lvwWindow.Items.Add;
  xItem.ImageIndex := 2;
  xItem.Data := Pointer(wReadSMSWnd.Handle);
  xItem.Caption := IfThen(WndType = ntMsgError, '�Ķ����� (������)', '�Ķ����� (�ռ���)');

  // ���һЩ��Ϣ
  if WndType = ntMsgError then
    wReadSMSWnd.OpenSMS(bSend, InternalID)
  else
    wReadSMSWnd.OpenSMS(bFinish, InternalID);

  wReadSMSWnd.Show;
  xItem.SubItems.Add(sIdentifier);
  xItem.SubItems.Add(IntToStr(InternalID));
end;

procedure TfrmNotification.btnResentClick(Sender: TObject);
var
  dbSend: TADOTable;
begin
  // �������е���Ŀ
  dbSend := TADOTable.Create(nil);
  dbSend.Connection := frmMain.adoSMS;
  dbSend.TableName := 'send';
  dbSend.Open;

  if dbSend.Locate('internalid', InternalID, []) then
  begin
    JobThread.JobContent.AddSendJob(
      dbSend.FieldByName('number').AsString,
      dbSend.FieldByName('content').AsString,
      dbSend.FieldByName('addressee').AsString,
      dbSend.FieldByName('finishid').AsInteger);
    dbSend.Delete;
  end;

  dbSend.Close;
  dbSend.Free;

  // �����б�
  if (frmMain.CurrentView = cvSend) then
    frmMain.RefreshView(InternalID);

  // ��ʼ����
  JobThread.Suspended := False;
end;

procedure TfrmNotification.btnDeleteClick(Sender: TObject);
var
  dbSMS: TADOTable;
begin
  // �����ݿ�
  dbSMS := TADOTable.Create(nil);
  dbSMS.Connection := frmMain.adoSMS;
  dbSMS.TableName := 'receive';
  dbSMS.Open;

  // ɾ����Ŀ
  if dbSMS.Locate('internalid', InternalID, []) then
    dbSMS.Delete;

  dbSMS.Close;
  dbSMS.Free;

  // ����ͼ��
  if (frmMain.CurrentView = cvReceive) then
    frmMain.RefreshView(InternalID);

  btnView.Enabled := False;
  btnDelete.Enabled := False;

  // �Ƴ�
  FormClick(nil);
end;

end.
