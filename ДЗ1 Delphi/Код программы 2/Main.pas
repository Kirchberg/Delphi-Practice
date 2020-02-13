unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TMainForm = class(TForm)
    Image: TImage;
    EndButton: TButton;
    Timer1: TTimer;
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure EndButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

uses Figure;

{$R *.dfm}

Var
    t:single=pi; a:real=0.5;
    Astr,AstrCircle:TAstroida;
    C,K:TCircle;
    Moving:Boolean=true;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  Image.Canvas.Brush.Color:= clWhite;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Astr:=TAstroida.Create(300,100,50,Image);
  C:=TCircle.Create(100,100,50,20,Image);
  K:=TCircle.Create(520,100,50,-40,Image);
  AstrCircle:=TAstroida.Create(520,100,50,Image);
  Timer1.Enabled:=true;
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  Astr.Move(0.32*t);
  K.Move(0.2*t);
  if (t > 2 * pi) or (t < pi - 0.001) then
    begin
      a := -a;
      C.Move(-t);
    end
      else C.Move(-t);
        AstrCircle.Move(0.2*t);
        t:=t + a;
end;

procedure TMainForm.EndButtonClick(Sender: TObject);
begin
  close;
end;
initialization

finalization
    K.Free;
    AstrCircle.Free;
    Astr.Free;
    C.Free;

end.
