object MainF: TMainF
  Left = 295
  Top = 254
  Width = 1044
  Height = 540
  Caption = 'MainF'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 648
    Top = 456
    Width = 75
    Height = 25
    Caption = #21457#36865
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 816
    Top = 48
    Width = 193
    Height = 409
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object IdPOP31: TIdPOP3
    MaxLineAction = maException
    ReadTimeout = 0
    Left = 960
    Top = 8
  end
  object IdSMTP1: TIdSMTP
    MaxLineAction = maException
    ReadTimeout = 0
    Port = 25
    AuthenticationType = atNone
    Left = 896
    Top = 8
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'MIME'
    BccList = <>
    CCList = <>
    Encoding = meMIME
    Recipients = <>
    ReplyTo = <>
    Left = 928
    Top = 8
  end
end
