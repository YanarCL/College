program qq;//Дан файл вещественных чисел. Поменять в нем местами минимальный и максимальный элементы.
var
  i,indmax,indmin,max,min:integer;
  filetext,filetext2: file of integer;
  arr: array[1..10] of integer;
  begin
  assign(filetext,'D:\лаба 13\minmax.txt');
  assign(filetext2,'D:\лаба 13\minmax2.txt');
  rewrite(filetext);
  writeln('Введите числа');
  for i:=1 to 10 do 
    begin
    readln(arr[i]);
    write(filetext, arr[i]);
    end;
  writeln('Числа записаны');
  rewrite(filetext2);
  indmax:=0; 
  indmin:=0;
  max:=-2147483647; 
  min:=2147483647;
  for i:=1 to 10 do
  begin
    if arr[i] > max then
      begin
      max:=arr[i];
      indmax:=i;
      end;
    if arr[i] < min then
      begin
      min:=arr[i];
      indmin:=i;
      end
  end;
  if indmax=0 then
    indmax+=1;
  if indmin=0 then
    indmin+=1;
  arr[indmax]:= min;
  arr[indmin]:= max;
  writeln('Массив: ', arr);
  for i:=1 to 10 do
  begin
    write(filetext2,arr[i]);
  end;
  close(filetext);
  close(filetext2);
  end.