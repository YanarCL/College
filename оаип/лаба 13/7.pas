var //В файле заменить символы с четной позицией на восклицательные знаки (‘!’). Использовать процедуру seek
  f: file;
  ch: Char;
  pos: Integer;
begin
  assign(f,'d:\лаба 13\text7.txt');
  reset(f);
  pos := 0;
  while not eof(f) do
  begin
    read(f,ch);
    if pos mod 2 <> 0 then
      ch:='!';
    seek(f,pos);
    write(f,ch);
    pos+=1;
  end;
  close(f);
end.