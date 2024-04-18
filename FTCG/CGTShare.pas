unit CGTShare;

interface

const
  // ��������� ��������, ������������ elGetFlag
  ONE_COPY   = $1;   // ���� ����� ���������� � �������� SDK ����� �� ����(???)
  NO_DELETE  = $2;   // �� ��������� ���������
  IS_EXCLUZIV= $4;   // ���� ����� ���������� � �������� SDK � ����� ������(???)
  IS_EDIT    = $8;   // ���������� ���������� ��������������
  IS_CONTAIN = $10;  // ��������� ����� ��������� ���
  IS_BACK    = $20;  // ��� ��������� ������ ����������� �����( EditMulti )
  IS_MULTI   = $40;  // ������� ���������
  ADD_LAST   = $80;  // �������, ����������� �� ����� ���������( Splitter )
  IS_SELECT  = $100; // ��������� �������
  IS_PARENT  = $200; // �������� ��� ��������� ������� SDK
  IS_HIDE    = $400; // not build
  IS_LINK    = $800;
  PSTORE     = $1000; // ������������ ����� ��-��(not used)

  // ���� ����� ��������
  pt_Work  = 1;
  pt_Event = 2;
  pt_Var   = 3;
  pt_Data  = 4;

  // ���� ������
  data_null = 0;
  data_int  = 1;
  data_str  = 2;
  data_data = 3;
  data_combo= 4;
  data_list = 5;
  data_icon = 6;
  data_real = 7;
  data_color= 8;
  data_script = 9;
  data_stream = 10;
  data_bitmap = 11;
  data_wave = 12;
  data_array = 13;
  data_comboEx = 14;
  data_font   = 15;
  data_matr = 16;
  data_jpeg = 17;
  data_menu = 18;
  data_code = 19;
  data_element = 20;
  data_flags   = 21;

  data_object = 100;

  // ������ �������� (elGetClassIndex)
  CI_DPElement    = 1;
  CI_MultiElement = 2;
  CI_EditMulti    = 3;
  CI_EditMultiEx  = 4;
  CI_InlineCode   = 5;
  CI_DrawElement  = 6;
  CI_AS_Special   = 7;
  CI_DPLElement   = 8;
  CI_UseHiDLL     = 9;
  CI_WinElement   = 10;
  CI_PointHint    = 11;
  CI_PointElement = 12;
  CI_LineBreak    = 13;
  CI_LineBreakEx  = 14;
  CI_UserElement  = 15;
  CI_Translate    = 16;
  CI_PolyMulti    = 17;
  CI_DocumentTemplate = 18;

  // ����� ����� ��-�� ��������
  DataNames:array[0..20]of string =
   (
     'NULL',
     'Integer',
     'String',
     'Data',
     '', //Combo
     'StrList', //data_list
     'Icon',
     'Real',
     'Color',
     '', //data_script = 9;
     'Stream',
     'Bitmap',
     'Wave',
     '', //data_array = 13;
     '', //combo Ex
     '', // font
     '', // matrix
     '', //jpeg
     'Menu', //menu
     'Code',
     'LinkElement'
   );

  // ������� ���������� �����
  PARAM_CODE_PATH         = 0;
  PARAM_DEBUG_MODE        = 1;
  PARAM_DEBUG_SERVER_PORT = 2;
  PARAM_DEBUG_CLIENT_PORT = 3;
  PARAM_PROJECT_PATH      = 4;
  PARAM_HIASM_VERSION     = 5;
  PARAM_USER_NAME         = 6;
  PARAM_USER_MAIL         = 7;
  PARAM_PROJECT_NAME      = 8;
  PARAM_SDE_WIDTH         = 9;
  PARAM_SDE_HEIGHT        = 10;
  PARAM_COMPILER          = 11;

  // ������ ��� ������ � ����������� ��������������
  CG_SUCCESS         = 0;
  CG_NOT_FOUND       = 1;  // ������������� �� ������
  CG_INVALID_VERSION = 2;  // ��� ������ HiAsm ������� ����� ������� ������ ��������������
  CG_ENTRY_POINT_NF  = 3;  // ����� ����� � ������������� �� �������
  // ������ ��� ���������� �������
  CG_BUILD_FAILED    = 10; // ����� ������ ��� ������ �������
  // ������ �� ����� ��������� ���������� ����������
  CG_APP_NOT_FOUND   = 20; // ��������� ���������� �� ������

  // ��������� �������
  CGMP_COMPRESSED    = $01; // ������������ ������
  CGMP_RUN           = $02; // ������������ ������ �� �����
  CGMP_RUN_DEBUG     = $04; // ������������ ������ �� ����� � ���������� ������
  CGMP_FORM_EDIT     = $08; // ������� �������� ����

  id_empty = nil;

type
  // ����, ������������ � ����������
  id_sdk = pointer;
  id_element = pointer;
  id_point = pointer;
  id_prop = pointer;
  id_array = pointer;
  id_data = pointer;
  id_font = pointer;
  id_proplist = pointer;

type
  // CodeGen types and entry point interfaces
 PCodeGenTools = ^TCodeGenTools;
  THiAsmVersion = record
    major:word;
    minor:word;
    build:word;
  end;
  TBuildPrepareRec = record
     // none
  end;
  TBuildProcessRec = record
     cgt:PCodeGenTools;
     sdk:id_sdk;
     result:pointer;
  end;
  TBuildMakePrjRec = record
     result:pointer;
     prjFilename:PChar;
  end;
  TBuildCompliteRec = record
     prjFilename:PChar;
     appFilename:PChar;
  end;
  TBuildParams = record
     flags:cardinal;
  end;
  TBuildRunRec = record
     FileName:PChar;
     Mode:integer;
     ServerPort,ClientPort:integer;
     data:pointer;
  end;

 TCodeGenTools = object
   //~~~~~~~~~~~~~~~~~~~~~~~~ SDK ~~~~~~~~~~~~~~~~~~~~~~~~~~
   sdkGetCount:function (SDK:id_sdk):integer; cdecl;
   //���������� ���������� ��������� � �����
   sdkGetElement:function (SDK:id_sdk; Index:integer ):id_element; cdecl;
   //���������� ����� �������� �� ��� Z-����������(�������)
   sdkGetElementName:function (SDK:id_sdk; Name:PChar ):id_element; cdecl;
   //���������� ����� �������� �� ����� ��� ������

   //~~~~~~~~~~~~~~~~~~~~~~~~ Element ~~~~~~~~~~~~~~~~~~~~~~~~~~
   elGetFlag:function (e:id_element):cardinal; cdecl;
   //���������� "������" ����������� �������� �� ��� ������
   elGetPropCount:function (e:id_element):cardinal; cdecl;
   //���������� ���-�� ��-� ��������
   elGetProperty:function (e:id_element; Index:integer):id_prop; cdecl;
   //���������� ����� ��������� ��� ����������� ��-�� � ���������� ������� �� INI
   elIsDefProp:function (e:id_element; Index:integer):boolean; cdecl;
   //���������� True, ���� �������� ��-�� ��������� � �������� � INI �����, ����� False
   elSetCodeName:function (e:id_element; Name:pchar):cardinal; cdecl;
   //���� �������� ���� �������(����������) ���
   elGetCodeName:function (e:id_element):PChar; cdecl;
   //� �������� ��� ������� (���� ������)
   elGetClassName:function (e:id_element):PChar; cdecl;
   //� ��� ��� ������ �� �� ������ - ����� ������ ������
   elGetInfSub:function (e:id_element):PChar; cdecl;
   //������ ���������� ���� Sub �� INI-����� ��������
   elGetPtCount:function (e:id_element):cardinal; cdecl;
   //�������� ���������� ����� � ��������
   elGetPt:function (e:id_element; i:integer):id_point; cdecl;
   //�������� ����� ����� �� � �������
   elGetPtName:function (e:id_element; Name:PChar):id_point; cdecl;
   //�������� ����� ����� �� � �����
   elGetClassIndex:function (e:id_element):byte; cdecl;
   //�������� �������� ��������(��������� ���� CI_���)
   elGetSDK:function (e:id_element):id_sdk; cdecl;
   //�������� ����� ���������� ����� ��� ����������� � ����� ��������(id_element) ��� ��������� ����������
   elLinkIs:function (e:id_element):boolean; cdecl;
   //���������� True, ���� ������ ������� �������� ������� ���� �� ���� ���������
   elLinkMain:function (e:id_element):id_element; cdecl;
   //���������� ����� �������� ��������(���, �� ������� ��������� ������)
   elGetPos:procedure (e:id_element; var X,Y:integer); cdecl;
   //���������� ������� �������� � ��������� ����
   elGetSize:procedure (e:id_element; var W,H:integer); cdecl;
   //���������� ������� �������� � ��������� ����
   elGetEID:function (e:id_element):integer; cdecl;

   //~~~~~~~~~~~~~~~~~~~~~~~~ Point ~~~~~~~~~~~~~~~~~~~~~~~~~~
   ptGetLinkPoint:function (p:id_point):id_point; cdecl;
   //���������� ����� �����, � ������� ��������� ������
   ptGetRLinkPoint:function (p:id_point):id_point; cdecl;
   //���������� ����� �����, � ������� ��������� ������ ��� ����� ����� ������� � �����
   ptGetType:function (p:id_point):cardinal; cdecl;
   //���������� ��� �����(��������� pt_XXX)
   ptGetName:function (p:id_point):pchar; cdecl;
   //���������� ��� �����
   ptGetParent:function (p:id_point):id_element; cdecl;
   //���������� ����� ��������, �������� ����������� �����
   ptGetIndex:function (p:id_point):cardinal; cdecl;
   //���������� ������������� ������ ����� �� �������������� � ����� �� 4� �����
   pt_dpeGetName:function (p:id_point):PChar; cdecl;
   //���������� ������� ����� ����� ������������ �����(��� CI_DPElement)

   //~~~~~~~~~~~~~~~~~~~~~~~~ Property ~~~~~~~~~~~~~~~~~~~~~~~~~~
   propGetType:function (prop:id_prop):integer; cdecl;
   //���������� ��� ���������
   propGetName:function (prop:id_prop):PChar; cdecl;
   //���������� ��� ���������
   propGetValue:function (prop:id_prop):pointer; cdecl;
   //���������� �������� ���������
   propToByte:function (prop:id_prop):byte; cdecl;
   //
   propToInteger:function (prop:id_prop):integer; cdecl;
   //
   propToReal:function (prop:id_prop):real; cdecl;
   //
   propToString:function (prop:id_prop):PChar; cdecl;
   //

   //~~~~~~~~~~~~~~~~~~~~~~~~ Res ~~~~~~~~~~~~~~~~~~~~~~~~~~
   resAddFile:function (Name:pchar):cardinal; cdecl;
   //��������� ��� ����� � ����� ������ ��������� ������ ��� ������������ ��������
   resAddIcon:function (P:id_prop):PChar; cdecl;
   //��������� ������ � ������� � � ������ ��������� ������
   resAddStr:function (P:PChar):PChar; cdecl;
   //��������� ������ � ������� � � ������ ��������� ������
   resAddStream:function (P:id_prop):PChar; cdecl;
   //��������� ����� � ������� � � ������ ��������� ������
   resAddWave:function (P:id_prop):PChar; cdecl;
   //��������� ���� � ������� � � ������ ��������� ������
   resAddBitmap:function (P:id_prop):PChar; cdecl;
   //��������� �������� � ������� � � ������ ��������� ������
   resAddMenu:function (P:id_prop):PChar; cdecl;
   //��������� ���� � ������� � � ������ ��������� ������

   //~~~~~~~~~~~~~~~~~~~~~~~~ Other ~~~~~~~~~~~~~~~~~~~~~~~~~~
   _Debug:function (Text:PChar; Color:cardinal):cardinal; cdecl;
   //������� ������ Text � ���� ������� ������ Color
   GetParam:function(index:word; value:pointer):cardinal; cdecl;
   //���������� �������� ��������� ����� �� ��� �������

   //~~~~~~~~~~~~~~~~~~~~~~~~ Arrays ~~~~~~~~~~~~~~~~~~~~~~~~~~
   arrCount:function (a:id_array):integer; cdecl;
   //���������� ���-�� ��������� � ������� �
   arrType:function (a:id_array):integer; cdecl;
   //���������� ��� ��������� � ������� �
   arrItemName:function (a:id_array; Index:integer):PChar; cdecl;
   //���������� ��� �������� � �������� Index
   arrItemData:function (a:id_array; Index:integer):pointer; cdecl;
   //���������� �������� �������� � �������� Index
   arrGetItem:function (a:id_array; Index:integer):id_prop; cdecl;
   //
   isDebug:function (e:id_sdk):longbool; cdecl;

   //~~~~~~~~~~~~~~~~~~~~~~~~ Data ~~~~~~~~~~~~~~~~~~~~~~~~~~
   dtType:function (d:id_data):byte; cdecl;
   dtStr:function (d:id_data):PChar; cdecl;
   dtInt:function (d:id_data):integer; cdecl;
   dtReal:function (d:id_data):real; cdecl;

   //~~~~~~~~~~~~~~~~~~~~~~~~ Font ~~~~~~~~~~~~~~~~~~~~~~~~~~
   fntName:function (f:id_font):PChar; cdecl;
   fntSize:function (f:id_font):integer; cdecl;
   fntStyle:function (f:id_font):byte; cdecl;
   fntColor:function (f:id_font):cardinal; cdecl;
   fntCharSet:function (f:id_font):byte; cdecl;

   //~~~~~~~~~~~~~~~~~~~~~~~~ Element ~~~~~~~~~~~~~~~~~~~~~~~~~~
   elGetData:function (e:id_element):pointer; cdecl;
   // �������� ���������������� ������ ��������
   elSetData:procedure (e:id_element; data:pointer); cdecl;
   // ������������� ���������������� ������ ��������

   //~~~~~~~~~~~~~~~~~~~~~~~~ Point ~~~~~~~~~~~~~~~~~~~~~~~~~~
   ptGetDataType:function (p:id_point):integer; cdecl;
   // ���������� ��� ������ �����

   //~~~~~~~~~~~~~~~~~~~~~~~~ Element ~~~~~~~~~~~~~~~~~~~~~~~~~~
   elGetParent:function (e:id_element):id_sdk; cdecl;
   // ���������� ��������
   elGetPropertyListCount:function (e:id_element):cardinal; cdecl;
   // ���������� ���������� ��������� � ������ ��-��(�� ������ ��-��)
   elGetPropertyListItem:function (e:id_element; i:integer):id_proplist; cdecl;
   // ���������� ������� ������ ��-��

   //~~~~~~~~~~~~~~~~~~~~~~~~ PropertyList ~~~~~~~~~~~~~~~~~~~~~~~~~~
   plGetName:function (p:id_proplist):PChar; cdecl;
   // ���������� ��� ��-��
   plGetInfo:function (p:id_proplist):PChar; cdecl;
   // ���������� �������� ��-��
   plGetGroup:function (p:id_proplist):PChar; cdecl;
   // ���������� ������ ��-��
   plGetProperty:function (p:id_proplist):id_prop; cdecl;
   // ���������� �������� ��-��
   plGetOwner:function (p:id_proplist):id_element; cdecl;
   // ���������� ������������ ������� ������ ��-��

   //~~~~~~~~~~~~~~~~~~~~~~~~ Point ~~~~~~~~~~~~~~~~~~~~~~~~~~
   ptGetInfo:function (p:id_point):PChar; cdecl;
   // ���������� �������� �����

   //~~~~~~~~~~~~~~~~~~~~~~~~ Property ~~~~~~~~~~~~~~~~~~~~~~~~~~
   propGetLinkedElement:function(e:id_element; propName:PChar):id_element; cdecl;
   // ���������� id ��������, ��������������� � ���������� ��-��
   propIsTranslate:function (e:id_element; p:id_prop):integer; cdecl;
   // ���������� 1 ���� ��-�� �������� �� �������

   propGetLinkedElementInfo:function(e:id_element; prop:id_prop; _int:PChar):id_element; cdecl;

   //~~~~~~~~~~~~~~~~~~~~~~~~ Element ~~~~~~~~~~~~~~~~~~~~~~~~~~
   elGetSDKByIndex:function (e:id_element; index:integer):id_sdk; cdecl;
   // ���������� SDK ������������ ���������� �� ��� �������
   elGetSDKCount:function (e:id_element):integer; cdecl;
   // ���������� ���������� ���������� ������������ ����������
   elGetSDKName:function (e:id_element; index:integer):PChar; cdecl;

   //~~~~~~~~~~~~~~~~~~~~~~~~ SDK ~~~~~~~~~~~~~~~~~~~~~~~~~~
   sdkGetParent:function (SDK:id_sdk):id_element; cdecl;
   // ���������� ������� �������� ��� ������� SDK
   
   //~~~~~~~~~~~~~~~~~~~~~~~~ Element ~~~~~~~~~~~~~~~~~~~~~~~~~~
   elGetInterface:function (e:id_element):PChar; cdecl;
   // ���������� ����������, ��������������� ���������
   elGetInherit:function (e:cardinal):PChar; cdecl;
   // ���������� ������, �� ������� ����������� �������

   //~~~~~~~~~~~~~~~~~~~~~~~~ Resource ~~~~~~~~~~~~~~~~~~~~~~~~~~
   resEmpty:function:integer; cdecl;
   // ���������� 1 ���� ������ �������� ����, � 0 � ��������� ������
   resSetPref:function(pref:PChar):integer; cdecl;
   // ������������� ������� ��� ���� ��������

   //~~~~~~~~~~~~~~~~~~~~~~~~ SDE ~~~~~~~~~~~~~~~~~~~~~~~~~~
   _Error:function (Line:integer; e:id_element; Text:PChar):cardinal; cdecl;
   // ��������� ���������� � ������ ������

   //~~~~~~~~~~~~~~~~~~~~~~~~ Element ~~~~~~~~~~~~~~~~~~~~~~~~~~
   elGetGroup:function (e:id_element):integer; cdecl;
   // ���������� ID ������, � ������� ����������� ������� � 0 ���� ������ �����������

   //~~~~~~~~~~~~~~~~~~~~~~~~ Property ~~~~~~~~~~~~~~~~~~~~~~~~~~
   propSaveToFile:function (p:id_prop; fileName:PChar):integer; cdecl;

   //~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   // ���������������� �-���, �� �������� � ���������
   function ReadIntParam(Index:word):integer;
   function ReadStrParam(Index:word):string;
   function ReadCodeDir(e:id_element):string;
 end;

  TSynParams = record
    elName:PChar;     // ��� �������� ��������
    objName:PChar;    // ��� �������
    inst_list:PChar;  // ������ ������� � ����� ��� ������� � ��������
    disp_list:PChar;  // ������, ������������ �� ������������ ���������
  end;

  THintParams = record
    point:id_point;
    sdk:id_sdk;
    cgt:PCodeGenTools;
    hint:PChar;
  end;

procedure Replace(var Str:string;const substr,dest:string );
function PosEx(const SubStr, S: string; Offset: Cardinal = 1): Integer;
function GetTok(var s:string; const c:char):string;

implementation

function TCodeGenTools.ReadIntParam(Index:word):integer;
begin
   GetParam(Index, @Result);
end;

var buf:array[0..255] of char;

function TCodeGenTools.ReadStrParam(Index:word):string;
begin
    GetParam(Index, @buf);
    Result := PChar(@buf);
end;

function TCodeGenTools.ReadCodeDir(e:id_element):string;
var
    path:array[0..256] of char;
begin
   pointer(pointer(@path)^) := e;
   GetParam(PARAM_CODE_PATH, @path);
   Result := PChar(path);
end;

function PosEx(const SubStr, S: string; Offset: Cardinal = 1): Integer;
var
  I,X: Integer;
  Len, LenSubStr: Integer;
begin
  if Offset = 1 then
    Result := Pos(SubStr, S)
  else begin
    I := Offset;
    LenSubStr := Length(SubStr);
    Len := Length(S) - LenSubStr + 1;
    while I <= Len do begin
      if S[I] = SubStr[1] then
      begin
        X := 1;
        while (X < LenSubStr) and (S[I + X] = SubStr[X + 1]) do
          Inc(X);
        if (X = LenSubStr) then begin
          Result := I;
          exit;
        end;
      end;
      Inc(I);
    end;
    Result := 0;
  end;
end;


procedure Replace(var Str:string;const substr,dest:string );
var p:integer;
begin
  p := Pos(substr,str);
  while p > 0 do begin
    Delete(str,p,length(substr));
    Insert(dest,Str,p);
    p := PosEx(substr,str,p + Length(dest));
  end;
end;

function GetTok(var s:string; const c:char):string;
var p:integer;
begin
  p := Pos(c,s);
  if p > 0 then begin
    Result := Copy(s,1,p-1);
    if p = Length(s) then
      s := ''
    else Delete(s,1,p);
  end else Result := s;
end;

end.
