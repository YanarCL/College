program koordinati;

var
  x, y: integer;

begin
  writeln('введите координаты X и Y точки: ');
  readln(x, y);
  if (x > 0) and (y > 0) then 
    writeln('точка находится в первой координатной четверти');
  if (x < 0) and (y > 0) then 
    writeln('точка находится во второй координатной четверти');
  if (x < 0) and (y < 0) then 
    writeln('точка находится в третьей координатной четверти');
  if (x > 0) and (y < 0) then 
    writeln('точка находится в четвертой координатной четверти');
end.