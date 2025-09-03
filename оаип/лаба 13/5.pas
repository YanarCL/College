program qq; //Дан файл вещественных чисел. Найти его последний локальный максимум (локальным максимумом называется элемент, который больше своих соседей).
var
  i,ind,j,res:integer;
  filetext: file of integer;
  ARR: array[1..10] of integer;
  begin
  assign(filetext,'D:\лаба 13\lokmax.txt');
  rewrite(filetext);
  write('Введите числа');
  for i:=1 to 10 do 
    begin
    readln(arr[i]);
    write(filetext, arr[i]);
    end;
  writeln('Числа записаны');
  ind:=0;
  for j:=2 to 9 do
  begin
    if (ARR[j]>ARR[j+1]) and (ARR[j]>ARR[j-1]) then
      begin
      ind:=j;
      res:=ARR[j];
      end;
  end;
  if ind= 0 then
    writeln('Локальных максимумов нет')
  else
    begin
  writeln('Последний локальный максимум: ', res);
  end;
  close(filetext);
  end.