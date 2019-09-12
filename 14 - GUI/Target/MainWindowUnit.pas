unit MainWindowUnit;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  RzPanel,
  Vcl.WinXCtrls,
  WorkerThread, Vcl.Imaging.GIFImg;

type
  TMainWindowForm = class(TForm)
    FPanelChessAndInput: TPanel;
    FLabelDescription: TLabel;
    FPanelInput: TPanel;
    FButtonShow: TButton;
    FEditChessBoardInput: TEdit;
    FLableChessBoard: TLabel;
    procedure FormCreate(_Sender: TObject);
    procedure FormDestroy(_Sender: TObject);
    procedure FButtonShowClick(Sender: TObject);

  private
    FWorker : TWorkerThread;

  private // Show Functions
    procedure ShowNewChessBoard();

  private // Thread Callbacks
    procedure OnBoardGenerated(_Board : String);
    procedure OnError(_Message : String);
    procedure MakeGuiGreatAgain;
  end;

var
  MainWindowForm: TMainWindowForm;

implementation

{$R *.dfm}

procedure TMainWindowForm.FormCreate(_Sender: TObject);
begin
  FWorker := TWorkerThread.Create;
  FWorker.FreeOnTerminate := True;
  FWorker.ChessCallback := OnBoardGenerated;
  FWorker.ErrorCallback := OnError;

  FWorker.Start;

  ShowNewChessBoard;
end;

procedure TMainWindowForm.FormDestroy(_Sender: TObject);
begin
  FWorker.Terminate;
end;

procedure TMainWindowForm.FButtonShowClick(Sender: TObject);
begin
  ShowNewChessBoard;
end;

procedure TMainWindowForm.ShowNewChessBoard;
begin
  FWorker.GenerateChessBoardFromString(FEditChessBoardInput.Text);

  FButtonShow.Enabled := False;
  Screen.Cursor       := crHourGlass;
end;

procedure TMainWindowForm.OnBoardGenerated(_Board : String);
begin
  FLableChessBoard.Caption := _Board;

  MakeGuiGreatAgain;
end;

procedure TMainWindowForm.OnError(_Message : String);
begin
  MakeGuiGreatAgain;

  ShowMessage(_Message);
end;


procedure TMainWindowForm.MakeGuiGreatAgain;
begin
  FButtonShow.Enabled := True;
  Screen.Cursor       := crDefault ;
end;
end.
