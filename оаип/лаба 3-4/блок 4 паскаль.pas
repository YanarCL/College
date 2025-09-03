program qq;
var
  n, i, max_power: Integer;
  number: Integer;
  power: Real;
  numbers: array of Integer;
  powers: array of Real;
  total_power, average_power: Real;
begin
  Write('Введите количество предприятий: ');
  ReadLn(n);
  SetLength(numbers, n);
  SetLength(powers, n);
  for i := 0 to n - 1 do
  begin
    Write('Введите порядковый номер предприятия ', i + 1, ': ');
    ReadLn(number);
    numbers[i] := number;
    Write('Введите энергетическую мощность предприятия ', i + 1, ': ');
    ReadLn(power);
    powers[i] := power;
  end;
  total_power := 0;
  for i := 0 to n - 1 do
    total_power := total_power + powers[i];
  average_power := total_power / n;
  max_power := 0;
  for i := 1 to n - 1 do
    if powers[i] > powers[max_power] then
      max_power := i;
  WriteLn(Format('Общая мощность по отрасли: ', [total_power]));
  WriteLn(Format('Средняя мощность по отрасли: ', [average_power]));
  WriteLn('Порядковый номер предприятия с наибольшей мощностью: ', numbers[max_power]);
end.