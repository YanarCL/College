program qq;

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
function Inac(a, b, ans: real): real;
begin
    Inac:=((ExactIntegral(a, b) - ans)/ExactIntegral(a, b))*100
end;
var
  a, b, exactResult, error: Real;
  result: Real;
  n: Integer;
  choice: Integer;

begin
  repeat
    Writeln('Выберите действие:');
    Writeln('1. Вычислить интеграл по методу трапеций');
    Writeln('2. Оценить погрешность');
    Writeln('0. Выход.');

    Readln(choice);

    case choice of
      1: begin
           Write('Введите нижний предел интегрирования (a): ');
           Readln(a);
           Write('Введите верхний предел интегрирования (b): ');
           Readln(b);
           Write('Введите количество трапеций (n): ');
           Readln(n);
           
           result := Traps(Func, a, b, n);
           Writeln('Приближенное значение интеграла: ', result);
         end;
      2: begin
           Write('Введите нижний предел интегрирования (a): ');
           Readln(a);
           Write('Введите верхний предел интегрирования (b): ');
           Readln(b);
           Write('Введите количество трапеций (n): ');
           Readln(n);
           
           result := Traps(Func, a, b, n);
           exactResult := ExactIntegral(a, b);
           error := Abs(Inac(a, b, result));

           Writeln('Приближенное значение интеграла: ', result);
           Writeln('Точное значение интеграла: ', exactResult);
           Writeln('Погрешность: ', error:0:8);
         end;
      0: Writeln('Выход из программы...');
    else
      Writeln('Неверный выбор, попробуйте снова.');
    end;

    Writeln; 

  until choice = 0; 
end.
