program qq;

var
  inputFile, outputFile: text;//Имя входного файла: z3.in
//Имя выходного файла: z3.out
//nайти сумму всех чисел от 1 до n, имеющих ровно 5 делителей.
//Единица и само число входят в число его делителей.
  n, i, j, sum: integer;
  count: integer;

function func(x: integer): integer;
var
  i, count: integer;
begin
  count := 0;
  for i := 1 to trunc(sqrt(x)) do
  begin
    if x mod i = 0 then
    begin
      if i * i = x then
        count := count + 1
      else
        count := count + 2;
    end;
  end;
  func := count;
end;

begin
  assign(inputFile, 'd:\z3.in.txt');
  reset(inputFile);
  readln(inputFile, n);
  close(inputFile);

  sum := 0;

  for i := 1 to n do
  begin
    if func(i) = 5 then
      sum := sum + i;
  end;

  assign(outputFile, 'd:\z3.out.txt');
  rewrite(outputFile);
  writeln(outputFile, sum);
  close(outputFile);
end.