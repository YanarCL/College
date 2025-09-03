function NOD(a, b: integer): integer; //параметризация
begin
  if b = 0 then //база
    NOD := a
  else
    NOD := NOD(b, a mod b); //декомпозиция
end;

begin
  writeln('НОД для чисел 3430 и 1365: ', NOD(36, 48));
end.