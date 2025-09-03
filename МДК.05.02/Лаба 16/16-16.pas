program qq; //16.	Выведите список слов из словаря в порядке убывания частоты, то есть, сначала те слова, которые встречаются чаще всего.
type
  PNode=^TNode;
  TNode=record
    word:string;
    count:integer;
    next:PNode;
  end;
function TakeWord(var F:text):string;
var
  c:char;
begin
  result:='';
  c:=' ';
  while not eof(F) and (c<=' ') do
    read(F,c);
  while not eof(F) and (c>' ') do
  begin
    result:=result+c;
    read(F,c);
  end;
end;

function CreateNode(NewWord:string):PNode;
var
  NewNode:PNode;
begin
  New(NewNode);
  NewNode^.word:=NewWord;
  NewNode^.count:=1;
  NewNode^.next:=nil;
  result:=NewNode;
end;
function FindPlace(Head:PNode;NewWord:string):PNode;
var
  pp:PNode;
begin
  pp:=Head;
  while (pp<>nil) and (NewWord>pp^.word) do
    pp:=pp^.next;
  result:=pp;
end;
procedure AddBefore(var Head:PNode;p,NewNode:PNode);
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

procedure InsertSorted(var sortedhead: PNode; Node: PNode);
var
  current,prev:PNode;
begin
  if (sortedhead=nil) or (Node^.count>sortedhead^.count) then
  begin
    Node^.next:=sortedhead;
    sortedhead:=Node;
  end
  else
  begin
    current:=sortedhead;
    prev:=nil;
    while (current<>nil) and (Node^.count<=current^.count) do
    begin
      prev:=current;
      current:=current^.next;
    end;
    Node^.next:=current;
    if prev<>nil then
      prev^.next:=Node;
  end;
end;
procedure sortbyubyv(var Head: PNode);
var
  sorted,current:PNode;
begin
  sorted:=nil;
  while Head<>nil do
  begin
    current:=Head;
    Head:=Head^.next;
    InsertSorted(sorted,current);
  end;
  Head:=sorted;
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
        Place^.count+= 1
      else
      begin
        node:=CreateNode(Word);
        AddBefore(Head, Place, node);
        Count+=1;
      end;
    end;
  end;
  close(F);
  sortbyubyv(Head);
  writeln('Количество различных слов: ',Count);
  node:=Head;
  while node<>nil do
  begin
    writeln(node^.word,': ',node^.count);
    node:=node^.next;
  end;
end.