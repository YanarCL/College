program StudentAnketa;
//Для предыдущего задания (record 1) задать таблицу значений с данными о нескольких студентах, и, использовав массив, вывести все данные о студентах в удобочитаемом виде.
type
  anketa = record
    fio: string;
    birth: string;
    kurs: 1..5;
  end;

var
  students: array[1..3] of anketa;  // Массив для хранения данных о трех студентах
  i: integer;

begin
  for i := 1 to 3 do
  begin
    writeln('Введите Ф.И.О. студента ', i, ':');
    readln(students[i].fio);
    writeln('Введите дату рождения студента ', i, ' (дд.мм.гггг):');
    readln(students[i].birth);
    writeln('Введите курс студента ', i, ' (1..5):');
    readln(students[i].kurs);
  end;

  writeln('Анкетные данные студентов:');
  for i := 1 to 3 do
  begin
    writeln('Студент ', i, ':');
    writeln('Ф.И.О.: ', students[i].fio);
    writeln('Дата рождения: ', students[i].birth);
    writeln('Курс: ', students[i].kurs);
    writeln('-----------------------');
  end;
end.