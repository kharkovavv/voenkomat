unit logo;

interface

uses
  PNGImage, Windows, Messages, SysUtils, Classes, Graphics, Forms, Controls,
  StdCtrls, ExtCtrls;

type
  TSplash = class(TCustomControl)
  private
    FDesktop: TBitmap;
    FImage: TImage;
    FLabel: TLabel;
  protected
    procedure Paint; override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure WMEraseBkgnd(var Message: TWMEraseBkgnd);
      message WM_ERASEBKGND;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    constructor CreateNamed(AOwner: TComponent;
                            ResName: String;
                            X: Integer = -1;
                            Y: Integer = -1);
    destructor Destroy; override;

    property Font;
  end;

procedure ShowLogo;
procedure ShowLogoEx (const Version: string; const VersionCoord: TPoint; AFont: TFont; Delay: Integer);
procedure KillLogo;

implementation

{$R logo.RES}



var
  L: TSplash = nil;

procedure ShowLogoEx (const Version: string; const VersionCoord: TPoint; AFont: TFont; Delay: Integer);
var
  W, H: Integer;
begin
  L := TSplash.Create(Application);
  with L
  do
  begin
    Font.Assign(AFont);
    with FLabel
    do
    begin
      Caption := Version;
      Left := VersionCoord.X;
      Top := VersionCoord.Y;
      Visible := True;
    end;
    Show;
  end;
  W := GetTickCount;
  H := W;
  while H - W < Delay
  do
  begin
    H := GetTickCount;
    Application.ProcessMessages;
  end;
end;

procedure ShowLogo;
begin
  if not Assigned (L)
  then
    L := TSplash.Create(Application);
  L.Show;
  L.BringToFront;
end;

procedure KillLogo;
begin
  if Assigned (L)
  then
    FreeAndNil (L);
end;

constructor TSplash.Create(AOwner: TComponent);
begin
  CreateNamed(AOwner, 'LOGO_PNG');
end;

constructor TSplash.CreateNamed(AOwner: TComponent;
                                ResName: String;
                                X: Integer = -1;
                                Y: Integer = -1);

  procedure LoadInternal;
  var
    PNG: TPNGObject;
  begin
    try
      PNG := TPNGObject.Create;
      PNG.LoadFromResourceName (hInstance, ResName);
      FImage.Picture.Graphic := PNG;
    except
    end
  end;

begin
  inherited Create (AOwner);
  FImage := TImage.Create (self);

  with FImage
  do
  begin
    Parent := self;
    Align := alClient;
    LoadInternal;
  end;

  FLabel := TLabel.Create (Self);
  with FLabel
  do
  begin
    Parent := self;
    Transparent := True;
    ParentFont := True;
    Visible := False;
  end;

  FDeskTop := TBitmap.Create;
  FDeskTop.Width := FImage.Picture.Width;
  FDeskTop.Height := FImage.Picture.Height;
  Width := FDeskTop.Width;
  Height := FDeskTop.Height;
  if X < 0
  then
    Left := (Screen.Width - Width) div 2
  else
    Left := X;
  if Y < 0
  then
    Top := (Screen.Height - Height) div 2
  else
    Top := Y;
  ParentWindow := Forms.Application.Handle;
end;

destructor TSplash.Destroy;
begin
  FDeskTop.Free;
  FImage.Free;
  inherited;
end;

procedure TSplash.Paint;
begin
  inherited Paint;
  Canvas.StretchDraw(Rect(0,0,Width,Height), FDeskTop);
end;

procedure TSplash.WMEraseBkgnd(var Message: TWMEraseBkgnd);
var
  DC: HDC;
begin
  DC := GetDC(GetDeskTopWindow);
  try
    BitBlt(FDeskTop.Canvas.Handle, 0, 0, Width, Height, DC, Left, Top, SRCCOPY);
  finally
    ReleaseDC(GetDeskTopWindow, DC);
  end;
  Message.Result := 0;
end;

procedure TSplash.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    if ParentWindow <> 0 then
      Style := Style and not WS_CHILD or WS_POPUP or WS_OVERLAPPED;
    WindowClass.Style := CS_SAVEBITS or CS_DBLCLKS or not (CS_HREDRAW or not CS_VREDRAW);
    ExStyle := ExStyle;
  end;
end;

end.
