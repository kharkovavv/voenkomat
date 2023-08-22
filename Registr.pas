unit Registr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Mask, IBDatabase, IBCustomDataSet, IBQuery, logo,
  DBCtrls, DBGridEh, DBCtrlsEh, DBLookupEh,Clipbrd;

  Var    log:String;
type
  TfmRegistr = class(TForm)
    Panel1: TPanel;
    Bevel1: TBevel;
    bbOk: TBitBtn;
    bbCancel: TBitBtn;
    Bevel2: TBevel;
    Image1: TImage;
    Label1: TLabel;
    edId: TEdit;
    edPassword: TEdit;
    Label2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure bbOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    
  private
    kl:SmallInt;
    { Private declarations }
  public
    prRun:Boolean;
    is_bud:integer; // �������������, ������� �������� � ����������
    name_faculty:string; // ���������, ������� �������� � ����������
    id_faculty:integer;
    { Public declarations }
  end;
var
  fmRegistr: TfmRegistr;

implementation

uses sprav_dm, Menu, rml, spisok, DB;

{$R *.DFM}
procedure TfmRegistr.FormActivate(Sender: TObject);
begin
 {edId.Text:='';
  edPassword.Text:='';
  dmSprav.quFacult.Open;
  // ������ ��������
  KillLogo; }
  edId.SetFocus;
  dmsprav.qUser.Open;
end;

procedure TfmRegistr.bbOkClick(Sender: TObject);
var NameT:String;
    i: byte;
    VarArrayOf:Variant;
begin
  If edId.Text='' then
  begin
     ShowMessage('������� ��� ������������!');
     ActiveControl:=edId;
     edId.SetFocus;
     ModalResult := mrNone;   Exit;
  end;

  If edId.Text<>'' then
  begin
  If dmSprav.qUser.Locate('Login',edId.Text,[]) then
  begin
     If edPassword.Text=dmSprav.qUserPword.Value then
     begin
        prRun:=true; log:=edId.Text;
        IdUser:=dmSprav.qUserId.value;
        FioUser:=dmSprav.qUserFio.value;


        fmMenu.sbInfo.Panels.Items[0].Text:='������������: '+dmSprav.qUserFIO.AsString;
        //����������� ����������
        // rmlID_Stud := InitRML ('stud','rector', '1', '1', nil);
        Close;
     end
     else
     begin
        If kl>2 then
        begin
           ShowMessage('������������ � ������ ������� �� ���������������!');
           prRun:=false;
           if dmSprav.ib_stud.Connected then
            dmSprav.ib_stud.Connected:=false;
           Close;
        end
        else
        begin
           kl:=kl+1;
           ShowMessage('������ �� �����! ���������� ��� ���.');
           edPassword.Text:='';
           edPassword.SetFocus;
           ModalResult := mrNone;
        end;
     end;
    end
  else
  begin
     ShowMessage('�� �� ����������������!');
     prRun:=false;
     if dmSprav.ib_stud.Connected then
       dmSprav.ib_stud.Connected:=false;
     Close;
  end
  end
end;


procedure TfmRegistr.FormCreate(Sender: TObject);
const
  LogoTime = 3000; // ���. ����� ������ ��������
var
  Fnt: TFont;
begin
{ kl:=0;
  prRun:=false;

  // �������� ��������
  Fnt := TFont.Create;
  Fnt.Name := 'Segoe UI';
  Fnt.Height := -23;
  //Fnt.Style := [fsBold];
  Fnt.Color:=clWhite;
  ShowLogoEx('������   2017.10.09.19', Point(35, 362), Fnt, LogoTime); 
  Fnt.Free;     }
end;

procedure TfmRegistr.bbCancelClick(Sender: TObject);
begin
   prRun := false;
end;

procedure TfmRegistr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if not prRun then
  begin
   ShowMessage('�� ��������!');
   if dmSprav.ib_stud.Connected then dmSprav.ib_stud.Connected:=false;
    Application.Terminate;
  end
end;

end.
