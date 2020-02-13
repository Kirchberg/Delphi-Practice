unit Unit4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.UITypes;

type
  TForm4 = class(TForm)
    Label1Unit4: TLabel;
    FindEdit2: TEdit;
    ListBox2: TListBox;
    EndButton4: TButton;
    Label2Unit4: TLabel;
    FindButton2: TButton;
    ClearButton2: TButton;
    procedure EndButton4Click(Sender: TObject);
    procedure FindButton2Click(Sender: TObject);
    procedure ClearButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

Uses Unit1;

{$R *.dfm}

procedure TForm4.ClearButton2Click(Sender: TObject);  //������ ������� ����� ��� ���������� �����
begin
  FindEdit2.Clear;
  Listbox2.Items.Clear;
  CloseFile(f);
  AssignFile(f, 'Vvod.txt');
  Reset(f);
end;

procedure TForm4.EndButton4Click(Sender: TObject); //������ ��������� � ������� ����
begin
  Mainform.Visible:= true;
  CloseFile(f); //�������� ����� � �������� ����� � ������� ����
  Form4.Close;
end;

procedure TForm4.FindButton2Click(Sender: TObject);  //������ ������ ������� �� ��������� ���-�� ����
var
  i, k, c: integer;
  number: integer; //��������� ���������� ��� �������� ���������� ���-�� ����
  mas1: array [1..20] of ShortString;
  mas2: array [1..20] of integer;
begin

   for i := 1 to 20 do
     begin
       mas1[i]:= '0';
       mas2[i]:= 0;
     end;

   i:=0;
   while not eof(f) do
    begin
      read(f, z);
      inc(i);
      mas1[i]:= z.author;
      mas2[i] :=  StrToInt(z.numberOfCopies) //���������� � ������
    end;

  for i:= 1 to 19 do
    for k:= i+1 to 20 do
      if (mas1[i] = mas1[k]) and (mas1[i] <> '0') and (mas1[k]<> '0') then
        begin
          mas1[k]:= '0'; //�������� ���������� �� �������
        end;

  c:= 1;
  number:= StrToInt(FindEdit2.Text); //�������� ���-�� ����
  for i:=1 to 20 do
    begin
      if (number <= mas2[i]) and (mas1[i] <> '0') and (mas2[i] <> 0)  then //���� �� ����� ������� ������ ���-� ����
        begin
          c:= 0;
          ListBox2.Items.Add(mas1[i]); //�������� ������ � ListBox
        end;
    end;
      if c <> 0 then
        MessageDlg('��� ������', mtError, [mbOK], 0); //����� ���� ������, ����� ������ ������ ��� � ��
end;

end.

