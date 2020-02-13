unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, VclTee.TeeGDIPlus,
  VCLTee.TeEngine, VCLTee.Series, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart;

type
  TForm6 = class(TForm)
    EndButton10: TButton;
    Image1: TImage;
    Button1: TButton;
    procedure EndButton10Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

Uses Unit1;

{$R *.dfm}

procedure TForm6.Button1Click(Sender: TObject);
var
  i, j, c, k, p, x1, x2, y2:integer;
  mas1: array [1..10] of integer;
  mas2: array [1..10] of integer;

begin

   Image1.Canvas.Pen.Width:= 3;
   Image1.Canvas.Rectangle(20,20,Image1.width-20,Image1.Height-2);
   Image1.Canvas.Brush.Color:= clWhite; //��������� ����� ��� ���������

   Image1.Canvas.TextOut(170,25, '��������� ������������� ���� �� ����� �������');
   Image1.Canvas.TextOut(30,25, '���-��');
   Image1.Canvas.TextOut(30,40, '����');
   Image1.Canvas.TextOut(510,430, '���');
   Image1.Canvas.TextOut(510,445, '�������');

   for i:= 1 to 10 do
    begin
      mas2[i]:= 1;      //���������� �������
      mas1[i]:= 0;   //���������� �������
    end;

   AssignFile(f, 'Vvod.txt');
   Reset(f);
   i:=0;
   While not eof(f) do
    begin
      read(f, z);
      inc(i);
      mas1[i]:=StrToInt(z.yearOfPublication);  //���������� � ������
    end;

    for i:=1 to 10 do
      for j:=1 to 10-i do
        if mas1[j] > mas1[j+1] then
          begin
            p:= mas1[j];
            mas1[j]:= mas1[j+1];
            mas1[j+1]:= p;
          end;  //���������� �������

    for i:= 1 to 9 do
      for k:= i+1 to 10 do
        if (mas1[i] = mas1[k]) and (mas1[i]<> 0) and (mas1[k]<> 0) then
          begin
            inc(mas2[i]); //���������� ���-�� ����
            mas1[k]:= 0;
            dec(mas2[k]);
          end; //�������� ���������� �� �������


   Image1.Canvas.Pen.Color:= clTeal;
   Image1.Canvas.Pen.Width:= 1;
   c:=5;
   p:= 0;
   for i:= 1 to 8 do
    begin
     y2:= 420;
     y2 := y2 - (c * 10);
     c:= c + 5;
     Image1.Canvas.TextOut(50-20,y2+45, IntToStr(p));
     inc(p);
     Image1.Canvas.MoveTo(50,420);
     Image1.Canvas.MoveTo(50,y2);
     Image1.Canvas.LineTo(521,y2);
     end; // ���������� ����� ���-�� ����

   Image1.Canvas.Pen.Width:= 2;
   Image1.Canvas.MoveTo(50,420);
   Image1.Canvas.LineTo(521,420); // ��� X
   Image1.Canvas.MoveTo(80,450);
   Image1.Canvas.LineTo(80,45);  // ��� Y
   Image1.Canvas.MoveTo(50,420); // ���������� ���� ���������

   x1:= 80;
   x2:= 120;
   y2:= 420;
   Image1.Canvas.Pen.Color:= clBlack;
   Image1.Canvas.MoveTo(x2, y2);
   Image1.Canvas.Pen.Width:= 3;

   i:=1;
    While i<=10 do
      begin
        if (mas2[i] <> 0) and (mas1[i] <> 0) then  //���� ��� ���������� � ������ ����� � �������
          begin
            Image1.Canvas.Brush.Color := RGB(Random(256), Random(256), Random(256)); //����� ��������� ���� ��� ������� ���������
            Image1.Canvas.Rectangle(x1, y2 - mas2[i] * 50, x2, y2); //�������� �������, ��� (y2 - mas2[i] * 50) ��� ������ �������
            x1:= x2;                                                //��������� ����
            x2:= x2 + 40; //��������� ���������� ��� ���������� �������
          end;
        inc(i);
      end;

   Image1.Canvas.Brush.Color:=clWhite;
   x1:=85;
   for i:= 1 to 10 do
    if mas1[i] <> 0 then
      begin
      Image1.Canvas.TextOut(x1, 430 , IntToStr(mas1[i]));
        x1:= x1+41;
      end;    // ����� �� ��� X ��� ������� �����

   CloseFile(f);
end;

procedure TForm6.EndButton10Click(Sender: TObject); //������ ��������� � ������� ����
begin
  Mainform.Visible:= true;  //�������� ����� � �������� ����� � ������� ����
  Image1.Picture:= nil;
  Form6.Close;
end;


end.
