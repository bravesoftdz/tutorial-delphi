unit Komplex;

interface
type
  TKomplex = class
    private
      FReal      : Extended;
      FImaginary : Extended;

    public
      constructor Create(_Real : Extended; _Imaginary : Extended);
      constructor CreateCopy(_Other : TKomplex);

    public
      function GetBetrag : Extended;
      procedure KonjugiertKomplex;
      function GetKonjugiertKomplex : TKomplex;
      procedure Add(_Other : TKomplex);
      procedure Mult(_Other : TKomplex);

      function ToString : String; override;

    private
      function GetReal      : Extended;
      function GetImaginary : Extended;

      procedure SetReal(_Real : Extended);
      procedure SetImaginary(_Imaginary : Extended);

    public
      property Real      : Extended read GetReal      write SetReal;
      property Imaginary : Extended read GetImaginary write SetImaginary;
  end;

implementation

uses
  System.SysUtils,
  Math;

constructor TKomplex.Create(_Real : Extended; _Imaginary : Extended);
begin
  inherited Create;

  FReal      := _Real;
  FImaginary := _Imaginary;
end;

constructor TKomplex.CreateCopy(_Other : TKomplex);
begin
  inherited Create;

  FReal      := _Other.FReal;
  FImaginary := _Other.FImaginary;
end;

function TKomplex.GetBetrag : Extended;
begin
  Result := Sqrt(Power(FReal,2) + Power(FImaginary,2));
end;

procedure TKomplex.KonjugiertKomplex;
begin
  FImaginary := -FImaginary;
end;

function TKomplex.GetKonjugiertKomplex : TKomplex;
begin
  Result := TKomplex.CreateCopy(Self);
  Result.KonjugiertKomplex;
end;

procedure TKomplex.Add(_Other : TKomplex);
begin
  FReal      := FReal      + _Other.FReal;
  FImaginary := FImaginary + _Other.FImaginary;
end;

procedure TKomplex.Mult(_Other : TKomplex);
var
  HTmpReal : Extended;
begin
  HTmpReal   := FReal * _Other.FReal      - FImaginary * _Other.FImaginary;
  FImaginary := FReal * _Other.FImaginary + FImaginary * _Other.FReal;
  FReal := HTmpReal;
end;

function TKomplex.ToString : String;
begin
  Result := FloatToStr(FReal) + ' + ' + FloatToStr(FImaginary) + 'i';
end;

function TKomplex.GetReal : Extended;
begin
  Result := FReal;
end;

function TKomplex.GetImaginary : Extended;
begin
  Result := FImaginary;
end;

procedure TKomplex.SetReal(_Real : Extended);
begin
  FReal := _Real;
end;

procedure TKomplex.SetImaginary(_Imaginary : Extended);
begin
  FImaginary := _Imaginary;
end;

end.
