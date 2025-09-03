program qq;
var a:string;
b:integer;
begin 
  readln(a);
  while 'Nikolay' in a do
begin
  b:=Pos('Nikolay', a);
  Delete(a, b, 7);
   Insert('Oleg', a, b);
   end;
  writeln(a);
end.