program qq;

var
  x, a: real;
  e: real;

begin
  e := exp(1);
  x := -8;
  while x <= 0 do
  begin
    if x < -6 then
    begin
      a := (power(e, x) * (-x) + power(e, x)) / cos(x); 
      writeln(a)
    end
    else
    begin
      if (x < -2) then
      begin
        a := (-power((-x), (1 / 3))) - tan(x);
        writeln(a);
      end
      else 
      begin
        a := cos(x) / ln(Abs(x)) - ln(Abs(x))/ln(10) / (x * x * x);
        writeln(a);
      end;
    end;
    writeln('Y= ',a:0:2,' X= ',x:0:2);
    x += 0.1;
  end;
end.