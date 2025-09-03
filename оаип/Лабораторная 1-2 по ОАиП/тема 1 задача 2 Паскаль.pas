program qq;

var
  L,S: real;

begin
  writeln('введите длину окружности: ');
  Readln(L);
  S := (L * L) / (4 * pi);
  writeln('Площадь круга равна: ', S)
end.