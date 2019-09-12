program Blatt15;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Übungen in 'Übungen.pas',
  Kreis in 'Kreis.pas',
  Dominostein in '..\Start\Dominostein.pas',
  Punkt in '..\Start\Punkt.pas',
  Dominokette in 'Dominokette.pas';

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
  ReadLn;
end.
