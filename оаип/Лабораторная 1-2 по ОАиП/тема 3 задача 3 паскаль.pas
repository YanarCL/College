program koordinati;

var
  x, y: integer;

begin
  writeln('������� ���������� X � Y �����: ');
  readln(x, y);
  if (x > 0) and (y > 0) then 
    writeln('����� ��������� � ������ ������������ ��������');
  if (x < 0) and (y > 0) then 
    writeln('����� ��������� �� ������ ������������ ��������');
  if (x < 0) and (y < 0) then 
    writeln('����� ��������� � ������� ������������ ��������');
  if (x > 0) and (y < 0) then 
    writeln('����� ��������� � ��������� ������������ ��������');
end.