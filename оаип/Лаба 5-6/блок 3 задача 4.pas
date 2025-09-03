program qq;

var
  original: array[1..20] of Integer;
  result: array[1..40] of Integer;
  i, j: Integer;

begin
  Randomize;
  for i := 1 to 20 do
  begin
    original[i] := Random(201) - 100;
  end;
  WriteLn('Оригинальный массив:');
  for i := 1 to 20 do
  begin
    Write(original[i], ' ');
  end;
  WriteLn;
  j := 1;
  for i := 1 to 20 do
  begin
    if original[i] > 0 then
    begin
      result[j] := 0; // Вставка нуля
      Inc(j);
      result[j] := original[i];
    end
    else
    begin
      result[j] := original[i];
    end;
    Inc(j);
  end;
  WriteLn('Результирующий массив:');
  for i := 1 to j - 1 do
  begin
    Write(result[i], ' ');
  end;
  WriteLn;
end.

