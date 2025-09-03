program peremennaya;

var
  a, b: integer;

begin
  writeln('введите 2 целых числа в уравнение ax+b вместо значений a,b соответственно: ');
  readln(a, b);
  begin
    if a <> 0 then 
      writeln('уравнение имеет 1 корень');
  end;
  begin
    if (a = 0) and (b = 0) then
      writeln('уравнение имеет бесконечно много корней');
  end;
  begin
    if (a = 0) and (b <> 0) then
      writeln('нет решений');
  end;
end.