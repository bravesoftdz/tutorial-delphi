unit Komplex;

interface
type
  TKomplex = class
    private
      FReal      : Extended;
      FImaginary : Extended;

    public
      constructor Create(_Real : Extended; _Imaginary : Extended);

    public
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
  System.SysUtils;

constructor TKomplex.Create(_Real : Extended; _Imaginary : Extended);
begin
  inherited Create;
  FReal := _Real;
  FImaginary := _Imaginary;
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
