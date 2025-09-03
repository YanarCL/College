var
   filetext: text;//Дана строка S и текстовый файл. Добавить строку S в конец файла.
   S: string;
begin
   writeln('Введите строку S: ');
   readln(S);

   assign(filetext, 'd:\text3.txt');
   append(filetext);  // Открываем файл для добавления данных в конец

   writeln(filetext, S);  // Записываем строку S в конец файла

   close(filetext);  // Закрываем файл после записи
end.