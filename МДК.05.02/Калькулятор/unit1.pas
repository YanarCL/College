unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    buttonclose: TBitBtn;
    Button1: TButton;
    Button0: TButton;
    Buttondot: TButton;
    Buttonbackspace: TButton;
    Buttonce: TButton;
    Buttonc: TButton;
    Buttonplus: TButton;
    Buttonminus: TButton;
    Buttonmult: TButton;
    Buttondivision: TButton;
    Buttonsqrt: TButton;
    Button2: TButton;
    Buttonsqr: TButton;
    Buttonopp: TButton;
    Buttonanswer: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Image1: TImage;
    output: TEdit;
    procedure Button0Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure ButtonanswerClick(Sender: TObject);
    procedure ButtonbackspaceClick(Sender: TObject);
    procedure ButtoncClick(Sender: TObject);
    procedure ButtonceClick(Sender: TObject);
    procedure buttoncloseClick(Sender: TObject);
    procedure ButtondivisionClick(Sender: TObject);
    procedure ButtondotClick(Sender: TObject);
    procedure ButtonminusClick(Sender: TObject);
    procedure ButtonmultClick(Sender: TObject);
    procedure ButtonoppClick(Sender: TObject);
    procedure ButtonplusClick(Sender: TObject);
    procedure ButtonsqrClick(Sender: TObject);
    procedure ButtonsqrtClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  countstring:string;
  a,b:real;
  operation:char;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
 a:=0;
 b:=0;
 operation:='0';
end;


procedure TForm1.ButtondivisionClick(Sender: TObject);
begin
 if output.text = 'Невозможно' then
  begin
  a:=0;
  b:=0;
  operation:='/';
  output.text:='';
  end
 else
 begin
 if output.text<>'' then
 begin
 if operation='0' then
 begin
 a+=strtofloat(output.text);
 operation:='/';
 output.text:='';
 end
 else
 begin
 b:=strtofloat(output.text);
 if b=0 then
 begin
 output.text:='Невозможно';
 Exit;
 end
 else
 begin
 case operation of
 '+':a:=a+b;
 '-':a:=a-b;
 '*':a:=a*b;
 '/':a:=a/b;
 end;
 b:=0;
 output.text:='';
 operation:='/';
 end;
 end;
 end
 else
 operation:='/';
 end;
end;

procedure TForm1.ButtondotClick(Sender: TObject);
var
  str:string;
  flag:boolean;
  i:integer;
begin
 flag:=false;
  str:=output.text;
  i:=1;
   if output.text = 'Невозможно' then
  begin
  a:=0;
  b:=0;
  operation:='0';
  output.text:='';
  end
   else
   begin
  if str<>'' then
  begin
  for i:=1 to length(str) do
     begin
     if  str[i]=',' then
     begin
     flag:=true;
     end;
     end;
  if flag= false then
   output.text:=str+',';
  end;
end;
end;

procedure TForm1.ButtonminusClick(Sender: TObject);
begin
  if output.text = 'Невозможно' then
  begin
  a:=0;
  b:=0;
  operation:='0';
  output.text:='';
  end
  else
  begin
  if output.text <> '' then
  begin
  if operation = '0' then
  begin
  a := StrToFloat(output.text);
  operation := '-';
  output.text := '';
  end
  else
  begin
  b := StrToFloat(output.text);
  if (b = 0) and (operation = '/') then
  begin
  output.text := 'Невозможно';
  Exit;
  end
  else
  begin
  case operation of
  '+': a := a + b;
  '-': a := a - b;
  '*': a := a * b;
  '/': a := a / b;
  end;
  b := 0;
  output.text := '';
  operation := '-';
  end;
  end;
  end
  else
  begin
  output.text := '-';
  end;
end;
end;

procedure TForm1.ButtonmultClick(Sender: TObject);
begin
  if output.text = 'Невозможно' then
  begin
  a:=0;
  b:=0;
  operation:='0';
  output.text:='';
  end
  else
  begin
if output.text <> '' then
begin
if operation = '0' then
begin
a:=strtofloat(output.text);
operation:='*';
output.text:='';
end
else
begin
b:=strtofloat(output.text);
if (operation='/') and (b=0) then
begin
output.text:='Невозможно';
Exit;
end;
case operation of
'+':a:=a+b;
'-':a:=a-b;
'*':a:=a*b;
'/':a:=a/b;
end;
operation := '*';
output.text := '';
end;
end
else
operation:='*';
end;
end;

procedure TForm1.ButtonoppClick(Sender: TObject);
var
  c:real;
begin
   if output.text = 'Невозможно' then
  begin
  a:=0;
  b:=0;
  operation:='0';
  output.text:='';
  end
   else
   begin
   c:=strtofloat(output.text);
   if c=0 then
   begin
   output.text:='Невозможно';
   Exit;
   end
   else
   begin
  c:=1/c;
  output.text:=floattostr(c);
   end;
   end;
end;

procedure TForm1.ButtonplusClick(Sender: TObject);
begin
   if output.text = 'Невозможно' then
  begin
  a:=0;
  b:=0;
  operation:='0';
  output.text:='';
  end
else
begin
  if output.text <> '' then
  begin
  if operation = '0' then
  begin
  a:=strtofloat(output.text);
  operation:='+';
  output.text:='';
  end
  else
  begin
  b:=strtofloat(output.text);
  if (operation='/') and (b=0) then
  begin
  output.text:='Невозможно';
  Exit;
  end;
  case operation of
  '+':a:=a+b;
  '-':a:=a-b;
  '*':a:=a*b;
  '/':a:=a/b;
  end;
  operation:='+';
  output.text:='';
  end;
  end
  else
  operation:='+';
end;
end;

procedure TForm1.ButtonsqrClick(Sender: TObject);
var c:real;
begin
  if output.text = 'Невозможно' then
  begin
  a:=0;
  b:=0;
  operation:='0';
  output.text:='';
  end
  else
  begin
  c:=strtofloat(output.text);
  c:=c*c;
  output.text:=floattostr(c);
  end;
end;

procedure TForm1.ButtonsqrtClick(Sender: TObject);
var a:real;
begin
  if output.text = 'Невозможно' then
  begin
  a:=0;
  b:=0;
  operation:='0';
  output.text:='';
  end;
  if (output.text='')then
  output.text:=''
  else
    begin
    a:=strtofloat(output.text);
    if a<0 then
    begin
    output.text:='Невозможно';
    b:=0;
    a:=0;
    operation:='0';
    end
    else
    begin
    a:=sqrt(a);
    output.text:=floattostr(a);
    end;
    end;
end;

procedure TForm1.buttoncloseClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if output.text = 'Невозможно' then
  begin
  a:=0;
  b:=0;
  operation:='0';
  output.text:='1';
  end
  else
  begin
    countstring:=output.text;
  if length(countstring)<15 then
  begin
    countstring:=countstring + '1';
    output.text:=countstring;
  end;
   end;
end;

procedure TForm1.Button0Click(Sender: TObject);
begin
  countstring:=output.text;
  if output.text = 'Невозможно' then
  begin
  a:=0;
  b:=0;
  operation:='0';
  output.text:='0';
  end
  else
  begin
  if length(countstring)<15 then
  begin
    countstring:=countstring + '0';
    output.text:=countstring;
  end;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   countstring:=output.text;
   if output.text = 'Невозможно' then
  begin
  a:=0;
  b:=0;
  operation:='0';
  output.text:='2';
  end
   else
   begin
  if length(countstring)<15 then
  begin
    countstring:=countstring + '2';
    output.text:=countstring;
  end;
   end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
countstring:=output.text;
   if output.text = 'Невозможно' then
     begin
     a:=0;
     b:=0;
     operation:='0';
     output.text:='3';
     end
   else
   begin
 if length(countstring)<15 then
 begin
   countstring:=countstring + '3';
   output.text:=countstring;
 end;
   end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
   countstring:=output.text;
   if output.text = 'Невозможно' then
  begin
  a:=0;
  b:=0;
  operation:='0';
  output.text:='4';
  end
   else
   begin
  if length(countstring)<15 then
  begin
    countstring:=countstring + '4';
    output.text:=countstring;
  end;
   end;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
   countstring:=output.text;
   if output.text = 'Невозможно' then
  begin
  a:=0;
  b:=0;
  operation:='0';
  output.text:='5';
  end
   else
   begin
  if length(countstring)<15 then
  begin
    countstring:=countstring + '5';
    output.text:=countstring;
  end;
   end;
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
   countstring:=output.text;
   if output.text = 'Невозможно' then
  begin
  a:=0;
  b:=0;
  operation:='0';
  output.text:='6';
  end
   else
   begin
  if length(countstring)<15 then
  begin
    countstring:=countstring + '6';
    output.text:=countstring;
  end;
   end;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  countstring:=output.text;
  if output.text = 'Невозможно' then
  begin
  a:=0;
  b:=0;
  operation:='0';
  output.text:='7';
  end
  else
  begin
  if length(countstring)<15 then
  begin
    countstring:=countstring + '7';
    output.text:=countstring;
  end;
  end;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  countstring:=output.text;
  if output.text = 'Невозможно' then
  begin
  a:=0;
  b:=0;
  operation:='0';
  output.text:='8';
  end
  else
  begin
  if length(countstring)<15 then
  begin
    countstring:=countstring + '8';
    output.text:=countstring;
  end;
  end;
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
   countstring:=output.text;
   if output.text = 'Невозможно' then
  begin
  a:=0;
  b:=0;
  operation:='0';
  output.text:='9';
  end
   else
   begin
  if length(countstring)<15 then
  begin
    countstring:=countstring + '9';
    output.text:=countstring;
  end;
   end;
end;

procedure TForm1.ButtonanswerClick(Sender: TObject);
var
  b: Double;
begin
  if output.text = 'Невозможно' then
  begin
  a:=0;
  b:=0;
  operation:='0';
  output.text:='';
  end
  else
  begin
  if (operation='0') and (a=0) and (output.text<>'') then
  begin
  exit;
  end;
  if output.text='' then
  begin
  output.text:=floattostr(a);
  operation:='0';
  end
  else
  begin
  b:=strtofloat(output.text);
  if (b=0) and (operation='/') then
    begin
    output.text :='Невозможно';
    exit;
    end;
    case operation of
    '+':a:=a+b;
      '-':a:=a-b;
      '*':a:=a*b;
      '/':a:=a/b;
    else
      a:=b;
    end;
    output.text:=floattostr(a);
    operation:='0';
  end;
  end;
end;

procedure TForm1.ButtonbackspaceClick(Sender: TObject);
var
  str,str2:string;
  i:integer;
begin
  str2:='';
 str:=output.text;
 if str<>'' then
 if str='Невозможно' then
 begin
 output.text:='';
 a:=0;
 operation:='0';
 b:=0;
 end
 else
 begin
 for i:=1 to length(str)-1 do
    begin
      str2+=str[i];
    end;
 output.text:=str2;
 end;
end;

procedure TForm1.ButtoncClick(Sender: TObject);
begin
 b:=0;
  a:=0;
  operation:='0';
  output.text:='';
end;

procedure TForm1.ButtonceClick(Sender: TObject);
begin
 if output.text<>'Невозможно' then
 begin
 output.text:='';
 end
 else
 begin
 output.text:='';
 a:=0;
 b:=0;
 operation:='0';
 end;
end;

end.

