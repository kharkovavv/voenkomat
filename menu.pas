unit menu;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Menus, ComCtrls,StdCtrls,ToolWin,IniFiles,ShellAPI, FileCtrl, Db,
  DBTables, ImgList,Printers, jpeg, Buttons,IBDatabase, IBCustomDataSet, IBQuery, Clipbrd;

  procedure LockDB;
  function MenuButtons(sender:TObject):boolean;
  var
    TekData:TDate;   //текущая дата - считывается при вводе номера пользователя
    FioUser:String;
    CURR_YEAR:SmallInt;  //текущий учебный год



type
  TfmMenu = class(TForm)
    ImageList1: TImageList;
    ImageList2: TImageList;
    Timer1: TTimer;
    pnWarning: TPanel;
    Shape1: TShape;
    lbWarning: TLabel;
    imgWarning: TImage;
    Bevel2: TBevel;
    PageScroller1: TPageScroller;
    MainPanel: TPanel;
    sbStud: TSpeedButton;
    laDepart: TLabel;
    Label1: TLabel;
    sbSprav: TSpeedButton;
    sbAnswer: TSpeedButton;
    sbHelp: TSpeedButton;
    Bevel3: TBevel;
    sbExit: TSpeedButton;
    sbInfo: TStatusBar;
    Label2: TLabel;
    Image1: TImage;
    Label3: TLabel;
    procedure Timer1Timer(Sender: TObject);
    function ReadNameForm(NameForm: Tform):boolean;
    procedure sbSpravClick(Sender: TObject);
    procedure sbStudClick(Sender: TObject);
    procedure sbExitClick(Sender: TObject);
    procedure CloseWin;
    procedure sbAnswerClick(Sender: TObject);
    procedure sbHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    KlStud:boolean;
  end;

var
  fmMenu: TfmMenu;
  USER_STATUS,IdUser: Integer;
  const
  cLockWarning = 'ПРЕДУПРЕЖДЕНИЕ. На сервере УМУ в настоящее время проводятся ' +
             'технические работы. Это означает, что работа с базой данных ' +
             'сейчас невозможна. Приносим свои извинения за временные трудности.';

implementation

uses sprav_dm,Sprav, spisok, registr, Answer;

{$R *.DFM}
procedure LockDB;
begin
  if Assigned (fmMenu)
  then
  begin
    if not fmMenu.pnWarning.Visible
    then
    begin
      fmMenu.pnWarning.Visible := True;
      fmMenu.Timer1.Enabled := true;
    end;
  end
  else
  begin
    Application.MessageBox (cLockWarning, 'Ошибка', MB_OK or MB_APPLMODAL or MB_ICONERROR);
    Application.Terminate;
  end;
end;

//Процедура, которая проверяет, откуда идет обащение к кнопкам основного меню
function MenuButtons(sender:TObject):boolean;
 var HMenuButtons:boolean;
begin
 HMenuButtons:=false;
//Первый раз - ничего нет
  If not fmMenu.ReadNameForm(fmSprav) and
     not fmMenu.ReadNameForm(fmSpisok)   then
   HMenuButtons:=true;
//
 If fmMenu.ReadNameForm(fmSprav)then
    if fmSprav.Active then HMenuButtons:=true;
 If fmMenu.ReadNameForm(fmSpisok)then
    if fmSpisok.Active then HMenuButtons:=true;
 If fmMenu.ReadNameForm(fmAnswer)then
    if fmAnswer.Active then HMenuButtons:=true;
 if not HMenuButtons then
   begin
     Beep;
//Отключить нажатие "чужой" кнопки верхнего меню
     TSpeedButton(Sender).Down:=false;
//     If fmMenu.ReadNameForm(fmVvod)then
//      if fmVvod.Active then fmMenu.sbStud.Down:=true;
   end;
 MenuButtons:=HMenuButtons;
end;

//========================================================
//=============закрытие базы==============================
//========================================================
procedure TfmMenu.Timer1Timer(Sender: TObject);
var  I: Integer;
const
  cWarning = 'Пожалуйста, сохраните свои данные и закройте ' +
             'программу.'#13#10'Программа автоматически закроется через %d сек.';

begin
  Timer1.Tag := Timer1.Tag - 1;
  if Timer1.Tag = 10
  then
    fmMenu.lbWarning.Font.Color := clRed;
  lbWarning.Caption := cLockWarning + Format (cWarning, [Timer1.Tag]);
  if Timer1.Tag = 0
  then
  begin
    with Screen
    do
      for I := 0 to CustomFormCount - 1
      do
        if CustomForms [I] <> fmMenu
        then
          CustomForms [I].Close;
    Close;
  end
end;


// открытие форм
function TfmMenu.ReadNameForm(NameForm: Tform):boolean;
var
  I: Integer;
begin
    result:=false;
    For I := 0 to Screen.FormCount-1 do
      if Screen.Forms[I]=NameForm then
      begin
         result:=true;
         Break;
      end;
end;

//====================справочники=================================
procedure TfmMenu.sbSpravClick(Sender: TObject);
begin
 if MenuButtons(Sender) then
  begin
   If ReadNameForm(fmSprav)=false then
     fmSprav:=TfmSprav.Create(Self);
   fmSprav.Show;
  end;
end;
//=============================список образовательных партнеров=============================
procedure TfmMenu.sbStudClick(Sender: TObject);
begin
 if MenuButtons(Sender) then
  begin
   If ReadNameForm(fmSpisok)=false then
      fmSpisok:=TfmSpisok.Create(Self);
   fmSpisok.Show;
  end;
end;
//===========================запросы===============================
procedure TfmMenu.sbAnswerClick(Sender: TObject);
begin
 if MenuButtons(Sender) then
  begin
 If ReadNameForm(fmAnswer)=false then
    fmAnswer:=TfmAnswer.Create(Self);
   fmAnswer.Show;
  end;
end;

procedure TfmMenu.sbExitClick(Sender: TObject);
begin
   if MessageDlg('Закончить работу с программой ?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes then
   begin
      closeWin();
      Close;
   end;
end;
procedure TfmMenu.CloseWin;
var
  I: Integer;
begin
  for I := MDIChildCount - 1 downto 0 do
    MDIChildren[I].Close;
end;
procedure TfmMenu.sbHelpClick(Sender: TObject);
begin
 if ShellExecute (Handle,
                   'open',
                   '_help.docx',
                   nil,
                   PChar(ExtractFileDir (Application.ExeName)),
                   0) < 32
  then
    MessageBox (Application.Handle,
                'Невозможно загрузить документ',
                'Ошибка',
                MB_OK + MB_ICONERROR + MB_APPLMODAL);

end;

end.
