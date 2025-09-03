program qq;

var
  x, y : integer;

begin
  readln(x);
  for x := 0 to 5 do
  begin
    y:=x*x*x - 3*(x*x) + 4*x -2;
    writeln(y)
  end;
end.