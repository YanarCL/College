program qq;
var a,b,c:integer;
begin
writeln('введите число: ');
readln(a);
b:=a div 10 * 100;
c:=b+ a mod 10;
writeln(c);
end.
