unit Übungen;

{$HINTS OFF}

interface

type
  TExcercise = procedure;

procedure Nr1;
procedure Nr2;
procedure Nr3;
procedure Nr4;
procedure Nr5;
procedure Nr6;
procedure Nr7;
procedure Nr8;
procedure Nr9;
procedure Nr10;
procedure Nr11;
procedure Nr12;
procedure Nr13;
procedure Nr14;
procedure Nr15;

implementation

uses
  System.SysUtils,
  Math
  ;

procedure Nr1;
var
  HMenge : Integer;
begin
  HMenge := 2;
end;

procedure Nr2;
begin
  WriteLn(FloatToStr(3 / 17));
end;

procedure Nr3;
var
  HBruch : Single;
begin
  HBruch := 1 / 7;
  WriteLn(FloatToStr(HBruch));
end;

procedure Nr4;
var
  HPi : Double;
begin
  HPi := PI;
  WriteLn('Pi hat den Wert ', FloatToStr(HPi));
end;

procedure Nr5;
var
  HSqrtTwoDouble : Double;
  HSqrtTwoInteger : Integer;
begin
  HSqrtTwoDouble := Sqrt(2);
  HSqrtTwoInteger := trunc(Sqrt(2));
end;

procedure Nr6;
var
  HExtendedStart : Extended;
  HIntegerMemory : Integer;
  HExtendedEnd   : Extended;
begin
  HExtendedStart := 4.3;
  HIntegerMemory := trunc(HExtendedStart);
  HExtendedEnd := HIntegerMemory;
end;

procedure Nr7;
var
  HInput : String;
begin
  Write('Gib einen String-Wert ein: ');
  ReadLn(HInput);
end;

procedure Nr8;
var
  HInput : Integer;
begin
  Write('Gib einen Integer-Wert ein: ');
  ReadLn(HInput);
end;

procedure Nr9;
var
  HInput : Extended;
begin
  Write('Gib einen Extended-Wert ein: ');
  ReadLn(HInput);
end;

procedure Nr10;
var
  HOne : Integer;
  HTwo : Integer;
  HTmp : Integer;
begin
  HOne := 1;
  HTwo := 2;

  HTmp := HOne;
  HOne := HTwo;
  HTwo := HTmp;
end;

procedure Nr11;
var
  HInput : Extended;
begin
  Write('Gib einen Extended-Wert ein: ');
  ReadLn(HInput);
  WriteLn('Zahl: ', FloatToStr(HInput), ', Reziproke Zahl: ', FloatToStr(1/HInput));
end;

procedure Nr12;
var
  HInput : Extended;
begin
  Write('Gib einen Extended-Wert ein: ');
  ReadLn(HInput);
  WriteLn('Absolutwert: ', FloatToStr(Abs(HInput)));
  WriteLn('natürlicher Logarithmus: ', FloatToStr(Ln(HInput)));
  WriteLn('Sinus Hyperbolikus: ', FloatToStr(Sin(HInput)));
end;

function ToFahrenheit(_Celsius : Extended) : Extended;
begin
  Result :=  _Celsius * 9 / 5 + 32;
end;

procedure Nr13;
begin
  WriteLn('0°C sind ', FloatToStr(ToFahrenheit(0)), '°F');
  WriteLn('-40°C sind ', FloatToStr(ToFahrenheit(-40)), '°F');
end;

function GetDistance(_X1 : Extended; _Y1 : Extended; _X2 : Extended; _Y2 : Extended) : Extended;
begin
  Result := Sqrt(Power(_X1 - _X2, 2) + Power(_Y1 - _Y2, 2));
end;

procedure Nr14;
begin
  WriteLn('P1=(0,0) und P2=(0,0) haben den Abstand ', FloatToStr(GetDistance(0,0,0,0)), '.');
  WriteLn('P1=(0,0) und P2=(10,0) haben den Abstand ', FloatToStr(GetDistance(0,0,10,0)), '.');
end;

function GetExtendedRandom(_Min : Extended; _Max : Extended) : Extended;
begin
  Result := _Min + Random * (_Max - _Min);
end;

function GetIntegerRandom(_Min : Integer; _Max : Integer) : Integer;
begin
  Result := trunc(GetExtendedRandom(_Min, _Max));
end;

procedure Nr15;
begin
  Randomize;
  WriteLn('Eine Zufallszahl zwischen 5.5 und 5.6: ', FloatToStr(GetExtendedRandom(5.5, 5.6)), '.');
  WriteLn('Eine Zufallszahl zwischen -10 und 50 : ', GetIntegerRandom(-10,50), '.');
end;

end.
