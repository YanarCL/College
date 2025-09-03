program qq; //15.	Измените алгоритмы для работы с алфавитно-частотным словарем, используя двусвязные списки.
type
  PNode=^TNode;
  TNode=record
    word:string;      
    count:integer;   
    next:PNode;       
    prev:PNode;      
  end;
function TakeWord(var F:text):string;
var
  c: char;
begin
  result := '';  
  c := ' ';      
  while not eof(F) and (c <= ' ') do
    read(F, c);
  while not eof(F) and (c > ' ') do
  begin
    result := result + c;
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
  NewNode^.prev := nil;
  result := NewNode;
end;
function FindPlace(Head: PNode; NewWord: string):PNode;
var
  pp:PNode;
begin
  pp := Head;
  while (pp <> nil) and (NewWord > pp^.word) do
    pp := pp^.next;
  result := pp;
end;
procedure AddBefore(var Head: PNode; p, NewNode: PNode);
begin
  if p=nil then 
  begin
    Head:=NewNode; 
  end
  else if p=Head then  
  begin
    NewNode^.next:=Head;
    if Head<>nil then
      Head^.prev:=NewNode;
    Head:=NewNode;
  end
  else
  begin
    NewNode^.next:=p;
    NewNode^.prev:=p^.prev;
    if p^.prev<>nil then
      p^.prev^.next:=NewNode;
    p^.prev:=NewNode;
  end;
end;
var
  F:text;
  Head:PNode;
  Word,NewWord:string;
  Place:PNode;
  Count:integer;
  node:PNode;
begin
  assign(F,'D:\2 курс\МДК.05.02\Лаба 16\input.txt');  
  reset(F);
  Head:=nil;  
  Count:=0;   
  while not eof(F) do
  begin
    Word:=TakeWord(F);  
    if Word<>'' then
    begin
      Place:=FindPlace(Head,Word);
      if (Place<>nil) and (Place^.word=Word) then
        Place^.count:=Place^.count+1
      else
      begin
        node:=CreateNode(Word); 
        AddBefore(Head,Place,node); 
        Count:=Count+1; 
      end;
    end;
  end;
  close(F);  
  writeln('Количество различных слов: ',Count);
  node := Head; 
  while node <> nil do
  begin
    writeln(node^.word, ': ', node^.count); 
    node:=node^.next; 
  end;
end.