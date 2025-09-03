uses GraphABC;
uses P;
procedure dvizh(a:integer);
begin
  case a of
    VK_Up:
      begin
        y:=y-5;
      end;
    VK_Down:
      begin
        y:=y+5;
      end;
    VK_Left:
      begin
        x:=x-5;
      end;
    VK_Right:
      begin
        x:=x+5;
      end;
  end;
  Window.Clear;
end;
procedure glub(b:integer); 
begin
  case b of
    VK_w:depth:=depth+1;
    VK_s:depth:=depth-1;
  end;
  Window.Clear;
end;
procedure maschtab(c: char);
begin
  case c of
    'd': step := step + 1;
    'a': 
      if step > 1 then
        step := step - 1;
  end;
  Window.Clear;
end;
begin
  LockDrawing;
  SetWindowSize(500, 500);
  x:=100;
  y:=100;
  step:=10;
  depth:=2;
  repeat
    begin
  Window.Clear;    
  MoveTo(x, y);
  Fractal(depth, -1);
  onKeyDown:=dvizh;
  onKeyUp := glub;
  onKeyPress:=maschtab;
  end;
    redraw;
sleep(1);
  until false;
end.