program qq;
uses GraphABC;
var x,y,r,i:integer;
begin
SetWindowWidth(800);
SetWindowHeight(800);
x:=70;
y:=70;
r:=10;
for i:=1 to 8 do
begin
  circle(x,y,r);
  FloodFill(x, y,(rgb(random(256), random(256), random(256))));
  x+=57;
  y+=40;
  r+=10;
  end;
end.