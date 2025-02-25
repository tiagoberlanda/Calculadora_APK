unit UnitFormHistorico;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts, FMX.ListBox, Data.DB, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  Data.Bind.Components, Data.Bind.DBScope, FMX.Memo.Types, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.Objects,
  FMX.StdCtrls;

type
  TFormHistorico = class(TForm)
    Memo1: TMemo;
    Image_C: TImage;
    Layout_superior: TLayout;
    Image_menu_historico: TImage;
    Label_Info: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Image_CClick(Sender: TObject);
    procedure Image_menu_historicoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormHistorico: TFormHistorico;

implementation

{$R *.fmx}

uses UDMDados, UnitCalculadora;

procedure TFormHistorico.FormShow(Sender: TObject);
begin
  Memo1.Lines.Clear;
  DMDados.Query_Listar_Dados.Close;
  DMDados.Query_Listar_Dados.Open;
  while not DMDados.Query_Listar_Dados.Eof do
    begin
      Memo1.Lines.Add('Valor1: ' + DMDados.Query_Listar_Dadosvalor1.AsString + #13 +
                      'Valor2: ' + DMDados.Query_Listar_Dadosvalor2.AsString + #13 +
                      'Opera��o: ' + DMDados.Query_Listar_Dadosoperacao.AsString + #13 +
                      'Resultado: ' + DMDados.Query_Listar_Dadosresultado.AsString + #13#13);
      DMDados.Query_Listar_Dados.Next;
    end;
end;

procedure TFormHistorico.Image_CClick(Sender: TObject);
begin
  Memo1.Lines.Clear;

  DMDados.Query_DML.Close;
  DMDados.Query_DML.SQL.Clear;
  DMDados.Query_DML.SQL.Add(' DELETE FROM HISTORICO ');
  DMDados.Query_DML.ExecSQL;
end;

procedure TFormHistorico.Image_menu_historicoClick(Sender: TObject);
begin
  FormHistorico.hide;
  FormCalculadora.show;
  FormCalculadora.Limpa_Tudo('');
end;

end.
