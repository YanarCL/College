unit Zadanie11111Laba19;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var x,a,b,e,f: Float;
begin
   e:=2.718281828;
   a:=strtoint(Edit1.Text);
   b:=strtoint(Edit2.Text);
   x:=strtoint(Edit3.Text);
   f:=(Power(a,2)+Power(e,-x)*cos(b*x))/(b*x-Power(e,-x)*sin(b*x)+1);
   Memo1.Lines.add('Ответ: '+FloatToStr(f));
end;

end.

