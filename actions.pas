unit actions;

{$mode objfpc}{$H+}

interface

uses
  Dialogs,Classes, SysUtils;
procedure DoExit();
function Decipher(src:ansistring; key:ansistring; encypher:boolean):ansistring;
function SpyGrouping(s:ansistring):ansistring;

implementation

procedure DoExit();
          begin
          Halt(0);
          end;

function SpyGrouping(s:ansistring):ansistring; //Group them like a REAL spy!
var
   r:ansistring='';
   i:integer;
begin
     for i:=1 to (length(s)) do
         begin
         r:=r+s[i];
         if ((i mod 5) = 0) then r:=r+' ';  //constants for sissies, anyway -
         end;                               //ALL spies ALL the time group them by 5.
     SpyGrouping:=r                         //
end;

function ClearSpaces(s:ansistring):ansistring; //More than just spaces.
var
   r:ansistring='';
   i:integer;
const
   DIGITS=['0'..'9'];
begin
  for i:=1 to length(s) do
      begin
      if s[i] in DIGITS then r:=r+s[i]
      end;
  ClearSpaces:=r
end;

function mod10minus(a:integer;b:integer):integer; //a-b: it was harder, than expected
begin
     if b>a then a:=10+a;  //very problem specific
     mod10minus:=(a-b) mod 10;
end;

function Decipher(src:ansistring; key:ansistring; encypher:boolean):ansistring;
var
   i:integer;       //loop counter
   sn:integer;      //current source text number
   kn:integer;      //current key number
   r:ansistring=''; //result
begin
     src:=ClearSpaces(src);
     key:=ClearSpaces(key);
   if length(src)> length(key) then
      begin
      Decipher:='(⊙︿⊙)'; // :_(
      ShowMessage('Insufficient key length');
      exit;
      end;
   for i:=1 to (length(src)) do
       begin
         try
         sn:=strToInt(src[i]);
         kn:=strToInt(key[i]);
         Except
           On E:EConvertError do
             begin
             ShowMessage('Non-dight in input. Please check.'); //Newer shown,
             Decipher:='(''o'')';                              //but funny.
             exit;
             end;

         end;
         if encypher then
            begin
            r:=r+intToStr( (sn+kn) mod 10 )
            end
         else
             begin
             r:=r+intToStr( mod10minus(sn,kn))
             end;
       end;
   Decipher:=SpyGrouping(r);
end;

end.
