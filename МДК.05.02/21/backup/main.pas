unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, Buttons,
  Grids, Edit, StdCtrls;

type
  TAnime = record
    Title: string;        // Строковый тип
    Episodes: integer;    // Целочисленный тип
    Rating: real;         // Вещественный тип
    Completed: boolean;   // Логический тип
  end;

  { TfMain }

  TfMain = class(TForm)
    bAdd: TSpeedButton;
    bEdit: TSpeedButton;
    bDel: TSpeedButton;
    bSave: TSpeedButton;
    bOpen: TSpeedButton;
    OpenDialog1: TOpenDialog;
    Panel1: TPanel;
    SaveDialog1: TSaveDialog;
    SG: TStringGrid;
    StatusBar1: TStatusBar;
    procedure bAddClick(Sender: TObject);
    procedure bDelClick(Sender: TObject);
    procedure bEditClick(Sender: TObject);
    procedure bOpenClick(Sender: TObject);
    procedure bSaveClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure SaveAnimeData(const FileName: string);
    procedure LoadAnimeData(const FileName: string);
    function BoolToStr(Value: boolean): string;
    function StrToBool(Value: string): boolean;
    procedure UpdateStatusBar;
  public
  end;

var
  fMain: TfMain;

implementation

{$R *.lfm}

{ TfMain }

procedure TfMain.FormCreate(Sender: TObject);
begin
  SG.Cells[0, 0] := 'Название';
  SG.Cells[1, 0] := 'Эпизоды';
  SG.Cells[2, 0] := 'Рейтинг';
  SG.Cells[3, 0] := 'Просмотрено';

  SG.ColWidths[0] := 200;
  SG.ColWidths[1] := 80;
  SG.ColWidths[2] := 80;
  SG.ColWidths[3] := 100;

  UpdateStatusBar;
end;

function TfMain.BoolToStr(Value: boolean): string;
begin
  if Value then
    Result := 'Да'
  else
    Result := 'Нет';
end;

function TfMain.StrToBool(Value: string): boolean;
begin
  Result := (LowerCase(Value) = 'да');
end;

procedure TfMain.UpdateStatusBar;
begin
  StatusBar1.Panels[0].Text := 'Записей: ' + IntToStr(SG.RowCount - 1);
end;

procedure TfMain.bAddClick(Sender: TObject);
begin
  fEditAnime.eTitle.Text := '';
  fEditAnime.eEpisodes.Text := '0';
  fEditAnime.eRating.Text := '0.0';
  fEditAnime.cbCompleted.Checked := False;

  if fEditAnime.ShowModal = mrOk then
  begin
    SG.RowCount := SG.RowCount + 1;
    SG.Cells[0, SG.RowCount-1] := fEditAnime.eTitle.Text;
    SG.Cells[1, SG.RowCount-1] := fEditAnime.eEpisodes.Text;
    SG.Cells[2, SG.RowCount-1] := fEditAnime.eRating.Text;
    SG.Cells[3, SG.RowCount-1] := BoolToStr(fEditAnime.cbCompleted.Checked);
    UpdateStatusBar;
  end;
end;

procedure TfMain.bEditClick(Sender: TObject);
begin
  if SG.RowCount <= 1 then Exit;

  fEditAnime.eTitle.Text := SG.Cells[0, SG.Row];
  fEditAnime.eEpisodes.Text := SG.Cells[1, SG.Row];
  fEditAnime.eRating.Text := SG.Cells[2, SG.Row];
  fEditAnime.cbCompleted.Checked := StrToBool(SG.Cells[3, SG.Row]);

  if fEditAnime.ShowModal = mrOk then
  begin
    SG.Cells[0, SG.Row] := fEditAnime.eTitle.Text;
    SG.Cells[1, SG.Row] := fEditAnime.eEpisodes.Text;
    SG.Cells[2, SG.Row] := fEditAnime.eRating.Text;
    SG.Cells[3, SG.Row] := BoolToStr(fEditAnime.cbCompleted.Checked);
  end;
end;

procedure TfMain.bDelClick(Sender: TObject);
begin
  if SG.RowCount <= 1 then Exit;

  if MessageDlg('Подтверждение',
                'Удалить аниме "' + SG.Cells[0, SG.Row] + '"?',
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    SG.DeleteRow(SG.Row);
    UpdateStatusBar;
  end;
end;

procedure TfMain.bSaveClick(Sender: TObject);
begin
  SaveDialog1.Title := 'Сохранить коллекцию аниме';
  SaveDialog1.DefaultExt := 'anim';
  SaveDialog1.Filter := 'Файлы аниме (*.anim)|*.anim|Все файлы (*.*)|*.*';
  SaveDialog1.FileName := 'collection.anim';

  if SaveDialog1.Execute then
  begin
    SaveAnimeData(SaveDialog1.FileName);
    StatusBar1.Panels[1].Text := 'Сохранено: ' + SaveDialog1.FileName;
  end;
end;

procedure TfMain.bOpenClick(Sender: TObject);
begin
  OpenDialog1.Title := 'Открыть коллекцию аниме';
  OpenDialog1.DefaultExt := 'anim';
  OpenDialog1.Filter := 'Файлы аниме (*.anim)|*.anim|Все файлы (*.*)|*.*';
  OpenDialog1.FileName := 'collection.anim';

  if OpenDialog1.Execute then
  begin
    LoadAnimeData(OpenDialog1.FileName);
    StatusBar1.Panels[1].Text := 'Загружено: ' + OpenDialog1.FileName;
    UpdateStatusBar;
  end;
end;

procedure TfMain.SaveAnimeData(const FileName: string);
var
  f: file of TAnime;
  i: Integer;
  anime: TAnime;
begin
  AssignFile(f, FileName);
  Rewrite(f);
  try
    for i := 1 to SG.RowCount - 1 do
    begin
      anime.Title := SG.Cells[0, i];
      anime.Episodes := StrToInt(SG.Cells[1, i]);
      anime.Rating := StrToFloat(SG.Cells[2, i]);
      anime.Completed := StrToBool(SG.Cells[3, i]);
      Write(f, anime);
    end;
  finally
    CloseFile(f);
  end;
end;

procedure TfMain.LoadAnimeData(const FileName: string);
var
  f: file of TAnime;
  anime: TAnime;
begin
  if not FileExists(FileName) then Exit;

  AssignFile(f, FileName);
  Reset(f);
  try
    SG.RowCount := 1;
    while not Eof(f) do
    begin
      Read(f, anime);
      SG.RowCount := SG.RowCount + 1;
      SG.Cells[0, SG.RowCount-1] := anime.Title;
      SG.Cells[1, SG.RowCount-1] := IntToStr(anime.Episodes);
      SG.Cells[2, SG.RowCount-1] := FloatToStr(anime.Rating);
      SG.Cells[3, SG.RowCount-1] := BoolToStr(anime.Completed);
    end;
  finally
    CloseFile(f);
  end;
end;

end.

