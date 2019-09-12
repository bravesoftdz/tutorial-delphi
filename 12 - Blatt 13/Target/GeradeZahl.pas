unit GeradeZahl;

interface

type
  TGeradeZahl = class
    private
      FValue : Integer;

    public
      constructor Create(_Value : Integer);
      constructor CreateCopy(_Other : TGeradeZahl);

    public
      function GetNachfolger : TGeradeZahl;
      function GetSum(_Other : TGeradeZahl) : TGeradeZahl;
      function GetProd(_Other : TGeradeZahl) : TGeradeZahl;

      function ToString : String; override;

    private
      function  GetValue : Integer;
      procedure SetValue(_Value : Integer);

    public
      property Value : Integer read GetValue write SetValue;
  end;

implementation

uses
  System.SysUtils;

constructor TGeradeZahl.Create(_Value : Integer);
begin
  inherited Create;

  SetValue(_Value);
end;

constructor TGeradeZahl.CreateCopy(_Other : TGeradeZahl);
begin
  inherited Create;

  FValue := _Other.FValue;
end;

function TGeradeZahl.GetNachfolger : TGeradeZahl;
begin
  Result := TGeradeZahl.Create(FValue + 2);
end;

function TGeradeZahl.GetSum(_Other : TGeradeZahl) : TGeradeZahl;
begin
  Result := TGeradeZahl.Create(FValue + _Other.FValue);
end;

function TGeradeZahl.GetProd(_Other : TGeradeZahl) : TGeradeZahl;
begin
  Result := TGeradeZahl.Create(FValue * _Other.FValue);
end;

function TGeradeZahl.ToString : String;
begin
  Result := IntToStr(FValue);
end;

function TGeradeZahl.GetValue : Integer;
begin
  Result := FValue;
end;

procedure TGeradeZahl.SetValue(_Value : Integer);
begin
  FValue := _Value;

  if (_Value mod 2) = 1 then
  begin
    FValue := FValue - 1;
  end;
end;

end.
