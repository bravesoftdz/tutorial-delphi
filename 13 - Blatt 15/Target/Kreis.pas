unit Kreis;

interface

uses
  Punkt;

type
  TKreis = class
    private
      FRadius      : Extended;
      FMittelpunkt : TPunkt;

    public
      constructor Create(_Radius : Extended; _Mittelpunkt : TPunkt);
      constructor CreateCopy(_Other : TKreis);
      destructor Destroy; override;

    public
      function GetAbstand(_Punkt : TPunkt) : Extended;

    private
      function GetRadius : Extended;
      function GetMittelpunkt : TPunkt;
      function GetFläche : Extended;
      function GetUmfang : Extended;

      procedure SetRadius(_Radius : Extended);
      procedure SetMittelpunkt(_Mittelpunkt : TPunkt);

    public
      property Radius      : Extended read GetRadius      write SetRadius;
      property Mittelpunkt : TPunkt   read GetMittelpunkt write SetMittelpunkt;
      property Fläche      : Extended read GetFläche;
      property Umfang      : Extended read GetUmfang;
  end;

implementation

uses
  System.SysUtils,
  Math;

constructor TKreis.Create(_Radius : Extended; _Mittelpunkt : TPunkt);
begin
  inherited Create;

  FRadius := _Radius;
  FMittelpunkt := _Mittelpunkt;
end;

constructor TKreis.CreateCopy(_Other : TKreis);
begin
  inherited Create;

  FRadius      := _Other.FRadius;
  FMittelpunkt := TPunkt.CreateCopy(_Other.FMittelpunkt);
end;

destructor TKreis.Destroy;
begin
  FreeAndNil(FMittelpunkt);

  inherited;
end;

function TKreis.GetAbstand(_Punkt : TPunkt) : Extended;
begin
  Result := Abs(Sqrt(Power(_Punkt.X - FMittelpunkt.X, 2) + Power(_Punkt.Y - FMittelpunkt.Y, 2)) - FRadius);
end;

function TKreis.GetRadius : Extended;
begin
  Result := FRadius;
end;

function TKreis.GetMittelpunkt : TPunkt;
begin
  Result := FMittelpunkt;
end;

function TKreis.GetFläche : Extended;
begin
  Result := Power(Radius, 2) * PI;
end;

function TKreis.GetUmfang : Extended;
begin
  Result := 2 * Radius * PI;
end;

procedure TKreis.SetRadius(_Radius : Extended);
begin
  FRadius := _Radius;
end;

procedure TKreis.SetMittelpunkt(_Mittelpunkt : TPunkt);
begin
  FreeAndNil(FMittelpunkt); // Muss gemacht werden, da sonst ein MemoryLeak entsteht.

  FMittelpunkt := _Mittelpunkt;
end;


end.
