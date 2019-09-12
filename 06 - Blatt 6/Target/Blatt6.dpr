program Blatt6;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils, // (Benötigt für die Funktion FloatToStr)
  Übungen in 'Übungen.pas';


procedure ExerciseCaller(_Exercise : TExcercise; _Number : Integer);
begin
  WriteLn('--> Start Exercise ', _Number);
  _Exercise;
  WriteLn('<-- End Exercise ', _Number);
  WriteLn;
end;

begin
  ExerciseCaller(Nr1,   1);
  ExerciseCaller(Nr2,   2);
  ExerciseCaller(Nr3,   3);
  ReadLn;
end.

