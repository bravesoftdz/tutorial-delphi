program GUI;

uses
  Vcl.Forms,
  MainWindowUnit in 'MainWindowUnit.pas' {Form1},
  Chess in 'Chess.pas',
  WorkerThread in 'WorkerThread.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainWindowForm, MainWindowForm);
  Application.Run;
end.
