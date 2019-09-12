unit WorkerThread;

interface

uses
  System.Classes,
  Chess,
  System.Generics.Collections,
  Windows;

type
  TChessCallback = procedure(_Board : String) of object;
  TErrorCallback = procedure(_Message : String) of object;

  TWorkerThread = class(TThread)
    private
      FChessCallback     : TChessCallback;
      FErrorCallback     : TErrorCallback;
      FLastError         : String;
      FChessBoardHandler : TChessBoardHandler;
      FWork              : TList<String>;
      FCriticalSection   : TRTLCriticalSection;

    public
      constructor Create;
      destructor Destroy; override;

    protected
      procedure Execute; override;

    public
      procedure GenerateChessBoardFromString(_Board : String);

    private
      procedure Error;
      procedure Success;

    public
      property ChessCallback : TChessCallback write FChessCallback;
      property ErrorCallback : TErrorCallback write FErrorCallback;
  end;

implementation

uses
  System.SysUtils;

constructor TWorkerThread.Create;
begin
  inherited Create(True);

  FChessBoardHandler := TChessBoardHandler.Create;
  FWork              := TList<String>.Create;
  InitializeCriticalSection(FCriticalSection);
end;

destructor TWorkerThread.Destroy;
begin
  FreeAndNil(FChessBoardHandler);
  FreeAndNil(FWork);
  DeleteCriticalSection(FCriticalSection);

  inherited;
end;

procedure TWorkerThread.Execute;
var
  HBoard : String;
begin
  while not Terminated do
  begin
    try
      if FWork.Count <> 0 then
      begin
        HBoard := FWork.First;

        EnterCriticalSection(FCriticalSection);
        try
          FWork.Delete(0);
        finally
          LeaveCriticalSection(FCriticalSection);
        end;

        FChessBoardHandler.SetBoardFromString(HBoard);
        Synchronize(Success);
      end
      else
      begin
        Sleep(100);
      end;
    except on E : Exception do
      begin
        FLastError := E.Message;
        Synchronize(Error);
      end;
    end;
  end;
end;

procedure TWorkerThread.GenerateChessBoardFromString(_Board : String);
begin
  EnterCriticalSection(FCriticalSection);
  try
    FWork.Add(_Board);
  finally
    LeaveCriticalSection(FCriticalSection);
  end;
end;

procedure TWorkerThread.Error;
begin
  FErrorCallback(FLastError)
end;

procedure TWorkerThread.Success;
begin
  FChessCallback(FChessBoardHandler.GetBoardAsString)
end;

end.
