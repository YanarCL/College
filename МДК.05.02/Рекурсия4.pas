procedure LoopFor(i, n: integer); //параметризация
{Первый параметр – счетчик шагов, второй параметр – общее количество шагов}
begin
  if i <= n then 
  begin
    
    LoopFor(i + 1, n);//декомпозиция
    writeln('привет ', i);
  end;// база i>n
end;

begin
  LoopFor(1, 10);
end.