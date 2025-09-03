unit Edit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TfEdit }

  TfEdit = class(TForm)
    bCansel: TBitBtn;
    bSave: TBitBtn;
    CBNote: TComboBox;
    eTelephone: TEdit;
    eName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure bSaveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
  private

  public

  end;

var
  fEdit: TfEdit;

implementation

{$R *.lfm}

{ TfEdit }

procedure TfEdit.Label1Click(Sender: TObject);
begin

end;

procedure TfEdit.FormShow(Sender: TObject);
begin
     eName.SetFocus;
end;



procedure TfEdit.bSaveClick(Sender: TObject);
begin

end;

procedure TfEdit.Label3Click(Sender: TObject);
begin

end;

end.

