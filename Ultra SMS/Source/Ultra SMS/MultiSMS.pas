unit MultiSMS;

// ************************************************************************ //
// ����
// ----
//     ���ģ�������ڼ������ŵ�֧��
// ************************************************************************ //

interface

uses
  Classes;

type
  TMultiSMSStorageItem = class(TCollectionItem)
  public
    MessageContents: TStringList;
    MessageReference: Integer;
    MessageKnownTotal: Integer;
  end;

  TMultiSMSStorage = class(TCollection)
  private
    function FGetCount: Integer;
    function FGetItem(Index: Integer): TMultiSMSStorageItem;
    function FAdd: TMultiSMSStorageItem;
    procedure FSetItem(Index: Integer; Value: TMultiSMSStorageItem);
  public
    function AddMessagePiece(MessageReference: Integer; PieceTotal: Integer;
      PieceNo: Integer; MessagePiece: String; var WholeMessage: string): Boolean;
    constructor Create; virtual;
  end;

var
  AMultiSMSStorage: TMultiSMSStorage;

implementation

{ TMultiSMSStorage }

{*******************************************************************************
  ������:    TMultiSMSStorage.AddMessagePiece
  ����:      Administrator
  ����:      2009.01.27
  ����:      MessageReference, PieceTotal, PieceNo: Integer; var WholeMessage
  ����ֵ:    Boolean

  ˵��:
 -------
  ���һ����ϢƬ�Σ�MessageReference, PieceTotal, PieceNo ����ϢƬ�εĲο�ֵ��
  Ƭ��������Ƭ�α��

  WholeMessage�� ������֮�����ƴ�ӳ�һ����������Ϣ������ҷ���ֵ���ҷ���True,
  ���򷵻�False;
*******************************************************************************}
function TMultiSMSStorage.AddMessagePiece(MessageReference, PieceTotal,
  PieceNo: Integer; MessagePiece: String; var WholeMessage: string): Boolean;
var
  AMsgItem: TMultiSMSStorageItem;
  i: Integer;
begin
  AMsgItem := nil;

  // �����������ǲ�������صĲο�ֵ������
  for i := 0 to Count - 1 do
    if FGetItem(i).MessageReference = MessageReference then
      AMsgItem := FGetItem(i);

  // ���û����ͬ����Ϣ�ο������һ��
  if not Assigned(AMsgItem) then
  begin
    AMsgItem := FAdd;
    AMsgItem.MessageReference := MessageReference;
    AMsgItem.MessageKnownTotal := 0;
    AMsgItem.MessageContents := TStringList.Create;
    for i := 0 to PieceTotal - 1 do
      AMsgItem.MessageContents.Add('');
  end;

  // ��ӵ���Ϣ�ο���ص���Ŀ��
  AMsgItem.MessageContents[PieceNo] := MessagePiece;
  Inc(AMsgItem.MessageKnownTotal);

  // ��װ
  if AMsgItem.MessageKnownTotal = PieceTotal then
  begin
    WholeMessage := '';
    Result := True;

    for i := 0 to PieceTotal - 1 do
      WholeMessage := WholeMessage + AMsgItem.MessageContents[i];

    // ɾ�������Ϣ�ο�
    inherited Delete(AMsgItem.Index);
  end
  else
    Result := False;  
end;

constructor TMultiSMSStorage.Create;
begin
  inherited Create(TMultiSMSStorageItem);
end;

function TMultiSMSStorage.FAdd: TMultiSMSStorageItem;
begin
  Result := TMultiSMSStorageItem(inherited Add);
end;

function TMultiSMSStorage.FGetCount: Integer;
begin
  Result := inherited Count;
end;

function TMultiSMSStorage.FGetItem(Index: Integer): TMultiSMSStorageItem;
begin
  Result := TMultiSMSStorageItem(inherited GetItem(Index));
end;

procedure TMultiSMSStorage.FSetItem(Index: Integer;
  Value: TMultiSMSStorageItem);
begin
  inherited SetItem(Index, Value);
end;

end.
