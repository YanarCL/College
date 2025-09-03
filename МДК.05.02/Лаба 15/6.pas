type //Запросить у пользователя ввести строку. Проверить ее на наличие недопустимых символов. В качестве первого символа можно использовать только буквы и знак подчеркивания. Остальные символы могут быть буквами, цифрами и знаком подчеркивания. Использовать заданное начало программы. (так, строка равная '_sdfs234' вернет значение true, тогда как строка равная '_sdfs`234' вернет false) 
  t_chs = set of Char;
const
  lett: t_chs = ['a'..'z', 'A'..'Z', '_'];
  num: t_chs = ['0'..'9'];
var
  str: string;
  i: integer;
  flag: boolean;
begin
  writeln('Введите строку');
  readln(str);
  if str[1] not in lett then
  begin
    writeln('Строка содержит недопустимые символы');
    exit;
  end;
  for i:=2 to length(str) do
  begin
    if  str[i]  in (lett + num) then
    begin
      flag:=true; 
    end
    else
      begin
      flag:=false;
    break;
    end;
  end;
  if flag = false then
    writeln('Строка содержит недопустимые символы')
  else
    writeln('Строка не содержит недопустимые символы');
end.