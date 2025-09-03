type 
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
    if not(str[i] in lett + num) then
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