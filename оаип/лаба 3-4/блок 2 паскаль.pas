program qq;
var a,b,c:integer;
begin
writeln('Введите количетво бактерий ');
readln(b);
writeln('Введите количество минут ');
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
