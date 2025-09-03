program qq;
var a,b,c,g,i,max,min,f: integer;
D:ARRAY[1..20] of integer;
begin
 randomize;
 for b:= 1 to 20 do
 begin
   D[b]:= random(118) - 52;
   end;
   writeln(D);
Max := 0;
For i := 2 to 20 do if D[i]>Max then 
  begin
  Max := D[i];
c:=i;
  end;
Writeln('Максимальный Элемент массива = ',Max,', ','Номер маскимального элемента = ',c) ;
Min := 60;
For i :=2 to 20 do if (Min>D[i]) and (D[i]>0) then 
  begin
  Min:= D[i];
  f:=i;
  end;
Writeln('Минимальный положительный Элемент массива = ',Min,', ','Номер минимального элемента = ',f);
a := 0;
For i := 1 to 20 do 
  begin
  if (D[i] mod 5 )= 0 then
  begin
  a := D[i];
  g:=i;
  end;
  end;
Writeln(' номер последнего элемента массива, кратного 5 = ',c) ;
end.