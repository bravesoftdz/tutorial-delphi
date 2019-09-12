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

procedure Nr2;
var
  HVar : TPunkt;
begin
  HVar := TPunkt.Create(1, 1);

  try
    WriteLn(HVar.ToString);
    HVar.Schiebe(9,9);
    WriteLn(HVar.ToString);
  finally
    FreeAndNil(HVar);
  end;
end;

procedure Nr3;
var
  HVar : TKomplex;
  HTmp : TKomplex;
begin
  HVar := TKomplex.Create(3, 4);

  try
    WriteLn('|', HVar.ToString, '| = ', FloatToStr(HVar.GetBetrag));

    HTmp := HVar.GetKonjugiertKomplex;
    try
      WriteLn(HVar.ToString, ' -> ', HTmp.ToString);
    finally
      FreeAndNil(HTmp);
    end;

    HTmp := TKomplex.Create(1, 2);
    try
      Write('(', HVar.ToString, ') + (', HTmp.ToString, ') = ');
      HVar.Add(HTmp);
      WriteLn(HVar.ToString);

      Write('(', HVar.ToString, ') * (', HTmp.ToString, ') = ');
      HVar.Mult(HTmp);
      WriteLn(HVar.ToString);
    finally
      FreeAndNil(HTmp);
    end;

  finally
    FreeAndNil(HVar);
  end;
end;

procedure Nr4;
var
  HVarOne : TGeradeZahl;
  HVarTwo : TGeradeZahl;
  HRes    : TGeradeZahl;
begin
  HVarOne := TGeradeZahl.Create(2);
  HVarTwo := TGeradeZahl.Create(35);

  try
    HRes := HVarOne.GetNachfolger;
    try
      WriteLn(HVarOne.ToString, ' -> ', HRes.ToString);
    finally
      FreeAndNil(HRes);
    end;

    HRes := HVarOne.GetSum(HVarTwo);
    try
      WriteLn(HVarOne.ToString, ' + ', HVarTwo.ToString, ' = ', HRes.ToString);
    finally
      FreeAndNil(HRes);
    end;

    HRes := HVarOne.GetProd(HVarTwo);
    try
      WriteLn(HVarOne.ToString, ' * ', HVarTwo.ToString, ' = ', HRes.ToString);
    finally
      FreeAndNil(HRes);
    end;
  finally
    FreeAndNil(HVarOne);
    FreeAndNil(HVarTwo);
  end;
end;

procedure Nr5;
var
  HVar : TNote;
begin
  HVar := TNote.Create(2.7);
  try
    WriteLn('Hat ', HVar.ToString, ' bestanden? ', HVar.HatBestanden)
  finally
    FreeAndNil(HVar);
  end;

  HVar := TNote.Create(5.0);
  try
    WriteLn('Hat ', HVar.ToString, ' bestanden? ', HVar.HatBestanden)
  finally
    FreeAndNil(HVar);
  end;
end;

procedure Nr6;
var
  HOne   : TGeburtstag;
  HTwo   : TGeburtstag;
  HThree : TGeburtstag;
begin
  HOne   := TGeburtstag.Create(23, 2);
  HTwo   := TGeburtstag.CreateCopy(HOne);
  HThree := TGeburtstag.Create(24, 2);

  try
    WriteLn(HOne.ToString, ' = ', HTwo.ToString, ' ? ', HOne.Equals(HTwo));
    WriteLn(HOne.ToString, ' = ', HThree.ToString, ' ? ', HOne.Equals(HThree));
  finally
    FreeAndNil(HOne);
    FreeAndNil(HTwo);
    FreeAndNil(HThree);
  end;
end;

procedure Nr7;
var
  HVar : TDominostein;
  HArr : TDominoArray;
begin
  HVar := TDominostein.Create(2, 4);

  try
    Write(HVar.ToString, ' -> ');
    HVar.DreheUm;
    WriteLn(HVar.ToString);

    HArr := HVar.GetValues;
    WriteLn(HVar.ToString, ' -> [', HArr[0], ',', HArr[1], ']');
  finally
    FreeAndNil(HVar)
  end;
end;

end.
