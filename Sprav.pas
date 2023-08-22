unit Sprav;

interface

uses
  Windows, Messages,  Variants, SysUtils,Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrlsEh, DBLookupEh, ComCtrls, Grids,
  DBGrids, ExtCtrls,ToolWin, DBGridEh,Db, DBTables,DBIProcs, DBITypes, IBDatabase, IBCustomDataSet, IBQuery,
  IBSQL, IBEvents, Menus, DBCtrls,EhLibIBX,reportfl, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, GridsEh, DynVarsEh, DBAxisGridsEh;

type
  TfmSprav = class(TForm)
    pcSpr: TPageControl;
    tsVoenSpec: TTabSheet;
    GrType: TDBGridEh;
    clbr1: TCoolBar;
    tlb1: TToolBar;
    btnAdd: TToolButton;
    btnDel: TToolButton;
    btnEdit: TToolButton;
    lb5: TLabel;
    tsResidenc: TTabSheet;
    DBGridEh1: TDBGridEh;
    dbNav: TDBNavigator;
    tsVoen_Zvanie: TTabSheet;
    DBGridEh2: TDBGridEh;
    tsRodstvo: TTabSheet;
    DBGridEh3: TDBGridEh;
    function DelSpravRec(DataSet: TIBDataSet): Byte;
    function ModifySpravRec(DataSet: TIBDataSet; TfIns: TComponentClass): Byte;
    function InsSpravRec(DataSet : TIBDataSet; TfIns: TComponentClass): Byte;
    procedure FormActivate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure tsTypeAgreementsShow(Sender: TObject);
    procedure tsVoenSpecShow(Sender: TObject);
    procedure tsResidencShow(Sender: TObject);
    procedure GrTypeDblClick(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
    fmSprav: TfmSprav;

implementation

uses Registr,Menu,Sprav_dm, _fmMod_spr_top_grant, _fmMod_spr_voen_zvanie, _fmMod_spr_rodstvo;

{$R *.dfm}


procedure TfmSprav.FormActivate(Sender: TObject);
begin
   if not dmSprav.quVoenSpec.Active
   then dmSprav.quVoenSpec.Open;
   if not dmSprav.quResidenc.Active
   then dmSprav.quResidenc.Open;
   if not dmSprav.quVoenZvanie.Active
   then dmSprav.quVoenZvanie.Open;
   if not dmSprav.quSprRodstvo.Active
   then dmSprav.quSprRodstvo.Open


end;

procedure TfmSprav.btnAddClick(Sender: TObject);
begin
   If pcSpr.ActivePage=tsVoenSpec then
     InsSpravRec(dmSprav.quVoenSpec, TfmMod_spr_type_inst)
   else
   If pcSpr.ActivePage=tsVoen_Zvanie then
     InsSpravRec(dmSprav.quVoenZvanie, TfmMod_spr_voen_zvanie) else
   If pcSpr.ActivePage=tsRodstvo then
     InsSpravRec(dmSprav.quSprRodstvo, TfmMod_spr_rodstvo);
end;
//------------------------------------------------------------
//ПРОЦЕДУРЫ добавления, редактирования и удаления записей
//------------------------------------------------------------
function TfmSprav.InsSpravRec(DataSet : TIBDataSet; TfIns: TComponentClass): Byte;
var fIns: TForm;
    id,idS: Integer;
begin
  If fmMenu.ReadNameForm(fIns)=false then Application.CreateForm(TfIns, fIns);
  fIns.Caption := 'Добавление записи';
  id:= DataSet.FieldByName('ID').asInteger;
  DataSet.Append;
  Result:= fIns.ShowModal;

  if (Result = mrOK) then
  begin
    try DataSet.Post;
    except
       ShowMessage('Сохранить не удалось! Проверьте, возможно, такая запись уже есть?');
       DataSet.Cancel;
       Exit;
    end;
    if not DataSet.Transaction.Active then DataSet.Transaction.StartTransaction;
    try
      DataSet.ApplyUpdates;
      DataSet.Transaction.Commit;
      DataSet.DisableControls;
      DataSet.Close;
      DataSet.Open;
      DataSet.Locate('ID',id,[]);
      DataSet.EnableControls;
    except DataSet.Transaction.RollBack;
    ShowMessage('Не удалось выполнить транзакцию!');
    end;
  end
  else
   begin
    DataSet.Locate('ID',id,[]);
    DataSet.Cancel;
   end;
end;

{Метод, изменяющий запись в набор данных DataSet.
Открывает модальную форму класса TcomponentClass для редактирования данных.
Сохраняет/отменяет сделанные изменения в зависимости от результата,
который возвращает модальная форма.}
function TfmSprav.ModifySpravRec(DataSet: TIBDataSet; TfIns:  TComponentClass): Byte;
var
    fIns : TForm;
    id : Integer;
begin
  If fmMenu.ReadNameForm(fIns)=false then   Application.CreateForm(TfIns, fIns);
  fIns.Caption := 'Редактирование записи';
  DataSet.Edit;
  Result := fIns.ShowModal;
  if (Result = mrOK) then
  begin
    try
      DataSet.Post;
    except
      ShowMessage('Сохранение не прошло! Возможно, такая запись уже есть.');
      DataSet.Cancel;
      Exit;
    end;
    if not DataSet.Transaction.Active then DataSet.Transaction.StartTransaction;
    try
       id := DataSet.FieldByName('ID').asInteger;
       DataSet.ApplyUpdates;
       DataSet.Transaction.Commit;
       DataSet.DisableControls;
       DataSet.Close;
       DataSet.Open;
       DataSet.Locate('ID',id,[]);
       DataSet.EnableControls;
    except
       DataSet.Transaction.RollBack;
       ShowMessage('Не удалось выполнить транзакцию!');
    end;
  end
  else
      DataSet.Cancel;
end;

{Метод, удаляющий текущую запись из набора данных DataSet,предварительно запрашивая подтверждение на удаление}
function TfmSprav.DelSpravRec(DataSet: TIBDataSet): Byte;
var next_id, id: Integer;
begin
  if MessageDlg('Удалить запись?',mtConfirmation,[mbOK, mbCancel],0)=mrOK then
  begin
    id:= DataSet.Fields[0].AsInteger;
    try DataSet.Delete;
    except raise
      Exception.Create('Удалить не удалось! Возможно, на данную запись есть ссылка.');
    end;

    try next_id := DataSet.FieldByName('ID').AsInteger;
    except
      next_id := 0;
    end;
    if not DataSet.Transaction.Active then DataSet.Transaction.StartTransaction;
    try
      DataSet.ApplyUpdates;
      DataSet.Transaction.Commit;
    except
      DataSet.Transaction.Rollback;
      DataSet.DisableControls;
      DataSet.Close;
      DataSet.Open;
      DataSet.Locate('ID',id,[]);
      DataSet.EnableControls;
      ShowMessage('Запись не удалена! Транзакция не может быть выполнена!');
      exit;
    end;
    DataSet.DisableControls;
    DataSet.Close;
    DataSet.Open;
    DataSet.Locate('ID',next_id, []);
    DataSet.EnableControls;
  end;
end;

procedure TfmSprav.btnDelClick(Sender: TObject);
begin
 If pcSpr.ActivePage=tsvoenspec then
   DelSpravRec(dmSprav.quvoenspec)
else
 If pcSpr.ActivePage=tsVoen_Zvanie then
   DelSpravRec(dmSprav.quVoenZvanie) else
  If pcSpr.ActivePage=tsRodstvo then
   DelSpravRec(dmSprav.quSprRodstvo);

end;

procedure TfmSprav.btnEditClick(Sender: TObject);
begin
 If pcSpr.ActivePage=tsVoenSpec then
     ModifySpravRec(dmSprav.quVoenSpec, TfmMod_spr_type_inst)
 else
   if  pcSpr.ActivePage=tsVoen_Zvanie then
     ModifySpravRec(dmSprav.quVoenZvanie, TfmMod_spr_voen_zvanie)  else
   if  pcSpr.ActivePage=tsRodstvo then
     ModifySpravRec(dmSprav.quSprRodstvo, TfmMod_spr_rodstvo)
end;

procedure TfmSprav.tsTypeAgreementsShow(Sender: TObject);
begin
 if not dmSprav.quVOenSpec.Active
 then dmSprav.quVOenSpec.Open;

 dbnav.DataSource:=dmSprav.dsVOenSpec;
//========================
  btnAdd.Visible:=false;
  btnDel.Visible:=false;
  btnEdit.Visible:=false;
end;

procedure TfmSprav.tsVoenSpecShow(Sender: TObject);
begin
//dbnav.DataSource:=dmSprav.dsTypeInstitution;
//====================
if fmRegistr.is_bud=0 then
 begin
  btnAdd.Visible:=true;
  btnDel.Visible:=true;
  btnEdit.Visible:=true;
 end
else
 begin
  btnAdd.Visible:=False;
  btnDel.Visible:=False;
  btnEdit.Visible:=False;
 end;
  //if not dmSprav.quTypeTopGrant.Active then dmSprav.quTypeTopGrant.Open;
end;

procedure TfmSprav.tsResidencShow(Sender: TObject);
begin
  if not dmSprav.quResidenc.Active
   then dmSprav.quResidenc.Open;
  dbnav.DataSource:=dmSprav.dsResidenc;
  btnAdd.Visible:=false;
  btnDel.Visible:=false;
  btnEdit.Visible:=false;
end;

procedure TfmSprav.GrTypeDblClick(Sender: TObject);
begin
{if fmRegistr.is_bud=0 then
   If pcSpr.ActivePage=tsTypeInstitution then
     ModifySpravRec(dmSprav.quTypeInstitution, TfmMod_spr_type_inst);   }
 
end;

end.
