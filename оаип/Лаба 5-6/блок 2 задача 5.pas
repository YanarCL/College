var 
  a: array[1..100] of integer;
  i, n, j, count, max, imax: integer;
begin
  read(n);
  for i:=1 to n do
    read(a[i]);
  max:=1; imax:=1;
  for i:=1 to n do
  begin
    count:=0;
    for j:=i to n do begin
      if a[i]=a[j] then count+=1
      end;
    if count>max then begin max:=count; imax:=i end;
  end;
  writeln(a[imax]);
    if imax=1 then
    writeln('В массиве нет максималльного числа');
end.