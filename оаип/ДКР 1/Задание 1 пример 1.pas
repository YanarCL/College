program qq;

var
  x, a: real;
  e: real;

begin
  e := exp(1);
  writeln('¬ведите значение x');
  readln(x);
  if x < -6 then
  begin
    a := (power(e, x) * (-x) + power(e, x)) / cos(x); 
    writeln(a)
  end
  else
  begin
    if (x < -2) then
    begin
      a := (- power((-x), (1 / 3))) - tan(x);
      writeln(a);
    end
    else 
    begin
      a := cos(x) / ln(x) - log10(x) / (x * x * x);
      writeln(a);
    end;
  end;
end.