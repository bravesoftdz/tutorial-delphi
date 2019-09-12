unit Punkt;

interface

type
  TPunkt = class
    private
      FX : Extended;
      FY : Extended;

    public
      constructor Create(_X : Extended; _Y : Extended);

    public
      function ToString : String; override;

    private
      function GetX : Extended;
      function GetY : Extended;

      procedure SetX(_X : Extended);
      procedure SetY(_Y : Extended);

    public
      property X : Extended read GetX write SetX;
      property Y : Extended read GetY write SetY;
  end;

implementation

uses
  System.SysUtils;

constructor TPunkt.Create(_X : Extended; _Y : Extended);
begin
  inherited Create;
  FX := _X;
  FY := _Y;
end;

function TPunkt.ToString : String;
begin
  Result := '(' + FloatToStr(FX) + '|' + FloatToStr(FY) + ')';
end;

function TPunkt.GetX : Extended;
begin
  Result := FX;
end;

function TPunkt.GetY : Extended;
begin
  Result := FY;
end;

procedure TPunkt.SetX(_X : Extended);
begin
  FX := _X;
end;

procedure TPunkt.SetY(_Y : Extended);
begin
  FY := _Y;
end;

end.
