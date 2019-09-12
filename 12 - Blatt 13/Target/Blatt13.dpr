program Blatt13;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Übungen in 'Übungen.pas',
  Dominostein in 'Dominostein.pas',
  Geburtstag in 'Geburtstag.pas',
  GeradeZahl in 'GeradeZahl.pas',
  Komplex in 'Komplex.pas',
  Note in 'Note.pas',
  Punkt in 'Punkt.pas';

procedure ExerciseCaller(_Exercise : TExcercise; _Number : Integer);
begin
  WriteLn('--> Start Exercise ', _Number);
  _Exercise;
  WriteLn('<-- End Exercise ', _Number);
  WriteLn;
end;

begin
  ExerciseCaller( Nr2, 2);
  ExerciseCaller( Nr3, 3);
  ExerciseCaller( Nr4, 4);
  ExerciseCaller( Nr5, 5);
  ExerciseCaller( Nr6, 6);
  ExerciseCaller( Nr7, 7);
  ReadLn;
end.
