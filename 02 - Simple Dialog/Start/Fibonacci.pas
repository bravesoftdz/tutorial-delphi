unit Fibonacci;

interface

type

  IFibonacci = interface
    function GetDescription(): String;
    function GetValue(_N: Integer): Integer;
  end;

  TIterativFibonacci = class(TInterfacedObject, IFibonacci)
  public
    function GetDescription(): String;
    function GetValue(_N: Integer): Integer;
  end;

  TRekursiveFibonacci = class(TInterfacedObject, IFibonacci)
  public
    function GetDescription(): String;
    function GetValue(_N: Integer): Integer;

  private
    function FibonacciRek(_N: Integer): Integer;
  end;

  TDirectFibonacci = class(TInterfacedObject, IFibonacci)
  public
    constructor Create;
    destructor Destroy; override;

  public
    function GetDescription(): String;
    function GetValue(_N: Integer): Integer;

  private
  var
    FLambda: Extended;
    FPhi: Extended;
    FPsi: Extended;
  end;

implementation

uses
  System.Math,
  System.SysUtils;

function TIterativFibonacci.GetDescription(): String;
begin
  Result := 'Iterativ';
end;

function TIterativFibonacci.GetValue(_N: Integer): Integer;
var
  HCount: Integer;
  HBefore: Integer;
  HNow: Integer;
begin
  if _N < 3 then
  begin
    raise Exception.Create('Es sind nur N >= 3 erlaubt.');
  end;

  Result := 0;
  HBefore := 1;
  HNow := 1;

  for HCount := 3 to _N do
  begin
    Result := HBefore + HNow;
    HBefore := HNow;
    HNow := Result;
  end;
end;

function TRekursiveFibonacci.GetDescription(): String;
begin
  Result := 'Rekursiv';
end;

function TRekursiveFibonacci.GetValue(_N: Integer): Integer;
begin
  if _N < 1 then
  begin
    raise Exception.Create('Es sind nur N > 0 erlaubt.');
  end;

  Result := FibonacciRek(_N);
end;

function TRekursiveFibonacci.FibonacciRek(_N: Integer): Integer;
begin
  if (_N = 1) or (_N = 2) then
  begin
    Result := 1;
  end
  else
  begin
    Result := GetValue(_N - 1) + GetValue(_N - 2)
  end;
end;

function TDirectFibonacci.GetDescription(): String;
begin
  Result := 'Direkt';
end;

constructor TDirectFibonacci.Create;
begin
  inherited;
  WriteLn('Aufbau von einem Objekt der Klasse "TDirectFibonacci" eingeleitet.');
  FLambda := 1 / Sqrt(5);
  FPhi := (1 + Sqrt(5)) / 2;
  FPsi := (1 - Sqrt(5)) / 2;
end;

destructor TDirectFibonacci.Destroy;
begin
  WriteLn('Zerstörung von einem Objekt der Klasse "TDirectFibonacci" eingeleitet.');
  inherited;
end;

function TDirectFibonacci.GetValue(_N: Integer): Integer;
begin
  Result := trunc(FLambda * (Power(FPhi, _N) - Power(FPsi, _N)));
end;

end.
