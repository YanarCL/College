program qq;

var
  b, c, p,v: integer;
  t: array of integer;  //глобальные переменные 

function fun(t: array of integer): integer;   //формальный параметр, по значению
var
  d, i: integer;       //локальные переменные 
begin
  d := 0;
  for i := Low(t) to High(t) do
  begin
    if t[i] > 0 then
    begin
      fun := i + 1; 
      Exit;
    end;
  end;
  fun := 0; 
end;
function minun(t: array of integer): integer;  //формальный параметр, по значению
var
  l, i: integer;      //локальные переменные
begin
  l := 0;
  for i := Low(t) to High(t) do
  begin
    if t[i] < l then
    begin
      minun := i + 1; 
    end;
  end;
end;

begin
  writeln('Введите количество элементов: ');
  readln(b);
  SetLength(t, b); 
  randomize; 
  for c := 0 to b - 1 do
  begin
    t[c] := random(100) - 50;
    write(t[c], ' '); 
  end;
  writeln;
  
  p := fun(t); // фактический параметр
  v:= minun(t); // фактический параметр
  writeln('Номер первого положительного элемента: ', p);
  writeln('Номер последнего отрицательного элемента: ', v);
end.