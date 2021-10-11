unit im_copyr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, FileCtrl, ShellApi, Buttons,
  ExtCtrls, Jpeg, Spin, ColorGrd;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Label6: TLabel;
    Label7: TLabel;
    FileListBox1: TFileListBox;
    DirectoryListBox1: TDirectoryListBox;
    DriveComboBox1: TDriveComboBox;
    FilterComboBox1: TFilterComboBox;
    Button2: TButton;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox1: TGroupBox;
    OpenDialog1: TOpenDialog;
    CheckBox1: TCheckBox;
    ScrollBox1: TScrollBox;
    Image1: TImage;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Label5: TLabel;
    Label9: TLabel;
    SpinEdit1: TSpinEdit;
    ColorBox1: TColorBox;
    Label10: TLabel;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label8: TLabel;
    TrackBar1: TTrackBar;
    procedure Button2Click(Sender: TObject);
    procedure DirectoryListBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FileListBox1Click(Sender: TObject);
    procedure FileListBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpinEdit1Change(Sender: TObject);
    procedure ColorBox1Change(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Set_Buttons;
    procedure Draw_Text;
  end;

const
  Pixels = MaxInt div SizeOf(TRGBTriple);

type
  PRGBArray = ^TRGBArray;
  TRGBArray = array[0..Pixels-1] of TRGBTriple;

  TypeRGB = record
        Bleu, Vert, Rouge: Byte;
  end;
  TypeTRGBArray = array [0..400] of TypeRGB;
  TypePRGBArray = ^TypeTRGBArray;
  TypeRebond    = array [1..180] of integer;

var
  Form2: TForm2;
  Bmp: TBitmap;
  Jpg: TJpegImage;
  iX,iY:  integer;
  failname: string;

implementation

{$R *.dfm}

procedure TForm2.Set_Buttons;
begin
 Button1.Enabled:=FileListBox1.SelCount>0;
end;

procedure TForm2.Edit2Change(Sender: TObject);
begin
 Set_Buttons;
end;

procedure TForm2.Edit3Change(Sender: TObject);
begin
 Set_Buttons;
end;

procedure TForm2.DirectoryListBox1Change(Sender: TObject);
begin
 Label2.Caption:='Всего файлов: '+IntToStr(FileListBox1.Items.Count);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
 Button1.Width:=Form2.Width-(Button1.Left+14);
 Button2.Width:=Form2.Width-(Button2.Left+14);
 //
 Application.Title:=Form2.Caption;

 ComboBox1.Items.Assign(Screen.Fonts);
 ComboBox1.ItemIndex:=0;
 ColorBox1.OnChange(Sender);
 CheckBox3.OnClick(Sender);

 Bmp:=TBitmap.Create;
 Bmp.PixelFormat:=pf24Bit;
 Jpg:=TJpegImage.Create;
 Jpg.PixelFormat:=jf24Bit;

 iX:=5;
 iY:=5;

 if Image1.Picture.Graphic is TJPEGImage
 then TJpegImage(Image1.Picture.Graphic).DIBNeeded;
end;

procedure TForm2.FileListBox1Click(Sender: TObject);
var
 i,j: integer;
begin
 j:=0;
 for i:=0 to FileListBox1.Items.Count-1 do
  begin
   if FileListBox1.Selected[i]
   then
    begin
     inc(j);
     failname:=FileListBox1.Items.Strings[i];
     Jpg.LoadFromFile(failname);
     Bmp.Assign(Jpg);
     Image1.Picture.Bitmap.Assign(Bmp);
    end;
  end;
 Label3.Caption:='Выделенных файлов: '+IntToStr(j);
end;

procedure TForm2.FileListBox1Change(Sender: TObject);
var
 i,j: integer;
begin
 j:=0;
 for i:=0 to FileListBox1.Items.Count-1 do
  begin
   if FileListBox1.Selected[i]
   then inc(j);
  end;
 Label3.Caption:='Выделенных файлов: '+IntToStr(j);

 Set_Buttons;

 CheckBox1.OnClick(Sender);
end;

procedure TForm2.FormShow(Sender: TObject);
var
 i,j: integer;
begin
 Label2.Caption:='Всего файлов: '+IntToStr(FileListBox1.Items.Count);
 j:=0;
 for i:=0 to FileListBox1.Items.Count-1 do
  begin
   if FileListBox1.Selected[i]
   then inc(j);
  end;
 //
 Label3.Caption:='Выделенных файлов: '+IntToStr(j);
 //
 Set_Buttons;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
 Draw_Text;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
 Image1.Picture.Bitmap.SaveToFile(ChangeFileext(failname, '_new.bmp'));

 jpg.Assign(Image1.Picture.Bitmap);
 //
 // устанавливаем степень сжатия (качество) - 1..100
 jpg.CompressionQuality:=TrackBar1.Position;
 // "Оттенки серого" false
 jpg.Grayscale:=false;
 // упаковываем графику
 jpg.Compress;
 //
 jpg.SaveToFile(ChangeFileext(failname, '_new.jpg'));
end;

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
 Image1.Stretch:=CheckBox1.Checked;

 if CheckBox1.Checked=false
 then
  begin
   Image1.Align:=alNone;  
   Image1.Width:=Image1.Picture.Width;
   Image1.Height:=Image1.Picture.Height;
  end
 else Image1.Align:=alClient;
end;

procedure TForm2.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if Image1.Stretch=false
 then
  begin
   iX:=X;
   iY:=Y;
   Label4.Caption:='Координаты: X = '+IntToStr(X)+', Y = '+IntToStr(Y);
  end
 else
  begin
   iX:=Round((X/Image1.Width)*Image1.Picture.Width);
   iY:=Round((Y/Image1.Height)*Image1.Picture.Height);
   Label4.Caption:='Координаты: X ='+IntToStr(iX)+', Y = '+IntToStr(iY);
  end;

 Draw_Text;   
end;

/////////////////////////////////////////////////

procedure CopyTransparentBitmap(_B_in,_B_out: TBitmap;
 _x,_y: integer; trColor: Tcolor; _transparent: integer);
var
 RowOut,RowIn: PRGBArray;
 _r,_b,_g:integer; rc1, bc1, gc1: byte;
 x, y, x_cor,y_cor,x_corS,y_corS: integer;

begin
 if (_x)>_B_out.Width-1
 then exit;
 if (_x+_B_out.Width)<0
 then exit;
 if (_y)>_B_out.Height-1
 then exit;
 if (_y+_B_out.Height)<0 then exit;

 // убрать, если изначально этот формат
 _B_in.PixelFormat:=pf24bit;
 // убрать, если изначально этот формат
 _B_out.PixelFormat:=pf24bit;

 if _x<0
 then x_corS:=abs(_x)
 else x_corS:=0;
 if _y<0
 then y_corS:=abs(_y)
 else y_corS:=0;
 if (_x+_B_in.Width)>_B_out.Width
 then x_cor:=_x+_B_in.Width-_B_out.Width
 else x_cor:=0;
 if (_y+_B_in.Height)>_B_out.Height
 then y_cor:=_y+_B_in.Height-_B_out.Height
 else y_cor:=0;

 rc1:=GetRValue(trColor);
 gc1:=GetGValue(trColor);
 bc1:=GetBValue(trColor);

 for y:=y_corS to _B_in.Height-1-y_cor do
  begin
   RowOut:=_B_out.ScanLine[y+_y];
   RowIn:=_B_in.ScanLine[y];
   for x:=x_corS to _B_in.Width-1-x_cor do
    if not((RowIn[x].rgbtRed=rc1) and (RowIn[x].rgbtGreen=gc1)
     and (RowIn[x].rgbtBlue=bc1))
    then
     begin
      _r:= trunc(RowOut[x+_x].rgbtRed+(((RowIn[x].rgbtRed-RowOut[x+_x].rgbtRed)/100)*_transparent));
      if _r>255
      then _r:=255;
      if _r<0
      then _r:=0;
      _g:= trunc(RowOut[x+_x].rgbtGreen+(((RowIn[x].rgbtGreen-RowOut[x+_x].rgbtGreen)/100)*_transparent));
      if _g>255
      then _g:=255;
      if _g<0
      then _g:=0;
      _b:= trunc(RowOut[x+_x].rgbtBlue+(((RowIn[x].rgbtBlue-RowOut[x+_x].rgbtBlue)/100)*_transparent));
      if _b>255
      then _b:=255;
      if _b<0
      then _b:=0;

      RowOut[x+_x].rgbtRed:=_r;
      RowOut[x+_x].rgbtGreen:=_g;
      RowOut[x+_x].rgbtBlue:=_b;
     end;
  end
end;

procedure DrawTransparentText(_B_out: TBitmap; _x,_y: integer;
 font: TFont; _transparent: integer; _text: string);
var
 _F_out:Tbitmap;
begin
 _F_out:=Tbitmap.Create;
 try
  _F_out.PixelFormat:=pf24bit;
  _F_out.Canvas.Font:=font;
  _F_out.Width:=_F_out.Canvas.TextWidth(_text);
  _F_out.Height:=_F_out.Canvas.TextHeight(_text);
  if (_F_out.Width+_x)>_B_out.Width
  then _F_out.Width:=_B_out.Width-_x;
  if (_F_out.Height+_y)>_B_out.Height
  then _F_out.Height:=_B_out.Height-_y;
  _F_out.Canvas.Brush.Color:=font.Color+1;
  _F_out.Canvas.TextOut(0,0,_text);
  CopyTransparentBitmap(_F_out,_B_out, _x,_y,font.Color+1, _transparent);
 finally
  _F_out.Free;
 end;
end;

procedure TForm2.Draw_Text;
begin
 Image1.Picture.Bitmap.Assign(Bmp);
 DrawTransparentText(Image1.Picture.Bitmap,iX,iY,Image1.Canvas.Font,60,Edit1.Text);
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
begin
 Image1.Canvas.Font.Name:=ComboBox1.Text;
 Draw_Text;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Bmp.Free;
 Jpg.Free;
end;

procedure TForm2.SpinEdit1Change(Sender: TObject);
begin
 Image1.Canvas.Font.Size:=SpinEdit1.Value;
 Draw_Text; 
end;

procedure TForm2.ColorBox1Change(Sender: TObject);
begin
 Image1.Canvas.Font.Color:=ColorBox1.Selected;
 Draw_Text; 
end;

procedure TForm2.CheckBox3Click(Sender: TObject);
begin
 if CheckBox3.Checked
 then Image1.Canvas.Font.Style:=Image1.Canvas.Font.Style+[fsBold]
 else Image1.Canvas.Font.Style:=Image1.Canvas.Font.Style-[fsBold];
 Draw_Text; 
end;

procedure TForm2.CheckBox4Click(Sender: TObject);
begin
 if CheckBox4.Checked
 then Image1.Canvas.Font.Style:=Image1.Canvas.Font.Style+[fsItalic]
 else Image1.Canvas.Font.Style:=Image1.Canvas.Font.Style-[fsItalic];
 Draw_Text; 
end;

procedure TForm2.Edit1Change(Sender: TObject);
begin
 Draw_Text;
end;

procedure TForm2.TrackBar1Change(Sender: TObject);
begin
 Label8.Caption:='Сжатие: '+IntToStr(TrackBar1.Position)+'%';
end;

end.
