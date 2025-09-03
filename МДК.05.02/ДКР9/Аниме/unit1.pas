unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, ActnList,
  ExtCtrls, Grids, Buttons, Unit2;

type
  Character = record
    Name: string[100];
    Surname: string[100];
    Age: string[5];
    Sex: string[20];
    Race: string[30];
    Genre: string[40];
    Job: string[100];
  end;

  { TfOutput }

  TfOutput = class(TForm)
    Panel: TPanel;
    bAdd: TSpeedButton;
    bEdit: TSpeedButton;
    bDel: TSpeedButton;
    bSort: TSpeedButton;
    Strings: TStringGrid;
    procedure bAddClick(Sender: TObject);
    procedure bDelClick(Sender: TObject);
    procedure bEditClick(Sender: TObject);
    procedure bSortClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  fOutput: TfOutput;
  adres: string;
implementation

{$R *.lfm}

{ TfOutput }

procedure TfOutput.bAddClick(Sender: TObject);
begin
  fEdit.eName.Text:='';
  fEdit.eSurname.Text:='';
  fEdit.eAge.Text:='';
  fEdit.cSex.Text:='';
  fEdit.eRace.Text:='';
  fEdit.cTroop.Text:='';
  fEdit.eJob.Text:='';
  fEdit.ModalResult:=mrNone;
  fEdit.ShowModal;
  if (fEdit.eName.Text='') or (fEdit.eSurname.Text='') or (fEdit.eAge.Text='') or (fEdit.eRace.Text='') or (fEdit.eJob.Text='') then exit;
  if fEdit.ModalResult <> mrOk then exit;
  Strings.RowCount:=Strings.RowCount +1;
  Strings.Cells[0, Strings.RowCount-1]:= fEdit.eName.Text;
  Strings.Cells[1, Strings.RowCount-1]:= fEdit.eSurname.Text;
  Strings.Cells[2, Strings.RowCount-1]:= fEdit.eAge.Text;
  Strings.Cells[3, Strings.RowCount-1]:= fEdit.cSex.Text;
  Strings.Cells[4, Strings.RowCount-1]:= fEdit.eRace.Text;
  Strings.Cells[5, Strings.RowCount-1]:= fEdit.cTroop.Text;
  Strings.Cells[6, Strings.RowCount-1]:= fEdit.eJob.Text;
end;

procedure TfOutput.bDelClick(Sender: TObject);
begin
  if Strings.RowCount=1 then exit;
  if MessageDlg('Подтверждение удаления',
                'Вы действительно хотите удалить персонажа "' +
                Strings.Cells[0,Strings.Row] + '"?',
          mtConfirmation, [mbYes, mbNo],0)=mrYes then
             Strings.DeleteRow(Strings.Row);
end;

procedure TfOutput.bEditClick(Sender: TObject);
begin
  if Strings.RowCount = 1 then exit;
  fEdit.eName.Text:=Strings.Cells[0, Strings.Row];
  fEdit.eSurname.Text:=Strings.Cells[1, Strings.Row];
  fEdit.eAge.Text:=Strings.Cells[2,Strings.Row];
  fEdit.cSex.Text:=Strings.Cells[3,Strings.Row];
  fEdit.eRace.Text:=Strings.Cells[4,Strings.Row];
  fEdit.cTroop.Text:=Strings.Cells[5,Strings.Row];
  fEdit.eJob.Text:=Strings.Cells[6,Strings.Row];
  fEdit.ModalResult:=mrNone;
  fEdit.ShowModal;
  if fEdit.ModalResult = mrOk then begin
    Strings.Cells[0, Strings.Row]:=fEdit.eName.Text;
    Strings.Cells[1, Strings.Row]:=fEdit.eSurname.Text;
    Strings.Cells[2,Strings.Row]:=fEdit.eAge.Text;
    Strings.Cells[3,Strings.Row]:=fEdit.cSex.Text;
    Strings.Cells[4,Strings.Row]:=fEdit.eRace.Text;
    Strings.Cells[5,Strings.Row]:=fEdit.cTroop.Text;
    Strings.Cells[6,Strings.Row]:=fEdit.eJob.Text;
  end;
end;

procedure TfOutput.bSortClick(Sender: TObject);
begin
  if Strings.RowCount = 1 then exit;
  Strings.SortColRow(true, 0);
end;

procedure TfOutput.FormClose(Sender: TObject; var CloseAction: TCloseAction);
  var
    MyChar: Character;
    f: file of Character;
    i: integer;
begin
  if Strings.RowCount = 1 then exit;
  try
    AssignFile(f, adres + 'anime_characters.dat');
    Rewrite(f);
    for i:=1 to Strings.RowCount -1 do begin
      MyChar.Name:=Strings.Cells[0,i];
      MyChar.Surname:=Strings.Cells[1,i];
      MyChar.Age:=Strings.Cells[2,i];
      MyChar.Sex:=Strings.Cells[3,i];
      MyChar.Race:=Strings.Cells[4,i];
      MyChar.Genre:=Strings.Cells[5,i];
      MyChar.Job:=Strings.Cells[6,i];
      Write(f, MyChar);
    end;
  finally
    CloseFile(f);
  end;
end;

procedure TfOutput.FormCreate(Sender: TObject);
  var
    MyChar: Character;
    f: file of Character;
begin
  adres:=ExtractFilePath(ParamStr(0));
  Strings.Cells[0,0]:='Имя';
  Strings.Cells[1,0]:='Фамилия';
  Strings.Cells[2,0]:='Возраст';
  Strings.Cells[3,0]:='Пол';
  Strings.Cells[4,0]:='Раса';
  Strings.Cells[5,0]:='Жанр аниме';
  Strings.Cells[6,0]:='Род занятий';
  if not FileExists(adres + 'anime_characters.dat') then exit;
  try
    AssignFile(f, adres + 'anime_characters.dat');
    Reset(f);
    while not Eof(f) do begin
      Read(f, MyChar);
       Strings.RowCount:=Strings.RowCount +1;
       Strings.Cells[0, Strings.RowCount-1]:=MyChar.Name;
       Strings.Cells[1, Strings.RowCount-1]:=MyChar.Surname;
       Strings.Cells[2, Strings.RowCount-1]:=MyChar.Age;
       Strings.Cells[3, Strings.RowCount-1]:=MyChar.Sex;
       Strings.Cells[4, Strings.RowCount-1]:=MyChar.Race;
       Strings.Cells[5, Strings.RowCount-1]:=MyChar.Genre;
       Strings.Cells[6, Strings.RowCount-1]:=MyChar.Job;
    end;
  finally
    CloseFile(f);
  end;
end;

end.

