unit Zadanie22222Laba19;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  close
end;

procedure TForm1.Button1Click(Sender: TObject);
var R,n,d,S: Float;
begin
  R:=strtoint(Edit1.Text);
  n:=strtoint(Edit2.Text);
  d:=2*R;
  S:=(4*n*power(R,2))/(power(n,2) + 1);
  Memo1.Lines.add('Диагональ равна: '+FloatToStr(d)+'      Площадь равна: '+FloatToStr(S));
end;

end.

