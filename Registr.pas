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
    is_bud:integer; // подразделение, которое работает с программой
    name_faculty:string; // факультет, который работает с программой
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
  // убрать заставку
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
     ShowMessage('Введите имя пользователя!');
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


        fmMenu.sbInfo.Panels.Items[0].Text:='Пользователь: '+dmSprav.qUserFIO.AsString;
        //подключение библиотеки
        // rmlID_Stud := InitRML ('stud','rector', '1', '1', nil);
        Close;
     end
     else
     begin
        If kl>2 then
        begin
           ShowMessage('Пользователь с данным паролем не зарегистрирован!');
           prRun:=false;
           if dmSprav.ib_stud.Connected then
            dmSprav.ib_stud.Connected:=false;
           Close;
        end
        else
        begin
           kl:=kl+1;
           ShowMessage('Пароль не верен! Попробуйте еще раз.');
           edPassword.Text:='';
           edPassword.SetFocus;
           ModalResult := mrNone;
        end;
     end;
    end
  else
  begin
     ShowMessage('Вы не зарегистрированы!');
     prRun:=false;
     if dmSprav.ib_stud.Connected then
       dmSprav.ib_stud.Connected:=false;
     Close;
  end
  end
end;


procedure TfmRegistr.FormCreate(Sender: TObject);
const
  LogoTime = 3000; // мин. время показа заставки
var
  Fnt: TFont;
begin
{ kl:=0;
  prRun:=false;

  // показать заставку
  Fnt := TFont.Create;
  Fnt.Name := 'Segoe UI';
  Fnt.Height := -23;
  //Fnt.Style := [fsBold];
  Fnt.Color:=clWhite;
  ShowLogoEx('Версия   2017.10.09.19', Point(35, 362), Fnt, LogoTime); 
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
   ShowMessage('До свидания!');
   if dmSprav.ib_stud.Connected then dmSprav.ib_stud.Connected:=false;
    Application.Terminate;
  end
end;

end.
