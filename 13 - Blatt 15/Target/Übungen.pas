unit Übungen;

interface

type
  TExcercise = procedure;

procedure Nr1;
procedure Nr2;

implementation

uses
  Punkt,
  Kreis,
  Dominostein,
  Dominokette,
  System.SysUtils;

procedure Nr1;
var
  HKreis : TKreis;
  HPunkt : TPunkt;
begin
  HKreis := TKreis.Create(2, TPunkt.Create(2,5));
  try
    WriteLn('r:', FloatToStr(HKreis.Radius),
            ' p:', HKreis.Mittelpunkt.ToString,
            ' f:', FloatToStr(HKreis.Fläche),
            ' u:', FloatToStr(HKreis.Umfang));

    HKreis.Radius      := 1;
    HKreis.Mittelpunkt := TPunkt.Create(0,0);

    WriteLn('r:', FloatToStr(HKreis.Radius),
            ' p:', HKreis.Mittelpunkt.ToString,
            ' f:', FloatToStr(HKreis.Fläche),
            ' u:', FloatToStr(HKreis.Umfang));

    HPunkt := TPunkt.Create(1, 0);
    try
      WriteLn('a:', FloatToStr(HKreis.GetAbstand(HPunkt)));
    finally
      FreeAndNil(HPunkt);
    end;

    HPunkt := TPunkt.Create(-0.6, 0);
    try
      WriteLn('a:', FloatToStr(HKreis.GetAbstand(HPunkt)));
    finally
      FreeAndNil(HPunkt);
    end;

    HPunkt := TPunkt.Create(5, 0);
    try
      WriteLn('a:', FloatToStr(HKreis.GetAbstand(HPunkt)));
    finally
      FreeAndNil(HPunkt);
    end;
  finally
    FreeAndNil(HKreis);
  end;
end;

procedure Nr2;
var
  HKette : TDominokette;
begin
  HKette := TDominokette.Create(TDominostein.Create(5,0));
  try
    HKette.FuegeRechtsAn(TDominostein.Create(0,6));
    HKette.FuegeRechtsAn(TDominostein.Create(6,3));
    HKette.FuegeRechtsAn(TDominostein.Create(3,3));

    HKette.FuegeLinksAn(TDominostein.Create(2,5));
    HKette.FuegeLinksAn(TDominostein.Create(2,4));

    WriteLn(HKette.ToString);
  finally
    FreeAndNil(HKette);
  end;
end;

end.
