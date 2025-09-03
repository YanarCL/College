program qq;

var
  x, y: integer; 
  q: String;

begin
  Write('Введите клетку шахматной доски: '); 
  ReadLn(q);
  x := 0; 
  y := 0;
  if Length(q) = 2 then 
  begin
    if q[1] in ['a'..'h'] then x := Ord(q[1]);
    if q[2] in ['1'..'8'] then y := Ord(q[2]); 
  end; 
  if (x = 0) or (y = 0) then WriteLn('Не правильно! '); 
  if (x + y)mod 2 = 0 then WriteLn('BLACK')
  else WriteLn('WHITE');
end.