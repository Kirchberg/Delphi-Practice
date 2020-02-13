unit Unit3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.UITypes;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    ListBox1: TListBox;
    EndButton3: TButton;
    Label2: TLabel;
    Button1: TButton;
    ClearButton: TButton;
    procedure EndButton3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ClearButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

Uses Unit1;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject); //������ ������ ����
  var
    c:integer;  //�������� �� ������������� ������
    aut:string[22]; //��������� ���������� ��� �������� ���������� ������

    begin
        c:= 1;
        aut:= Edit1.Text; //�������� ��� ���������� ������
        while not EOF(f) do
          begin
            Read(f,z);
            if z.author = aut then  //���� �� ����� ������� ������
              begin
                c:= 0;
                ListBox1.Items.Add(z.name); //�������� ����� � ListBox
              end;
          end;
        if c <> 0 then
          MessageDlg('��� ������', mtError, [mbOK], 0); //����� ���� ������, ����� ������ ������ ��� � ��
    end;

procedure TForm3.ClearButtonClick(Sender: TObject); //������ ������� ����� ��� ���������� �����
begin
  Edit1.Clear;
  Listbox1.Items.Clear;
  CloseFile(f);
  AssignFile(f, 'Vvod.txt');
  Reset(f);
end;

procedure TForm3.EndButton3Click(Sender: TObject); //������ ��������� � ������� ����
  begin
    Mainform.Visible:= true;
    CloseFile(f); //�������� ����� � �������� ����� � ������� ����
    Form3.Close;
  end;

end.
