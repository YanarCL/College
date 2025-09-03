Uses GraphABC;

var
  x, y, x0, y0, w, h, n, y3, x3: integer;
  x1, y1, a, b, k, Sh, y2, x2,result: real;

type
  FuncType = function(x: Real): Real;

function Func(x: Real): Real;
begin
  Func := x * x * x + 1 * x + 12; 
end;
function Primitive(x: Real): Real;
begin
  Primitive := (x * x * x * x) / 4 + (x * x) / 2 + 12 * x; 
end;

function ExactIntegral(a, b: Real): Real;
begin
  ExactIntegral := Primitive(b) - Primitive(a);
end;

function Traps(Func: FuncType; a, b: Real; n: Integer): Real;
var
  h, s, xi: Real;
  i: Integer;
begin
  h := (b - a) / n;
  s := 0.0;
  for i := 0 to n - 1 do
  begin
    xi := a + i * h;
    s := s + h * (Func(xi) + Func(xi + h)) / 2;
  end;
  Traps := s;
end;

begin
  writeln('Введите ширину: ');
  readln(w);
  writeln('Введите высоту: ');
  readln(h);
  SetWindowSize(w, h);
  x0 := w div 2;
  y0 := h div 2;
  TextOut(h - 40, y0, 'Ось Х');
  TextOut(x0 - 40, 20, 'Ось Y');
  TextOut(0,0,'построить график функции, ограниченной кривой x * x * x + 1 * x + 12');
  Line(10, y0, w - 10, y0);
  Line(x0, 10, x0, h - 10);
  writeln('Введите масштаб графика(лучше 25)');
  readln(k);
  writeln('Введите пределы участка для графика: ');
  readln(a, b);
  x1 := a;
  
  // Рисуем график функции
  while x1 <= b do
  begin
    y1 := Func(x1);
    x := x0 + Round(x1 * k);
    y := y0 - Round(y1 * k);
    SetPixel(x, y, clLime);
    x1 += 0.0001;
  end;
  
  writeln('Введите данные о трапециях: ');
  readln(a, b, n);
  sh := (b - a) / n;
  x1 := a;
  result := Traps(Func, a, b, n);
           Writeln('Приближенное значение интеграла: ', result);
  // Рисуем трапеции и штриховку
  while x1 <= b do
  begin
    y1 := Func(x1);
    y2 := Func(x1 + sh);
    x2 := x1 + sh;
    x := x0 + Round(x1 * k);
    x3 := x0 + Round(x2 * k);
    y := y0 - Round(y1 * k);
    y3 := y0 - Round(y2 * k);
    SetPenWidth(3);
    Line(x, y, x, y0, clBlue);
    if round(x1) <> b then
     begin
      Line(x, y, x3, y3, clBlue);
    // Штриховка трапеций
    var i: integer;
    i:=x;
    while i<x3 do
    begin
      var y_start := y0 - Round(Func(x1 + (i - x) / k) * k);
      setpenwidth(1);
      Line(i, y_start, i, y0, clred);
      i+=4;
    end;
    end;
    x1 += sh;
  end;
end. 