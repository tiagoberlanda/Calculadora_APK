unit UDMDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.Stan.Param,
  FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet, Datasnap.DBClient, Datasnap.Provider,
  System.IOUtils;

type
  TDMDados = class(TDataModule)
    FDConexao: TFDConnection;
    Query_Listar_Dados: TFDQuery;
    Query_Listar_Dadosidhistorico: TFDAutoIncField;
    Query_Listar_Dadosvalor1: TStringField;
    Query_Listar_Dadosvalor2: TStringField;
    Query_Listar_Dadosoperacao: TStringField;
    Query_Listar_Dadosresultado: TStringField;
    Query_DML: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMDados: TDMDados;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TDMDados.DataModuleCreate(Sender: TObject);
begin

  FDConexao.Params.Values['DriverID'] := 'SQLite';

  {$IFDEF MSWINDOWS}
  FDConexao.Params.Values['Database'] := System.SysUtils.GetCurrentDir + '\calculadora.db';
  {$ELSE}
  FDConexao.Params.Values['Database'] := TPath.Combine(TPath.GetDocumentsPath, 'calculadora.db');
  {$ENDIF}

  try
    FDConexao.Connected := true;
  except on e:exception do
    raise Exception.Create('Erro de conex�o com o banco de dados: ' + e.Message);
  end;
end;

end.
