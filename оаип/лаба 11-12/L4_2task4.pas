program qq;
uses GraphABC;
var a,r:integer;
begin
  SetWindowWidth(800);
SetWindowHeight(800);
  r:=250;
  for a:=1 to 20 do
    begin
    circle(400,400,r);
    r-=10;
  end;
end.

