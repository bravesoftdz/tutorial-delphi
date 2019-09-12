/// <summary>
///   In dieser Unit befinden sich Funktionalitäten die genutzt werden können
///   um mit dem Nutzer zu kommuniezieren.
/// </summary>
unit UserInteraction;

interface


/// <summary>
///   Diese Methode lässt das Programm mit dem Nutzer sprechen.
/// </summary>
procedure TalkToUser;

implementation

uses
  Fibonacci,
  System.Classes,
  System.RegularExpressions,
  System.SysUtils,
  System.Diagnostics;

type
  /// <summary>
  ///   Dieses Enum speichert den Typ den eine Nachricht des Nutzers haben
  ///   kann.
  /// </summary>
  TMessageType = (
    /// <summary>
    ///   Hilft dem Nutzer mit dem Programm.
    /// </summary>
    TYP_HELP,
    /// <summary>
    ///   Ein Dialog mit dem Programm.
    /// </summary>
    TYP_DIALOG,
    /// <summary>
    ///   Berechnung der N-ten Fibonacci Zahl.
    /// </summary>
    TYP_FIBONACCI,
    /// <summary>
    ///   Schließt das Programm.
    /// </summary>
    TYP_QUIT,
    /// <summary>
    ///   Die Nachricht konnte keinem der Oberen Typen zugeordnet werden.
    /// </summary>
    TYP_UNKNOWN);

var
  /// <summary>
  ///   Alle Strings die das Programm veranlassen Hilfe auszugeben.
  /// </summary>
  VHelpStrings: TStringList;
  /// <summary>
  ///   Alle Strings die das Programm veranlassen einen Dialog zu starten.
  /// </summary>
  VDialogStrings: TStringList;
  /// <summary>
  ///   Alle Strings die das Programm veranlassen Fibonacci Zahlen zu
  ///   berechnen.
  /// </summary>
  VFibonacciStrings: TStringList;
  /// <summary>
  ///   Alle Strings die das Programm veranlassen zu terminieren.
  /// </summary>
  VQuitStrings: TStringList;

/// <summary>
///   Gibt den Typ einer Nachricht zurück.
/// </summary>
/// <param name="_Message">
///   Die Nachricht dessen Typ herausgefunden werden soll.
/// </param>
/// <returns>
///   Der Typ der Nachricht, UNKNOWN wenn der Typ nicht festgestellt werden
///   konnte.
/// </returns>
function TypeOfMessage(_Message: String): TMessageType;
var
  HIndex: Integer;
begin
  if VHelpStrings.Find(_Message, HIndex) then
  begin
    Result := TMessageType.TYP_HELP;
  end
  else if VDialogStrings.Find(_Message, HIndex) then
  begin
    Result := TMessageType.TYP_DIALOG;
  end
  else if VFibonacciStrings.Find(_Message, HIndex) then
  begin
    Result := TMessageType.TYP_FIBONACCI;
  end
  else if VQuitStrings.Find(_Message, HIndex) then
    Result := TMessageType.TYP_QUIT
  else
    Result := TMessageType.TYP_UNKNOWN;
end;

/// <summary>
///   Diese Methode wandelt eine StringListe in einen String der Ausgegeben
///   werden kann um.
/// </summary>
/// <param name="_List">
///   Die Liste die umgewandelt werden soll.
/// </param>
/// <returns>
///   Der String der ausgegeben werden kann.
/// </returns>
function StringListToString(_List: TStringList): String;
var
  HEntery: String;
begin
  Result := '';
  for HEntery in _List do
  begin
    Result := Result + '"' + HEntery + '"; ';
  end;
  Result := Result.Remove(Result.Length - 2);
end;

/// <summary>
///   Gibt den Hilfe-Dialog aus.
/// </summary>
procedure GiveHelp;
begin
  WriteLn('Hallo. Ich bin ein einfaches Dialogprogramm. Ich kann folgende Eingaben verstehen:');
  WriteLn('   ' + StringListToString(VHelpStrings) + ':');
  WriteLn('      Das hast du ja bereits gefunden. Hier gebe ich dir eine Einführung in das Programm.');
  WriteLn('   ' + StringListToString(VDialogStrings) + ':');
  WriteLn('      Wenn du mit mir ein bisschen Small-Talk haben möchtest bist du hier genau richtig.');
  WriteLn('   ' + StringListToString(VFibonacciStrings) + ':');
  WriteLn('      Du wolltest schon immer die ersten N Fibonaccizahlen wissen? Sprich mich an.');
  WriteLn('   ' + StringListToString(VQuitStrings) + ':');
  WriteLn('      Wenn du gehen musst kannst du hiermit das Gespräch mit mir beenden.');
end;

/// <summary>
///   Prüft ob ein gegebener String ein Name sein könnte.
/// </summary>
function CheckName(_Name: String): Boolean;
const
  HCRegEx: String = '^[A-ZÄÖÜ][a-zäöüß]*$';
begin
  Result := not _Name.IsEmpty and TRegEx.IsMatch(_Name, HCRegEx);
end;

function CheckAge(_Name: Integer): Boolean;
begin
  Result := (_Name > 0) and (_Name < 120);
end;

procedure GiveDialog;
var
  HName: String;
  HAge: Integer;
  HCount: Integer;
begin
  WriteLn('Du willst also mit mir reden. Wie heißt du denn?');
  ReadLn(HName);

  HCount := 0;
  while (not CheckName(HName)) do
  begin
    case HCount of
      0:
        WriteLn('Kann es sein das du dich vertippt hast? Versuch es einfach nochmal.');
      1:
        WriteLn('Du willst mich doch ärgern, ich glaube nicht das "' + HName +
          '" dein Name ist. Du hast noch eine Chance deinen Namen einzugeben.');
      2:
        begin
          WriteLn('So, dass war es, du heißt jetzt Peter!');
          HName := 'Peter';
          break;
        end;
    end;

    ReadLn(HName);
    inc(HCount);
  end;

  WriteLn('So ' + HName + ', wie alt bist du denn?');
  try
    ReadLn(HAge);
  except
    HAge := -1;;
  end;


  HCount := 0;
  while (not CheckAge(HAge)) do
  begin
    case HCount of
      0:
        WriteLn('Das Alter ergibt nicht so viel Sinn. Hast du dich vielleicht vertippt? Versuche es nochmal.');
      1:
        WriteLn('Das nervt, wenn du nicht die Wahrheit sagst. Ich frag dich nur noch einmal nach deinem Alter.');
      2:
        begin
          WriteLn('So wie du dich verhältst bist du allerhöchstens 12.');
          HAge := 12;
          break;
        end;
    end;


    try
      ReadLn(HAge);
    except
      HAge := -1;;
    end;
    inc(HCount);
  end;

  WriteLn('Danke für das Gespräch ' + HName + '. Ich wünsche dir mit deinen ' +
    IntToStr(HAge) + ' Jahren Lebenserfahrung noch viel Erfolg.');
end;

procedure GiveFibonacci;
var
  HInput: String;
  HOutput: String;
  HIndexOfNumber: Integer;
  HIterator: Integer;
  HFibonacciCalculators: Array [1 .. 3] of IFibonacci;
  HTimer: TStopWatch;
begin
  WriteLn('Ok dann gib mir mal ein paar N und ich sage dir den Wert. Wenn du keine Lust mehr hast sag einfach "STOP".');

  HFibonacciCalculators[1] := TIterativFibonacci.Create;
  HFibonacciCalculators[2] := TRekursiveFibonacci.Create;
  HFibonacciCalculators[3] := TDirectFibonacci.Create;

  repeat
    ReadLn(HInput);
    if TryStrToInt(HInput, HIndexOfNumber) then
    begin
      if (HIndexOfNumber > -47) and (HIndexOfNumber < 47) then
      begin
        for HIterator := 1 to 3 do
        begin
          HOutput := HFibonacciCalculators[HIterator].GetDescription + ': ';
          HTimer := TStopWatch.StartNew;
          try
            HOutput := HOutput +
              IntToStr(HFibonacciCalculators[HIterator]
              .GetValue(HIndexOfNumber));
            HTimer.Stop;
            HOutput := HOutput + ' (Benötigte CPU Ticks: ' +
              IntToStr(HTimer.ElapsedTicks) + ')';
          except
            on E: Exception do
              HOutput := HOutput + E.Message;
          end;
          WriteLn(HOutput);
        end;
      end
      else
      begin
        WriteLn('Die Zahl sollte in folgendem Interval liegen [-46,46]');
      end;
    end;
  until HInput = 'STOP';
end;

procedure GiveUnknown(_Message: String);
const
  CNumberOfPossibilities: Integer = 3;
begin
  case Random(CNumberOfPossibilities) of
    0:
      WriteLn('Tut mir leid, dass verstehe ich nicht.');
    1:
      WriteLn('Ich weiß nicht was du mit "' + _Message + '" sagen möchtest.');
    2:
      WriteLn('Mit dieser Aufforderung weiß ich leider gar nichts anzufangen.');
  end;
end;

procedure TalkToUser;
var
  HInput: String;
  HMessageType: TMessageType;
begin
  Reset(Input);

  GiveHelp;

  repeat
    WriteLn('');
    ReadLn(HInput);
    HMessageType := TypeOfMessage(HInput);

    case HMessageType of
      TMessageType.TYP_HELP:
        GiveHelp;
      TMessageType.TYP_DIALOG:
        GiveDialog;
      TMessageType.TYP_FIBONACCI:
        GiveFibonacci;
      TMessageType.TYP_UNKNOWN:
        GiveUnknown(HInput);
    end;

  until (HMessageType = TMessageType.TYP_QUIT);
end;

initialization

VHelpStrings := TStringList.Create();
VHelpStrings.Add('/h');
VHelpStrings.Add('Hilfe! Sofort!');
VHelpStrings.Add('Was kannst du alles?');

VDialogStrings := TStringList.Create();
VDialogStrings.Add('/d');
VDialogStrings.Add('Rede mit mir!');
VDialogStrings.Add('Ich würde mich gerne unterhalten.');

VFibonacciStrings := TStringList.Create();
VFibonacciStrings.Add('/f');
VFibonacciStrings.Add('Lass uns über Fibonacci reden!');
VFibonacciStrings.Add('Hast du schon von Fibonacci gehört?');

VQuitStrings := TStringList.Create();
VQuitStrings.Add('/q');
VQuitStrings.Add('Auf Wiedersehen.');
VQuitStrings.Add('Bruder muss los!');

finalization

FreeAndNil(VHelpStrings);
FreeAndNil(VDialogStrings);
FreeAndNil(VFibonacciStrings);
FreeAndNil(VQuitStrings);

end.
