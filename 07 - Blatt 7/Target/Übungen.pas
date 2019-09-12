unit Übungen;

interface

type
  TExcercise = procedure;

procedure Nr1;
procedure Nr2;
procedure Nr3;  
procedure Nr4;

implementation

uses
  System.SysUtils,
  Klassen;

procedure Nr1;
var
  HBruch : TBruch;
  HAlias : TBruch;
  HKlon  : TBruch;
begin
  HBruch := TBruch.Create(1, 5);
  try
    HAlias := HBruch;
    HKlon  := TBruch.CreateClone(HBruch);
    try

      HBruch.Inverse;

      WriteLn(HBruch.ToString, ' = ', FloatToStr(HBruch.GetFloatWert));
      WriteLn(HAlias.ToString, ' = ', FloatToStr(HAlias.GetFloatWert));
      WriteLn(HKlon.ToString, ' = ',  FloatToStr(HKlon.GetFloatWert));
    finally
      FreeAndNil(HKlon);
    end;
  finally
    FreeAndNil(HBruch);
  end;
end;

procedure Nr2;
var
  HInputZähler : Integer;
  HInputNenner : Integer;
  HBruch       : TBruch;
  HAddBruch    : TBruch;
  HResultBruch : TBruch;
begin
  Write('Bitte gib einen Zähler ein: ');
  ReadLn(HInputZähler);
  Write('Bitte gib einen Nenner ein: ');
  ReadLn(HInputNenner);

  HBruch := TBruch.Create(HInputZähler, HInputNenner);

  try
    HAddBruch := TBruch.Create(1, 10);
    HResultBruch := TBruch.CreateClone(HBruch);
    try
      HResultBruch.Add(HAddBruch);
      WriteLn(HBruch.ToString, ' = ', FloatToStr(HBruch.GetFloatWert));
      WriteLn(HResultBruch.ToString, ' = ', FloatToStr(HResultBruch.GetFloatWert));

    finally
      FreeAndNil(HResultBruch);
      FreeAndNil(HAddBruch);
    end;
  finally
    FreeAndNil(HBruch);
  end;
end;

procedure Nr3;
var
  HBruch : TBruch;
  HAlias : TBruch;
  HKlon  : TBruch;
begin
  HBruch := TBruch.Create(1, 3);
  try
    HAlias := HBruch;
    HKlon  := TBruch.CreateClone(HBruch);
    try
      WriteLn('Original = Alias : ', HBruch = HAlias);
      WriteLn('Original = Klon  : ', HBruch = HKlon);
      WriteLn('Klon     = Alias : ', HKlon  = HAlias);

      WriteLn('Original equals Alias : ', HBruch.Equals(HAlias));
      WriteLn('Original equals Klon  : ', HBruch.Equals(HKlon));
      WriteLn('Klon     equals Alias : ', HKlon.Equals(HAlias));
    finally
      FreeAndNil(HKlon);
    end;
  finally
    FreeAndNil(HBruch);
  end;
end;

procedure Nr4;
var
  HPointOne : TPoint;
  HPointTwo : TPoint;
  HX : Extended;
  HY : Extended;
begin
  Write('Bitte gib die X-Koordinate des ersten Punktes ein: ');
  ReadLn(HX);
  Write('Bitte gib die Y-Koordinate des ersten Punktes ein: ');
  ReadLn(HY);

  HPointOne := TPoint.Create(HX, HY);
  try
    Write('Bitte gib die X-Koordinate des zweiten Punktes ein: ');
    ReadLn(HX);
    Write('Bitte gib die Y-Koordinate des zweiten Punktes ein: ');
    ReadLn(HY);

    HPointTwo := TPoint.Create(HX, HY);
    try
      HPointOne.Add(10, 10);
      HPointTwo.Add(10, 10);

      WriteLn('(', FloatToStr(HPointOne.X), '|', FloatToStr(HPointOne.Y), ')');
      WriteLn('(', FloatToStr(HPointTwo.X), '|', FloatToStr(HPointTwo.Y), ')');

      WriteLn('Die Distanz zwischen den beiden Punkten beträgt ', FloatToStr(TPoint.Distance(HPointOne, HPointTwo)), ' LE.');
    finally
      FreeAndNil(HPointTwo);
    end;
  finally
    FreeAndNil(HPointOne);
  end;
end;

end.
