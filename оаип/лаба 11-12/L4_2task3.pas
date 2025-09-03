program DrawCircles;

uses
  GraphABC;

var
  x, y: Integer;
  radius,i: Integer;
begin
  x := 50; 
  for i := 0 to 8 do 
  begin
    Circle(x, 100, 10); 
    FloodFill(x, 100,(rgb(random(256), random(256), random(256)))); 
    x := x + 30; 
  end;
end.
