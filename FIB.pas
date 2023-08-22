{***************************************************************}
{ FIBPlus - component library for direct access to Firebird and }
{ Interbase databases                                           }
{                                                               }
{    FIBPlus is based in part on the product                    }
{    Free IB Components, written by Gregory H. Deatz for        }
{    Hoagland, Longo, Moran, Dunst & Doukas Company.            }
{    mailto:gdeatz@hlmdd.com                                    }
{                                                               }
{    Copyright (c) 1998-2001 Serge Buzadzhy                     }
{    Contact: buzz@devrace.com                                  }
{                                                               }
{ ------------------------------------------------------------- }
{    FIBPlus home page      : http://www.fibplus.net/           }
{    FIBPlus support e-mail : fibplus@devrace.com               }
{ ------------------------------------------------------------- }
{                                                               }
{  Please see the file License.txt for full license information }
{***************************************************************}


unit fib;

{$I FIBPlus.inc}
{$T-}

interface

uses
 {$IFDEF MSWINDOWS}
  Windows, SysUtils, Classes, ibase,IB_Intf, ib_externals,Db
  ;
 {$ENDIF}
 {$IFDEF LINUX}
  Types, SysUtils, Classes, ibase,IB_Intf, IB_Externals,Db,
  Libc;
 {$ENDIF}

type

  (*
   * It might seem more natural for the EFIBError constructor to
   * include the Msg parameter first, and the ASQLCode second, but
   * to get this to work easily with C++-Builder, the parameter
   * order is switched.
   *)

     
  EFIBError                  = class(EDatabaseError)
  private
    FSQLCode: Long;
    FIBErrorCode: Long;
    SenderObj :TObject;
  public
    constructor Create(ASQLCode: Long; const aMsg: String;Sender:TObject);// virtual;
    property    SQLCode    : Long read FSQLCode ;
    property    IBErrorCode: Long read FIBErrorCode ;
  end;


  EFIBInterBaseError         = class(EFIBError);
  EFIBClientError            = class(EFIBError);



  TIBErrorMessage            = (ShowSQLCode,
                                ShowIBMessage,
                                ShowSQLMessage);
  TIBErrorMessages          = set of TIBErrorMessage;


  TFIBClientError            = (
                                feUnknownError,
                                feNotSupported,
                                feNotPermitted,
                                feFileAccessError,
                                feConnectionTimeout,
                                feCannotSetDatabase,
                                feCannotSetTransaction,
                                feOperationCancelled,
                                feDPBConstantNotSupported,
                                feDPBConstantUnknown,
                                feTPBConstantNotSupported,
                                feTPBConstantUnknown,
                                feDatabaseClosed,
                                feDatabaseOpen,
                                feDatabaseNameMissing,
                                feNotInTransaction,
                                feInTransaction,
                                feTimeoutNegative,
                                feNoDatabasesInTransaction,
                                feUpdateWrongDB,
                                feUpdateWrongTR,
                                feDatabaseNotAssigned,
                                feTransactionNotAssigned,
                                feXSQLDAIndexOutOfRange,
                                feXSQLDANameDoesNotExist,
                                feEOF,
                                feBOF,
                                feInvalidStatementHandle,
                                feDatasetOpen,
                                feDatasetClosed,
                                feUnknownSQLDataType,
                                feInvalidColumnIndex,
                                feInvalidParamColumnIndex,
                                feInvalidDataConversion,
                                feColumnIsNotNullable,
                                feBlobCannotBeRead,
                                feBlobCannotBeWritten,
                                feEmptyQuery,
                                feCannotOpenNonSQLSelect,
                                feNoFieldAccess,
                                feFieldReadOnly,
                                feFieldNotFound,
                                feNotInEditState,
                                feNotEditing,
                                feCannotInsert,
                                feCannotPost,
                                feCannotUpdate,
                                feCannotDelete,
                                feCannotRefresh,
                                feBufferNotSet,
                                feCircularReference,
                                feSQLParseError,
                                feUserAbort,
                                feDataSetUniDirectional,
                                feCannotCreateSharedResource,
                                feWindowsAPIError,
                                feColumnListsDontMatch,
                                feColumnTypesDontMatch,
                                feCantEndSharedTransaction,
                                // Added
                                feNotIsArrayField,
                                feWrongDimension,
                                feSQLDialectInvalid,
                                feIBMissing,
                                feIB60feature,
                                // Added by Serg Vostrikov
                                feInterBaseInstallMissing,
                                feServiceActive,
                                feServiceInActive,
                                feServerNameMissing,
                                feQueryParamsError,
                                feStartParamsError,
                                feOutputParsingError,
                                feUseSpecificProcedures,
                                feSPBConstantNotSupported,
                                feSPBConstantUnknown,
                                feFieldSizeMismatch
                                );

  TStatusVector              = array[0..19] of ISC_STATUS;
  PStatusVector              = ^TStatusVector;


  (* TFIBTLGlobals *)
  (* A single structure will be used to maintain all thread-local "globals".
    Right now, the only thread-local "global" is FStatusVector, although
    this can certainly change. *)

const
  {$I pFIBVersion.inc}

  (* For building buffers to send to IB *)
  CRLF = #13#10;
  FIBLocalBufferLength = 512;
  FIBBigLocalBufferLength = FIBLocalBufferLength * 2;
  FIBHugeLocalBufferLength = FIBBigLocalBufferLength * 20;
  (* Default "Prefix" to show in error messages. *)

  {$I FIB_MESSAGES.INC}

  DPBPrefix = 'isc_dpb_';
  DPBConstantNames: array[1..isc_dpb_last_dpb_constant] of String = (
    'cdd_pathname',
    'allocation',
    'journal',
    'page_size',
    'num_buffers',
    'buffer_length',
    'debug',
    'garbage_collect',
    'verify',
    'sweep',
    'enable_journal',
    'disable_journal',
    'dbkey_scope',
    'number_of_users',
    'trace',
    'no_garbage_collect',
    'damaged',
    'license',
    'sys_user_name',
    'encrypt_key',
    'activate_shadow',
    'sweep_interval',
    'delete_shadow',
    'force_write',
    'begin_log',
    'quit_log',
    'no_reserve',
    'user_name',
    'password',
    'password_enc',
    'sys_user_name_enc',
    'interp',
    'online_dump',
    'old_file_size',
    'old_num_files',
    'old_file',
    'old_start_page',
    'old_start_seqno',
    'old_start_file',
    'drop_walfile',
    'old_dump_id',
    'wal_backup_dir',
    'wal_chkptlen',
    'wal_numbufs',
    'wal_bufsize',
    'wal_grp_cmt_wait',
    'lc_messages',
    'lc_ctype',
    'cache_manager',
    'shutdown',
    'online',
    'shutdown_delay',
    'reserved',
    'overwrite',
    'sec_attach',
    'disable_wal',
    'connect_timeout',
    'dummy_packet_interval',
    'gbak_attach',
    'sql_role_name',
    'set_page_buffers',
    'working_directory',
    'sql_dialect',
    'set_db_readonly',
    'set_db_sql_dialect',
    'gfix_attach',
    'gstat_attach'
  );
  TPBPrefix = 'isc_tpb_';
  TPBConstantNames: array[1..isc_tpb_last_tpb_constant] of String = (
    'consistency',
    'concurrency',
    'shared',
    'protected',
    'exclusive',
    'wait',
    'nowait',
    'read',
    'write',
    'lock_read',
    'lock_write',
    'verb_time',
    'commit_time',
    'ignore_limbo',
    'read_committed',
    'autocommit',
    'rec_version',
    'no_rec_version',
    'restart_requests',
    'no_auto_undo'
  );
type
TpFIBLoginDialog=
 function (const ADatabaseName: string; var AUserName, APassword,ARoleName: string): Boolean;


const
  SQLDecimalSeparator='.';
var
  FIBCS: TRTLCriticalSection;
  hFIBTLGlobals: DWord;
  pFIBLoginDialog :TpFIBLoginDialog;

(* FIBAlloc acts like Realloc, except that it guarantees that
   the "newly" allocated memory is initialized to 0's *)
procedure FIBAlloc(var p; OldSize, NewSize: DWord);
(* Error message routines. *)
procedure FIBError(ErrMess: TFIBClientError; const Args: array of const);
procedure IBError(Sender:TObject);

procedure RegisterErrorHandler(aErrorHandler:TComponent);
procedure UnRegisterErrorHandler;
function ErrorHandlerRegistered:boolean;

(* Management of the thread-local TFIBTLGlobals structure. *)
//procedure InitializeFIBTLGlobals;
//procedure FreeFIBTLGlobals;
(* Manage the thread-local status vector *)
function StatusVector: PISC_STATUS;
function StatusVectorArray: PStatusVector;
function CheckStatusVector(ErrorCodes: array of ISC_STATUS): Boolean;
function StatusVectorAsText: String;

(* Generate a DPB *)
procedure GenerateDPB(sl: TStrings; var DPB: String; var DPBLength: Short);
procedure GenerateTPB(sl: TStrings; var TPB: String; var TPBLength: Short);
(* Manage global options *)
procedure SetIBErrorMessages(Value: TIBErrorMessages);
function GetIBErrorMessages: TIBErrorMessages;

implementation

uses pFIBErrorHandler,StdFuncs,StrUtil;

var
  IBErrorMessages: TIBErrorMessages;
  IBErrorHandler :TpFibErrorHandler;
  TPBConstants    :TStringList;
  DPBConstants    :TStringList;

threadvar
  FStatusVector : TStatusVector;
  
{$IFDEF LINUX}
Const
 libpthreadmodulename = 'libpthread.so.0';
type
  TKeyValueDestructor = procedure(ValueInKey: Pointer); cdecl;
function TlsGetValue(Key : Integer) : Pointer; cdecl;
  external libpthreadmodulename name 'pthread_getspecific';
function TlsSetValue(Key : Integer; Ptr : Pointer) : Integer; cdecl;
  external libpthreadmodulename name 'pthread_setspecific';
function pthread_key_create(var Key: DWord; KeyValueDestructor: TKeyValueDestructor): Integer; cdecl;
  external libpthreadmodulename name 'pthread_key_create';

function pthread_key_delete(Key: DWord): Integer; cdecl;
  external libpthreadmodulename name 'pthread_key_delete';

procedure FreeTLSBuffer(ValueInKey: Pointer); export cdecl;
begin
  // called upon destruction of each thread.  ValueInKey guaranteed non-nil
  free(ValueInKey);
end;

{$ENDIF}


procedure FIBAlloc(var p; OldSize, NewSize: DWord); 
begin
  if Pointer(p)=nil then
    GetMem(Pointer(p), NewSize)
  else
    ReallocMem(Pointer(P), NewSize);
  if NewSize>OldSize then
   FillChar((PChar(p)+OldSize)^,NewSize-OldSize,#0);
end;

/// ErrorHandler

procedure RegisterErrorHandler(aErrorHandler:TComponent);
begin
 if aErrorHandler is TpFibErrorHandler then
  IBErrorHandler:=TpFibErrorHandler(aErrorHandler)
end;

procedure UnRegisterErrorHandler;
begin
 IBErrorHandler:=nil
end;

function ErrorHandlerRegistered:boolean;
begin
 Result:= IBErrorHandler<>nil
end;
(*
 * FIBError -
 *  Given an error code and some possible string arguments, raise
 *  an exception.
 *)

procedure FIBError(ErrMess: TFIBClientError; const Args: array of const);
begin
(*
  raise EFIBClientError.Create(
          Ord(ErrMess),
          Format(FIBErrorMessages[ErrMess], Args),nil);
CHISLER *)           
end;


(*
 * IBError -
 *  Examine the status vector, and raise an
 *  exception based on the current values in it.
 *)
procedure IBError(Sender:TObject);
var
  sqlcode: Long;
  local_buffer: array[0..FIBHugeLocalBufferLength - 1] of char;
  usr_msg: String;
  status_vector: PISC_STATUS;
  IBErrorMessages: TIBErrorMessages;

  vEFIBInterBaseError                   : EFIBInterBaseError  ;
  vRaiseExcept :boolean;
begin
  (*
   * Initialize the working user message.
   * Get a local reference to the status vector.
   * Get a local copy of the IBErrorMessages options.
   * Get the SQL error code.
   *)
  usr_msg := '';
  status_vector := StatusVector;
  IBErrorMessages := GetIBErrorMessages;
  sqlcode := isc_sqlcode(status_vector);

  (*
   * Maybe show the SQL Code
   *)
  if (ShowSQLCode in IBErrorMessages) then
    usr_msg := usr_msg + 'SQLCODE: ' + IntToStr(sqlcode);
  (*
   * Maybe show the SQL Error message
   *)
  if (ShowSQLMessage in IBErrorMessages) then
  begin
    isc_sql_interprete(sqlcode, local_buffer, FIBLocalBufferLength);
    if (ShowSQLCode in IBErrorMessages) then
      usr_msg := usr_msg + CRLF;
    usr_msg := usr_msg + String(local_buffer);
    if (usr_msg[Length(usr_msg)] <> '.') then
      usr_msg := usr_msg + '.';
  end;
  (*
   * Maybe show the interbase error messages
   *)
  if (ShowIBMessage in IBErrorMessages) then
  begin
    if (ShowSQLCode in IBErrorMessages) or
       (ShowSQLMessage in IBErrorMessages) then
      usr_msg := usr_msg + CRLF;
    while (isc_interprete(local_buffer, @status_vector) > 0) do begin
      usr_msg := usr_msg + String(local_buffer);
      if (usr_msg[Length(usr_msg)] <> '.') then
        usr_msg := usr_msg + '.';
      usr_msg := usr_msg + CRLF;
    end;
  end;
  (*
   * Finally raise the exception
   *)
  vRaiseExcept:=true;
  vEFIBInterBaseError:=EFIBInterBaseError.Create(sqlcode, usr_msg,Sender);
  try
    if ErrorHandlerRegistered   then
     IBErrorHandler.DoOnErrorEvent(Sender,vEFIBInterBaseError,vRaiseExcept);
  except
   vEFIBInterBaseError.Free;
   raise;
  end;

  if vRaiseExcept then
   begin
   if ( sqlcode <> -508 ) then
    begin
//    ShowMessage('sqlcode=' + IntToStr(sqlcode));
    raise vEFIBInterBaseError //Chisler commented
    end
   end
  else
   vEFIBInterBaseError.Free;
end;



(* Return the status vector for the current thread *)

function StatusVector: PISC_STATUS;
begin
   Result := Pointer(@FStatusVector)
end;

function StatusVectorArray: PStatusVector;        
begin
  Result := @FStatusVector;
end;


function CheckStatusVector(ErrorCodes: array of ISC_STATUS): Boolean;
var
  p: PISC_STATUS;
  i: Integer;
  procedure NextP(i: Integer);
  begin
    p := PISC_STATUS(PChar(p) + (i * SizeOf(ISC_STATUS)));
  end;
begin
  p := StatusVector;
  Result := False;
  while (p^ <> 0) and (not Result) do
    case p^ of
      3: NextP(3);
      1, 4: begin
        NextP(1);
        i := 0;
        while (i <= High(ErrorCodes)) and (not Result) do begin
          Result := p^ = ErrorCodes[i];
          Inc(i);
        end;
        NextP(1);
      end;
      else
        NextP(2);
    end;
end;

function StatusVectorAsText: String;
var
  p: PISC_STATUS;
  function NextP(i: Integer): PISC_STATUS;
  begin
    p := PISC_STATUS(PChar(p) + (i * SizeOf(ISC_STATUS)));
    Result := p;
  end;
begin
  p := StatusVector;
  Result := '';
  while (p^ <> 0) do
    if (p^ = 3) then
    begin
      Result := Result + Format('%d %d %d', [p^, NextP(1)^, NextP(1)^]) + CRLF;
      NextP(1);
    end
    else
    begin
      Result := Result + Format('%d %d', [p^, NextP(1)^]) + CRLF;
      NextP(1);
    end;
end;

(* EFIBError *)
constructor EFIBError.Create(ASQLCode: Long; const aMsg: String;Sender:TObject);
var sn:string;
begin
  if (Sender<>nil) and (Sender is TComponent)
  then
   sn:=CmpFullName(TComponent(Sender))+':'+#13#10
  else
   sn:='';
  inherited Create(sn+aMsg);
  FSQLCode := ASQLCode;
  FIBErrorCode :=StatusVectorArray[1];
  SenderObj := Sender;
end;


(*
 * GenerateDPB -
 *  Given a string containing a textual representation
 *  of the database parameters, generate a database
 *  parameter buffer, and return it and its length
 *  in DPB and DPBLength, respectively.
 *)
procedure GenerateDPB(sl: TStrings; var DPB: String;
  var DPBLength: Short);
var
  i : integer;
  j, DPBVal:integer;
  param_name, param_value: String;
  pval: Integer;
begin
  (*
   * The DPB is initially empty, with the exception that
   * the DPB version must be the first byte of the string.
   *)
  DPBLength := 1;
  DPB := Char(isc_dpb_version1);
  (*
   * Iterate through the textual database parameters, constructing
   * a DPB on-the-fly.
   *)
  for i := 0 to sl.Count - 1 do begin
    (*
     * Get the parameter's name and value from the list,
     * and make sure that the name is all lowercase with
     * no leading 'isc_dpb_' prefix
     *)
    sl[i]:=Trim(sl[i]);
    if sl[i]='' then Continue;

    GetNameAndValue(sl[i],param_name,param_value);
    DoLowerCase(param_name);

    if (param_name[1]=DPBPrefix[1]) and (Pos(DPBPrefix, param_name) = 1) then
      Delete(param_name, 1, Length(DPBPrefix));
    (*
     * We want to translate the parameter name to some integer
     * value. We do this by scanning through a list of known
     * database parameter names (DPBConstantNames, defined above).
     *)
    if DPBConstants.Find(param_name,j) then
      DPBVal :=Integer(DPBConstants.Objects[j])
    else
      DPBVal := 0;

    (*
     * A database parameter either contains a string value (case 1)
     * or an integer value (case 2)
     * or no value at all (case 3)
     * or an error needs to be generated (case else)
     *)
    case DPBVal of
      isc_dpb_user_name, isc_dpb_password, isc_dpb_password_enc,
      isc_dpb_sys_user_name, isc_dpb_license, isc_dpb_encrypt_key,
      isc_dpb_lc_messages, isc_dpb_lc_ctype,
      isc_dpb_sql_role_name,isc_dpb_sql_dialect: begin
        if DPBVal = isc_dpb_sql_dialect then
          param_value[1] := Char(Ord(param_value[1]) - 48);

        DPB := DPB +
               Char(DPBVal) +
               Char(Length(param_value)) +
               param_value;
        Inc(DPBLength, 2 + Length(param_value));
      end;
      isc_dpb_num_buffers, isc_dpb_dbkey_scope, isc_dpb_force_write,
      isc_dpb_no_reserve, isc_dpb_damaged, isc_dpb_verify,
      isc_dpb_dummy_packet_interval, isc_dpb_connect_timeout
      : begin
        DPB := DPB +Char(DPBVal) +#1+Char(StrToInt(param_value));
        Inc(DPBLength, 3);
      end;
      isc_dpb_sweep: begin
        DPB := DPB +Char(DPBVal) +#1 +Char(isc_dpb_records);
        Inc(DPBLength, 3);
      end;
      isc_dpb_sweep_interval: begin
        pval := StrToInt(param_value);
        DPB := DPB +Char(DPBVal) +#4 +
               PChar(@pval)[0] +
               PChar(@pval)[1] +
               PChar(@pval)[2] +
               PChar(@pval)[3];
        Inc(DPBLength, 6);
      end;
      isc_dpb_activate_shadow, isc_dpb_delete_shadow, isc_dpb_begin_log,
      isc_dpb_quit_log: begin
        DPB := DPB +Char(DPBVal) +#1#0;
        Inc(DPBLength, 3);
      end;

      //
      isc_dpb_no_garbage_collect,isc_dpb_garbage_collect:
      begin
        DPB := DPB + Char(DPBVal) + #1#0;
        Inc(DPBLength, 3);
      end;
      else
      begin
        if (DPBVal > 0) and
           (DPBVal <= isc_dpb_last_dpb_constant) then
          FIBError(feDPBConstantNotSupported,
                   [DPBConstantNames[DPBVal]])
        else
          FIBError(feDPBConstantUnknown, [param_name]);
      end;
    end;
  end;
end;

(*
 * GenerateTPB -
 *  Given a string containing a textual representation
 *  of the transaction parameters, generate a transaction
 *  parameter buffer, and return it and its length in
 *  TPB and TPBLength, respectively.
 *)
procedure GenerateTPB(sl: TStrings; var TPB: String;
  var TPBLength: Short);
var
  i, j, TPBVal, ParamLength: Integer;
  param_name, param_value: String;
begin
  TPB := '';
  if (sl.Count = 0) then
    TPBLength := 0
  else
  begin
    TPBLength := sl.Count + 1;
    TPB := TPB + Char(isc_tpb_version3);
  end;
  for i := 0 to sl.Count - 1 do begin
    sl[i]:=Trim(sl[i]);
    if sl[i]='' then
    begin
     Dec(TPBLength);
     Continue;
    end;
    GetNameAndValue(sl[i],param_name,param_value);
    DoLowerCase(param_name);
    if (TPBPrefix[1] = param_name[1]) and (Pos(TPBPrefix, param_name) = 1) then
      Delete(param_name, 1, Length(TPBPrefix));
    if TPBConstants.Find(param_name,j) then
      TPBVal :=Integer(TPBConstants.Objects[j])
    else
      TPBVal := 0;
    (* Now act on it *)
    case TPBVal of
      isc_tpb_consistency, isc_tpb_exclusive, isc_tpb_protected,
      isc_tpb_concurrency, isc_tpb_shared, isc_tpb_wait, isc_tpb_nowait,
      isc_tpb_read, isc_tpb_write, isc_tpb_ignore_limbo,
      isc_tpb_read_committed, isc_tpb_rec_version, isc_tpb_no_rec_version:
        TPB := TPB + Char(TPBVal);
      isc_tpb_lock_read, isc_tpb_lock_write: begin
        TPB := TPB + Char(TPBVal);
        // Now set the string parameter
        ParamLength := Length(param_value);
        Inc(TPBLength, ParamLength + 1);
        TPB := TPB + Char(ParamLength) + param_value;
      end;
      else
      begin
        if (TPBVal > 0) and
           (TPBVal <= isc_tpb_last_tpb_constant) then
          FIBError(feTPBConstantNotSupported,
                   [TPBConstantNames[TPBVal]])
        else
          FIBError(feTPBConstantUnknown, [param_name]);
      end;
    end;
  end;
end;

procedure SetIBErrorMessages(Value: TIBErrorMessages);
begin
  EnterCriticalSection(FIBCS);
  try
    IBErrorMessages := Value;
  finally
    LeaveCriticalSection(FIBCS);
  end;
end;

function GetIBErrorMessages: TIBErrorMessages;
begin
  EnterCriticalSection(FIBCS);
  try
    Result := IBErrorMessages;
  finally
    LeaveCriticalSection(FIBCS);
  end;
end;

procedure InitTPBConstantsList;
var i:integer;
begin
  TPBConstants:= TStringList.Create;
  with TPBConstants do
  begin
   Capacity:=isc_tpb_last_tpb_constant;
   for i:=1 to isc_tpb_last_tpb_constant do
    AddObject(TPBConstantNames[i],TObject(i));
   Sorted:=true;
  end;
end;

procedure InitDPBConstantsList;
var i:integer;
begin
  DPBConstants:= TStringList.Create;
  with DPBConstants do
  begin
   Capacity:=isc_dpb_last_dpb_constant;
   for i:=1 to isc_dpb_last_dpb_constant do
    AddObject(DPBConstantNames[i],TObject(i));
   Sorted:=true;
  end;
end;


initialization
  IsMultiThread := True;
  InitializeCriticalSection(FIBCS);
  IBErrorMessages := [ShowSQLMessage, ShowIBMessage];
  InitTPBConstantsList;
  InitDPBConstantsList;
finalization
  FreeAndNil(TPBConstants);
  FreeAndNil(DPBConstants);  
  DeleteCriticalSection(FIBCS);
end.


