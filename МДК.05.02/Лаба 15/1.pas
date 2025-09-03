program StudentAnketa;
//Создать анкетные данные о студенте(type anketa):запись с полями: Ф.И.О. (fio — строковый тип), дата рождения (birth — строковый тип), курс (kurs — значения 1..5). Создать переменную student созданного типа. Выводить значения полей на экран.
type
  anketa = record
    fio: string;
    birth: string;
    kurs: 1..5;
  end;

var
  student: anketa;

begin
  writeln('Введите Ф.И.О. студента:');
  readln(student.fio);
  writeln('Введите дату рождения студента (дд.мм.гггг):');
  readln(student.birth);
  writeln('Введите курс студента (1..5):');
  readln(student.kurs);
  writeln('Анкетные данные студента:');
  writeln('Ф.И.О.: ', student.fio);
  writeln('Дата рождения: ', student.birth);
  writeln('Курс: ', student.kurs);
end.