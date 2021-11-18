//************************************************
// �������� �������
// ������� ��������
//************************************************

unit AMyLib;

interface

uses

  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  ComCtrls, ExtCtrls, Menus;

const
  cr = #13#10;

procedure MesEr(const mes: string; log: Boolean = false); forward;
function MesYesNo(const title,mes: string; tip: boolean = true): boolean; forward;
procedure MesWarn(const mes: string);  forward;// ��������������
procedure MesOk(const mes: string);  forward;// ���������
function MesYesNoCancel(const title,mes: string): integer;

function DS(const d: TDateTime; fl: boolean = false):string; forward;  // ���� � ������
function DTS(const d: TDateTime):string; forward;

implementation

{------------------------------------------------------------------------------}
// ��� ������ � ��� ����
function GetPathPrg: string;
const
  sd = '\Debug\Win32';
  np = 'AKassa';
var
  j: integer;
begin
  result := ExtractFilePath(ParamStr(0));
  j := pos(sd,result); // ��� ������� ������� '\Debug\Win32';
  if (j>0) then
    delete(result,j,length(sd));
  if DirectoryExists(result+np) then  //����
    result := result+np+'\';
end;
{------------------------------------------------------------------------------}
function GetCompName: string;
var
  buffer: array[0..255] of char;
  size: dword;
begin
  Result := '';
  size := 256;
  if GetComputerName(buffer, size) then
    Result := buffer;
end;
{------------------------------------------------------------------------------}
// ���� � ������
function DS(const d: TDateTime; fl: boolean = false):string;  // ���� � ������
begin
  result := FormatDateTime('dd.mm.yyyy',d);
  if (fl) then
    result := QuotedStr(result);
end;
{------------------------------------------------------------------------------}
// ���� ����� � ������
function DTS(const d: TDateTime):string;
begin
  result := FormatDateTime('dd.mm.yyyy hh:nn',d);
end;
{------------------------------------------------------------------------------}
// ������� ��� � ����
procedure ALog(Text:string);
var
  F : TextFile;
  FN: String;
begin
  try
    try
      FN := GetPathPrg()+'AKassa_Log.txt';
      AssignFile(F, FN);
      if FileExists(FN) then
        Append(F)
      else
        Rewrite(F);
      WriteLn(F, '[',DTS(now),Format(' %10s',[GetCompName]),'] ',
                 StringReplace(text,cr,';',[rfReplaceAll]));
    finally
      CloseFile(F);
    end;
  except on E: Exception do
    begin
      mesEr('������ ������ � ���� ����: ' + FN + cr + E.Message);
    end;
  end;
end;
{--------------------- Rus2Lat ------------------------------------------------}
// �������������� ������� ����
function Rus2Lat(s:string):string;
const
  rus = '���������������������������������������������������������������߸�';
  lat = 'aAbBvVgGdDeEjJzZiIyYkKlLmMnNoOpPrRsStTuUfFhHcCcChHhH00wW00eEuUyYeE';
var
  i,p: integer;
begin
  result := '';
  for i:=1 to length(s) do
  begin
    p := pos(s[i],rus);
    if (p>0) then
      result := result+lat[p]
    else
      result := result+s[i];
  end;
end;

{--------------------- MesYesNoCancel ------------------------------------------------}
function MesYesNoCancel(const title,mes: string): integer;
// tip - ��������� ������ �� ��������� YES
begin
// IDYES IDNO IDCANCEL
  result := MessageBox(GetActiveWindow,PChar(mes), PChar(title),
      MB_YESNOCANCEL+MB_ICONQUESTION+MB_DEFBUTTON1);
end;
{--------------------- MesYesNo ------------------------------------------------}
function MesYesNo(const title,mes: string; tip: boolean = true): boolean;
// tip - ��������� ������ �� ��������� YES
begin

//MessageBox(0, '', '', MB_ICONSTOP or MB_OK or MB_DEFAULT_DESKTOP_ONLY);
  if tip then
    result := (MessageBox(GetActiveWindow,PChar(mes), PChar(title),
      MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1)=IDYES)
  else
    result := (MessageBox(GetActiveWindow,PChar(mes), PChar(title),
      MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2)=IDYES);
end;
{--------------------- MesYesNo1 ------------------------------------------------}
function MesYesNo1(const title,mes: string; tip: boolean = true): boolean;
// tip - ��������� ������ �� ��������� YES
begin

//MessageBox(0, '', '', MB_ICONSTOP or MB_OK or MB_DEFAULT_DESKTOP_ONLY);
  if tip then
    result := (Application.MessageBox(PChar(mes), PChar(title),
      MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1)=IDYES)
  else
    result := (Application.MessageBox(PChar(mes), PChar(title),
      MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2)=IDYES);
end;
{--------------------- MesEr --------------------------------------------------}
procedure MesEr(const mes: string; log: Boolean = false);  // ������
begin
  if log then
    ALog(mes);
  MessageBox(GetActiveWindow,PChar(mes), PChar('������'), MB_OK+MB_ICONERROR);
end;
{--------------------- MeWarn --------------------------------------------------}
procedure MesWarn(const mes: string); // ��������������
begin
//  MessageBox(GetActiveWindow,PChar(mes), PChar('��������'), MB_OK+MB_ICONWARNING);
  MessageBox(0,PChar(mes), PChar('��������'), MB_OK+MB_ICONWARNING);
end;
{--------------------- MeOk --------------------------------------------------}
procedure MesOk(const mes: string); // ���������
begin
//  MessageBox(GetActiveWindow,PChar(mes), PChar('���������'), MB_OK+MB_ICONINFORMATION);
  MessageBox(0,PChar(mes), PChar('���������'), MB_OK+MB_ICONINFORMATION);
end;


end.
