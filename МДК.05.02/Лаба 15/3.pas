program ToyStore;
//Создать запись toy с информацией об имеющихся в продаже игрушках (название товара (name), цена товара (price) и возрастной диапазон (age), для которого игрушка предназначена). Заполнить несколько товаров. Вывести данные на экран. Использовать массив и конструкцию with.
type
  toy = record
    name: string;
    price: real;
    age: string;
  end;

var
  toys: array[1..3] of toy; 
  i: integer;

begin
  for i := 1 to 3 do
  begin
    writeln('Введите название игрушки ', i, ':');
    readln(toys[i].name);
    writeln('Введите цену игрушки ', i, ':');
    readln(toys[i].price);
    writeln('Введите возрастной диапазон для игрушки ', i, ':');
    readln(toys[i].age);
  end;

  writeln('Информация о игрушках в продаже:');
  for i := 1 to 3 do
  begin
    with toys[i] do
    begin
      writeln('Игрушка ', i, ':');
      writeln('Название: ', name);
      writeln('Цена: ', price:0:2);
      writeln('Возрастной диапазон: ', age);
      writeln('-----------------------');
    end;
  end;
end.