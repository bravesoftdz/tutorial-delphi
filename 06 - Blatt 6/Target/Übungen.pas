unit Übungen;

interface

type
  TExcercise = procedure;

procedure Nr1;
procedure Nr2;
procedure Nr3;

implementation

uses
  System.SysUtils,
  Math;

function GCD(_A : Integer; _B : Integer): Integer;
var
  HTemp: Integer;
begin
  if (_A < 1) or (_B < 1) then
  begin
    raise Exception.Create('Es kann kein ggT ermittelt werden. (A < 1 oder B < 1)');
  end;

  Result := _A;
  HTemp := _B;

  while HTemp <> 0 do
  begin
    if Result > HTemp then
    begin
      Result := Result - HTemp;
    end
    else
    begin
      HTemp := HTemp - Result;
    end;
  end;
end;

procedure Nr1;
begin
  WriteLn('ggT von 1 und 1: ', GCD(1, 1));
  WriteLn('ggT von 50 und 17: ', GCD(50, 17));
  WriteLn('ggT von 10000 und 99995: ', GCD(10000, 99995));
end;

procedure Nr2;
const
  CRowCount : Integer = 6;
var
  HTmpRow : Integer;
  HTmpColumn : Integer;
begin
  WriteLn('Align Left');
  for HTmpRow := 1 to CRowCount do
  begin
    for HTmpColumn := 1 to HTmpRow do
    begin
      Write(HTmpRow);
    end;
    WriteLn;
  end;

  WriteLn;
  WriteLn('Align Center');

  for HTmpRow := 1 to CRowCount do
  begin
    for HTmpColumn := 1 to CRowCount - HTmpRow  do
    begin
      begin
        Write(' ');
      end;
    end;
    for HTmpColumn := 1 to HTmpRow do
    begin
      begin
        Write(HTmpRow, ' ');
      end;
    end;
    WriteLn;
  end;

end;

function Round(_Val : Extended) : Integer;
begin
  Result := Trunc(_Val + 0.5);
end;

procedure PrintCircle(_Radius : Integer);
var
  HTmpRow : Integer;
  HTmpCol : Integer;
begin
  for HTmpRow := 0 to _Radius * 2 do
  begin
    for HTmpCol := 0 to _Radius * 2 do
    begin
      if _Radius = Round(Sqrt(Power(_Radius - HTmpRow, 2) + Power(_Radius - HTmpCol, 2))) then
      begin
        Write('#');
      end
      else
      begin
        Write(' ');
      end;
    end;
    WriteLn;
  end;

end;

procedure Nr3;
begin
  PrintCircle(3);
  PrintCircle(5);
  PrintCircle(15);
  PrintCircle(35);
end;

end.
