unit GSMChar;

// ************************************************************************ //
// ����
// ----
//     �����Ԫ�����ڽ� GSM ��׼���ַ�ת��Ϊ Unicode ���ߵ�����ʶ��ı��룬
// GSM ��׼ʹ���� Unicdoe Big Endian ��׼����Ϊ���룬�� 7bit ��ΪӢ�ĵı�׼
// ************************************************************************ //


// ************************************************************************ //
// �ӿڲ���
//     ��������������
// ************************************************************************ //
interface

uses
  StrUtils, SysUtils, Classes, DateUtils, GerneralFunc;

type
  TMultiSection = record
    Reference: Integer;
    Index: Integer;
    Total: Integer;
  end;

function EncodeNumberString(sPhoneNumber: string; InfoCentre: Boolean = True): string;
function DecodeNumberString(sPhoneNumber: string): string;
function Encode7bit(s: String): String;
function Decode7Bit(S: String): string;
function EncodeUnicodeBE(S: WideString): string;
function DecodeUnicodeBE(S: string): string;
function IsSpecificTest(S: String): boolean;
function PDUSendString(var PDULength: Integer; sInfoCentre: string; sReceiver: string; sContent: string; bUnicode: Boolean = True; bFirstOctet: byte = 17; bMessageReference: byte = 0; bProtocolIdentifier: byte = 0; bLongSMS: Boolean = False; iTotalCount: Integer = 0; iCurIndex: Integer = 0; iSMSReferenceNum: Integer = 0): string;
procedure PDUReceiveString(sSrc: String; var sInfoCenter: string; var bMoreMsg: Boolean; var sSender: string; var dReceive: TDateTime; var sMsg: string; var bIsMultiSMS: Boolean; var MultiSMS: TMultiSection);
function PDUReceiveDate(sSrc: String): TDateTime;
function ParseDateTime(sSrc: String): TDateTime;
function IsMultireceiver(sSrc: String): Boolean;
function ConvertUCS2PhoneNumber(const sSrc: string): String;
function ParseSMSReport(PDU: string; var Number: string; var DateTime: TDateTime;
  var ReferenceNumber: Byte): Boolean;

// ************************************************************************ //
// ʵ�ֲ���
//     ���ڱ�д����ĺ���
// ************************************************************************ //
implementation

// ***************************************
// ��õ绰�����ַ����ĺ���
// ������[in]sPhoneNumber �绰������ַ���
//       [in]InfoCentre �Ƿ�����Ϣ����
// ���أ�����绰������ַ���
// ***************************************
function EncodeNumberString(sPhoneNumber: string; InfoCentre: Boolean = True): string;
var
  bInternational: Boolean;
  iLength: Integer;
  i: Integer;
  bChar: char;
begin
  // �ж��Ƿ��ǹ��ʺ���
  bInternational := False;
  if LeftStr(sPhoneNumber, 1) = '+' then
  begin
    bInternational := true;
    sPhoneNumber := RightStr(sPhoneNumber, Length(sPhoneNumber) - 1);
  end;

  iLength := Length(sPhoneNumber);

  // �����ǲ�������λ
  if Length(sPhoneNumber) mod 2 = 1 then
    sPhoneNumber := sPhoneNumber + 'F';

  // ����λ��
  for i := 0 to Length(sPhoneNumber) div 2 - 1 do
  begin
    bChar := sPhoneNumber[i * 2 + 1];
    sPhoneNumber[i * 2 + 1] := sPhoneNumber[i * 2 + 2];
    sPhoneNumber[i * 2 + 2] := bChar;
  end;

  // ����ַ���
  if InfoCentre then
    Result := Format('%2.2X', [Length(sPhoneNumber) div 2 + 1])
  else
    Result := Format('%2.2X', [iLength]);   

  Result := Result + IfThen(bInternational, '91', '81');
  Result := Result + sPhoneNumber;
end;

// ***************************************
// ����绰�����ַ����ĺ���
// ������[in]PDU sPhoneNumber �绰������ַ���
// ���أ�����绰������ַ���
// ***************************************
function DecodeNumberString(sPhoneNumber: string): string;
var
//  bInternational: Boolean;
  i: Cardinal;
begin
  // ͷ�������ֽڷ��ţ�����
  // ����������Ǳ�ʾ�Ƿ��ǹ��ʺ���(+)
  if MidStr(sPhoneNumber, 3, 2) = '91' then
    Result := '+';

  for i := 5 to Length(sPhoneNumber) do
  begin
    if Odd(i) then
      Result := Result + sPhoneNumber[i+1] + sPhoneNumber[i];
  end;

  // ɾ�����ڵ� F
  if RightStr(Result, 1) = 'F' then
    Delete(Result, Length(Result), 1);
end;

// ***************************************
// �� 7bit GSM ����Ӣ���ַ���
// ������[in]s Ҫ������ַ���
// ���أ��������ַ���
// ***************************************
function Encode7bit(s: String): String;
var
  cBuf: Cardinal;
  bLen: Byte;
  bChar: Byte;
  i: Cardinal;
  iLenSrc: Cardinal;
begin
  // ��ʼ������
  cBuf := 0;
  bLen := 0;
  i := 1;
  iLenSrc := Length(S);

  // ѭ����û������Ϊ֮
  while true do
  begin
    // ��Ҫ��ȡһ���ַ�
    if bLen < 8 then
    begin
      if i > iLenSrc then
      begin
        if bLen >0 then Result := Result + Format('%2.2X', [cBuf and $FF]);
        Break;
      end;

      bChar := Byte(S[i]) and 127;
      cBuf := cBuf or (bChar shl bLen);
      Inc(bLen, 7);
      Inc(i);
    end;

    if bLen >= 8 then
    begin
      Result := Result + Format('%2.2X', [cBuf and $FF]);
      cBuf := cBuf shr 8;
      Dec(bLen, 8);
    end;
  end;

end;

// ***************************************
// �� 7bit GSM ����Ӣ���ַ���
// ������[in]s Ҫ������ַ���
// ���أ��������ַ���
// ***************************************
function Decode7Bit(S: String): string;
var
  iPos: Byte;
  iBuf: Cardinal;
  i: Cardinal;
  iLenSrc: Cardinal;
begin
  // ��ʼ������
  iBuf := 0;
  iPos := 0;
  i := 1;
  iLenSrc := Length(S) div 2;

  // ѭ����û�ж��ڵ�����
  while true do
  begin
    if iBuf < 128 then
    begin
      // ��Ҫ��ȡһ���ַ�
      if i > iLenSrc then
      begin
        break;
      end;

      iBuf := iBuf or (Byte(StrToInt('$' + MidStr(S, i*2-1, 2))) shl iPos);
      Inc(i);
      Inc(iPos, 8);
    end;

    // ��ӵ��ַ���
    Result := Result + Chr(iBuf and 127);
    iBuf := iBuf shr 7;
    Dec(iPos, 7);
  end;

end;

// ***************************************
// �� Unicdoe Big Edtian ����Ӣ���ַ���
// ������[in]s Ҫ������ַ���
// ���أ��������ַ���
// ***************************************
function EncodeUnicodeBE(S: WideString): string;
var
  i, len: Integer;
  cur: Integer;
  t: String;
begin
  Result := '';
  len := Length(s);
  i := 1;

  while i <= len do
  begin
    cur := Ord(s[i]);

    //BCDת��
    FmtStr(t, '%4.4X', [cur]);
    Result := Result + t;
    inc(i);
  end;

end;

// ***************************************
// �� Unicdoe Big Edtian ����Ӣ���ַ���
// ������[in]s Ҫ������ַ���
// ���أ��������ַ���
// ***************************************
function DecodeUnicodeBE(S: string): string;
var
  wsTemp: WideString;
  i: Cardinal;
  counter: Cardinal;
  bHigh: Byte;
  bLow: Byte;
begin
  //SetLength(wsTemp, Length(S) div 4);

  if Length(S) > 0 then
  begin
    for i := 0 to (Length(S) div 4) - 1 do
    begin
      counter := i * 4 + 1 ;
      bHigh := Byte(StrToInt('$' + MidStr(S, counter, 2)));
      bLow := Byte(StrToInt('$' + MidStr(S, counter + 2, 2)));
      wsTemp := wsTemp + WideChar(bHigh * $100 + bLow);
    end;

    Result := string(wsTemp);
  end
  else
    Result := '';	
end;

// *************************************************************************
//     һ��������ʾ�ַ����Ƿ��������ַ���������������ַ��Ͳ����� 7bit ��
// �룬�����ͱ���ʹ�� Unicode �����ˡ�
// ������[in]s Ҫ���Ե��ַ���
// ���أ��Ƿ��������ַ�
// *************************************************************************
function IsSpecificTest(S: String): boolean;
var
  i: integer;
begin
  Result := false;

  for i :=1 to Length(S) do
    if not ((S[i] >= #0) and (S[i] <= #127)) then
    begin
      Result := true;
      Exit;
    end;
end;

// *************************************************************************
//     ���� PDU ��ȡ��Ϣ�Ĺ��̣�������̽����� PDU ���ݡ�
// ������[in]  s            Ҫ����� PDU �ַ���
//       [out] sInfoCenter  ��Ϣ���ĺ���
//       [out] bMoreMsg     ���и������Ϣ
//       [out] sSender      ������
//       [out] dReceive     �յ�ʱ��
//       [out] sMsg         ��Ϣ����
//       [out] bIsMultiSMS  �Ƿ��Ǽ�������
//       [out] MultiSMS     ����������ϸ����
// *************************************************************************
procedure PDUReceiveString(sSrc: String; var sInfoCenter: string;
  var bMoreMsg: Boolean; var sSender: string; var dReceive: TDateTime;
  var sMsg: string; var bIsMultiSMS: Boolean; var MultiSMS: TMultiSection);
var
  iLen: Cardinal;
  bField: Byte;
  bUnicode: Boolean;
  bSMSSubmit: Boolean;
begin
  // ������Ϣ���ĺ���
  iLen := StrToInt('$' + LeftStr(sSrc, 2)) * 2 + 2;
  sInfoCenter := DecodeNumberString(LeftStr(sSrc, iLen));
  Delete(sSrc, 1, iLen);

  // �����Ƿ��и��������
  bField := StrToInt('$' + LeftStr(sSrc, 2));
  bMoreMsg := ((bField and 4) = 0);
  bIsMultiSMS := (bField and 64) = 64;
  bSMSSubmit := (bField and 1) = 1;

  // ����Ƿ��Ͷ���
  if bSMSSubmit then
    Delete(sSrc, 1, 4)
  else
    Delete(sSrc, 1, 2);

  // �������ͷ�
  iLen := StrToInt('$' + LeftStr(sSrc, 2)) + 4;
  if Odd(iLen) then Inc(iLen);
  sSender := DecodeNumberString(LeftStr(sSrc, iLen));
  Delete(sSrc, 1, iLen);

  // Э���ʶ������
  Delete(sSrc, 1, 2);

  // �û����ݱ��뷽ʽ
  bField := StrToInt('$' + LeftStr(sSrc, 2));
  bUnicode := (bField = 8);
  Delete(sSrc, 1, 2);

  // ����ʱ��
  if bSMSSubmit then
  begin
    dReceive := Now;
    Delete(sSrc, 1, 4)
  end
  else
  begin
    dReceive := EncodeDateTime(2000 + StrToInt(sSrc[2] + sSrc[1]),
                               StrToInt(sSrc[4] + sSrc[3]),
                               StrToInt(sSrc[6] + sSrc[5]),
                               StrToInt(sSrc[8] + sSrc[7]),
                               StrToInt(sSrc[10] + sSrc[9]),
                               StrToInt(sSrc[12] + sSrc[11]),
                               0);
    Delete(sSrc, 1, 16);
  end;    

  sMsg := '';

  // ������Ϣ
  if bIsMultiSMS then
    if AnsiStartsStr('050003', sSrc) then
    begin
       MultiSMS.Reference := StrToInt('$' + MidStr(sSrc, 7, 2));
       MultiSMS.Total := StrToInt('$' + MidStr(sSrc, 9, 2));
       MultiSMS.Index := StrToInt('$' + MidStr(sSrc, 11, 2)) - 1;
       Delete(sSrc, 1, 12);
    end
    else
      bIsMultiSMS := False;

  // �û�����
  if bUnicode then
    sMsg := DecodeUnicodeBE(sSrc)
  else
  begin
    // �����һ���ַ�
    if bIsMultiSMS then
    begin
      sMsg := Char(StrToInt('$' + LeftStr(sSrc, 2)) shr 1);
      Delete(sSrc, 1, 2);
    end
    else
      sMsg := '';
      
    sMsg := sMsg + Decode7Bit(sSrc);
  end;
end;

function PDUReceiveDate(sSrc: String): TDateTime;
var
  iLen: Cardinal;
  bField: Byte;
  bUnicode: Boolean;
  bSMSSubmit: Boolean;
  sJunk: String;
begin
  // ������Ϣ���ĺ���
  iLen := StrToInt('$' + LeftStr(sSrc, 2)) * 2 + 2;
  Delete(sSrc, 1, iLen);

  // �����Ƿ��и��������
  bField := StrToInt('$' + LeftStr(sSrc, 2));
  bSMSSubmit := (bField and 1) = 1;

  // ����Ƿ��Ͷ���
  if bSMSSubmit then
    Delete(sSrc, 1, 4)
  else
    Delete(sSrc, 1, 2);

  // �������ͷ�
  iLen := StrToInt('$' + LeftStr(sSrc, 2)) + 4;
  if Odd(iLen) then Inc(iLen);
  Delete(sSrc, 1, iLen);

  // Э���ʶ������
  Delete(sSrc, 1, 2);

  // �û����ݱ��뷽ʽ
  bField := StrToInt('$' + LeftStr(sSrc, 2));
  bUnicode := (bField = 8);
  Delete(sSrc, 1, 2);

  // ����ʱ��
  if bSMSSubmit then
    Result := Now
  else
    Result := EncodeDateTime(2000 + StrToInt(sSrc[2] + sSrc[1]),
                               StrToInt(sSrc[4] + sSrc[3]),
                               StrToInt(sSrc[6] + sSrc[5]),
                               StrToInt(sSrc[8] + sSrc[7]),
                               StrToInt(sSrc[10] + sSrc[9]),
                               StrToInt(sSrc[12] + sSrc[11]), 0);
end;


// *************************************************************************
//     ���뷢�� PDU ��Ϣ�ĺ������������������ PDU ���ݡ�
// ������[in] sInfoCenter           ��Ϣ���ĺ���
//       [in] sReceiver             �ռ��˵�ַ
//       [in] sContent              ����
//       [in] [bFirstOctet]         FirstOctet�ֶ�
//       [in] [bMessageReference]   ��Ϣ�ο�
//       [in] [bProtocolIdentifier] Э���ʶ
//       [in] [bLongSMS]            �Ƿ��Ǽ�������
//       [in] [iTotalCount]         ������������
//       [in] [iCurIndex]           ��ǰƬ�α��
//       [in] [iSMSReferenceNum]    ����������Ϣ�ο�
// *************************************************************************
function PDUSendString(var PDULength: Integer; sInfoCentre: string;
  sReceiver: string; sContent: string; bUnicode: Boolean = True;
  bFirstOctet: byte = 17; bMessageReference: byte = 0;
  bProtocolIdentifier: byte = 0; bLongSMS: Boolean = False;
  iTotalCount: Integer = 0; iCurIndex: Integer = 0;
  iSMSReferenceNum: Integer = 0): string;
var
  // bUnicode: Boolean;
  sUserData: String;
  iTPUDL: Integer;
begin
  // ����������ĵ�ַ
  Result := EncodeNumberString(sInfoCentre, True);
  PDULength := -Length(Result) div 2;

  // FistOctober �ֶ�
  if bLongSMS then bFirstOctet := bFirstOctet or 64{ or 128};
  Result := Result + Format('%2.2X', [bFirstOctet]);

  // ��Ϣ�ο�ֵ
  Result := Result + Format('%2.2X', [bMessageReference]);

  // �ռ��˵�ַ
  Result := Result + EncodeNumberString(sReceiver, False);

  // Э���ʶ��
  Result := Result + Format('%2.2X', [bProtocolIdentifier]);

  // ���뷽ʽ
  // bUnicode := IsSpecificTest(sContent);

  if bUnicode then
    Result := Result + '08'
  else
    Result := Result + '00';

  // ��Ч��
  if opValidityPeriod < 10 then
    Result := Result + 'FF'
  else
    Result := Result + Format('%2.2X', [opValidityPeriod mod 256]);

  // �û�����
  if bUnicode then
  begin
    sUserData := EncodeUnicodeBE(sContent);
    iTPUDL := Length(WideString(sContent)) * 2;

    if bLongSMS then
    begin
      sUserData := '050003' + Format('%2.2X', [iSMSReferenceNum]) +
        Format('%2.2X', [iTotalCount]) + Format('%2.2X', [iCurIndex + 1]) + sUserData;
      iTPUDL := Length(sUserData) div 2;
    end;
  end
  else
    if bLongSMS then
    begin
      sUserData := '050003' + Format('%2.2X', [iSMSReferenceNum]) +
        Format('%2.2X', [iTotalCount]) + Format('%2.2X', [iCurIndex + 1]);
      sUserData := sUserData + Format('%2.2X', [Byte(sContent[1]) shl 1]);
      Delete(sContent, 1, 1);
      sUserData := sUserData + Encode7bit(sContent);
      iTPUDL := Length(WideString(sContent)) + 8;
    end
    else
    begin
      sUserData := Encode7bit(sContent);
      iTPUDL := Length(WideString(sContent));
    end;

  Result := Result + Format('%2.2X', [iTPUDL]) + sUserData;
  PDULength := Length(Result) div 2 + PDULength;
end;

// ����ʱ���ַ���
function ParseDateTime(sSrc: String): TDateTime;
var
  slDatePart: TStringList;
  slTimePart: TStringList;
  slTmp: TStringList;
  iYear: Integer;
begin
  slTmp := SplitString(sSrc, ',', 2, True);
  slDatePart := SplitString(slTmp[0], '/', 3, True);
  slTimePart := SplitString(slTmp[1], ':', 3, True);

  if Pos('+', slTimePart[2]) > 0 then
    slTimePart[2] := LeftStr(slTimePart[2], Pos('+', slTimePart[2]) - 1);

  iYear := StrToIntDef(slDatePart[0], 2000);

  if iYear < 100 then
    if iYear < 50 then
      iYear := iYear + 2000
    else
      iYear := iYear + 1900;

  Result := EncodeDateTime(iYear,
                           StrToIntDef(slDatePart[1], 1),
                           StrToIntDef(slDatePart[2], 1),
                           StrToIntDef(slTimePart[0], 0),
                           StrToIntDef(slTimePart[1], 0),
                           StrToIntDef(slTimePart[2], 0),
                           0);

  slTimePart.Free;
  slDatePart.Free;
  slTmp.Free;
end;

//  �Ƿ��Ƕ෽����
function IsMultireceiver(sSrc: String): Boolean;
begin
  if AnsiEndsText(#13#10, sSrc) then
    Delete(sSrc, Length(sSrc) - 2, 2);
  Result := Pos(#13#10, sSrc) > 0;
end;

function ConvertUCS2PhoneNumber(const sSrc: string): String;
var
  i: Cardinal;
  len: Cardinal;
begin
  len := Length(sSrc);

  if len mod 4 <> 0 then
  begin
    Result := sSrc;
    Exit;
  end;

  for i := 1 to len do
    if (((i - 1) mod 4) div 2 = 0) and (sSrc[i] <> '0') then
    begin
      Result := sSrc;
      Exit;
    end;

  Result := DecodeUnicodeBE(sSrc);
end;

function ParseSMSReport(PDU: string; var Number: string; var DateTime: TDateTime;
  var ReferenceNumber: Byte): Boolean;
var
  iLen: Integer;
  bOtect: Byte;
begin
  // ������Ϣ���ĺ���
  iLen := StrToInt('$' + LeftStr(PDU, 2)) * 2 + 2;
  Delete(PDU, 1, iLen);
  Result := False;

  // ���� FirstOtect
  bOtect := StrToInt('$' + LeftStr(PDU, 2));
  if (bOtect and 2) = 0 then Exit;
  Delete(PDU, 1, 2);

  // ���� MessageReference
  ReferenceNumber := StrToInt('$' + LeftStr(PDU, 2));
  Delete(PDU, 1, 2);

  // ���������ߵĵ绰����
  iLen := StrToInt('$' + LeftStr(PDU, 2)) + 4;
  if Odd(iLen) then Inc(iLen);
  Number := DecodeNumberString(LeftStr(PDU, iLen));
  Delete(PDU, 1, iLen);

  // �����绰����
  if opReceiveAsReportTime then
    Delete(PDU, 1, 14);

  DateTime := EncodeDateTime(2000 + StrToInt(PDU[2] + PDU[1]),
                             StrToInt(PDU[4] + PDU[3]),
                             StrToInt(PDU[6] + PDU[5]),
                             StrToInt(PDU[8] + PDU[7]),
                             StrToInt(PDU[10] + PDU[9]),
                             StrToInt(PDU[12] + PDU[11]),
                             0);

  
end;
end.
