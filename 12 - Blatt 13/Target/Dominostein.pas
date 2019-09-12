unit Dominostein;

interface

type
  TDominoArray = Array[0..1] of Integer;

  TDominostein = class
    private
      FSideOne : Integer;
      FSideTwo : Integer;

    public
      constructor Create(_SideOne : Integer; _SideTwo : Integer);
      constructor CreateCopy(_Other : TDominostein);

    public
      procedure DreheUm;
      function GetValues : TDominoArray;

      function ToString : String; override;

    private
      function  GetSideOne : Integer;
      function  GetSideTwo : Integer;
      procedure SetSideOne(_SideOne : Integer);
      procedure SetSideTwo(_SideTwo : Integer);

    private
      class function ValidValue(_Value : Integer) : Boolean; static;

    public
      property SideOne : Integer read GetSideOne write SetSideOne;
      property SideTwo : Integer read GetSideTwo write SetSideTwo;
  end;

implementation

uses
  System.SysUtils;

constructor TDominostein.Create(_SideOne : Integer; _SideTwo : Integer);
begin
  inherited Create;

  SetSideOne(_SideOne);
  SetSideTwo(_SideTwo);
end;

constructor TDominostein.CreateCopy(_Other : TDominostein);
begin
  inherited Create;

  FSideOne := _Other.FSideOne;
  FSideTwo := _Other.FSideOne;
end;

procedure TDominostein.DreheUm;
var
  HTmp : Integer;
begin
  HTmp := FSideOne;
  FSideOne := FSideTwo;
  FSideTwo := HTmp;
end;

function TDominostein.GetValues : TDominoArray;
begin
  Result[0] := FSideOne;
  Result[1] := FSideTwo;
end;


function TDominostein.ToString : String;
begin
  Result := '|' + IntToStr(FSideOne) + '|' + IntToStr(FSideTwo) + '|';
end;

function  TDominostein.GetSideOne : Integer;
begin
  Result := FSideOne;
end;

function  TDominostein.GetSideTwo : Integer;
begin
  Result := FSideTwo;
end;

procedure TDominostein.SetSideOne(_SideOne : Integer);
begin
  if ValidValue(_SideOne) then
  begin
    FSideOne := _SideOne;
  end
  else
  begin
    raise Exception.Create('Wert außerhalb des Bereichs');
  end;
end;

procedure TDominostein.SetSideTwo(_SideTwo : Integer);
begin
  if ValidValue(_SideTwo) then
  begin
    FSideTwo := _SideTwo;
  end
  else
  begin
    raise Exception.Create('Wert außerhalb des Bereichs');
  end;
end;

class function TDominostein.ValidValue(_Value : Integer) : Boolean;
const
  CUpperBound : Integer = 6;
  CLowerBound : Integer = 0;
begin
  Result := (CLowerBound <= _Value) and (_Value <= CUpperBound);
end;

end.
