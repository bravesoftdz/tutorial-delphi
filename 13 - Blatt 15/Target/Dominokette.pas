unit Dominokette;

interface

uses
  Dominostein;

type
  TDominoArray = Array of TDominostein;

  TDominokette = class
  private
    FData: TDominoArray;

  public
    constructor Create(_StartStein: TDominostein);
    destructor Destroy; override;

  public
    procedure FuegeRechtsAn(_Dominostein: TDominostein);
    procedure FuegeLinksAn(_Dominostein: TDominostein);

    function ToString: String; override;
  end;

implementation

uses
  System.SysUtils;

constructor TDominokette.Create(_StartStein: TDominostein);
begin
  inherited Create;

  SetLength(FData, 1);
  FData[Low(FData)] := _StartStein;
end;

destructor TDominokette.Destroy;
var
  HIdx : Integer;
begin
  for HIdx := Low(FData) to High(FData) do
  begin
    FreeAndNil(FData[HIdx]);
  end;

  SetLength(FData, 0);
  inherited;
end;

procedure TDominokette.FuegeRechtsAn(_Dominostein: TDominostein);
begin
  if FData[High(FData)].SideTwo = _Dominostein.SideTwo then
  begin
    _Dominostein.DreheUm;
  end
  else if FData[High(FData)].SideTwo <> _Dominostein.SideOne then
  begin
    raise Exception.Create('Stein kann nicht angefügt werden, er passt nicht.');
  end;

  SetLength(FData, Length(FData) + 1);
  FData[High(FData)] := _Dominostein;
end;

procedure TDominokette.FuegeLinksAn(_Dominostein: TDominostein);
begin
  if FData[Low(FData)].SideOne = _Dominostein.SideOne then
  begin
    _Dominostein.DreheUm;
  end
  else if FData[Low(FData)].SideOne <> _Dominostein.SideTwo then
  begin
    raise Exception.Create('Stein kann nicht angefügt werden, er passt nicht.');
  end;

  SetLength(FData, Length(FData) + 1);
  Move(FData[Low(FData)], FData[Low(FData) + 1], (Length(FData) - 1) * SizeOf(FData[Low(FData)]));
  FData[Low(FData)] := _Dominostein;
end;

function TDominokette.ToString;
var
  HTmp: TDominostein;
begin
  for HTmp in FData do
  begin
    Result := Result + HTmp.ToString;
  end;
end;

end.
