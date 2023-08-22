unit spisok;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, StdCtrls, Buttons, DBCtrls, ExtCtrls, ComCtrls,DB,
  ToolWin, DBGridEh, Mask, DBCtrlsEh, DBLookupEh,EhLibIBX, Menus,reportfl,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, GridsEh, DynVarsEh,
  DBAxisGridsEh, DateUtils, clipbrd;



type
  TfmSpisok = class(TForm)
    CoolBar2: TCoolBar;
    ToolBar2: TToolBar;
    btnNew: TToolButton;
    plFilter: TPanel;
    btnFilter: TToolButton;
    btnDel: TToolButton;
    btnEdit: TToolButton;
    Label8: TLabel;
    deFio: TEdit;
    DBNavigator2: TDBNavigator;
    ToolButton1: TToolButton;
    edAdress: TEdit;
    Label9: TLabel;
    GroupBox1: TGroupBox;
    rbPriz: TRadioButton;
    rbUchet: TRadioButton;
    rbAll: TRadioButton;
    pcEmployer: TPageControl;
    tsEmp: TTabSheet;
    grOrder: TDBGridEh;
    function  AllUpper(S: String): String;
    procedure btnFilterClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure grOrderDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure btnDelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure cbAll_dat1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure DateString (dat: TDate; var sdat: String);
    procedure FormActivate(Sender: TObject);
    procedure rbBudClick(Sender: TObject);
    procedure PrintOrder_VKR(n_chair, n_fio, n_city, n_vkr, n_fio_ryk, n_nom: string);
    procedure PrintBak_profil(bak_prof ,n_fio, n_citizen, n_nom: string);
    procedure PrintMag_prog(mag_prog, n_seti, n_fio, n_citizen, n_nom: string);
    procedure DBEdit1Change(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure print_pract_summer_agree;
    procedure print_sotr;
    procedure print_olimp;
    procedure print_olimp_base;
    procedure print_not_type_agree;
    function print_bank_info(s:string):string;
    procedure FormShow(Sender: TObject);




  private
    { Private declarations }
  public
    { Public declarations }
   read_only:Integer;     //1- нажата кнопка добавить, 0 - редактировать
   read_only_rod:Integer;     //1- нажата кнопка добавить, 0 - редактировать
     not_print:integer;
  end;

var
  fmSpisok: TfmSpisok;
  rmlID_Stud: Cardinal;
  {sum_grant, sum_soc, sum_top_soc,} oso_year, sum_grant_hol, sum_soc_hol: Integer;
  const
  Date_1_9='1 сентября';  //константы для дат приказов
  Date_1_10='1 октября';
  Date_30_9='30 сентября';
  spisok_sql='select c.id, c.fio, c.num_passport,c.date_passport, c.who_passport, c.NUM_PRIZYV_PASSPORT, c.DATE_PRIZYV_PASSPORT'+
  ',c. PLACE_BIRTH, c.ADRESS_REG, c.ADRESS_FACT, c.place_work, c.id_educ, se.name as name_educ, '+#13+
  'c.is_prizyv, c.ZHIL_ORGAN, c.MVD_ORGAN, c.DATE_VOEN_SPEC, c.PLACE_VOEN_SPEC, c.IS_SUD, c.SUD_PRIM, c.DATE_SUD_BEGIN, c.DATE_SUD_END,'+#13+
  'c.id_voen_spec, vs.name as name_voenspec, c.is_married, c.id_flanguage, f.name as flanguage, sport,'+#13+
  'c.DECISION_VOINSK_UCHET, c.DATE_DECISION_VOINSK_UCHET, c. DATE_DECISION_PRIZYV_KOM, c. ID_DECISION_PRIZYV_KOM, c.IS_VOEN_UCHET, d.name as DECISION_PRIZYV_KOM_name,'+#13+
  'c.NATION, c.GRAZHD_SPEC, c.ID_VOEN_ZVANIE, c.KAT_ZAPAS, c.GROUP_UCHET, c.SOSTAV, c.NUM_COMMAND_AND_LITER,'+#13+
  'c.VUS, c.DOLZNOST, c.VOEN_ZVAN_KOD, c.NUM_MARSHRUT, c.YAVKA, c.PUNKT_YAVKI, c.DATE_MOB_PREDPIS,'+#13+
  'c.NUM_DOPUSK, c.ALTER_VOIN_CHAST, c.ALTER_KOD_VUS, c.ALTER_TYPE_VVT, c.ALTER_DATE_BEGIN, c.ALTER_DATE_END, '+#13+
  'c.ALTER_DATE_UVOLEN, c.ZAKL_KOMAND_VOEN_CHAST, c.ZAKL_VOEN_KOMISSAR, c.DATE_UBYL_K_MESTY_SL, c.DATE_POSTYPIL_NA_SL, '+#13+
  'c.DATE_PRIZVAN_NAPRAVLEN_MOBILIZ, c.ROST, c.SIZE_HAD, c.SIZE_PROTIVOGAZ, c.SIZE_MUNDIR, c.SIZE_FOOT,  '+#13+
  'c.TAKE_PART_BOY_ACTION, c.PRISYAGA, c.GOS_NAGRADA, c.TRAVMA, c.MOB_RESERV_DATE_BEGIN, c.MOB_RESERV_DATE_END, c.MOB_RESERV_OSNOVANIE, c.DOP_SVED,  '+#13+
  'c.GOS_DAKT_REG, c.IND_DOZ_OBLUCH, c.DATE_VYDAN_VOEN_BILET, c.PRIBYL, c.YBYL, c.NACHALNIK, c.PHONE, c.DATE_DECISION_VOIN_UCHET_SNYAT, c.KAT_GODNOSTI,'+#13+
   'c.ID_ANSWER_RAZRYAD,c.ID_ANSWER_SOSTAV, c.IS_UCHET, c.IS_RA, c.IS_VMF, c.IS_FIRST_KAT_ZAPAS, c.IS_SEX';
  spisok_from='from conscripts c'+#13+
  'left join spr_education se on se.id=c.id_educ'+#13+
  'left join voen_spec vs on vs.id=c.id_voen_spec'+#13+
  'left join flanguage f on f.id=c.id_flanguage'+#13+
  'left join DECISION_PRIZYV_KOM d on d.id=c.id_DECISION_PRIZYV_KOM'+#13+
  'left join SPR_ANWER_RAZRYAD sr on sr.id=c.ID_ANSWER_RAZRYAD'+#13+
  'left join SPR_ANSWER_SOSTAV ss on ss.id=c.ID_ANSWER_SOSTAV';

 REPORT_INC_GRANT_ACTIVITY= 17;
  REPORT_INC_GRANT_SUMMARY = 18;


implementation
uses menu, sprav_dm, Sprav, AddOrder, rml, Registr, Dop_contract, Print;
{$R *.DFM}

//***********перевод кириллицы и латиницы в верхний регистр **********
function TfmSpisok.AllUpper(S: String): String;
var i: integer;
    Key: LongInt;
begin
   S:=UpperCase(S);
   for i:=1 to length(S) do
    begin
      Key := ord( S[ i ] );
      case Key of
         224..255: S[ i ] := chr(ord( S[ i ] )-32);
      end;

    end;
   Result := S;
end;

procedure TfmSpisok.print_pract_summer_agree;
var OldCursor:TCursor; value:string; id_order:Integer;
begin


end;

procedure TfmSpisok.print_sotr;
var OldCursor:TCursor; value:string; id_order:Integer;
begin
end;

procedure TfmSpisok.print_olimp_base;
var OldCursor:TCursor; value:string;
begin
 
end;

procedure TfmSpisok.print_olimp;
var OldCursor:TCursor; value:string; id_order:Integer;
begin

end;

procedure TfmSpisok.print_not_type_agree; //печать нетипового договора
var OldCursor:TCursor; value:string;
begin

end;


procedure TfmSpisok.DateString (dat: TDate; var sdat: String);
begin
 sdat:=IntToStr(DayOf(dat))+' ';
 case MonthOf(dat) of
  1:  sdat:=sdat+'января '+IntToStr(YearOf(dat))+' г.';
  2:  sdat:=sdat+'февраля '+IntToStr(YearOf(dat))+' г.';
  3:  sdat:=sdat+'марта '+IntToStr(YearOf(dat))+' г.';
  4:  sdat:=sdat+'апреля '+IntToStr(YearOf(dat))+' г.';
  5:  sdat:=sdat+'мая '+IntToStr(YearOf(dat))+' г.';
  6:  sdat:=sdat+'июня '+IntToStr(YearOf(dat))+' г.';
  7:  sdat:=sdat+'июля '+IntToStr(YearOf(dat))+' г.';
  8:  sdat:=sdat+'августа '+IntToStr(YearOf(dat))+' г.';
  9:  sdat:=sdat+'сентября '+IntToStr(YearOf(dat))+' г.';
  10: sdat:=sdat+'октября '+IntToStr(YearOf(dat))+' г.';
  11: sdat:=sdat+'ноября '+IntToStr(YearOf(dat))+' г.';
  12: sdat:=sdat+'декабря '+IntToStr(YearOf(dat))+' г.';
 end;
end;

procedure TfmSpisok.btnFilterClick(Sender: TObject);
var SWhere,s, s1: string;
    n1, n2, indStat:Integer;
    cnt1, cnt2, cnt3, count_null: integer;
begin
// переоткрываем
{If not dmSprav.quTypeInstitution.Active then
   dmSprav.quTypeInstitution.Open; }

if pcEmployer.ActivePage=tsEmp then
 begin
   if rbPriz.Checked then
      SWhere:=SWhere+' and c.is_prizyv=1'
   else
   if rbUchet.Checked then
      SWhere:=SWhere+' and c.is_prizyv=0';
{//фильтр на список работодателй
//Тип учреждения
  if ((cbType.Text<>'') and (cbType.Text<>'<Все типы>')) then
     SWhere:=SWhere+' and e.id_type_institution='+IntToStr(cbType.KeyValue);
// Регион
if (cbRez.Text<>'') and (cbRez.Text<>'<Все регионы>') then
     Swhere:=Swhere+' and e.id_residenc='+inttostr(cbRez.KeyValue);
// номер учреждения
if edNumInst.text<>'' then
     Swhere:=swhere+' and e.number='''+edNumInst.Text+'''';

//если даты пустые
if DateToStr(dtpDateBegin.Date)='  .  .    ' then
ShowMessage('Введите начальную дату интервала заключения договоров!');
//если даты пустые
if DateToStr(dtpDateEnd.Date)='  .  .    ' then
ShowMessage('Введите конечную дату интервала заключения договоров!');
if DateToStr(dtpDateBegin2.Date)='  .  .    ' then
ShowMessage('Введите начальную дату интервала окончания договоров!');
//если даты пустые
if DateToStr(dtpDateEnd2.Date)='  .  .    ' then
ShowMessage('Введите конечную дату интервала окончания договоров!');

//интервалы дат
if not cbAll_dat2.Checked then
   begin
     if dtpDateBegin.Date>dtpDateEnd.Date then
        begin
         ShowMessage('Некорректно введены даты!');
         Exit;
        end;
   Swhere:=Swhere+' and e.date_agreement>='''+DatetoStr(dtpDateBegin.Date)+''' and e.date_agreement<='''+Datetostr(dtpDateEnd.date)+'''';
   end;
if not cbAll_date2.Checked then
   begin
     if dtpDateBegin2.Date>dtpDateEnd2.Date then
        begin
         ShowMessage('Некорректно введены даты!');
         Exit;
        end;
     Swhere:=Swhere+' and e.date_end<='''+Datetostr(dtpDateEnd2.date)+'''';
     if not cbNoBegin.Checked then
        Swhere:=Swhere+' and e.date_end>='''+DatetoStr(dtpDateBegin2.Date)+'''';
   end;    }

// поиск по наименованию
if deFio.Text<>'' then
      begin
          s:=deFio.Text;
          n1:=Pos(' ',s);
          if (223<ORD(s[1])) and (ORD(s[1])<=255) then s[1]:=CHR(ORD(s[1])-32);
          if (223<ORD(s[n1+1])) and (ORD(s[n1+1])<=255) then s[n1+1]:=CHR(ORD(s[n1+1])-32);
          SWhere:=SWhere+' and (lower(c.fio) like ''%'' ||'+''''+AnsiLowerCase(s)+''' ||''%'')' // lower - в нижний регистр, чтобы находил названия ВСЕ
      end;      


  // поиск по адресу
  if edAdress.Text<>'' then
  begin
   s1:=edAdress.Text;
   n2:=Pos(' ',s1);
   if (223<ORD(s1[1])) and (ORD(s1[1])<=255) then s1[1]:=CHR(ORD(s1[1])-32);
   if (223<ORD(s1[n2+1])) and (ORD(s1[n2+1])<=255) then s1[n2+1]:=CHR(ORD(s1[n2+1])-32);
   SWhere:=SWhere+' and ((lower(c.adress_reg) like ''%'' ||'+''''+AnsiLowerCase(s1)+''' ||''%'') or (lower(c.adress_fact) like ''%'' ||'+''''+AnsiLowerCase(s1)+''' ||''%''))' // lower - в нижний регистр, чтобы находил названия ВСЕ
  end;



  dmSprav.quEmployers.DisableControls;
  dmSprav.quEmployers.Close;
  dmSprav.quEmployers.SelectSQL.Text:=spisok_sql+#13+spisok_from+#13+'where c.id<>0'+SWhere+#13;{+'order by e.date_agreement desc, e.num_agreement'; }
  clipboard.asText:= dmSprav.quEmployers.SelectSQL.Text;
  dmSprav.quEmployers.Open;
  dmSprav.quEmployers.First;
  dmSprav.quEmployers.EnableControls;
 end;           
end;

procedure TfmSpisok.btnNewClick(Sender: TObject);
begin
  if pcEmployer.ActivePage=tsEmp then
     begin
       if not dmSprav.quEmployers.Active then
          fmSpisok.btnFilterClick(Sender);
       dmSprav.quEmployers.Insert;
       If fmMenu.ReadNameForm(fmAddEmployer)=false then
          fmAddEmployer:=TfmAddEmployer.Create(Self);
          fmAddEmployer.Caption:='Добавление информации';
            read_only:=1; // нажата кнопка "Добавить"
          fmAddEmployer.ShowModal;
     end;

end;

procedure TfmSpisok.grOrderDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
 { if (Rect.Top = grOrder.CellRect(grOrder.Col,grOrder.Row).Top) and (not (gdFocused in State) or not grOrder.Focused) then
     grOrder.Canvas.Brush.Color := clSkyBlue;
  grOrder.DefaultDrawColumnCell(Rect,DataCol,Column,State);

  if not dmSprav.quEmployers.IsEmpty then
  //вместо цифр в гриде - слова
  if Column.Field.FieldName = 'IS_OSO' then
  begin
    grOrder.Canvas.FillRect(Rect);
    if Column.Field.AsInteger = 0 then
      grOrder.Canvas.TextOut(Rect.Left + 1, Rect.Top + 2, 'Организационно-студенческий отдел')
    else
     if Column.Field.AsInteger = 1   then
      grOrder.Canvas.TextOut(Rect.Left + 1, Rect.Top + 2, 'Центр по работе с талантливой молодежью и абитуриентами')
    else
     if Column.Field.AsInteger = 2   then
     begin
       //============= IF FACULTY =====
        If (dmSprav.quEmployersID_FACULTY.Value=1) or (dmSprav.quEmployersID_FACULTY.Value=109) or (dmSprav.quEmployersID_FACULTY.Value=37) then
              grOrder.Canvas.TextOut(Rect.Left + 1, Rect.Top + 2, dmSprav.quEmployersNAMEFAC.AsString+' факультет')
             else
             if (dmSprav.quEmployersSTATUSFAC.Value=1)
              then grOrder.Canvas.TextOut(Rect.Left + 1, Rect.Top + 2, 'факультет '+dmSprav.quEmployersNAMEFAC.AsString) else
             if (dmSprav.quEmployersSTATUSFAC.Value=2) or (dmSprav.quEmployersSTATUSFAC.Value=3)
              then grOrder.Canvas.TextOut(Rect.Left + 1, Rect.Top + 2, dmSprav.quEmployersNAMEFAC.AsString);
       //============= IF FACULTY =====
     end
     else
     if Column.Field.AsInteger = 3   then
      grOrder.Canvas.TextOut(Rect.Left + 1, Rect.Top + 2, 'УОМОИС в ПО')
  end;   }
end;

procedure TfmSpisok.btnDelClick(Sender: TObject);
var id_dop_contract,id_employer:integer;
begin
if pcEmployer.ActivePage=tsEmp then
 begin

          If MessageDlg('Удалить информацию о гражданине '+dmSprav.quEmployersFIO.asString+'?', mtConfirmation, [mbYes,mbNo], 0) = mrYes then
             begin
                //удаляем проект
                    dmSprav.quFine.Close;
                    dmSprav.quFine.SQL.Clear;
                    dmSprav.quFine.SQL.Add('delete from conscripts c');
                    dmSprav.quFine.SQL.Add('where c.id='+dmSprav.quEmployersID.AsString);
                    dmSprav.quFine.Open;
                    dmSprav.quFine.Close;
                //подтверждаем транзакцию
                 try
                   if not dmSprav.quEmployers.Transaction.Active
                     then  dmSprav.quEmployers.Transaction.StartTransaction;
                   dmSprav.quEmployers.Transaction.Commit;
                 except
                   dmSprav.quEmployers.Transaction.Rollback;
                   ShowMessage('Ошибка сохранения');
                   exit;
                 end;
                 fmSpisok.btnFilterClick(Sender);
              end;
end;
end;
procedure TfmSpisok.FormCreate(Sender: TObject);
begin
 { dtpDateBegin.Date:=Date;
  dtpDateend.Date:=Date;
  dtpDateBegin2.Date:=Date;
  dtpDateend2.Date:=Date;  }
   
end;

procedure TfmSpisok.btnEditClick(Sender: TObject);
var id_order:Integer;
begin
  if  dmSprav.quEmployers.Active then
   begin
    if pcEmployer.ActivePage=tsEmp then
     begin
       dmSprav.quEmployers.edit;
       If fmMenu.ReadNameForm(fmAddEmployer)=false
        then fmAddEmployer:=TfmAddEmployer.Create(Self);
       fmAddEmployer.Caption:='Редактирование проекта/приказа';
                  read_only:=0; //нажата кнопка "Редактировать"
                fmAddEmployer.ShowModal;

           
     end;
   end
  else ShowMessage('Нет данных для редактирования. Сформируйте список.');

end;

procedure TfmSpisok.cbAll_dat1Click(Sender: TObject);
begin
//  if cbAll_dat1.Checked
//   then dtpDateOrder.Enabled:=false
   //else dtpDateOrder.Enabled:=true;
end;

procedure TfmSpisok.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DoneRML (rmlID_Stud);
end;

procedure TfmSpisok.N1Click(Sender: TObject);
var sem, idf: Integer;
    fname: string;
begin
  RunRMLReport (0,
                  rmlID_Stud,
                  REPORT_INC_GRANT_ACTIVITY,
                  False,
                  True);
end;

procedure TfmSpisok.N2Click(Sender: TObject);
var sem :integer;
begin
 {if rbSess1.Checked
   then sem:=1
   else sem:=2;     }
   // SetParametr (rmlID_Stud ,StrToInt(edtYear.Text), sem, 0, PChar(''));
    RunRMLReport (0,
                  rmlID_Stud,
                  REPORT_INC_GRANT_SUMMARY,
                  False,
                  True);

end;

procedure TfmSpisok.FormActivate(Sender: TObject);
var i:integer;
begin
end;

procedure TfmSpisok.rbBudClick(Sender: TObject);
var i:integer;
begin
end;


procedure TfmSpisok.PrintOrder_VKR(n_chair, n_fio, n_city, n_vkr, n_fio_ryk, n_nom: string);
var value: string;
 begin
 end;

procedure TfmSpisok.PrintBak_profil(bak_prof ,n_fio, n_citizen, n_nom: string);
var value:string;
 begin
 end;

procedure TfmSpisok.PrintMag_prog(mag_prog, n_seti, n_fio, n_citizen, n_nom: string);
var value: string;
 begin
 end;

procedure TfmSpisok.DBEdit1Change(Sender: TObject);
begin
  { dmSprav.quDopContract.DisableControls;
   dmSprav.quDopContract.Close;
   dmSprav.quDopContract.ParamByName('par1').AsInteger:=dmSprav.quEmployersID.AsInteger;
   //clipboard.asText:= dmSprav.quDopContract.SelectSQL.Text;
   dmSprav.quDopContract.Open;
   dmSprav.quDopContract.EnableControls;   }
end;

procedure TfmSpisok.ToolButton1Click(Sender: TObject);
var id_order,button_selected:Integer;s,b:string;
begin

end;

function  TfmSpisok.print_bank_info(s:string):string;
var i:string;
begin
end;

procedure TfmSpisok.FormShow(Sender: TObject);
var count_null :integer;
begin
end;

end.
