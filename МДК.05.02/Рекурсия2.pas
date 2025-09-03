var x: integer;
   function sum (a: integer): integer;//параметризация
   begin
        if (a<=1) then //база
          a:=1
        else
          a:=a+(sum(a-1));//декомпозиция
   sum:=a;
end;
begin
writeln('Число?');
readln(x);
writeln('сумма: ',sum(x));
end.