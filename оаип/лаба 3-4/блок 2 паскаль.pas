program qq;
var a,b,c:integer;
begin
writeln('������� ��������� �������� ');
readln(b);
writeln('������� ���������� ����� ');
readln(a);
while c<a do
begin
b*=2;
c+=1;
if c>=a then
break;
end;
writeln(b);
end.
