program qq; //Дан файл вещественных чисел. Найти сумму его элементов с четными номерами.
var
  textfile: file of real;
  num, sum,number: real;
  index,i,n: integer;
begin
  sum := 0;
  writeln('Введите количество чисел');
  readln(n);
  assign(textfile, 'D:\лаба 13\sum.txt');
  rewrite(textfile);
  for i:=1 to n do
  begin
    write('Введите число ', i, ': ');
    readLn(number); 
    write(textfile, number);
    if i mod 2 = 0 then
      begin
      sum+=number;
      end;
  end;
  close(textfile);
  writeln('Сумма элементов с четными номерами: ', sum:0:2);
end.