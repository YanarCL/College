program qq;
var
  A1, A2, A3, A4,point: real;
 Points, i,c1, c2, c3: integer;  
begin
  writeln('������� ���������� ����� �������� (A1, A2, A3, A4):');
  readln(A1, A2, A3, A4);
  c1 := 0; 
  c2 := 0; 
  c3 := 0;
  writeln('������� ���������� �����:');
  readln(Points);
  i := 1;
  repeat
    writeln('������� ���������� ����� ', i, ':');
    readln(point);
    i+=1;
    if (point >= A1) and (point <= A2) then
      c1+=1
    else if (point > A2) and (point <= A3) then
      c2+=1
    else if (point > A3) and (point <= A4) then
      c3+=1;
    until i> Points;
  writeln('���������� ����� � ������� A1-A2: ', c1);
  writeln('���������� ����� � ������� A2-A3: ', c2);
  writeln('���������� ����� � ������� A3-A4: ', c3);
end.