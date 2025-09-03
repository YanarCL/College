var
  x, y: integer;

function stepen(a, b: integer): integer; //параметризация
begin
  if b = 0 then //база
    stepen := 1
  else
    stepen := a * stepen(a, b - 1);//декомпозиция
end;

begin
  writeln('число?');
  readln(x);
  writeln('степень?');
  readln(y);
  writeln('число ',x,'в степени ',y,': ',stepen(x, y));
end.