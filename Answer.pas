unit Answer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, ComCtrls, ToolWin, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, DBGridEh, StdCtrls, Buttons,
  Mask, DBCtrlsEh, DBLookupEh, GridsEh, DBAxisGridsEh,Clipbrd;

type
  TfmAnswer = class(TForm)
    Panel1: TPanel;
    grdReestr: TDBGridEh;
    plFilter: TPanel;
    ToolBar2: TToolBar;
    btnFilter: TToolButton;
    DBNavigator2: TDBNavigator;
    btnAmswer: TToolButton;
    grpWorkParams: TGroupBox;
    rgReportType: TRadioGroup;
    BitBtn1: TBitBtn;
    procedure btnFilterClick(Sender: TObject);
    procedure btnAmswerClick(Sender: TObject);
    procedure PrintReestrInst;
    procedure BitBtn1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmAnswer: TfmAnswer;

implementation
uses menu, answer_dm,sprav_dm, Registr,reportfl, DB, IBQuery;
{$R *.dfm}


procedure TfmAnswer.btnFilterClick(Sender: TObject);
 var Swhere:string;
begin
  if rgReportType.ItemIndex=0 then
     begin
       DBNavigator2.DataSource:=dmAnswer.dsOtchet;
       with dmAnswer do
         begin
             quOtchet.Close;
             quOtchet.ParamByName('IS_PR').AsInteger:=0;
             //Clipboard.AsText:=  quOtchet.SQL.Text;
             quOtchet.Open;
         end;
     end

end;

procedure TfmAnswer.btnAmswerClick(Sender: TObject);
begin
  if (dmAnswer.quOtchet.Active) then
     begin
         if rgReportType.ItemIndex=0 then
            PrintReestrInst;
     end
 else ShowMessage('Нет данных!Сформируйте список.');
end;

procedure TfmAnswer.PrintReestrInst;
var value,name_r:string;
    OldCursor:TCursor;
    itog,vsego_ra,
    vsego_vmf,
    vsego,
    ra_obsh,
    vmf_obsh,
    obsh,
    ra_spec,
    vmf_spec,
    spec,
    vs_ra,
    vs_vmf,
    vs,
    ra_o,
    vmf_o,
    o,
    ra_s,
    vmf_s,
    s,
    vs_prap_ra,
    vs_serg_ra,
    vs_sold_ra,
    vs_prap_vmf,
    vs_serg_vmf,
    vs_sold_vmf,
    vs_prap,
    vs_serg,
    vs_sold,
    prap_ra_o,
    serg_ra_o,
    sold_ra_o,
    prap_vmf_o,
    serg_vmf_o,
    sold_vmf_o,
    prap_o,
    serg_o,
    sold_o,
    prap_ra_s,
    serg_ra_s,
    sold_ra_s,
    prap_vmf_s,
    serg_vmf_s,
    sold_vmf_s,
    prap_s,
    serg_s,
    sold_s:Integer;
  begin
       if not BeginReport (Application.Handle,
                    PChar (ExtractFilePath (Application.ExeName) + 'Reestr_inst.dat'),
                    nil)
       then
       begin
         Abort;
         ShowMessage('Не найден файл Reestr_inst.dat');
         exit;
       end;
  if not dmAnswer.quOtchet.IsEmpty then
   begin
       dmAnswer.quOtchet.DisableControls;
       OldCursor:=Screen.Cursor;
       Screen.Cursor:=crHourGlass;
       StoreMode (SM_DISTINCT);
       Application.ProcessMessages;

       itog:=0;
       vsego_ra:=0;
       vsego_vmf:=0;
       vsego:=0;
       ra_obsh:=0;
       vmf_obsh:=0;
       obsh:=0;
       ra_spec:=0;
       vmf_spec:=0;
       spec:=0;
       vs_ra:=0;
       vs_vmf:=0;
       vs:=0;
       ra_o:=0;
       vmf_o:=0;
       o:=0;
       ra_s:=0;
       vmf_s:=0;
       s:=0;
       vs_prap_ra:=0;
       vs_serg_ra:=0;
       vs_sold_ra:=0;
       vs_prap_vmf:=0;
       vs_serg_vmf:=0;
       vs_sold_vmf:=0;
       vs_prap:=0;
       vs_serg:=0;
       vs_sold:=0;
       prap_ra_o:=0;
       serg_ra_o:=0;
       sold_ra_o:=0;
       prap_vmf_o:=0;
       serg_vmf_o:=0;
       sold_vmf_o:=0;
       prap_o:=0;
       serg_o:=0;
       sold_o:=0;
       prap_ra_s:=0;
       serg_ra_s:=0;
       sold_ra_s:=0;
       prap_vmf_s:=0;
       serg_vmf_s:=0;
       sold_vmf_s:=0;
       prap_s:=0;
       serg_s:=0;
       sold_s:=0;

       value:=DateToStr(date());
       WriteData('D', @value, DT_STRING, 0);

       while not dmAnswer.quOtchet.Eof do
         begin
          if dmAnswer.quOtchetRAZRYAD.asString<>name_r then
               begin
                     //=============наименование разряда
                     value:=dmAnswer.quOtchetRAZRYAD.asString;
                     WriteData('NAME', @value, DT_STRING, 1);
               end;

               //=============кнаименование состава
               value:=dmAnswer.quOtchetSOSTAV.asString;
               WriteData('NAME_SOS', @value, DT_STRING, 1);

          //========ВСЕГО=======================
               // РА
                   value:=dmAnswer.quOtchetKOL_RA_ALL.asString;
                   WriteData('COUNT_RA', @value, DT_STRING, 1);
                   vsego_ra:=vsego_ra+dmAnswer.quOtchetKOL_RA_ALL.asInteger;
                     // считаем прапорщиков для нижней шапки Всего
                     if dmAnswer.quOtchetSOSTAV.AsString='Прапорщик (мичман)' then
                      vs_prap_ra:=vs_prap_ra+dmAnswer.quOtchetKOL_RA_ALL.asInteger else
                     // считаем сержантов
                     if dmAnswer.quOtchetSOSTAV.AsString='Сержант (старшина)' then
                      vs_serg_ra:= vs_serg_ra+dmAnswer.quOtchetKOL_RA_ALL.asInteger else
                     // считаем солдат
                     if dmAnswer.quOtchetSOSTAV.AsString='Солдат (матрос)' then
                      vs_sold_ra:=vs_sold_ra+dmAnswer.quOtchetKOL_RA_ALL.asInteger;

               //ВМФ
                   value:=dmAnswer.quOtchetKOL_VMF_ALL.asString;
                   WriteData('COUNT_VMF', @value, DT_STRING, 1);
                   vsego_vmf:=vsego_vmf+dmAnswer.quOtchetKOL_VMF_ALL.asInteger;
                      // считаем прапорщиков для нижней шапки Всего
                     if dmAnswer.quOtchetSOSTAV.AsString='Прапорщик (мичман)' then
                      vs_prap_vmf:=vs_prap_vmf+dmAnswer.quOtchetKOL_VMF_ALL.asInteger else
                      // считаем сержантов
                     if dmAnswer.quOtchetSOSTAV.AsString='Сержант (старшина)' then
                      vs_serg_vmf:= vs_serg_vmf+dmAnswer.quOtchetKOL_VMF_ALL.asInteger else
                     // считаем солдат
                     if dmAnswer.quOtchetSOSTAV.AsString='Солдат (матрос)' then
                      vs_sold_vmf:=vs_sold_vmf+dmAnswer.quOtchetKOL_VMF_ALL.asInteger;

               // всего
                   value:=dmAnswer.quOtchetKOL_ALL.asString;
                   WriteData('COUNT_R', @value, DT_STRING, 1);
                   vsego:=vsego+dmAnswer.quOtchetKOL_ALL.asInteger;
                      // считаем прапорщиков для нижней шапки Всего
                     if dmAnswer.quOtchetSOSTAV.AsString='Прапорщик (мичман)' then
                      vs_prap:=vs_prap+dmAnswer.quOtchetKOL_ALL.asInteger else
                      // считаем сержантов
                     if dmAnswer.quOtchetSOSTAV.AsString='Сержант (старшина)' then
                      vs_serg:= vs_serg+dmAnswer.quOtchetKOL_ALL.asInteger else
                     // считаем солдат
                     if dmAnswer.quOtchetSOSTAV.AsString='Солдат (матрос)' then
                      vs_sold:=vs_sold+dmAnswer.quOtchetKOL_ALL.asInteger;



          //===========В т.ч. на общем учете===============
                   // РА
                   value:=dmAnswer.quOtchetKOL_RA_O.asString;
                   WriteData('COUNT_RA_O', @value, DT_STRING, 1);
                   ra_obsh:=ra_obsh+dmAnswer.quOtchetKOL_RA_O.asInteger;
                      // считаем прапорщиков для нижней шапки Всего
                     if dmAnswer.quOtchetSOSTAV.AsString='Прапорщик (мичман)' then
                      prap_ra_o:=prap_ra_o+dmAnswer.quOtchetKOL_RA_O.asInteger else
                     // считаем сержантов
                     if dmAnswer.quOtchetSOSTAV.AsString='Сержант (старшина)' then
                      serg_ra_o:= serg_ra_o+dmAnswer.quOtchetKOL_RA_O.asInteger else
                     // считаем солдат
                     if dmAnswer.quOtchetSOSTAV.AsString='Солдат (матрос)' then
                      sold_ra_o:=sold_ra_o+dmAnswer.quOtchetKOL_RA_O.asInteger;

                   //ВМФ
                   value:=dmAnswer.quOtchetKOL_VMF_O.asString;
                   WriteData('COUNT_VMF_O', @value, DT_STRING, 1);
                   vmf_obsh:=vmf_obsh+dmAnswer.quOtchetKOL_VMF_O.asInteger;
                     // считаем прапорщиков для нижней шапки Всего
                     if dmAnswer.quOtchetSOSTAV.AsString='Прапорщик (мичман)' then
                      prap_vmf_o:=prap_vmf_o+dmAnswer.quOtchetKOL_VMF_O.asInteger else
                     // считаем сержантов
                     if dmAnswer.quOtchetSOSTAV.AsString='Сержант (старшина)' then
                      serg_vmf_o:= serg_vmf_o+dmAnswer.quOtchetKOL_VMF_O.asInteger else
                     // считаем солдат
                     if dmAnswer.quOtchetSOSTAV.AsString='Солдат (матрос)' then
                      sold_vmf_o:=sold_vmf_o+dmAnswer.quOtchetKOL_VMF_O.asInteger;

                   // всего
                   value:=dmAnswer.quOtchetKOL_ALL_O.asString;
                   WriteData('COUNT_R_O', @value, DT_STRING, 1);
                   obsh:=obsh+dmAnswer.quOtchetKOL_ALL_O.asInteger;
                      // считаем прапорщиков для нижней шапки Всего
                     if dmAnswer.quOtchetSOSTAV.AsString='Прапорщик (мичман)' then
                      prap_o:=prap_o+dmAnswer.quOtchetKOL_ALL_O.asInteger else
                     // считаем сержантов
                     if dmAnswer.quOtchetSOSTAV.AsString='Сержант (старшина)' then
                      serg_o:= serg_o+dmAnswer.quOtchetKOL_ALL_O.asInteger else
                     // считаем солдат
                     if dmAnswer.quOtchetSOSTAV.AsString='Солдат (матрос)' then
                      sold_o:=sold_o+dmAnswer.quOtchetKOL_ALL_O.asInteger;

          //========В т.ч. на специальном учете=======================
                   // РА
                   value:=dmAnswer.quOtchetKOL_RA_S.asString;
                   WriteData('COUNT_RA_S', @value, DT_STRING, 1);
                   ra_spec:=ra_spec+dmAnswer.quOtchetKOL_RA_S.asInteger;
                        // считаем прапорщиков для нижней шапки Всего
                     if dmAnswer.quOtchetSOSTAV.AsString='Прапорщик (мичман)' then
                      prap_ra_s:=prap_ra_s+dmAnswer.quOtchetKOL_RA_S.asInteger else
                     // считаем сержантов
                     if dmAnswer.quOtchetSOSTAV.AsString='Сержант (старшина)' then
                      serg_ra_s:= serg_ra_s+dmAnswer.quOtchetKOL_RA_S.asInteger else
                     // считаем солдат
                     if dmAnswer.quOtchetSOSTAV.AsString='Солдат (матрос)' then
                      sold_ra_s:=sold_ra_s+dmAnswer.quOtchetKOL_RA_S.asInteger;

                   //ВМФ
                   value:=dmAnswer.quOtchetKOL_VMF_S.asString;
                   WriteData('COUNT_VMF_S', @value, DT_STRING, 1);
                   vmf_spec:=vmf_spec+dmAnswer.quOtchetKOL_VMF_S.asInteger;
                       // считаем прапорщиков для нижней шапки Всего
                     if dmAnswer.quOtchetSOSTAV.AsString='Прапорщик (мичман)' then
                      prap_vmf_s:=prap_vmf_s+dmAnswer.quOtchetKOL_VMF_S.asInteger else
                     // считаем сержантов
                     if dmAnswer.quOtchetSOSTAV.AsString='Сержант (старшина)' then
                      serg_vmf_s:= serg_vmf_s+dmAnswer.quOtchetKOL_VMF_S.asInteger else
                     // считаем солдат
                     if dmAnswer.quOtchetSOSTAV.AsString='Солдат (матрос)' then
                      sold_vmf_s:=sold_vmf_s+dmAnswer.quOtchetKOL_VMF_S.asInteger;

                   // всего
                   value:=dmAnswer.quOtchetKOL_ALL_S.asString;
                   WriteData('COUNT_R_S', @value, DT_STRING, 1);
                   spec:=spec+dmAnswer.quOtchetKOL_ALL_S.asInteger;
                      // считаем прапорщиков для нижней шапки Всего
                     if dmAnswer.quOtchetSOSTAV.AsString='Прапорщик (мичман)' then
                      prap_s:=prap_s+dmAnswer.quOtchetKOL_ALL_S.asInteger else
                     // считаем сержантов
                     if dmAnswer.quOtchetSOSTAV.AsString='Сержант (старшина)' then
                      serg_s:= serg_s+dmAnswer.quOtchetKOL_ALL_S.asInteger else
                     // считаем солдат
                     if dmAnswer.quOtchetSOSTAV.AsString='Солдат (матрос)' then
                      sold_s:=sold_s+dmAnswer.quOtchetKOL_ALL_S.asInteger;

               name_r:=dmAnswer.quOtchetRAZRYAD.asString;


           dmAnswer.quOtchet.Next;
           WriteEndOfRecord;
            if (dmAnswer.quOtchetRAZRYAD.asString<>name_r) or  (dmAnswer.quOtchet.Eof)  then
                 begin
                   value:='Всего';
                   WriteData('NAME_SOS',@value , DT_STRING, 1);
                   value:=Inttostr(vsego_ra);
                   WriteData('COUNT_RA', @value, DT_STRING, 1);
                   vs_ra:=vs_ra+vsego_ra; //для нижней шапки Всего
                   vsego_ra:=0;

                   value:=Inttostr(vsego_vmf);
                   WriteData('COUNT_VMF', @value, DT_STRING, 1);
                   vs_vmf:=vs_vmf+vsego_vmf; //для нижней шапки Всего
                   vsego_vmf:=0;

                   value:=Inttostr(vsego);
                   WriteData('COUNT_R', @value, DT_STRING, 1);
                   vs:=vs+vsego; //для нижней шапки Всего
                   vsego:=0;

                   //=========

                   value:=Inttostr(ra_obsh);
                   WriteData('COUNT_RA_O', @value, DT_STRING, 1);
                   ra_o:=ra_o+ra_obsh;
                   ra_obsh:=0;

                   value:=Inttostr(vmf_obsh);
                   WriteData('COUNT_VMF_O', @value, DT_STRING, 1);
                   vmf_o:=vmf_o+vmf_obsh;
                   vmf_obsh:=0;

                   value:=Inttostr(obsh);
                   WriteData('COUNT_R_O', @value, DT_STRING, 1);
                   o:=o+obsh;
                   obsh:=0;

                   //============

                   value:=Inttostr(ra_spec);
                   WriteData('COUNT_RA_S', @value, DT_STRING, 1);
                   ra_s:=ra_s+ra_spec;
                   ra_spec:=0;

                   value:=Inttostr(vmf_spec);
                   WriteData('COUNT_VMF_S', @value, DT_STRING, 1);
                   vmf_s:=vmf_s+vmf_spec;
                   vmf_spec:=0;

                   value:=Inttostr(spec);
                   WriteData('COUNT_R_S', @value, DT_STRING, 1);
                   s:=s+spec;
                   spec:=0;

                   WriteEndOfRecord;


                 end;
           itog:=itog+1;
          end;

    WriteData('itog',@itog,DT_INTEGER, 0);
    // печатаем шапку Всего внизу
    WriteData('VS_RA',@vs_ra,DT_INTEGER, 0);
    WriteData('VS_VMF',@vs_vmf,DT_INTEGER, 0);
    WriteData('VS',@vs,DT_INTEGER, 0);

    WriteData('RA_O',@ra_o,DT_INTEGER, 0);
    WriteData('VMF_O',@vmf_o,DT_INTEGER, 0);
    WriteData('O',@o,DT_INTEGER, 0);

    WriteData('RA_S',@ra_s,DT_INTEGER, 0);
    WriteData('VMF_S',@vmf_s,DT_INTEGER, 0);
    WriteData('S',@s,DT_INTEGER, 0);

    // Всего по отдельности сержантов, прапорщков и солдат
    // ==========================================ВСЕГО=================================
      WriteData('VS_PRAP_RA',@vs_prap_ra,DT_INTEGER, 0);
      WriteData('VS_PRAP_VMF',@vs_prap_vmf,DT_INTEGER, 0);
      WriteData('VS_PRAP',@vs_prap,DT_INTEGER, 0);


     WriteData('VS_SERG_RA',@vs_serg_ra,DT_INTEGER, 0);
     WriteData('VS_SERG_VMF',@vs_serg_vmf,DT_INTEGER, 0);
     WriteData('VS_SERG',@vs_serg,DT_INTEGER, 0);

     WriteData('VS_SOLD_RA',@vs_sold_ra,DT_INTEGER, 0);
     WriteData('VS_SOLD_VMF',@vs_sold_vmf,DT_INTEGER, 0);
     WriteData('VS_SOLD',@vs_sold,DT_INTEGER, 0);
    //================================================Общий============================
     WriteData('PRAP_RA_O',@prap_ra_o,DT_INTEGER, 0);
     WriteData('PRAP_VMF_O',@prap_vmf_o,DT_INTEGER, 0);
     WriteData('PRAP_O',@prap_o,DT_INTEGER, 0);

     WriteData('SERG_RA_O',@serg_ra_o,DT_INTEGER, 0);
     WriteData('SERG_VMF_O',@serg_vmf_o,DT_INTEGER, 0);
     WriteData('SERG_O',@serg_o,DT_INTEGER, 0);

     WriteData('SOLD_RA_O',@sold_ra_o,DT_INTEGER, 0);
     WriteData('SOLD_VMF_O',@sold_vmf_o,DT_INTEGER, 0);
     WriteData('SOLD_O',@sold_o,DT_INTEGER, 0);
    //===================================================Спец==========================
      WriteData('PRAP_RA_S',@prap_ra_s,DT_INTEGER, 0);
      WriteData('PRAP_VMF_S',@prap_vmf_s,DT_INTEGER, 0);
      WriteData('PRAP_S',@prap_s,DT_INTEGER, 0);

      WriteData('SERG_RA_S',@serg_ra_s,DT_INTEGER, 0);
      WriteData('SERG_VMF_S',@serg_vmf_s,DT_INTEGER, 0);
      WriteData('SERG_S',@serg_s,DT_INTEGER, 0);

      WriteData('SOLD_RA_S',@sold_ra_s,DT_INTEGER, 0);
      WriteData('SOLD_VMF_S',@sold_vmf_s,DT_INTEGER, 0);
      WriteData('SOLD_S',@sold_s,DT_INTEGER, 0);


    dmAnswer.quOtchet.First;
    dmAnswer.quOtchet.EnableControls;
    EndReport;
    Screen.Cursor:=OldCursor;

   end
   else
   ShowMessage('Нет данных для печати!');
end;

procedure TfmAnswer.BitBtn1Click(Sender: TObject);
var value:string; OldCursor:TCursor;
begin
    if not BeginReport (Application.Handle,
                    PChar (ExtractFilePath (Application.ExeName) + 'First_kat_zapas.dat'),
                    nil)
       then
       begin
         Abort;
         ShowMessage('Не найден файл First_kat_zapas.dat');
         exit;
       end;
       dmAnswer.quFirst_kat_zapas.close;
       dmAnswer.quFirst_kat_zapas.Open;
       dmAnswer.quFirst_kat_zapas.First;

       if not dmAnswer.quFirst_kat_zapas.IsEmpty then
         begin
           dmAnswer.quFirst_kat_zapas.DisableControls;
           OldCursor:=Screen.Cursor;
           Screen.Cursor:=crHourGlass;
           StoreMode (SM_DISTINCT);
           Application.ProcessMessages;

           while not dmAnswer.quFirst_kat_zapas.Eof do
             begin
              value:=dmAnswer.quFirst_kat_zapasFIO.asString;
              WriteData('FIO', @value, DT_STRING, 1);
              value:=dmAnswer.quFirst_kat_zapasNAME_RAZRYAD.asString;
              WriteData('NAME_R', @value, DT_STRING, 1);
              value:=dmAnswer.quFirst_kat_zapasNAME_SOSTAV.asString;
              WriteData('NAME_S', @value, DT_STRING, 1);
              value:=dmAnswer.quFirst_kat_zapasUCHET.asString;
              WriteData('UCHET', @value, DT_STRING, 1);
              value:=dmAnswer.quFirst_kat_zapasVMF.asString;
              WriteData('VMF', @value, DT_STRING, 1);
              value:=dmAnswer.quFirst_kat_zapasRA.asString;
              WriteData('RA', @value, DT_STRING, 1);
              dmAnswer.quFirst_kat_zapas.Next;
              WriteEndOfRecord;
             end;

        //dmAnswer.quFirst_kat_zapas.First;
        dmAnswer.quFirst_kat_zapas.EnableControls;
        EndReport;
        Screen.Cursor:=OldCursor;
        end
       else
       ShowMessage('Нет данных для печати!');
end;


end.
