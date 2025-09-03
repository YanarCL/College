program qq; //Составить из описанных выше функций программу, реализующую алфавитно-частотный словарь. Вывести на экран количество различных слов, т.е. количество элементов списка.
type
  PNode = ^TNode;  
  TNode = record
    word: string;    
    count: Integer;  
    next: PNode;     
  end;
function TakeWord(var F: Text): string;
var
  c: char;
begin
  Result := '';  
  c := ' ';      
  while not eof(F) and (c <= ' ') do
    read(F, c);
  while not eof(F) and (c > ' ') do
  begin
    Result := Result + c;
    read(F, c);
  end;
end;
function CreateNode(NewWord: string): PNode;
var
  NewNode: PNode;
begin
  New(NewNode);
  NewNode^.word := NewWord;
  NewNode^.count := 1;
  NewNode^.next := nil;
  Result := NewNode;
end;
function FindPlace(Head: PNode; NewWord: string): PNode;
var
  pp: PNode;
begin
  pp := Head;
  while (pp <> nil) and (NewWord > pp^.word) do
    pp := pp^.next;
  Result := pp;
end;
procedure AddBefore(var Head: PNode; p, NewNode: PNode);
var
  pp: PNode;
begin
  pp := Head;
  if p = Head then
    begin
      NewNode^.next := Head;
      Head := NewNode;
    end
  else
  begin
    while (pp <> nil) and (pp^.next <> p) do
      pp := pp^.next;
    if pp <> nil then
      begin
        NewNode^.next := pp^.next;
        pp^.next := NewNode;
      end;
  end;
end;
var
  F: Text;
  Head: PNode;
  Word, NewWord: string;
  Place: PNode;
  Count: Integer;
  node: PNode;  
begin
  Assign(F, 'D:\2 курс\МДК.05.02\Лаба 16\input.txt');  
  Reset(F);
  Head := nil;  
  Count := 0;   
  while not eof(F) do
  begin
    Word := TakeWord(F);  
    if Word <> '' then
    begin
      Place := FindPlace(Head, Word);
      if (Place <> nil) and (Place^.word = Word) then
        Place^.count+=1
      else
      begin
        node := CreateNode(Word); 
        AddBefore(Head, Place, node); 
        Count+=1; 
      end;
    end;
  end;
  close(F);  
  WriteLn('Количество различных слов: ', Count);
  node := Head; 
  while node <> nil do
  begin
    WriteLn(node^.word, ': ', node^.count); 
    node := node^.next; 
  end;
end.