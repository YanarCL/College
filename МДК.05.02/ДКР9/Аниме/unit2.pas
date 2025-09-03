unit Unit2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls;

type

  { TfEdit }

  TfEdit = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cSex: TComboBox;
    cTroop: TComboBox;  // Keep element name as cTroop
    eName: TEdit;
    eSurname: TEdit;
    eAge: TEdit;
    eRace: TEdit;
    eJob: TEdit;
    Image1: TImage;
    lName: TLabel;
    lSurname: TLabel;
    lAge: TLabel;
    lSex: TLabel;
    lTroop: TLabel;  // Keep element name as lTroop
    lRace: TLabel;
    lJob: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lAgeClick(Sender: TObject);
    procedure lTroopClick(Sender: TObject);
  private

  public

  end;

var
  fEdit: TfEdit;

implementation

{$R *.lfm}

{ TfEdit }

procedure TfEdit.FormShow(Sender: TObject);
begin
  cSex.Items.Clear;
  cSex.Items.Add('Мужской');
  cSex.Items.Add('Женский');
  cSex.Items.Add('Неопределённый');

  cTroop.Items.Clear;  // Keep element name as cTroop
  // Changed troops to anime genres
  cTroop.Items.Add('Сёнен');
  cTroop.Items.Add('Сёдзё');
  cTroop.Items.Add('Сейнен');
  cTroop.Items.Add('Дзёсэй');
  cTroop.Items.Add('Меха');
  cTroop.Items.Add('Исекай');
  cTroop.Items.Add('Повседневность');
  cTroop.Items.Add('Фэнтези');
  cTroop.Items.Add('Научная фантастика');
  cTroop.Items.Add('Романтика');
  cTroop.Items.Add('Комедия');
  cTroop.Items.Add('Драма');
  cTroop.Items.Add('Триллер');
  cTroop.Items.Add('Ужасы');

  eName.SetFocus;
end;

procedure TfEdit.FormCreate(Sender: TObject);
begin

end;

procedure TfEdit.lAgeClick(Sender: TObject);
begin

end;

procedure TfEdit.lTroopClick(Sender: TObject);  // Keep element name as lTroop
begin

end;

end.

