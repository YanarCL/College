program qq; //Дан символьный файл, содержащий, по крайней мере, один символ пробела. Удалить все его элементы, расположенные после последнего символа пробела, включая и этот пробел.
var
  textfile: file of char;
  s: string;
  lastSpacePos, i: integer;
begin
  assign(textfile, 'D:\лаба 13\text.txt'); 
  reset(textfile);
  s := '';
  while not Eof(textfile) do
  begin
    readln(textfile, s);
  end;
  close(textfile);
  lastSpacePos := 0;
  for i := 1 to Length(s) do
  begin
    if s[i] = ' ' then
      lastSpacePos := i;
  end;
  if lastSpacePos > 0 then
    s := Copy(s, 1, lastSpacePos - 1);
  rewrite(textfile);
  writeLn(textfile, s);
  close(textfile);
end.