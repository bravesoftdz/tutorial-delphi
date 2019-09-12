unit Übungen;

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

implementation

uses
  System.SysUtils;

procedure Nr1;
var
  HTmp : Integer;
begin
  for HTmp := 1 to 10 do
  begin
    WriteLn(HTmp);
  end;
end;

procedure Nr2;
var
  HTmp : Integer;
begin
  for HTmp := 2 to 30 do
  begin
    WriteLn(FloatToStr(Sqrt(HTmp)));
  end;
end;

procedure Nr3;
var
  HTmp : Integer;
begin
  HTmp := 0;

  while (HTmp * HTmp) <= 12000 do
  begin
    inc(HTmp);
  end;

  WriteLn('Ergebnis:', HTmp, ' (', HTmp, '*', HTmp, '=', HTmp*HTmp, '>12000)');
end;

function GetFactorial(_Number : Integer) : Integer;
var
  HTmp : Integer;
begin
  if _Number < 1 then
  begin
    raise Exception.Create('Konnte keine Fakultät berechnen, weil ' + IntToStr(_Number) + ' < 1');
  end;

  Result := 1;
  for HTmp := 1 to _Number do
  begin
    Result := Result * HTmp;
  end;
end;

procedure Nr4;
begin
  WriteLn('1!=', GetFactorial(1));
  WriteLn('4!=', GetFactorial(4));
  WriteLn('5!=', GetFactorial(5));

  try
    GetFactorial(-1);
  except on E : Exception do
    WriteLn(E.Message);
  end;
end;

function DoubleBirthday(_Size : Integer) : Extended;
var
  HTmp : Integer;
begin
  if _Size < 1 then
  begin
    raise Exception.Create('Konnte keine Wahrscheinlichkeit berechnen, weil ' + IntToStr(_Size) + ' < 1');
  end;

  Result := 1;

  for HTmp := 1 to _Size do
  begin
    Result := Result * (365 - HTmp + 1) / 365;
  end;

  Result := 1 - Result;
end;

procedure Nr5;
begin
  WriteLn('Die Wahrscheinlichkeit das 2 Personen in einer 1er Gruppe am gleichen Tag Geburtstag haben ist gleich ',
          FloatToStr(DoubleBirthday(1)),
          '.');
  WriteLn('Die Wahrscheinlichkeit das 2 Personen in einer 30er Gruppe am gleichen Tag Geburtstag haben ist gleich ',
          FloatToStr(DoubleBirthday(30)),
          '.');
  WriteLn('Die Wahrscheinlichkeit das 2 Personen in einer 365er Gruppe am gleichen Tag Geburtstag haben ist gleich ',
          FloatToStr(DoubleBirthday(365)),
          '.');
end;

function GetPi(_Count : Integer) : Extended;
var
  HTemp : Integer;
begin
  if _Count < 1 then
  begin
    raise Exception.Create('Konnte Pi nicht annähern, weil ' + IntToStr(_Count) + ' < 1');
  end;

  Result := 0;

  for HTemp := 1 to _Count do
  begin
    if (HTemp mod 2) = 1 then
    begin
      Result := Result + 1 / (HTemp * 2 - 1);
    end
    else
    begin
      Result := Result - 1 / (HTemp * 2 - 1);
    end;
  end;

  Result := Result * 4;
end;

procedure Nr6;
begin
  WriteLn('Pi nach       1 Iteration: ', FloatToStr(GetPi(      1)));
  WriteLn('Pi nach      10 Iteration: ', FloatToStr(GetPi(     10)));
  WriteLn('Pi nach     100 Iteration: ', FloatToStr(GetPi(    100)));
  WriteLn('Pi nach    1000 Iteration: ', FloatToStr(GetPi(   1000)));
  WriteLn('Pi nach   10000 Iteration: ', FloatToStr(GetPi(  10000)));
  WriteLn('Pi nach  100000 Iteration: ', FloatToStr(GetPi( 100000)));
  WriteLn('Pi nach 1000000 Iteration: ', FloatToStr(GetPi(1000000)));
end;

function GetNextPartialSum(_V : Integer) : Integer;
var
  HTemp : Integer;
begin
  if _V < 1 then
  begin
    raise Exception.Create('Konnte keine Summe bilden, weil ' + IntToStr(_V) + ' < 1');
  end;

  Result := 0;
  HTemp := 1;
  while Result < _V do
  begin
    Result := Result + HTemp;
    Inc(HTemp);
  end;
end;

procedure Nr7;
begin
  WriteLn('Summe größer/gleich 1: ', GetNextPartialSum(1));
  WriteLn('Summe größer/gleich 2: ', GetNextPartialSum(2));
  WriteLn('Summe größer/gleich 3: ', GetNextPartialSum(3));
  WriteLn('Summe größer/gleich 4: ', GetNextPartialSum(4));
  WriteLn('Summe größer/gleich 5: ', GetNextPartialSum(5));
  WriteLn('Summe größer/gleich 6: ', GetNextPartialSum(6));
  WriteLn('Summe größer/gleich 100: ', GetNextPartialSum(100));
end;

procedure Nr8;
var
  HInput : Integer;
  HCurr  : Integer;
  HCount : Integer;
begin
  HCurr := 0;
  HCount := 0;

  repeat
    Write('Gib eine Zahl ein: ');
    ReadLn(HInput);

    HCurr := HCurr + HInput;
    Inc(HCount);
  until (HInput = 0);

  Dec(HCount);

  if HCount <> 0 then
  begin
    WriteLn('Insgesamt: ', HCurr);
    WriteLn('Durchschnitt: ', FloatToStr(HCurr / HCount));
  end;
end;

procedure Nr9;
var
  HInput : Integer;
begin
  repeat
    Write('Gib einen ASCII-Wert ein: ');
    ReadLn(HInput);

    if HInput <> 0 then
    begin
      if (HInput < 0) or (HInput > 127) then
      begin
        raise Exception.Create(IntToStr(HInput) + ' ist kein gültiger ASCII Wert.');
      end;

      WriteLn(Char(HInput))
    end;
  until (HInput = 0);
end;

function GetFibonacciNumber(_N : Integer) : Integer;
var
  HOne : Integer;
  HTwo : Integer;
  HTmp : Integer;
begin
  if _N < 1 then
  begin
    raise Exception.Create('Konnte keine Summe bilden, weil ' + IntToStr(_N) + ' < 1');
  end;

  HTwo := 0;
  HOne := 1;
  Result := 1;

  for HTmp := 2 to _N do
  begin
    Result := HOne + HTwo;
    HTwo := HOne;
    HOne := Result;
  end;
end;

procedure Nr10;
begin
  WriteLn('Fibonacci Zahl an Position  1: ', GetFibonacciNumber(1));
  WriteLn('Fibonacci Zahl an Position  2: ', GetFibonacciNumber(2));
  WriteLn('Fibonacci Zahl an Position  3: ', GetFibonacciNumber(3));
  WriteLn('Fibonacci Zahl an Position 30: ', GetFibonacciNumber(30));
end;

end.
