var
   inputFile, tempFile: text;//Дано целое число K и текстовый файл. В данном файле вставить пустую строку перед строкой с номером K. Если строки с таким номером нет, то оставить файл без изменений.
//Для решения задачи можно использовать дополнительный временный файл.
   line: string;
   K, currentLine: integer;
begin
   writeln('Введите номер строки K: ');
   readln(K);
   assign(inputFile, 'd:\text4.txt');
   reset(inputFile);
   assign(tempFile, 'd:\temp4.txt');
   rewrite(tempFile);
   currentLine := 1;
   while not eof(inputFile) do
   begin
     readln(inputFile, line);
     if currentLine = K then
     begin
       writeln(tempFile, '');  
     end;
     writeln(tempFile, line);
     currentLine := currentLine + 1;
   end;
   close(inputFile);
   close(tempFile);
   erase(inputFile);
   rename(tempFile, 'text4.txt');
end.