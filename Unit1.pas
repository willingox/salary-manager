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
    IdSMTP1.AuthenticationType := atLogin; //保证登录模式为 Login
    IdSMTP1.Username := 'g0042317@163.com';
    IdSMTP1.Password := 'UIANEFYSBZMCYHTV';
//    IdSMTP1.Password := 'a13271187850';
    filename :='E:\dqc\微信图片_20200106144712.jpg'; //需要添加的附件文件
    TIdAttachment.Create(IdMessage1.MessageParts,filename); //添加附件
    IdMessage1.From.Address :='g0042317@163.com';
    IdMessage1.Recipients.EMailAddresses:='caoyan528@gmail.com';
    //tmpEMailItem := IdMessage1.Recipients.Add; //添加一个地址列表
    //tmpEMailItem.Text :='caoyan528@gmail.com';//写一个收件人
    idMessage1.BccList.Add.Text :='249497110@qq.com'; //书写多个目标地址，实现群发
   // idMessage1.BccList.Add.Text :='caoyan_528@163.com'; //书写多个目标地址，实现群发
    IdMessage1.Subject:= '第一个邮件客户端';
    IdMessage1.Body.Text := Memo1.Text; //此处为邮件正文
    IdMessage1.CharSet := 'gb2312'; //保证附件正文汉字的正常显示
    IdMessage1.Body.Assign(Memo1.Lines);
    if IdSMTP1.AuthSchemesSupported.IndexOf('LOGIN')>-1 then
    begin
      IdSMTP1.AuthenticationType := atLogin;//连接前要保存为 Login 上面己设，此处不必要
      IdSMTP1.Authenticate;
    end;
    IdSMTP1.Connect(); //连接 SMTP 服务器
    IdSMTP1.Authenticate;
    IdSMTP1.Send(IdMessage1); //向服务器发送邮箱
  finally
    IdSMTP1.Disconnect; //断开与服务器的连接
  end;
end;

end.
