procedure row(n:integer); //параметризация
begin
     if n >=1 then begin 
        write (n, ' ');
        row(n-2)//декомпозиция
     end;
     if n=1 then //база 
       write(0);
end;
begin
    row(31);
end. 