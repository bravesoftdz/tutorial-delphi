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

type
  TIntArr = Array of Integer;

procedure Nr1;
const
  CString : String = 'abcde';
var
  HChar : Char;
begin
  HChar := CString[2];
  WriteLn(HChar);
end;

function Identical(const _String : String) : Boolean;
begin
  if Length(_String) <> 0 then
  begin
    Result := _String[Low(_String)] = _String[High(_String)];
  end
  else
  begin
    Result := False;
  end;
end;

procedure Nr2;
begin
  WriteLn('"abcde"  -> ', Identical('abcde'));
  WriteLn('"abcdea" -> ', Identical('abcdea'));
  WriteLn('""       -> ', Identical(''));
end;

function GetCharCount(_String : String; _Char : Char) : Integer;
var
  HIndex : Integer;
begin
  Result := 0;

  for HIndex := Low(_String) to High(_String) do
  begin
    if _String[HIndex] = _Char then
    begin
      Inc(Result);
    end;
  end;
end;

procedure Nr3;
begin
  WriteLn('"aasdfssddsdaa" -> ', GetCharCount('aasdfssddsdaa', 'a'));
  WriteLn('"abcdefghijklm" -> ', GetCharCount('abcdefghijklm', 'a'));
  WriteLn('""              -> ', GetCharCount('',              'a'));
end;

function GetCapitalString : String;
var
  HIndex : Integer;
begin
  Write('Gib bitte einen Text ein: ');
  ReadLn(Result);

  for HIndex := Low(Result) to High(Result) do
  begin
    if (Ord(Result[HIndex]) >= 97) and (Ord(Result[HIndex]) <= 122) then
    begin
      Result[HIndex] := Char(Ord(Result[HIndex]) - 32);
    end;
  end;
end;

procedure Nr4;
var
  HString : String;
begin
  HString := GetCapitalString;
  WriteLn('Der neue Text: ', HString);
end;

procedure Nr5;
var
  HIndex : Integer;
begin
  WriteLn(' ----------------- ');
  WriteLn('| Index | Zeichen |');
  WriteLn('|-------|---------|');

  for HIndex := 0 to 127 do
  begin
    WriteLn(String.Format('| %5d | %7s |',[HIndex, Char(HIndex)]));
  end;

  WriteLn(' -------|--------- ');
end;

function Reverse(_String : String) : String;
var
  HIndex : Integer;
  HCurr  : Integer;
begin
  SetLength(Result, Length(_String));
  HCurr := Low(Result);

  for HIndex := 0 to Length(_String) - 1 do
  begin
    Result[HCurr] := _String[High(_String) - HIndex];
    Inc(HCurr);
  end;
end;

procedure Nr6;
begin
  WriteLn('"Donaudampfschiffahrtsgesellschaftskapitän" -> ', Reverse('Donaudampfschiffahrtsgesellschaftskapitän'));
end;

function ClozeText(_String : String) : String;
var
  HIndex : Integer;
  HCurr  : Integer;
  HCount : Integer;
begin
  SetLength(Result, Length(_String));
  HCurr := Low(Result);
  HCount := 1;

  for HIndex := Low(Result) to High(_String) do
  begin
    if (HCount mod 4) = 0 then
    begin
      Result[HCurr] := ' ';
    end
    else
    begin
      Result[HCurr] := _String[HIndex];
    end;

    Inc(HCurr);
    Inc(HCount);
  end;
end;

procedure Nr7;
begin
  WriteLn('"123456789"                              -> ', ClozeText('123456789'));
  WriteLn('"Das ist ein Text sie alle zu knechten." -> ', ClozeText('Das ist ein Text sie alle zu knechten.'));
  WriteLn('""                                       -> ', ClozeText(''));
end;

function GetParameters : TIntArr;
var
  HInput     : String;
  HTokenized : TArray<String>;
  HIndex     : Integer;
  HCurr      : Integer;
begin
  Write('Bitte gib Parameter ein: ');
  ReadLn(HInput);

  HTokenized := HInput.Split([',']);

  SetLength(Result, Length(HTokenized));
  HCurr := Low(Result);

  for HIndex := Low(HTokenized) to High(HTokenized) do
  begin
    Result[HCurr] := StrToInt(HTokenized[Hindex]);
    Inc(HCurr);
  end;
end;

procedure Nr8;
var
  HResult : TIntArr;
  HTmp    : Integer;
begin
  HResult := GetParameters;

  Write('Extrahierte Parameter: [ ');

  for HTmp in HResult do
  begin
    Write(HTmp, ' ');
  end;

  WriteLn(']');

  SetLength(HResult, 0);
end;

function NewGermanOrthography(_String : String) : String;
var
  HIndex : Integer;
begin
  HIndex := Low(_String);
  while HIndex <= (High(_String) - 2) do
  begin
    if ((_String[HIndex] = 'S') or (_String[HIndex ] = 's')) and (_String[HIndex + 1] = 'c') and (_String[HIndex + 2] = 'h') then
    begin
      if (_String[HIndex] = 'S') then
      begin
        Result := Result + 'Sh';
      end
      else if (_String[HIndex] = 's') then
      begin
        Result := Result + 'sh';
      end;
      Inc(HIndex, 3);
    end
    else
    begin
      Result := Result + _String[HIndex];
      Inc(HIndex);
      if HIndex > (High(_String) - 2) then
      begin
        Result := Result + _String[HIndex] + _String[HIndex+1];
      end;
    end;
  end;
end;

procedure Nr9;
begin
  WriteLn('"Neue deutsche Rechtschreibung" -> ', NewGermanOrthography('Neue deutsche Rechtschreibung'));
  WriteLn('"Sch sch" -> ', NewGermanOrthography('Sch sch'));
  WriteLn('"" -> ', NewGermanOrthography(''));
end;

function GetDigitCount(_Number : Integer) : TIntArr;
var
  HCurr   : Integer;
begin
  SetLength(Result, 10);
  HCurr := _Number;

  if HCurr < 0 then
  begin
    HCurr := -HCurr;
  end;

  while HCurr <> 0 do
  begin
    Inc(Result[HCurr mod 10]);
    HCurr := Trunc(HCurr / 10);
  end;
end;

procedure Nr10;
var
  HResult : TIntArr;
  HIndex  : Integer;
begin
  HResult := GetDigitCount(1234567890);

  WriteLn('Häufigkeit:');

  for HIndex := Low(HResult) to High(HResult) do
  begin
    WriteLn(HIndex, ' -> ', HResult[HIndex]);
  end;

  SetLength(HResult, 0);
end;

end.
