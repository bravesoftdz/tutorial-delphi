unit Übungen;

interface

type
  TExcercise = procedure;

procedure Nr1;
procedure Nr2;

implementation

uses
  System.SysUtils;

type
  T2DIntArr = array of array of integer;

procedure PrintPi(_Decimals : Integer);
begin
  WriteLn(String.Format('%.' + IntToStr(_Decimals) + 'n', [PI]));
end;

procedure Nr1;
begin
  PrintPi(1);
  PrintPi(5);
  PrintPi(10)
end;

procedure PrintArray(_Arr : T2DIntArr);
var
  HI      : Integer;
  HJ      : Integer;
  HMaxLen : Integer;
  HNewLen : Integer;
begin
  HMaxLen := 0;

  for HI := Low(_Arr) to High(_Arr) do
  begin
    for HJ := Low(_Arr[HI]) to High(_Arr[HI]) do
    begin
      HNewLen := IntToStr(_Arr[HI][HJ]).Length;
      if HNewLen > HMaxLen then
      begin
        HMaxLen := HNewLen;
      end;
    end;
  end;

  WriteLn;


  for HI := Low(_Arr) to High(_Arr) do
  begin
    for HJ := Low(_Arr[HI]) to High(_Arr[HI]) do
    begin
      Write(String.Format(' %' + IntToStr(HMaxLen) + 'd ', [_Arr[HI][HJ]]));
    end;
    WriteLn;
  end;
end;

procedure Nr2;
const
  CTestOne : T2DIntArr = [[1,2,3],[4,5,6],[7,8,9]];
  CTestTwo : T2DIntArr = [[  0,  1,  2,  3,  4,  5,  6,  7,  8,  9],
                          [ 10, 11, 12, 13, 14, 15, 16, 17, 18, 19],
                          [ 20, 21, 22, 23, 24, 25, 26, 27, 28, 29],
                          [ 30, 31, 32, 33, 34, 35, 36, 37, 38, 39],
                          [ 40, 41, 42, 43, 44, 45, 46, 47, 48, 49],
                          [ 50, 51, 52, 53, 54, 55, 56, 57, 58, 59],
                          [ 60, 61, 62, 63, 64, 65, 66, 67, 68, 69],
                          [ 70, 71, 72, 73, 74, 75, 76, 77, 78, 79],
                          [ 80, 81, 82, 83, 84, 85, 86, 87, 88, 89],
                          [ 90, 91, 92, 93, 94, 95, 96, 97, 98, 99],
                          [100,101,102,103,104,105,106,107,108,109]];
begin
  PrintArray(CTestOne);
  PrintArray(CTestTwo);
end;

end.
