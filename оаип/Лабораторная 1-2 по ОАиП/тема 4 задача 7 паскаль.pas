program peremennaya;

var
  a, b: integer;

begin
  writeln('������� 2 ����� ����� � ��������� ax+b ������ �������� a,b ��������������: ');
  readln(a, b);
  begin
    if a <> 0 then 
      writeln('��������� ����� 1 ������');
  end;
  begin
    if (a = 0) and (b = 0) then
      writeln('��������� ����� ���������� ����� ������');
  end;
  begin
    if (a = 0) and (b <> 0) then
      writeln('��� �������');
  end;
end.