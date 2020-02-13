unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.UITypes;

type
  TMainForm = class(TForm)
    EndButton: TButton;
    Button1: TButton;
    Button2: TButton;
    DeleteButton: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure EndButtonClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  zap = record
    author: string[22]; //�����
    name:string[22];    //������������
    publisher:string[22]; //������������
    yearOfPublication: string[22];  //��� ����������
    numberOfCopies: string[22]; //���-�� �����
  end;

var
  MainForm: TMainForm;
  f: file of zap;
  z: zap;

implementation

Uses Unit2, Unit3, Unit4, Unit5, Unit6;

{$R *.dfm}

procedure TMainForm.Button1Click(Sender: TObject); //�������/�������� ���������� �� ������
var
  size: integer;

begin
  Mainform.Visible:= false;
  AssignFile(f, 'Vvod.txt'); //�������� ���������� � ������
  {I+} Reset(f);{I-}
  if IOResult = 0 then   //�������� �� �������������
    begin
      size := FileSize(f);
      Seek(f, size);
    end
  else
    Rewrite(f);
  Form2.Show;
  Form2.Edit1.SetFocus;
  Form2.Edit1.Clear;
  Form2.Edit2.Clear;
  Form2.Edit3.Clear;
  Form2.Edit4.Clear;
  Form2.Edit5.Clear;  //������ ����� ��� ���������� ����� ������

end;

procedure TMainForm.Button2Click(Sender: TObject); //����� ��� ����� ������
begin
  Mainform.Visible:= false;
  AssignFile(f, 'Vvod.txt');
  Reset(f);
  Form3.Show;
  Form3.Edit1.SetFocus;
  Form3.Edit1.Clear;
  Form3.ListBox1.Clear;  //������ ����� ��� ���������� ����� ������
end;

procedure TMainForm.Button3Click(Sender: TObject); //����� ������ �� ���-�� ����
begin
  Mainform.Visible:= false;
  AssignFile(f, 'Vvod.txt');
  Reset(f);
  Form4.Show;
  Form4.FindEdit2.SetFocus;
  Form4.FindEdit2.Clear;
  Form4.ListBox2.Clear;  //������ ����� ��� ���������� ����� ������
end;

procedure TMainForm.Button4Click(Sender: TObject); //����� ��� ����� ������� �������
                                                   //������������ � ������� ����
begin
  Mainform.Visible:= false;
  AssignFile(f, 'Vvod.txt');
  Reset(f);
  Form5.Show;
  Form5.FindEdit3.SetFocus;
  Form5.FindEdit3.Clear;
  Form5.FindEdit4.Clear;
  Form5.ListBox3.Clear;   //������ ����� ��� ���������� ����� ������
end;


procedure TMainForm.Button5Click(Sender: TObject); //���������� ��������� ������������� ����
begin
  Mainform.Visible:= false;
  Form6.Show;
end;

procedure TMainForm.DeleteButtonClick(Sender: TObject); //������� ��� ������
begin
  AssignFile(f, 'Vvod.txt');
  Rewrite(f);
  CloseFile(f);   //������������ �����
end;

procedure TMainForm.EndButtonClick(Sender: TObject);
begin
  Close; //������� ���������
end;

end.
