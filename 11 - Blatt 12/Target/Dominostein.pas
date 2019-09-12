unit Dominostein;

interface

type
  TDominostein = class
    private
      FSideOne : Integer;
      FSideTwo : Integer;

    public
      constructor Create(_SideOne : Integer; _SideTwo : Integer);

    public
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
  SetSideOne(_SideOne);
  SetSideTwo(_SideTwo);
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
