var
   filetext: text;
   N, K, i, j: integer; //Даны целые положительные числа N и K. Создать текстовый файл и записать в него N строк, каждая из которых состоит из K символов «*» (звездочка).
   stars: string;
begin
   writeln('Введите количество строк (N): ');
   readln(N);
   writeln('Введите количество звездочек в строке (K): ');
   readln(K);

   assign(filetext, 'd:\stars.txt');
   rewrite(filetext);

   for i := 1 to N do
   begin
     stars := '';
     for j := 1 to K do
     begin
       stars := stars + '*';
     end;
     writeln(filetext, stars);  // Записываем строку из K звездочек в файл
   end;

   close(filetext);  // Закрываем файл после записи
end.