unit Chess;

interface

type
  /// <summary>
  ///   Gibt den Zustand an, in welchem sich ein Schachbrett befinden kann.
  /// </summary>
  TChessTileStates = (
    /// <summary>
    ///   Weißer König
    /// </summary>
    W_KING,
    /// <summary>
    ///   Weißer Königin
    /// </summary>
    W_QUEEN,
    /// <summary>
    ///   Weißer Turm
    /// </summary>
    W_ROOK,
    /// <summary>
    ///   Weißer Springer
    /// </summary>
    W_KNIGHT,
    /// <summary>
    ///   Weißer Läufer
    /// </summary>
    W_BISHOPS,
    /// <summary>
    ///   Weißer Bauer
    /// </summary>
    W_PAWN,
    /// <summary>
    ///   Schwarzer König
    /// </summary>
    B_KING,
    /// <summary>
    ///   Schwarze Königin
    /// </summary>
    B_QUEEN,
    /// <summary>
    ///   Schwarzer Turm
    /// </summary>
    B_ROOK,
    /// <summary>
    ///   Schwarzer Springer
    /// </summary>
    B_KNIGHT,
    /// <summary>
    ///   Schwarzer Läufer
    /// </summary>
    B_BISHOPS,
    /// <summary>
    ///   Schwarzer Bauer
    /// </summary>
    B_PAWN,
    /// <summary>
    ///   Leeres Feld
    /// </summary>
    CLEAR);

  /// <summary>
  ///   Diese Funktion erstellt aus einem TChessTileStates ein Char
  /// </summary>
  /// <param name="_State">
  ///   Der TChessTileStates aus dem ein Char werden soll.
  /// </param>
  function ToShortStr(_State : TChessTileStates) : Char;
  /// <summary>
  ///   Diese Methode erstellt aus einem Char einen TChessTileStates.
  /// </summary>
  /// <param name="_Char">
  ///   Der Char aus dem ein TTChessTileStates werden soll
  /// </param>
  /// <exception cref="Exception">
  ///   Wenn der Char keinen entsprechenden TChessTileStates hat.
  /// </exception>
  function FromShortStr(_Char : Char) : TChessTileStates;

type
  /// <summary>
  ///   Repräsentiert ein 8x8 Schachbrett
  /// </summary>
  TChessBoard = Array [1..8] of Array [1..8] of TChessTileStates;

  /// <summary>
  ///   Verwaltet ein Schachbrett, mit den Funktionen, wie sie in der Aufgabe
  ///   beschrieben sind.
  /// </summary>
  TChessBoardHandler = class
    private
      FBoard: TChessBoard;

    public
      /// <summary>
      ///   Initialiesiert das Schachbrett mit den gegeben Figuren und
      ///   Positionen
      /// </summary>
      /// <param name="_Board">
      ///   Der String der das Schachbrett repräsentiert.
      /// </param>
      /// <exception cref="Exception">
      ///   Wenn der Schachstring invalid ist. Das ist der Fall wenn
      ///   mindestends eine der folgenden bedingungen erfüllt ist:
      ///   <list type="bullet">
      ///     <item>
      ///       An einer Position stehen zwei Figuren.
      ///     </item>
      ///     <item>
      ///       Die Position liegt nicht auf dem Schachbrett.
      ///     </item>
      ///     <item>
      ///       Die gegebene Figur existiert nicht
      ///     </item>
      ///     <item>
      ///       Die gegebene Position ist keine Zahl <br />
      ///     </item>
      ///   </list>
      /// </exception>
      procedure SetBoardFromString(_Board: String);
      /// <summary>
      ///   Gibt das aktuelle Schachbrett als String zurück, der ausgegeben
      ///   werden kann.
      /// </summary>
      function GetBoardAsString : String;
  end;

implementation

uses
  System.SysUtils,
  System.Generics.Collections;

type
  TPoint = record
    FState : TChessTileStates;
    FX     : Integer;
    FY     : Integer;
  end;

function ToShortStr(_State : TChessTileStates) : Char;
begin
  Result := 'X';

  case _State of
    W_KING    : Result := 'K';
    W_QUEEN   : Result := 'D';
    W_ROOK    : Result := 'T';
    W_KNIGHT  : Result := 'S';
    W_BISHOPS : Result := 'L';
    W_PAWN    : Result := 'B';
    B_KING    : Result := 'k';
    B_QUEEN   : Result := 'd';
    B_ROOK    : Result := 't';
    B_KNIGHT  : Result := 's';
    B_BISHOPS : Result := 'l';
    B_PAWN    : Result := 'b';
    CLEAR     : Result := ' ';
  end;
end;

function FromShortStr(_Char : Char) : TChessTileStates;
begin
  case _Char of
    'K': Result := W_KING;
    'D': Result := W_QUEEN;
    'T': Result := W_ROOK;
    'S': Result := W_KNIGHT;
    'L': Result := W_BISHOPS;
    'B': Result := W_PAWN;
    'k': Result := B_KING;
    'd': Result := B_QUEEN;
    't': Result := B_ROOK;
    's': Result := B_KNIGHT;
    'l': Result := B_BISHOPS;
    'b': Result := B_PAWN;
    else
      raise Exception.Create('"' + _Char + '": Zeichen unbekannt');
  end;
end;

procedure TChessBoardHandler.SetBoardFromString(_Board : String);
var
  HIdxOne    : Integer;
  HIdxTwo    : Integer;
  HPoint     : TPoint;
  HPointList : TList<TPoint>;
begin
  for HIdxOne := Low(FBoard) to High(FBoard) do
  begin
    for HIdxTwo := Low(FBoard[HIdxOne]) to High(FBoard[HIdxOne]) do
    begin
      FBoard[HIdxOne][HIdxTwo] := Clear;
    end;
  end;

  if (Length(_Board) mod 3) <> 0 then
  begin
    raise Exception.Create('String besteht nicht aus 3er Tupeln');
  end;


  HPointList := TList<TPoint>.Create;
  try
    HIdxOne := Low(_Board);
    while HIdxOne <= High(_Board) - 2 do
    begin
      HPoint.FState := FromShortStr(_Board[HIdxOne]);
      HPoint.FX     := StrToInt(_Board[HIdxOne + 1]);
      HPoint.FY     := StrToInt(_Board[HIdxOne + 2]);

      if not (Low(FBoard) <= HPoint.FX) or not(HPoint.FX <= High(FBoard)) then
      begin
        raise Exception.Create('X-Koordinate "' + IntToStr(HPoint.FX) + '" außerhalb des Bereichs.');
      end;

      if not (Low(FBoard[HPoint.FX]) <= HPoint.FY ) or not (HPoint.FY <= High(FBoard[HPoint.FX])) then
      begin
        raise Exception.Create('Y-Koordinate "' + IntToStr(HPoint.FY) + '" außerhalb des Bereichs.');
      end;

      HPointList.Add(HPoint);

      inc(HIdxOne, 3)
    end;

    for HPoint in HPointList do
    begin
      if FBoard[HPoint.FX][HPoint.FY] <> CLEAR then
      begin
        raise Exception.Create('Das Feld (' + IntToStr(HPoint.FX) + ',' + IntToStr(HPoint.FY) + ') ist schon belegt.');
      end;

      FBoard[HPoint.FX][HPoint.FY] := HPoint.FState;
    end;

  finally
    FreeAndNil(HPointList);
  end;
end;

function TChessBoardHandler.GetBoardAsString : String;
const
  CRowSpacer   : Char   = '-';
  CColumSpacer : Char   = '|';
  CCrossSpacer : Char   = '+';
  CNewLine     : String = AnsiString(#13#10);
var
  HIdxOne : Integer;
  HIdxTwo : Integer;
begin
  for HIdxOne := Low(FBoard) to High(FBoard) do
  begin
    for HIdxTwo := 0 to Length(FBoard[HIdxOne]) * 4 do
    begin
      if HIdxTwo mod 4 = 0 then
      begin
        Result := Result + CCrossSpacer;
      end
      else
      begin
        Result := Result + CRowSpacer;
      end;
    end;

    Result := Result + CNewLine + CColumSpacer;

    for HIdxTwo := Low(FBoard[HIdxOne]) to High(FBoard[HIdxOne]) do
    begin
      Result := Result + ' ' + ToShortStr(FBoard[HIdxOne][HIdxTwo]) + ' ' + CColumSpacer;
    end;

    Result := Result + CNewLine;
  end;

  for HIdxTwo := 0 to Length(FBoard) * 4 do
  begin
    if HIdxTwo mod 4 = 0 then
    begin
      Result := Result + CCrossSpacer;
    end
    else
    begin
      Result := Result + CRowSpacer;
    end;
  end;

end;

end.
