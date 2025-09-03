unit P;
uses GraphABC;
var
  angle: integer := 1;
  x,y,depth,step: integer;
procedure Draw();
begin
  angle := angle mod 4;
  case angle of
    0: LineRel(Step, 0);
    1,-3: LineRel(0, Step);
    2,-2: LineRel(-Step, 0);
    3,-1: LineRel(0, -Step);
  end;
end;
procedure Fractal(depth: integer; dividedAngle: integer); //параметризация
begin
  if (depth <= 0) then  exit //база
  else
    begin
  Dec(depth);
  Fractal(depth, dividedAngle);
  Draw();
  Fractal(depth, -dividedAngle);
  Draw();
  Fractal(depth, dividedAngle);
  angle += dividedAngle;
  Draw();
  angle += dividedAngle;
  Fractal(depth, -dividedAngle);
  Draw();
  Fractal(depth, dividedAngle);
  Draw();
  Fractal(depth, -dividedAngle);
  angle -= dividedAngle;
  Draw();
  angle -= dividedAngle;
  Fractal(depth, dividedAngle);
  Draw();
  Fractal(depth, -dividedAngle);
  Draw();
  Fractal(depth, dividedAngle); //декомпозиция
  end;
end;
begin
  Fractal(depth, -1)
end.