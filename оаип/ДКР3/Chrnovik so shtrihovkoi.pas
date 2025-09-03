Uses GraphAbc;
var x,y,x0,y0,w,h,n,y3,x3,l,x4,y4,x5,y5:integer;
x1,y1,a,b,k,Sh,y2,x2:real;
function Func(x: Real): Real;
begin
  Func := x * x * x + 1 * x + 12; 
end;
begin
  writeln('Введите ширину: ');
  readln(w);
  writeln('Введите высоту: ');
  readln(h);
  setwindowsize(w,h);
  l:=1;
  x0:= w div 2;
  Y0:= h div 2;
  TextOut (h-40,y0,'Ось Х');
  TextOut (x0-40,20,'Ось Y');
  line(10,y0,w-10,y0);
  line(x0,10,x0,h-10);
  k:=25;
  writeln('Введите пределы участка для графика: ');
  readln(a,b);
  x1:=a;
  while x1<=b do
  begin
    y1:=func(x1);
    x:=x0 + round(x1*k);
    y:=y0 - round(y1*k);
    setpixel(x,y,cllime);
    x1+=0.0001;
    end;
    writeln('Введите данные о трапециях: ');
    readln(a,b,n);
    sh:=(b-a)/n;
    x1:=a;
     while x1<=b do
  begin
    y1:=func(x1);
    y2:=func(x1+sh);
    x2:=x1+sh;
    x:=x0 + round(x1*k);
    x3:=x0 + round(x2*k);
    y:=y0 - round(y1*k);
    y3:=y0 - round(y2*k);
    line(x,y,x,y0,clblue);
    if x1<>b then 
    line(x,y,x3,y3,clblue);
    x4:=x3;
    y4:=y3;
    x5:=x;
    y5:=y;
   begin //начало штриховки 
    repeat
      x4-=10;
      y4-=10;
      x5-=10;
      y5-=10;
      l+=10;
      line(x5,y5,x4,y4,clblue);
    until l=x3;
    end;
    x1+=sh;
  end;
end.