program Images_Copyright;

uses
  Forms,
  im_copyr in 'im_copyr.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
