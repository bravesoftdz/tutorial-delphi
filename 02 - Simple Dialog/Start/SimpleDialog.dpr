program SimpleDialog;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  UserInteraction in 'UserInteraction.pas',
  Fibonacci in 'Fibonacci.pas',
  Example in 'Example.pas';

begin
  ReportMemoryLeaksOnShutdown := True;
  TalkToUser;
end.
