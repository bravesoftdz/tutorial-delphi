program Blatt2;

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
  ExerciseCaller(Nr4,   4);
  ExerciseCaller(Nr5,   5);
  ExerciseCaller(Nr6,   6);
  ExerciseCaller(Nr7,   7);
  ExerciseCaller(Nr8,   8);
  ExerciseCaller(Nr9,   9);
  ExerciseCaller(Nr10, 10);
  ExerciseCaller(Nr11, 11);
  ExerciseCaller(Nr12, 12);
  ExerciseCaller(Nr13, 13);
  ExerciseCaller(Nr14, 14);
  ExerciseCaller(Nr15, 15);
  ReadLn;
end.
