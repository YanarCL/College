var
  input,output:textfile;
  numbers:array of integer;
  number:integer;
  count,i:integer;
  line:string;
begin
  assignfile(input,'D:\2 курс\МДК.05.02\Лаба 17\input.txt');
  reset(input);
  count:=0;
  while not eof(input) do
  begin
    readln(input,line);
    count+=1;
  end;
  setlength(numbers,count);
  reset(input);
  i:=0;
  while not eof(input) do
  begin
    readln(input,numbers[i]);
    i+=1;
  end;
  closefile(input);
  assignfile(output,'D:\2 курс\МДК.05.02\Лаба 17\output.txt');
  rewrite(output);
  for i:=count-1 downto 0 do
  begin
    writeLn(output,numbers[i]);
  end;
  closefile(output);
  writeLn('выполнено');
end.
