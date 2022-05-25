unit ufrmRedimensionarImg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ExtDlgs, uRedimensionarImg, Vcl.Imaging.pngimage;

type
  TfrmRedimensionarImg = class(TForm)
    Image1: TImage;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    function PngToBmp(Png : TPngImage) : TBitmap;

  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmRedimensionarImg: TfrmRedimensionarImg;

implementation

{$R *.dfm}

uses JPEG;

procedure TfrmRedimensionarImg.Button1Click(Sender: TObject);
var
  bmp: TBitmap;
  jpg: TJpegImage;
  scale: Double;
  vPng: TPngImage;
  vBmp: TBitmap;
begin
  if opendialog1.execute then
  begin
    jpg := TJpegImage.Create;
    try
      jpg.Loadfromfile(opendialog1.filename);
      if jpg.Height > jpg.Width then
        scale := 200 / jpg.Height
      else
        scale := 200 / jpg.Width;
      bmp := TBitmap.Create;
      try
        {Create thumbnail bitmap, keep pictures aspect ratio}
        bmp.Width := Round(jpg.Width * scale);
        bmp.Height:= Round(jpg.Height * scale);
        bmp.Canvas.StretchDraw(bmp.Canvas.Cliprect, jpg);
        {Draw thumbnail as control}
        Self.Canvas.Draw(100, 10, bmp);
        {Convert back to JPEG and save to file}
        jpg.Assign(bmp);
        jpg.SaveToFile(ChangeFileext(opendialog1.filename, '_thumb.JPG'));
      finally
        bmp.free;
      end;
    finally
      jpg.free;
    end;
  end;
end;

function TfrmRedimensionarImg.PngToBmp(Png: TPngImage): TBitmap;
begin
  Result := TBitmap.Create;
  Result.Assign(Png);
end;

end.
