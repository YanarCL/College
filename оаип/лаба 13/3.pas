program qq; //Дан файл вещественных чисел. Создать два новых файла, первый из которых содержит элементы исходного файла с нечетными номерами (1,3,…), а второй — с четными (2,4,…).
var
  vesFile: file of real;
  nechFile: file of real;
  chFile: file of real;
  number: real;
  index, n: integer;
begin
  assign(vesFile, 'D:\лаба 13\vesch.txt');    
  assign(nechFile, 'D:\лаба 13\nechyot.txt');        
  assign(chFile, 'D:\лаба 13\chyot.txt');        
  rewrite(vesFile);  
  write('Введите количество чисел: ');
  readLn(n);
  for index := 1 to n do
  begin
    write('Введите число ', index, ': ');
    readLn(number); 
    write(vesFile, number); 
  end;
  close(vesFile); 
  reset(vesFile);
  rewrite(nechFile);
  rewrite(chFile);
  index := 1;
  while not eof(vesFile) do
  begin
    read(vesFile, number); 
    if index mod 2 = 1 then
      write(nechFile, number)  
    else
      write(chFile, number); 
    index := index + 1; 
  end;
  close(vesFile);
  close(nechFile);
  close(chFile);
  writeln('Числа на нечётных позициях:');
  reset(nechFile);
  while not eof(nechFile) do
  begin
    read(nechFile, number);
    write(number:0:2, ' ');
  end;
  close(nechFile);
  writeln; 
  writeln('Числа на чётных позициях:');
  reset(chFile);
  while not eof(chFile) do
  begin
    read(chFile, number);
    write(number:0:2, ' ');
  end;
  close(chFile);
end.