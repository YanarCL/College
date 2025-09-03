program qq;
var
  n, i, max_power: Integer;
  number: Integer;
  power: Real;
  numbers: array of Integer;
  powers: array of Real;
  total_power, average_power: Real;
begin
  Write('������� ���������� �����������: ');
  ReadLn(n);
  SetLength(numbers, n);
  SetLength(powers, n);
  for i := 0 to n - 1 do
  begin
    Write('������� ���������� ����� ����������� ', i + 1, ': ');
    ReadLn(number);
    numbers[i] := number;
    Write('������� �������������� �������� ����������� ', i + 1, ': ');
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
  WriteLn(Format('����� �������� �� �������: ', [total_power]));
  WriteLn(Format('������� �������� �� �������: ', [average_power]));
  WriteLn('���������� ����� ����������� � ���������� ���������: ', numbers[max_power]);
end.