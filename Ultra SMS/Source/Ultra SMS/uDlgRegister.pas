unit uDlgRegister;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, ComCtrls, jpeg, ImgList, ShellAPI;

type
  TdlgRegister = class(TForm)
    tabRegister: TPageControl;
    tsCompare: TTabSheet;
    tsRegister: TTabSheet;
    tsPay: TTabSheet;
    iltRegister: TImageList;
    grpInfo: TGroupBox;
    lblInfoRemark: TLabel;
    lblUserName: TLabel;
    txtUserName: TEdit;
    lblMachineCode: TLabel;
    txtMachineCode: TEdit;
    btnSendEmail: TBitBtn;
    btnSendSMS: TBitBtn;
    grpPay: TGroupBox;
    lblPay: TLabel;
    btnViewPay: TBitBtn;
    btnViewPage: TBitBtn;
    grpKeyFile: TGroupBox;
    lblFile: TLabel;
    btnClose: TBitBtn;
    grpBank: TGroupBox;
    btnMorePay: TBitBtn;
    lblABChina: TLabel;
    lblAbcNo: TLabel;
    lblBocNo: TLabel;
    lblBoc: TLabel;
    lblName: TLabel;
    lblNameD: TLabel;
    lblBank: TLabel;
    grpYouju: TGroupBox;
    lblAddress: TLabel;
    lblAddressD: TLabel;
    lblp1: TLabel;
    lblp2: TLabel;
    lblYouju: TLabel;
    lblFreeware: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure txtUserNameChange(Sender: TObject);
    procedure btnSendEmailClick(Sender: TObject);
    procedure btnSendSMSClick(Sender: TObject);
    procedure btnViewPayClick(Sender: TObject);
    procedure btnViewPageClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  GerneralFunc, uFrmWriteSMS, UserInterfaces;

procedure TdlgRegister.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TdlgRegister.txtUserNameChange(Sender: TObject);
begin
  btnSendEmail.Enabled := Length(txtUserName.Text) > 0;
  btnSendSMS.Enabled := Length(txtUserName.Text) > 0;
end;

procedure TdlgRegister.btnSendEmailClick(Sender: TObject);
begin
  ShellExecute(Handle, nil, PChar(
    Format('mailto:chenminglong21cn@21cn.com?subject=Ultra SMS Ԥע��&body=�û���: "%s" ������: "%s"',
    [txtUserName.Text, txtMachineCode.Text])), nil, nil, SW_SHOW);
end;

procedure TdlgRegister.btnSendSMSClick(Sender: TObject);
var
  wWriteSMSWnd: TfrmWriteSMS;
  xItem: TListItem;
begin
{$IFDEF REGISTERED}
  if SameText(GlobalRegStatus, GRS_EXCEEDED) then
    MessageBox(Handle, 
      '���� Ultra SMS �ĳ����Ѿ�������ʹ���ڵģ����ܷ����š�', PChar(Caption),
      MB_OK + MB_ICONWARNING)
  else
  begin
{$ENDIF}  
    // ����һ���µ�׫д���ŵĴ���
    wWriteSMSWnd := TfrmWriteSMS.Create(nil);
    xItem := frmMain.lvwWindow.Items.Add;
    xItem.ImageIndex := 1;
    xItem.Data := Pointer(wWriteSMSWnd.Handle);
    xItem.SubItems.Add('draft');
    xItem.SubItems.Add('0');
    xItem.Caption := '׫д����';
    wWriteSMSWnd.NewSMS;
    wWriteSMSWnd.AppendOneContact('������', '+8613237148643');
    wWriteSMSWnd.txtSMS.Text := Format('(Ultra SMS Ԥע����Ϣ)�û���: "%s" ������: "%s"',
      [txtUserName.Text, txtMachineCode.Text]);
    wWriteSMSWnd.Modified := False;
{$IFDEF REGISTERED}
  end;
{$ENDIF}  

  Close;    
end;

procedure TdlgRegister.btnViewPayClick(Sender: TObject);
begin
  tabRegister.ActivePage := tsPay;
end;

procedure TdlgRegister.btnViewPageClick(Sender: TObject);
begin
  ShellExecute(Handle, nil, 'http://www.alexstudio.cn/ultrasms/register.htm', nil, nil, SW_SHOW);
end;

end.
