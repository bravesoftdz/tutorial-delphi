unit Example;

interface

procedure Test; // Mit dieser Methode kann die Klasse TPerson getestet werden.

type

TPerson = class
private                 // Sichtbarkeit der nachfolgenden Methoden und Variablen
  FName      : String;  // FName ist ein Attribut vom Typ String der Klasse. Diese sollten im Code immer mit F für Field beginnen.
  FAge       : Integer; // FAge ist ein Attribut vom Typ Integer der Klasse.
  FHairColor : Integer; // FHairColor ist ein Attribut vom Typ Integer der Klasse.

public                                      // Sichtbarkeit der nachfolgenden Methoden und Variablen
  constructor Create(_Name      : String;
                     _Age       : Integer;
                     _HairColor : Integer); // Der Konstruktor. Dieser sollte immer Create heißen.
  destructor  Destroy; override;            // Der Destruktor. Dieser wird aufgerufen wenn das Objekt zerstört wird und sollte immer Destroy heißen. Auch muss er als override gekennzeichnet sein, um den Destruktor der Oberklasse zu überlagern.

private                            // Sichtbarkeit der nachfolgenden Methoden und Variablen
  function GetName      : String;  // Der Getter für das Attribut FName. Dieser ist private, da Getter und Setter über properties Sichtbar gemacht werden (wie in C#).
  function GetAge       : Integer; // Der Getter für das Attribut FAge.
  function GetHairColor : Integer; // Der Getter für das Attribut FHairColor.

private                                         // Sichtbarkeit der nachfolgenden Methoden und Variablen
  procedure SetHairColor(_HairColor : Integer); // Der Setter für das Attribut FHairColor.

public                                  // Sichtbarkeit der nachfolgenden Methoden und Variablen
  procedure GrowUp;                     // Eine public Methode.
  function ToString : String; override; // Eine public Methode mit Rückgabewert.

public
  class function CreateDefault : TPerson; // Statische Methoden haben immer ein vorangestelltes class.

public
  property Name      : String  read GetName;                         // Eine Property erlaubt es auf z.B. ein Attribut mithilfe des Punktoperators zugreifen zu können, sodass im Hintergrund allerdings Methoden genutzt werden.
  property Age       : Integer read GetAge;                          // Eine Property die lesenden Zugriff auf das Alter ermöglicht.
  property HairColor : Integer read GetHairColor write SetHairColor; // Eine Property die lesenden und schreibenenden Zugriff auf die Haarfarbe ermöglicht.

end;

implementation

uses
  System.SysUtils;

procedure Test;
var
  HTest : TPerson;
begin
  // Aufruf des Konstruktors
  HTest := TPerson.Create('Jonas', 20, $CCC49b);
  try
    // Aufruf der Property Methoden (Getter)
    WriteLn(HTest.Name {entspricht HTest.GetName});
    WriteLn(HTest.Age {entspricht HTest.GetAge});
    WriteLn(HTest.HairColor {entspricht HTest.GetHairColor});

    // Aufruf der Property Methoden (Setter)
    HTest.HairColor := $BBBBBB; // entspricht HTest.SetHairColor($BBBBBB)
    WriteLn(HTest.HairColor);

    // Aufruf der procedure GrowUp
    HTest.GrowUp;
    WriteLn(HTest.Age);

    // Aufruf der function ToString
    WriteLn(HTest.ToString);
  finally
    FreeAndNil(HTest);
  end;

  // Aufruf der statischen Methode.
  HTest := TPerson.CreateDefault;
  try
  finally
    FreeAndNil(HTest);
  end;
end;

constructor TPerson.Create(_Name      : String;
                           _Age       : Integer;
                           _HairColor : Integer);
begin
  // Das neue Objekt wird mit den übergebenen Werten initialisiert
  FName      := _Name;
  FAge       := _Age;
  FHairColor := _HairColor;
end;

destructor TPerson.Destroy;
begin
  inherited; // Ruft den Destruktor der Oberklasse auf.
end;

function TPerson.GetName : String;
begin
  // Gibt FName zurück.
  Result := FName;
end;

function TPerson.GetAge : Integer;
begin
  // Gibt FAge zurück.
  Result := FAge;
end;

function TPerson.GetHairColor : Integer;
begin
  // Gibt FHairColor zurück.
  Result := FHairColor;
end;

procedure TPerson.SetHairColor(_HairColor: Integer);
begin
  // Setzt FHairColor auf den übergebenen Wert.
  FHairColor := _HairColor;
end;

procedure TPerson.GrowUp;
begin
  // Erhöht das Alter um eins.
  inc(FAge);
end;

function TPerson.ToString : String;
begin
  // Gibt die Information als JSON String zurück.
  Result := '{' +
            'name:"' + FName + '",' +
            'age:' + IntToStr(FAge) + ',' +
            'hair_color:' + IntToStr(FHairColor) +
            '}';
end;

class function TPerson.CreateDefault : TPerson;
begin
  // Erstellt eine Person mit default werten und gibt diese zurück.
  Result := TPerson.Create('Default', 42, $0000FF);
end;

end.
