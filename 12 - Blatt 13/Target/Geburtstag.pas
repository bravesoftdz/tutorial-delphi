unit Geburtstag;

interface

type

  TDate = record
    FDay : Integer;
    FMonth : Integer;

    constructor Create(_Day : Integer; _Month : Integer);
  end;

  TGeburtstag = class
    private
      FDay   : Integer;
      FMonth : Integer;

    public
      constructor Create(_Day : Integer; _Month : Integer);
      constructor CreateCopy(_Other : TGeburtstag);

    public
      function Equals(_Other : TObject): Boolean; Override;

      function ToString : String; override;

    private
      function  GetDay : Integer;
      function  GetMonth : Integer;
      procedure SetDate(_Date : TDate);

    public
      property Day : Integer read GetDay;
      property Month : Integer read GetMonth;
      property Date : TDate write SetDate;
  end;

implementation

uses
  System.SysUtils;

constructor TDate.Create(_Day: Integer; _Month: Integer);
begin
  FDay   := _Day;
  FMonth := _Month;
end;

constructor TGeburtstag.Create(_Day : Integer; _Month : Integer);
begin
  inherited Create;

  SetDate(TDate.Create(_Day, _Month));
end;

constructor TGeburtstag.CreateCopy(_Other : TGeburtstag);
begin
  inherited Create;

  FDay   := _Other.FDay;
  FMonth := _Other.FMonth;
end;

function TGeburtstag.Equals(_Other : TObject): Boolean;
begin
  Result := False;

  if _Other is TGeburtstag then
  begin
    if (TGeburtstag(_Other).FDay = FDay) and (TGeburtstag(_Other).FMonth = FMonth) then
    begin
      Result := True;
    end;
  end;
end;

function TGeburtstag.ToString : String;
begin
  Result := IntToStr(FDay) + '.' + IntToStr(FMonth);
end;

function TGeburtstag.GetDay : Integer;
begin
  Result := FDay;
end;

function TGeburtstag.GetMonth : Integer;
begin
  Result := FMonth;
end;

procedure TGeburtstag.SetDate(_Date : TDate);
const
  CDaysForMonth : Array[1..12] of Integer = (31,29,31,30,31,30,31,31,30,31,30,31);
begin
  if (_Date.FMonth >= Low(CDaysForMonth)) and (_Date.FMonth <= High(CDaysForMonth)) then
  begin
    if (_Date.FDay > 0) and (_Date.FDay <= CDaysForMonth[_Date.FMonth]) then
    begin
      FDay := _Date.FDay;
      FMonth := _Date.FMonth;
    end
    else
    begin
      raise Exception.Create('Dieser Tag existiert nicht');
    end;
  end
  else
  begin
    raise Exception.Create('Dieser Monat existiert nicht.');
  end;
end;

end.
