program Project1;

uses
  Vcl.Forms,
  Main in 'Main.pas' {MainForm},
  Figure in 'Figure.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
