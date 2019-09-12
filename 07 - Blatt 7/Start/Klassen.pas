unit Klassen;

interface

type

/// <summary>
///   Repraesentiert einen Bruch mit Integer-Werten als Zaehler und Nenner. <br /><br />
///   Invarianten: <br />1.Der Bruch ist immer gekuerzt. <br />2.Der Nenner ist
///   immer groesser als 0. <br />
/// </summary>
TBruch = class
private // Attribute
  FZähler : Integer;
  FNenner : Integer;

public // Konstruktoren
  /// <summary>
  ///   Erzeugt einen Bruch mit dem gegebenen Zaehler und Nenner.
  /// </summary>
  /// <param name="_Zähler">
  ///   der Zaehler des Bruchs
  /// </param>
  /// <param name="_Nenner">
  ///   der Nenner des Bruchs
  /// </param>
  /// <exception cref="Exception">
  ///   falls der Nenner gleich 0 ist.
  /// </exception>
  constructor Create(const _Zähler : Integer; const _Nenner : Integer);
  /// <summary>
  ///   Initialisiert den Bruch mit einem String des Formats zaehler/nenner.
  /// </summary>
  /// <param name="_BruchString">
  ///   der String im Format zaehler/nenner.
  /// </param>
  /// <exception cref="Exception">
  ///   falls das Format nicht stimmt.
  /// </exception>
  /// <exception cref="Exception">
  ///   falls der Nenner 0 ist.
  /// </exception>
  constructor CreateFromStr(const _BruchString : String);
  /// <summary>
  ///   Erzeugt eine Kopie (Klon) des uebergebenen Bruchs (Copy-Konstruktor).
  /// </summary>
  /// <param name="_Bruch">
  ///   der Bruch, der geklont werden soll.
  /// </param>
  constructor CreateClone(const _Bruch : TBruch); overload;

private // Getter
  /// <summary>
  ///   Gibt den Nenner des Bruchs zurueck.
  /// </summary>
  /// <returns>
  ///   der Nenner des Bruchs.
  /// </returns>
  function GetNenner : Integer;
  /// <summary>
  ///   Gibt den Zaehler des Bruchs zurueck.
  /// </summary>
  /// <returns>
  ///   der Zaehler des Bruchs.
  /// </returns>
  function GetZähler : Integer;

private // Setter
  /// <summary>
  ///   Setzt den Nenner des Bruchs.
  /// </summary>
  /// <param name="_Nenner">
  ///   der Nenner des Bruchs.
  /// </param>
  /// <exception cref="Exception">
  ///   falls der Nenner 0 ist.
  /// </exception>
  procedure SetNenner(const _Nenner : Integer);
  /// <summary>
  ///   Setzt den Zaehler des Bruchs.
  /// </summary>
  /// <param name="_Zähler">
  ///   der Zaehler des Bruchs.
  /// </param>
  procedure SetZähler(const _Zähler : Integer);

public // Properties
  property Nenner : Integer read GetNenner write SetNenner;
  property Zähler : Integer read GetZähler write SetZähler;

public // Member procedures
  /// <summary>
  ///   Multipliziert den Bruch mit dem angegebenen Faktor.
  /// </summary>
  /// <param name="_Faktor">
  ///   der Faktor, mit dem der Bruch multipliziert wird.
  /// </param>
  procedure Mult(const _Faktor : Integer); overload;
  /// <summary>
  ///   Multipliziert den Bruch mit dem uebergebenen Bruch.
  /// </summary>
  /// <param name="_Bruch">
  ///   der Bruch, mit dem multipliziert werden soll.
  /// </param>
  procedure Mult(const _Bruch : TBruch); overload;
  /// <summary>
  ///   Addiert den uebergebenen Bruch.
  /// </summary>
  /// <param name="_Bruch">
  ///   der zu addierende Bruch
  /// </param>
  procedure Add(const _Bruch : TBruch);
  /// <summary>
  ///   Invertiert den Bruch.
  /// </summary>
  /// <exception cref="Exception">
  ///   falls der Zaehler 0 war.
  /// </exception>
  procedure Inverse;

public // Member functions
  /// <summary>
  ///   Gibt den Wert des Bruchs als double-Wert zurueck.
  /// </summary>
  /// <returns>
  ///   der Wert des Bruchs als double-Wert.
  /// </returns>
  function GetFloatWert : Extended;
  /// <summary>
  ///   Gibt die Inverse des Bruchs zurueck.
  /// </summary>
  /// <returns>
  ///   die Inverse des Bruchs.
  /// </returns>
  /// <exception cref="Exception">
  ///   falls der Zaehler 0 war.
  /// </exception>
  function GetInverse : TBruch;
  /// <summary>
  ///   Gibt String in der Form Zaehler/Nenner zurueck.
  /// </summary>
  /// <returns>
  ///   der Strring in der Form Zaehler/Nenner
  /// </returns>
  function ToString : String; override;
  /// <summary>
  ///   Gibt zurueck, ob die Zaehler und Nenner zweier Brueche gleich sind.
  /// </summary>
  /// <returns>
  ///   true wenn die Objekte gleich sind, sonst false.
  /// </returns>
  function Equals(_Other : TObject) : Boolean; override;

private // Private Helper
  /// <summary>
  ///   Normaliesiert den aktuellen Bruch.
  /// </summary>
  procedure Normalisiere;
end;

TPoint = class
private
var
  FX : Extended;
  FY : Extended;

public
  constructor Create(_X : Extended; _Y : Extended);

public
  procedure Add(_DX : Extended; _DY : Extended);

private
  function GetX : Extended;
  function GetY : Extended;

public
  property X : Extended read GetX;
  property Y : Extended read GetY;

public
  class function Distance(_One : TPoint; _Two : TPoint) : Extended; static;
end;

implementation

uses
  System.SysUtils,
  Math;

constructor TBruch.Create(const _Zähler : Integer; const _Nenner : Integer);
begin
  inherited Create;

  if _Nenner = 0 then
  begin
    raise Exception.Create('Der Nenner darf nicht 0 sein.');
  end;

  FZähler := _Zähler;
  FNenner := _Nenner;

  Normalisiere;
end;

constructor TBruch.CreateFromStr(const _BruchString: String);
var
  HTokenList: TArray<String>;
begin
  inherited Create;

  HTokenList := _BruchString.Split(['/']);

  if Length(HTokenList) <> 2 then
  begin
    raise Exception.Create
      ('Das Format des Strings muss ''Zähler/Nenner'' sein');
  end;

  FZähler := StrToInt(HTokenList[0]);
  FNenner := StrToInt(HTokenList[1]);

  Normalisiere;
end;

constructor TBruch.CreateClone(const _Bruch: TBruch);
begin
  inherited Create;

  FZähler := _Bruch.FZähler;
  FNenner := _Bruch.FNenner;
end;

function TBruch.GetNenner : Integer;
begin
  Result := FNenner;
end;

function TBruch.GetZähler : Integer;
begin
  Result := FZähler;
end;

procedure TBruch.SetNenner(const _Nenner : Integer);
begin
  if _Nenner = 0 then
  begin
    raise Exception.Create('Der Nenner darf nicht 0 sein.');
  end;

  FNenner := _Nenner;

  Normalisiere;
end;

procedure TBruch.SetZähler(const _Zähler : Integer);
begin
  FZähler := _Zähler;

  Normalisiere;
end;

procedure TBruch.Mult(const _Faktor : Integer);
begin
  FZähler := FZähler * _Faktor;

  Normalisiere;
end;

procedure TBruch.Mult(const _Bruch : TBruch);
begin
  FZähler := FZähler * _Bruch.FZähler;
  FNenner := FNenner * _Bruch.FNenner;

  Normalisiere;
end;

procedure TBruch.Add(const _Bruch : TBruch);
begin
  FZähler := FZähler * _Bruch.FNenner + FNenner * _Bruch.FZähler;
  FNenner := FNenner * _Bruch.FNenner;

  Normalisiere;
end;

procedure TBruch.Inverse;
var
  HTemp : Integer;
begin
  HTemp := FNenner;

  if FZähler = 0 then
  begin
    raise Exception.Create('Der Nenner darf nicht 0 sein.');
  end;

  FNenner := FZähler;
  FZähler := HTemp;

  Normalisiere;
end;

function TBruch.GetFloatWert : Extended;
begin
  Result := FZähler / FNenner;
end;

function TBruch.GetInverse : TBruch;
begin
  Result := TBruch.CreateClone(Self);
  Result.Inverse;
end;

function TBruch.ToString : String;
begin
  Result := IntToStr(FZähler) + '/' + IntToStr(FNenner);
end;

function TBruch.Equals(_Other : TObject) : Boolean;
begin
  if _Other is TBruch then
  begin
    Result := ((_Other As TBruch).FZähler = FZähler) and ((_Other As TBruch).FNenner = FNenner);
  end
  else
  begin
		Result := False;
  end;
end;

procedure TBruch.Normalisiere;
var
  HTempA : Integer;
  HTempB : Integer;
  HTemp  : Integer;
begin
  if FNenner < 0 then
  begin
    FNenner := -FNenner;
    FZähler := -FZähler;
  end;

  if FZähler = 0 then
  begin
    FNenner := 1;
  end
  else
  begin
    HTempA := FZähler;
    HTempB := FNenner;

    if HTempA < 0 then
    begin
      HTempA := -HTempA;
    end;

    while (HTempB <> 0) do
    begin
      HTemp := HTempA mod HTempB;
      HTempA := HTempB;
      HTempB := HTemp;
    end;

    FZähler := Trunc(FZähler / HTempA);
    FNenner := Trunc(FNenner / HTempA);
  end;
end;

constructor TPoint.Create(_X : Extended; _Y : Extended);
begin
  FX := _X;
  FY := _Y;
end;

procedure TPoint.Add(_DX : Extended; _DY : Extended);
begin
  FX := FX + _DX;
  FY := FY + _DY;
end;

function TPoint.GetX : Extended;
begin
  Result := FX;
end;

function TPoint.GetY : Extended;
begin
  Result := FY;
end;

class function TPoint.Distance(_One : TPoint; _Two : TPoint) : Extended;
begin
  Result :=  Sqrt(Power(_One.FX - _Two.FX,2) + Power(_One.FY - _Two.FY, 2))
end;

end.
