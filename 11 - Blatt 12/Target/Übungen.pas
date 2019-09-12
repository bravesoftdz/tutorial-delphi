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

implementation

uses
  System.SysUtils,
  Punkt,
  Komplex,
  GeradeZahl,
  Note,
  Geburtstag,
  Dominostein
  ;

procedure Nr1;
var
  HVar : TPunkt;
begin
  HVar := TPunkt.Create(1, 1.345);

  try
    WriteLn('Created TPunkt-Object (', FloatToStr(HVar.X), '|', FloatToStr(HVar.Y), ')');

    HVar.X := 234;
    HVar.Y := 0.001;

    WriteLn(HVar.ToString);
  finally
    FreeAndNil(HVar)
  end;
end;

procedure Nr2;
var
  HVar : TKomplex;
begin
  HVar := TKomplex.Create(1, 2);

  try
    WriteLn('Created TKomplex-Object (', FloatToStr(HVar.Real), '|', FloatToStr(HVar.Imaginary), ')');

    HVar.Real := 45;
    HVar.Imaginary := 56;

    WriteLn(HVar.ToString);
  finally
    FreeAndNil(HVar)
  end;
end;

procedure Nr3;
var
  HVar : TGeradeZahl;
begin
  HVar := TGeradeZahl.Create(2);

  try
    WriteLn('Created TGeradeZahl-Object ', IntToStr(HVar.Value));

    HVar.Value := 45;

    WriteLn(HVar.ToString);
  finally
    FreeAndNil(HVar)
  end;
end;

procedure Nr4;
var
  HVar : TNote;
begin
  HVar := TNote.Create(2);

  try
    WriteLn('Created TNote-Object ', FloatToStr(HVar.Grade));

    HVar.Grade := 2.3;

    WriteLn(HVar.ToString);

    try
      HVar.Grade := 2.4;
    except
      on E : Exception do
        WriteLn(E.Message);
    end;

    WriteLn(HVar.ToString);
  finally
    FreeAndNil(HVar)
  end;
end;

procedure Nr5;
var
  HVar : TGeburtstag;
begin
  HVar := TGeburtstag.Create(23, 2);

  try
    WriteLn('Created TGeburtstag-Object ', IntToStr(HVar.Day), '.', IntToStr(HVar.Month));

    HVar.Date := TDate.Create(23, 2);

    WriteLn(HVar.ToString);

    try
      HVar.Date := TDate.Create(230, 2);
    except
      on E : Exception do
        WriteLn(E.Message);
    end;

    WriteLn(HVar.ToString);
  finally
    FreeAndNil(HVar)
  end;
end;

procedure Nr6;
var
  HVar : TDominostein;
begin
  HVar := TDominostein.Create(2, 4);

  try
    WriteLn('Created TDominostein-Object |', IntToStr(HVar.SideOne), '|', IntToStr(HVar.SideTwo), '|');

    HVar.SideOne := 5;
    HVar.SideTwo := 5;

    WriteLn(HVar.ToString);

    try
      HVar.SideTwo := 9;
    except
      on E : Exception do
        WriteLn(E.Message);
    end;

    WriteLn(HVar.ToString);
  finally
    FreeAndNil(HVar)
  end;
end;

end.
