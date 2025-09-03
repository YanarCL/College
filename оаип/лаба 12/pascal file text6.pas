var
  inputFile, tempFile: text;//Дан текстовый файл. Удалить из него все пустые строки.
  line: string;
begin
  assign(inputFile, 'd:\text6.txt');
  reset(inputFile);

  assign(tempFile, 'd:\temp6.txt');
  rewrite(tempFile);

  while not eof(inputFile) do
  begin
    readln(inputFile, line);
    if line <> '' then
    begin
      writeln(tempFile, line);
    end;
  end;
  close(inputFile);
  close(tempFile);
  erase(inputFile);
  rename(tempFile, 'text6.txt');
end.