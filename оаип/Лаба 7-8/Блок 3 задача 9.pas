program qq;
var
c, d, count: integer; 
a,b:string;
e: ARRAY[1..100] of string;
begin
  writeln('Введите логины через запятую ');
  readln(a);
  a += ',';
  c := 0;
  d := 1;
  count := 0;
  while a<>'' do
    begin
    c+=1;
    if a[c]=',' then
    begin
    b:=Copy(a,1,(c-1));
   b:=LowerCase(b);
    e[d]:=b;
    d+=1;
    Delete(a, 1, c);
    c:=0;
    count+=1
    end;
    end;
  d := 1;
  for d:=1 to count do  writeln(e[d])
end.