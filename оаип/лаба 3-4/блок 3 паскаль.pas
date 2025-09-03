program qq;
var
  A1, A2, A3, A4,point: real;
 Points, i,c1, c2, c3: integer;  
begin
  writeln('Введите координаты точек отрезков (A1, A2, A3, A4):');
  readln(A1, A2, A3, A4);
  c1 := 0; 
  c2 := 0; 
  c3 := 0;
  writeln('Введите количество точек:');
  readln(Points);
  i := 1;
  repeat
    writeln('Введите координату точки ', i, ':');
    readln(point);
    i+=1;
    if (point >= A1) and (point <= A2) then
      c1+=1
    else if (point > A2) and (point <= A3) then
      c2+=1
    else if (point > A3) and (point <= A4) then
      c3+=1;
    until i> Points;
  writeln('Количество точек в отрезке A1-A2: ', c1);
  writeln('Количество точек в отрезке A2-A3: ', c2);
  writeln('Количество точек в отрезке A3-A4: ', c3);
end.