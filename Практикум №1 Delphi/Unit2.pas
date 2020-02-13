unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    RecordButton: TButton;
    EndButton2: TButton;
    procedure EndButton2Click(Sender: TObject);
    procedure RecordButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm2.EndButton2Click(Sender: TObject); // нопка вернутьс€ в главное меню
begin
  CloseFile(f); //«акрываю форму и перехожу оп€ть в главное меню
  Mainform.Visible:= true;
  Form2.close;
end;

procedure TForm2.RecordButtonClick(Sender: TObject); // нопка записать данные
begin
  z.author:= edit1.text; //—охран€ю им€ автора
  z.name:= edit2.text; //—охран€ю им€ книги автора
  z.publisher:= edit3.text; //—охран€ю им€ издательтва книги
  z.yearOfPublication:= edit4.text; //—охран€ю год издани€
  z.numberOfCopies:= edit5.text; //—охран€ю кол-во копий
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  edit5.Clear;
  write(f,z); //«аписываю информацию об авторе в файл
  Edit1.SetFocus;
end;

end.
