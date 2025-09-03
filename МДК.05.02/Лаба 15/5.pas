program qq;
//Требуется написать программу, которая в зависимости от числа добавляет правильное окончание.
var 
  a: integer;
  god, goda, let: set of byte;
begin
  god := [1];
  goda := [2, 3, 4];
  writeln('Введите год');
  readln(a);
  if (a mod 10 in god) then
    if (a div 10 mod 10 <> 1) then
      writeln(a,' год')
    else
      writeln(a,' лет')
  else if (a mod 10 in goda) then
    if (a div 10 mod 10 <> 1) then
      writeln(a,' года')
    else
      writeln(a,' лет')
  else
    writeln(a,' лет');
  end.