unit Übungen;

interface

type
  TExcercise = procedure;

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

implementation

uses
  System.SysUtils;

// >> Nr 1
type
  TExtendedArray = Array of Extended;
  TIntegerArray  = Array of Integer;
  TTwoDimesionalExtendedArray = Array of TExtendedArray;
  TTwoDimesionalIntegerArray = Array of TIntegerArray;
  TMonthArray = Array [1..12] of String;
// << Nr 1

procedure Nr2;
const
  HArrayOne : Array [0..4] of Integer = (6, 9, 2, 1, 3);
var
  HArrayTwo : Array [0..4] of Integer;
begin
  HArrayTwo[0] := 6;
  HArrayTwo[1] := 9;
  HArrayTwo[2] := 2;
  HArrayTwo[3] := 1;
  HArrayTwo[4] := 3;
end;

procedure Nr3;
var
  HArray : Array [0..9] of Extended;
  HIndex : Integer;
  HValue : Integer;
begin
  HValue := 0;

  for HIndex := Low(HArray) to High(HArray) do
  begin
    HArray[HIndex] := Sqrt(HValue);
    inc(HValue);
  end;
end;

procedure Nr4;
var
  HArray : Array [0..9, 0..9] of Integer;
begin
  HArray[4, 5] := 7;
end;

function CheckSize(_Array : TTwoDimesionalExtendedArray) : Boolean;
const
  CField : Integer = 5;
begin
  Result := False;

  if (Low(_Array) <= CField) and (High(_Array) >= CField) then
  begin
    Result := (Low(_Array[5]) <= CField) and (High(_Array[5]) >= CField);
  end;
end;

procedure Nr5;
const
  HTestOne : TTwoDimesionalExtendedArray = [
                                             [   1.240,  121.234],
                                             [1241.456,   33.243]
                                           ];
  HTestTwo : TTwoDimesionalExtendedArray = [
                                             [1,1,1,1,1,1],
                                             [1,1,1,1,1,1],
                                             [1,1,1,1,1,1],
                                             [1,1,1,1,1,1],
                                             [1,1,1,1,1,1],
                                             [1,1,1,1,1,1]
                                           ];
  HTestThree : TTwoDimesionalExtendedArray = [
                                               [1],
                                               [1],
                                               [1],
                                               [1],
                                               [1],
                                               [1,1,1,1,1,1]
                                             ];
begin
  WriteLn('One:   ',   CheckSize(HTestOne));
  WriteLn('Two:   ',   CheckSize(HTestTwo));
  WriteLn('Three: ', CheckSize(HTestThree));
end;

function GetExtendedArray(_SizeX : Integer; _SizeY : Integer) : TTwoDimesionalExtendedArray;
var
  HIndex : Integer;
begin
  SetLength(Result, _SizeX);

  for HIndex := Low(Result) to High(Result) do
  begin
    SetLength(Result[HIndex], _SizeY);
  end;
end;

procedure Nr6;
var
  HTest : TTwoDimesionalExtendedArray;
  HIndex : Integer;
begin
  HTest := GetExtendedArray(10,10);
  WriteLn('Created Array with size ', Length(HTest), 'x', Length(HTest[0]));

  for HIndex := Low(HTest) to High(HTest) do
  begin
    SetLength(HTest[HIndex], 0);
  end;
  SetLength(HTest, 0);

  HTest := GetExtendedArray(30,20);
  WriteLn('Created Array with size ', Length(HTest), 'x', Length(HTest[0]));

  for HIndex := Low(HTest) to High(HTest) do
  begin
    SetLength(HTest[HIndex], 0);
  end;
  SetLength(HTest, 0);
end;


function GetMinimumIndex(_Array : TExtendedArray) : Integer;
var
  HIndex : Integer;
begin
  Result := Low(_Array);

  for HIndex := Low(_Array) + 1 to High(_Array) do
  begin
    if _Array[HIndex] < _Array[Result] then
    begin
      Result := HIndex;
    end;
  end;

end;

function GetMinimum(_Array : TExtendedArray) : Extended;
begin
  Result := _Array[GetMinimumIndex(_Array)];
end;

procedure Nr7;
const
  HTest : TExtendedArray = [0,1,2,3,4,5,6,-1,243,23,1,-1.01,3,23];
begin
  WriteLn('Minimum ', FloatToStr(GetMinimum(HTest)),' an Position ',GetMinimumIndex(HTest));
end;

function IsSquare(_Array : TTwoDimesionalIntegerArray) : Boolean;
var
  HIndex : Integer;
begin
  Result := True;

  for HIndex := Low(_Array) to High(_Array) do
  begin
    if Length(_Array) <> Length(_Array[HIndex]) then
    begin
      Result := False;
      break;
    end;
  end;
end;

procedure Nr8;
const
  HTestOne : TTwoDimesionalIntegerArray = [[1,1],[1,1]];
  HTestTwo : TTwoDimesionalIntegerArray = [[1,1],[1]];
begin
  WriteLn('Test eins: ', IsSquare(HTestOne));
  WriteLn('Test zwei: ', IsSquare(HTestTwo));
end;

function GetNameOfMonth(_Nr : Integer) : String;
const
  CMonths : TMonthArray = ('Januar', 'Februar','März','April','Mai','Juni','Juli','August','September','Oktober','November','Dezember');
begin
  if (_Nr >= Low(CMonths)) and (_Nr <= High(CMonths)) then
  begin
    Result := CMonths[_Nr];
  end
  else
  begin
    raise Exception.Create(IntToStr(_Nr) +
                             ' hat keinen entsprechenden Monat. Versuche es mit Zahlen von 1(Januar) bis 12(Februar).');
  end;
end;

procedure Nr9;
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

function Concat(_ArrayOne : TIntegerArray; _ArrayTwo : TIntegerArray) : TIntegerArray;
var
  HCur   : Integer;
  HIndex : Integer;
begin
  SetLength(Result, Length(_ArrayOne) + Length(_ArrayTwo));
  HCur := Low(Result);

  for HIndex := Low(_ArrayOne) to High(_ArrayOne) do
  begin
    Result[HCur] := _ArrayOne[HIndex];
    Inc(HCur);
  end;

  for HIndex := Low(_ArrayTwo) to High(_ArrayTwo) do
  begin
    Result[HCur] := _ArrayTwo[HIndex];
    Inc(HCur);
  end;
end;

procedure OutputArray(const _Arr : TIntegerArray);
var
  HIndex : Integer;
begin
  Write('[ ');
  for HIndex := Low(_Arr) to High(_Arr) do
  begin
    Write(_Arr[HIndex], ' ');
  end;
  Write(']');
end;

procedure Nr10;
const
  HTestOne : TIntegerArray = [1,2,3,4];
  HTestTwo : TIntegerArray = [5,6,7,8];
var
  HResultArray : TIntegerArray;
begin
  HResultArray := Concat(HTestOne, HTestTwo);

  OutputArray(HTestOne);
  Write(' + ');
  OutputArray(HTestTwo);
  Write(' = ');
  OutputArray(HResultArray);
  WriteLn;

  SetLength(HResultArray, 0);
end;

function GetIndexSumArray(_A : Integer; _B : Integer) : TTwoDimesionalIntegerArray;
var
  HAIndex : Integer;
  HBIndex : Integer;
begin
  SetLength(Result, _A);

  for HAIndex := Low(Result) to High(Result) do
  begin
    SetLength(Result[HAIndex], _B);
    for HBIndex := Low(Result[HAIndex]) to High(Result[HAIndex]) do
    begin
      Result[HAIndex][HBIndex] := HAIndex + HBIndex + 1;
    end;
  end;
end;

procedure Nr11;
var
  HResultArray : TTwoDimesionalIntegerArray;
  HIndex       : Integer;
begin
  HResultArray := GetIndexSumArray(5, 5);

  for HIndex := Low(HResultArray) to High(HResultArray) do
  begin
    OutputArray(HResultArray[HIndex]);
    WriteLn;
    SetLength(HResultArray[HIndex], 0);
  end;
  SetLength(HResultArray, 0);
end;

function GetTrace(_Matrix : TTwoDimesionalIntegerArray) : Integer;
var
  HIndex : Integer;
begin
  Result := 0;

  for HIndex := 0 to Length(_Matrix) - 1 do
  begin
    if Length(_Matrix[Low(_Matrix) + HIndex]) > HIndex then
    begin
      Result := Result + _Matrix[Low(_Matrix) + HIndex][Low(_Matrix[Low(_Matrix) + HIndex]) + HIndex];
    end
    else
    begin
      raise Exception.Create('Das übergebene Array hat keine Quadratische Form');
    end;
  end;

end;

procedure Nr12;
var
  HResultArray : TTwoDimesionalIntegerArray;
  HIndex       : Integer;
  HSpur        : Integer;
begin
  HResultArray := GetIndexSumArray(20,20);

  WriteLn('Das Array ');

  HSpur := GetTrace(HResultArray);

  for HIndex := Low(HResultArray) to High(HResultArray) do
  begin
    OutputArray(HResultArray[HIndex]);
    WriteLn;
    SetLength(HResultArray[HIndex], 0);
  end;
  SetLength(HResultArray, 0);

  WriteLn('hat die Spur ', HSpur, '.');
end;

end.
