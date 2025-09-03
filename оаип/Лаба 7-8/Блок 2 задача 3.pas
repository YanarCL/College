program qq;
var a,b:string;
c,d,s,f:integer;
begin
  write('ведите первую строку: ');
  readln(a);
  write('введите вторую строку: ');
  readln(b);
  c:=length(a);
  d:=length(b);
  if c>d then
    begin
    f:=c-d;
    for s:=1 to f do
      begin
      writeln(a);
      end;
      end
   else if c=d then 
    begin
    writeln(a);
    writeln(b);
    end;
   if c<d then
    begin
    f:=d-c;
    for s:=1 to f do
    begin
      writeln(b);
    end;
    end;     
end.