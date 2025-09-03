uses GraphABC;
var x,y:integer;
begin
SetWindowWidth(600);
SetWindowHeight(600);
  x:=40;
  y:=530;
  repeat
    begin
    ClearWindow;
    Rectangle(x,y,x+40,y+40);
    FloodFill(x, y,clblack);
    x+=1;
    y-=2;
    end;
until y=60;
repeat
  begin
    ClearWindow;
    Rectangle(x,y,x+40,y+40);
    FloodFill(x, y,clblack);
    x+=1;
    y+=2;
  end;
until y=530;
end.