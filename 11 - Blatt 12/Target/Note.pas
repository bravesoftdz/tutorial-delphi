unit Note;

interface

type
  TNote = class
    private
      FGrade : Integer;

    public
      constructor Create(_Grade : Extended);

    public
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

function TNote.ToString : String;
begin
  Result := FloatToStr(GetGrade);
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
