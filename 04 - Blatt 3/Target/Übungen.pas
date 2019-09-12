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

implementation

uses
  System.SysUtils;

procedure Nr1Helper(_Input : Boolean);
var
  HInvert : Boolean;
begin
  HInvert := not _Input;
  WriteLn('_Input=', _Input, ', HInvert=', HInvert);
end;

procedure Nr1;
begin
  Nr1Helper(True);
  Nr1Helper(False);
end;

procedure Nr2Helper(_Input : Integer);
begin
  if (_Input = 5) or (_Input = 37) then
  begin
    WriteLn(_Input, ' --> ', 'Ja');
  end;
end;

procedure Nr2;
begin
  Nr2Helper(5);
  Nr2Helper(20);
  Nr2Helper(37);
end;

procedure Nr3Helper(_Input : Integer);
begin
  if _Input < 1 then
  begin
    WriteLn(_Input, ' --> ', _Input);
  end
  else
  begin
    WriteLn(_Input, ' --> ', _Input + 1);
  end;
end;

procedure Nr3;
begin
  Nr3Helper(-10);
  Nr3Helper(1);
  Nr3Helper(10);
end;

procedure Nr4Helper1(_Input : Integer);
var
  HResult : Boolean;
begin
  HResult := False;
  if _Input = 5 then
  begin
    HResult := True;
  end;
  WriteLn(_Input, ' --> ', HResult);
end;

procedure Nr4Helper2(_Input : Integer);
var
  HResult : Boolean;
begin
  HResult := _Input = 5;
  WriteLn(_Input, ' --> ', HResult);
end;

procedure Nr4;
begin
  WriteLn('With if');
  Nr4Helper1(0);
  Nr4Helper1(5);
  Nr4Helper1(10);

  WriteLn('Without if');

  Nr4Helper2(0);
  Nr4Helper2(5);
  Nr4Helper2(10);
end;

procedure Nr5Helper(_Input : Integer);
begin
  case _Input of
    1: ;
    2: ;
    3: ;
  end;
end;

procedure Nr5;
begin
  Nr5Helper(1);
  Nr5Helper(2);
  Nr5Helper(3);
end;

function GetTemperaturText(_Temp : Extended) : String;
begin
  if _Temp <= 10 then
  begin
    Result := 'kalt';
  end
  else if _Temp <= 25 then
  begin
    Result := 'lauwarm';
  end
  else if _Temp <= 40 then
  begin
    Result := 'warm';
  end
  else
  begin
    Result := 'heiß';
  end;
end;

procedure Nr6;
begin
  WriteLn(-1, ' --> ', GetTemperaturText(-1));
  WriteLn(11, ' --> ', GetTemperaturText(11));
  WriteLn(28, ' --> ', GetTemperaturText(28));
  WriteLn(121, ' --> ', GetTemperaturText(121));
end;

function GetWaitingTime(_Hours : Integer; _Min : Integer) : Integer;
begin
  Result := (30 - (_Min mod 30)) mod 30;
end;

procedure Nr7;
begin
  WriteLn('01:13 --> ', GetWaitingTime(1,13));
  WriteLn('01:00 --> ', GetWaitingTime(1,0));
  WriteLn('01:30 --> ', GetWaitingTime(1,30));
  WriteLn('01:59 --> ', GetWaitingTime(1,59));
end;

function SolveLinearEquation(_A : Extended; _B : Extended) : Extended;
begin
  if (_A = 0) and (_B = 0) then
  begin
    raise Exception.Create('Es sind unendlich viele Lösungen möglich');
  end
  else if (_A = 0) then
  begin
    raise Exception.Create('Es ist keine Lösung möglich');
  end;

  Result := (-_B)/_A;
end;

procedure Nr8Helper(_A : Extended; _B : Extended);
var
  HResult : Extended;
begin
  try
    HResult := SolveLinearEquation(_A, _B);
    WriteLn('Die Nullstelle von ',
            FloatToStr(_A),
            'x+',
            FloatToStr(_B),
            ' liegt bei x=',
            FloatToStr(HResult),
            '.');
  except on E : Exception do
    WriteLn(FloatToStr(_A),
            'x+',
            FloatToStr(_B),
            ' hat keine Nullstelle (',
            E.Message,
            ').')
  end;
end;

procedure Nr8;
begin
  Nr8Helper(0,0);
  Nr8Helper(0,1);
  Nr8Helper(1,1);
  Nr8Helper(10,-5);
end;

function GetPostage(_Cents : Integer) : Integer;
begin
  if _Cents < 10000 then
  begin
    Result := 550;
  end
  else if _Cents < 20000 then
  begin
    Result := 300;
  end
  else
  begin
    Result := 0;
  end;
end;

procedure Nr9;
begin
  WriteLn('Die zusätzlichen Kosten für eine 15 Euro Bestellung belaufen sich auf ',
          FloatToStr(GetPostage(1500) / 100),
          ' Euro.');
  WriteLn('Die zusätzlichen Kosten für eine 150 Euro Bestellung belaufen sich auf ',
          FloatToStr(GetPostage(15000) / 100),
          ' Euro.');
  WriteLn('Die zusätzlichen Kosten für eine 200,01 Euro Bestellung belaufen sich auf ',
          FloatToStr(GetPostage(20001) / 100),
          ' Euro.');
end;

function GetNameOfMonth(_Nr : Integer) : String;
begin
  case _Nr of
     1: Result := 'Januar';
     2: Result := 'Februar';
     3: Result := 'März';
     4: Result := 'April';
     5: Result := 'Mai';
     6: Result := 'Juni';
     7: Result := 'Juli';
     8: Result := 'August';
     9: Result := 'September';
    10: Result := 'Oktober';
    11: Result := 'November';
    12: Result := 'Dezember';
    else
      raise Exception.Create(IntToStr(_Nr) +
                             ' hat keinen entsprechenden Monat. Versuche es mit Zahlen von 1(Januar) bis 12(Februar).');
  end;
end;

procedure Nr10;
begin
  WriteLn('1=',GetNameOfMonth(1));
  WriteLn('4=',GetNameOfMonth(4));
  WriteLn('8=',GetNameOfMonth(8));
  WriteLn('12=',GetNameOfMonth(12));

  try
    GetNameOfMonth(-1);
  except on E : Exception do
    WriteLn(E.Message);
  end;
end;

end.
