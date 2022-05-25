object frmRedimensionarImg: TfrmRedimensionarImg
  Left = 0
  Top = 0
  Caption = 'Redimensionar Imagem'
  ClientHeight = 412
  ClientWidth = 647
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Image1: TImage
    Left = 168
    Top = 48
    Width = 257
    Height = 193
    Stretch = True
  end
  object Button1: TButton
    Left = 264
    Top = 264
    Width = 89
    Height = 25
    Caption = 'Carregar Img'
    TabOrder = 0
    OnClick = Button1Click
  end
  object OpenDialog1: TOpenDialog
    Left = 8
    Top = 8
  end
end
