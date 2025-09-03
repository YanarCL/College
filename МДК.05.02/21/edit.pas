unit Edit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TfEditAnime }

  TfEditAnime = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cbCompleted: TCheckBox;
    eRating: TEdit;
    eEpisodes: TEdit;
    eTitle: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
  private
  public
  end;

var
  fEditAnime: TfEditAnime;

implementation

{$R *.lfm}

{ TfEditAnime }

procedure TfEditAnime.FormShow(Sender: TObject);
begin
  eTitle.SetFocus;
end;

end.

