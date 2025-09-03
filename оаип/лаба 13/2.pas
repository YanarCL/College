program qq; // Дан строковый файл. Создать новый строковый файл, содержащий все строки исходного файла наибольшей длины (в обратном порядке).
var
  textfile1, textfile2: file of char;
  s, max, s1: string;
  i, j, n: integer;
  ch: char;
  lines: array of string;
begin
  assign(textfile1, 'D:\лаба 13\text3.txt');  
  rewrite(textfile1);
  Write('Введите количество строк: ');
  ReadLn(n);  { Вводим количество строк }

  { Ввод строк с клавиатуры и запись их в файл }
  for j := 1 to n do
  begin
    Write('Введите строку ', j, ': ');
    ReadLn(s);  { Считываем строку с клавиатуры }
    for i := 1 to length(s) do
      write(textfile1, s[i]);  { Записываем строку в файл посимвольно }
    write(textfile1, #10);  { Записываем символ новой строки }
  end;
  close(textfile1);

  setlength(lines, 0);
  reset(textfile1);
  s := '';
  while not eof(textfile1) do
  begin
    read(textfile1, ch);
    if ch = #10 then
    begin
      if length(s) > 0 then
      begin
        setlength(lines, length(lines) + 1);
        lines[high(lines)] := s;
      end;
      s := '';
    end
    else
      s := s + ch;
  end;

  if length(s) > 0 then
  begin
    setlength(lines, length(lines) + 1);
    lines[high(lines)] := s;
  end;
  close(textfile1);

  assign(textfile2, 'D:\лаба 13\text4.txt');  
  rewrite(textfile2);

  for i := high(lines) downto 0 do
  begin
    s := lines[i];
    s1 := '';
    for j := length(s) downto 1 do
      s1 := s1 + s[j];
    for j := 1 to length(s1) do
      write(textfile2, s1[j]);
    write(textfile2, #10);
  end;

  writeln('Программа выполнена');    
  close(textfile2);  
end.