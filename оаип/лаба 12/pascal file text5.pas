var
  inputFile, outputFile: text;//В файле input.txt записаны числа (каждое — с новой строки), их количество не превышает 100. Необходимо найти максимальное и минимальное число и записать их в файл output.txt.
  number, max, min: integer;
  firstRead: integer;
begin
  assign(inputFile, 'input.txt');
  reset(inputFile);
  readln(inputFile, firstRead);
  max := firstRead;
  min := firstRead;
  while not eof(inputFile) do
  begin
    readln(inputFile, number);
    if number > max then
      max := number;
    if number < min then
      min := number;
  end;

  close(inputFile);

  assign(outputFile, 'output.txt');
  rewrite(outputFile);

  writeln(outputFile, 'Максимальное число: ', max);
  writeln(outputFile, 'Минимальное число: ', min);

  close(outputFile);
end.