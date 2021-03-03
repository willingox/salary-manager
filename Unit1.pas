unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdMessage, IdSMTP, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdMessageClient, IdPOP3;

type
  TMainF = class(TForm)
    IdPOP31: TIdPOP3;
    IdSMTP1: TIdSMTP;
    IdMessage1: TIdMessage;
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainF: TMainF;

implementation

{$R *.dfm}

procedure TMainF.Button1Click(Sender: TObject);
var
  filename : String;
//  tmpEMailItem : TIdEMailAddressItem;
// tmpEmailAdd : TIdEmailAddressList;
begin
  try
    IdSMTP1.Host:= 'SMTP.163.com';
    Idpop31.Host :='pop.163.com';
    IdSMTP1.AuthenticationType := atLogin; //��֤��¼ģʽΪ Login
    IdSMTP1.Username := 'g0042317@163.com';
    IdSMTP1.Password := 'UIANEFYSBZMCYHTV';
//    IdSMTP1.Password := 'a13271187850';
    filename :='E:\dqc\΢��ͼƬ_20200106144712.jpg'; //��Ҫ��ӵĸ����ļ�
    TIdAttachment.Create(IdMessage1.MessageParts,filename); //��Ӹ���
    IdMessage1.From.Address :='g0042317@163.com';
    IdMessage1.Recipients.EMailAddresses:='caoyan528@gmail.com';
    //tmpEMailItem := IdMessage1.Recipients.Add; //���һ����ַ�б�
    //tmpEMailItem.Text :='caoyan528@gmail.com';//дһ���ռ���
    idMessage1.BccList.Add.Text :='249497110@qq.com'; //��д���Ŀ���ַ��ʵ��Ⱥ��
   // idMessage1.BccList.Add.Text :='caoyan_528@163.com'; //��д���Ŀ���ַ��ʵ��Ⱥ��
    IdMessage1.Subject:= '��һ���ʼ��ͻ���';
    IdMessage1.Body.Text := Memo1.Text; //�˴�Ϊ�ʼ�����
    IdMessage1.CharSet := 'gb2312'; //��֤�������ĺ��ֵ�������ʾ
    IdMessage1.Body.Assign(Memo1.Lines);
    if IdSMTP1.AuthSchemesSupported.IndexOf('LOGIN')>-1 then
    begin
      IdSMTP1.AuthenticationType := atLogin;//����ǰҪ����Ϊ Login ���漺�裬�˴�����Ҫ
      IdSMTP1.Authenticate;
    end;
    IdSMTP1.Connect(); //���� SMTP ������
    IdSMTP1.Authenticate;
    IdSMTP1.Send(IdMessage1); //���������������
  finally
    IdSMTP1.Disconnect; //�Ͽ��������������
  end;
end;

end.
