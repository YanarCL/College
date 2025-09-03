program ToyStore;
//Выполнить предыдущее задание с игрушками (запись toy), записывать данные в файл, а затем считывать их из файла и выводить на экран.Внимание: При записи в файл и считывании из него не нужно обращаться к конкретным полям созданной записи. При считывании нельзя использовать оператор ReadLn, необходимо использовать Read. Например, при работе с массивом
type
  toy = record
    name: string[50];
    price: real;
    age: string[20];
  end;

var
  toys: array of toy;
  i, count: integer;
  f: file of toy;

begin
  count := 3;
  SetLength(toys, count);
  for i := 1 to count do
  begin
    writeln('Введите название игрушки ', i, ':');
    readln(toys[i-1].name);
    writeln('Введите цену игрушки ', i, ':');
    readln(toys[i-1].price);
    writeln('Введите возрастной диапазон для игрушки ', i, ':');
    readln(toys[i-1].age);
  end;
  assign(f, 'D:\2 курс\МДК.05.02\Лаба 15\input.txt');
  rewrite(f);
  for i := 0 to count - 1 do
  begin
    write(f, toys[i]);
  end;
  close(f);
  assign(f, 'D:\2 курс\МДК.05.02\Лаба 15\toys.txt');
  reset(f);
  i := 0;
  while not eof(f) do
  begin
    SetLength(toys, i + 1);
    read(f, toys[i]);
    i := i + 1;
  end;
  close(f);
  writeln('Информация о игрушках в продаже:');
  for i := 0 to High(toys) do
  begin
    with toys[i] do
    begin
      writeln('Игрушка ', i + 1, ':');
      writeln('Название: ', name);
      writeln('Цена: ', price:0:2); 
      writeln('Возрастной диапазон: ', age);
      writeln('-----------------------');
    end;
  end;
end.