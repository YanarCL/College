procedure fib(i, n: integer); //параметризация
begin
    writeln(i + n, ' '); 
    if n < 55 then 
        fib(n, i + n);//декомпозиция
end;
//база n>=55
begin
    fib(0, 1);
end.
