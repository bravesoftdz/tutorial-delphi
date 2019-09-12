program Blatt12;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Übungen in 'Übungen.pas',
  Punkt in 'Punkt.pas',
  Komplex in 'Komplex.pas',
  GeradeZahl in 'GeradeZahl.pas',
  Note in 'Note.pas',
  Geburtstag in 'Geburtstag.pas',
  Dominostein in 'Dominostein.pas';

procedure ExerciseCaller(_Exercise : TExcercise; _Number : Integer);
begin
  WriteLn('--> Start Exercise ', _Number);
  _Exercise;
  WriteLn('<-- End Exercise ', _Number);
  WriteLn;
end;

begin
  ExerciseCaller( Nr1, 1);
  ExerciseCaller( Nr2, 2);
  ExerciseCaller( Nr3, 3);
  ExerciseCaller( Nr4, 4);
  ExerciseCaller( Nr5, 5);
  ExerciseCaller( Nr6, 6);
  ReadLn;
end.
