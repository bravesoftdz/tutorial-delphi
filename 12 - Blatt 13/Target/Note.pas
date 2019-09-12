unit Note;

interface

type
  TNote = class
    private
      FGrade : Integer;

    public
      constructor Create(_Grade : Extended);
      constructor CreateCopy(_Other : TNote);

    public
      function HatBestanden : Boolean;

      function ToString : String; override;

    private
      function  GetGrade : Extended;
      procedure SetGrade(_Grade : Extended);

    public
      property Grade : Extended read GetGrade write SetGrade;
  end;

implementation

uses
  System.SysUtils;

constructor TNote.Create(_Grade : Extended);
begin
  inherited Create;

  SetGrade(_Grade);
end;

constructor TNote.CreateCopy(_Other : TNote);
begin
  inherited Create;

  FGrade := _Other.FGrade;
end;

function TNote.HatBestanden : Boolean;
begin
  Result := FGrade <= 40;
end;

function TNote.ToString : String;
begin
  Result := FloatToStrF(GetGrade, TFloatFormat.ffFixed, 2, 1);
end;

function  TNote.GetGrade : Extended;
begin
  Result := FGrade / 10;
end;

procedure TNote.SetGrade(_Grade : Extended);
const
  CPossibleGrades : Set of Byte = [10,13,17,20,23,27,30,33,37,40,50];
var
  HNewGrade : Integer;
begin
  HNewGrade := Trunc(_Grade * 10);

  if not (HNewGrade in CPossibleGrades) then
  begin
    raise Exception.CreateFmt('%n ist keine zulässige Note.', [_Grade]);
  end;

  FGrade := HNewGrade;
end;

end.
