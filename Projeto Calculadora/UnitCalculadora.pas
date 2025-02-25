unit UnitCalculadora;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFormCalculadora = class(TForm)
    Image_menu: TImage;
    Layout_central: TLayout;
    Image_zero: TImage;
    Image_mais: TImage;
    Image_menos: TImage;
    Layout_superior: TLayout;
    Label_visor: TLabel;
    Image_oito: TImage;
    Image_nove: TImage;
    Image_sete: TImage;
    Image_seis: TImage;
    Image_cinco: TImage;
    Image_quatro: TImage;
    Image_um: TImage;
    Image_tres: TImage;
    Image_dois: TImage;
    Image_multiplica��o: TImage;
    Image_virgula: TImage;
    Image_barra: TImage;
    Image_igual: TImage;
    Image_apagar: TImage;
    Image_C: TImage;
    Layout_visor: TLayout;
    Image_porcentagem: TImage;
    Label_informacao: TLabel;
    Label_valor: TLabel;
    Layout_historico: TLayout;
    Layout_valores: TLayout;
    procedure Image_menuClick(Sender: TObject);
    procedure Image_noveClick(Sender: TObject);
    procedure Image_oitoClick(Sender: TObject);
    procedure Image_seteClick(Sender: TObject);
    procedure Image_seisClick(Sender: TObject);
    procedure Image_cincoClick(Sender: TObject);
    procedure Image_quatroClick(Sender: TObject);
    procedure Image_tresClick(Sender: TObject);
    procedure Image_doisClick(Sender: TObject);
    procedure Image_umClick(Sender: TObject);
    procedure Image_zeroClick(Sender: TObject);
    procedure Image_CClick(Sender: TObject);
    procedure Image_fechaparentesClick(Sender: TObject);
    procedure Image_porcentagemClick(Sender: TObject);
    procedure Image_menosClick(Sender: TObject);
    procedure Image_igualClick(Sender: TObject);
    procedure Image_maisClick(Sender: TObject);
    procedure Image_barraClick(Sender: TObject);
    procedure Image_multiplica��oClick(Sender: TObject);
    procedure Image_virgulaClick(Sender: TObject);
    procedure Image_apagarClick(Sender: TObject);

  private
    { Private declarations }
    procedure Escreve_Visor(valor: string);  //Mostra pro usu�rio qual n�mero foi selecionado
    procedure Escreve_Informacao(valor: string); //Mostra qual a opera��o est� sendo feita
    procedure Limpa_Visor(valor: string);  // Limpa as informa��es somente do visor
    procedure Escreve_valor1(valor: string;operacao: string); //Mostra na tela o primeiro n�mero digitado
    procedure Escreve_valor2(valor: string;resultado: string); //Mostra na tela o primeiro n�mero digitado

  public
    { Public declarations }
   procedure Limpa_Tudo(valor: string);  // Limpa todas as informa��es
  end;

var  //Vari�veis Necess�rias
  FormCalculadora: TFormCalculadora;
  valor1,valor2,resultado : Double;
  operacao : string;

implementation

{$R *.fmx}

uses UDMDados, UnitFormHistorico;

// Procedure para escrever os valores digitados no visor.
procedure TFormCalculadora.Escreve_Visor(valor: string);
begin
   Label_Visor.Text := Label_Visor.Text + valor;
end;

// Procedure para escrever no painel de informa��o qual � a opera��o selecionada.
procedure TFormCalculadora.Escreve_Informacao(valor: string);
begin
    if (valor = '/') then
    Label_informacao.Text := 'Opera��o: Divis�o (/)'
  else if (valor = '*') then
    Label_informacao.Text := 'Opera��o: Multiplica��o (*)'
  else if (valor = '+') then
    Label_informacao.Text := 'Opera��o: Soma (+)'
  else if (valor = '-') then
    Label_informacao.Text := 'Opera��o: Subtra��o (-)'
  else if (valor = '%') then
    Label_informacao.Text := 'Opera��o: Porcentagem (%)'
  else if (valor = 'n')then
    Label_informacao.Text := 'Digite um valor!'
  else
   Label_Visor.Text := Label_Visor.Text + valor;
end;


// Procedure para Limpar os valores digitados no visor.
procedure TFormCalculadora.Limpa_Visor(valor: string);
begin
   Label_Visor.Text := '';
end;


// Procedure para Limpar tudo.
procedure TFormCalculadora.Limpa_Tudo(valor: string);
begin

//  Limpa valor de texto dos componentes
   Label_Visor.Text := '';
   Label_informacao.Text := '';
   Label_valor.Text := '';
   operacao := '';
end;

// Procedure para escrever os valores digitados no visor de n�meros.
procedure TFormCalculadora.Escreve_Valor1(valor: string; operacao: string);
begin
   Label_valor.Text := valor + ' ' + operacao
end;

// Procedure para escrever os valores digitados no visor de n�meros.
procedure TFormCalculadora.Escreve_Valor2(valor: string; resultado: string);
begin
   Label_valor.Text := Label_valor.Text + ' ' + valor + ' = ' + resultado;
end;


procedure TFormCalculadora.Image_porcentagemClick(Sender: TObject);
begin
  //Verifica se foi clicado o bot�o tento j� informa��es na tela
  // Ou seja, segue com a conta
  if (Label_valor.Text <> '') and (Label_informacao.Text <> '') and
  (Label_visor.Text <> '')then
  begin
    operacao := '%';
    Image_igualClick(sender);
  end;
  //verificar se possui valor digitado
  if Label_valor.Text = '' then      //Se n�o tiver valor de opera��es
    if (Label_visor.Text <> '') then   //Verificar se tem valor no visor
    begin
      valor1 := Label_visor.Text.ToDouble;
      operacao := '%';
      Escreve_valor1(valor1.ToString(),operacao);
      Escreve_Informacao(operacao);
      Limpa_Visor('')
    end
    else
      Escreve_Informacao('n')
  else
    valor1 := resultado;
    operacao := '%';
    Escreve_Informacao(operacao);
    Escreve_valor1(valor1.ToString,operacao);
    Limpa_Visor('');
end;


procedure TFormCalculadora.Image_apagarClick(Sender: TObject);
begin
  Label_visor.Text := Copy(Label_visor.Text, 1, Length(Label_visor.Text)-1);
end;

procedure TFormCalculadora.Image_barraClick(Sender: TObject);
begin
  //Verifica se foi clicado o bot�o tento j� informa��es na tela
  // Ou seja, segue com a conta
  if (Label_valor.Text <> '') and (Label_informacao.Text <> '') and
  (Label_visor.Text <> '')then
  begin
    operacao := '/';
    Image_igualClick(sender);
  end;
  //verificar se possui valor digitado
  if Label_valor.Text = '' then      //Se n�o tiver valor de opera��es
    if (Label_visor.Text <> '') then   //Verificar se tem valor no visor
    begin
      valor1 := Label_visor.Text.ToDouble;
      operacao := '/';
      Escreve_valor1(valor1.ToString(),operacao);
      Escreve_Informacao(operacao);
      Limpa_Visor('')
    end
    else
      Escreve_Informacao('n')
  else
    valor1 := resultado;
    operacao := '/';
    Escreve_Informacao(operacao);
    Escreve_valor1(valor1.ToString,operacao);
    Limpa_Visor('');
end;

procedure TFormCalculadora.Image_CClick(Sender: TObject);
begin
  Limpa_Tudo('');
end;

procedure TFormCalculadora.Image_cincoClick(Sender: TObject);
begin
  Escreve_Visor('5');
end;

procedure TFormCalculadora.Image_doisClick(Sender: TObject);
begin
  Escreve_Visor('2')
end;

procedure TFormCalculadora.Image_fechaparentesClick(Sender: TObject);
begin
  Escreve_Visor(')')
end;

procedure TFormCalculadora.Image_igualClick(Sender: TObject);
begin
   //verificar se possui valor digitado
  if (Label_visor.Text  <> '') and (Label_Valor.Text <> '') and (operacao <> '') then
  begin
    valor2 := Label_visor.Text.ToDouble();  //pega o segundo valor digitado
    //verificar se a opera��o � de subtra��o
    if operacao = '-' then
    begin
     resultado := valor1 - valor2;
     Escreve_valor2(valor2.ToString(),resultado.ToString());
     Limpa_Visor(''); //limpa o visor
    end;

    //verificar se a opera��o � de adi��o
    if operacao = '+' then
      begin
      resultado := valor1 + valor2;
      Escreve_valor2(valor2.ToString(),resultado.ToString());
      Limpa_Visor('');
      end;

    // Verificar se a opera��o � Divis�o
    if operacao = '/' then
      begin
      resultado := valor1 / valor2;
      if (resultado.ToString() = 'INF') then    //Valida Divis�o por Zero
        Escreve_valor2(valor2.ToString(),'0')
      else
        Escreve_valor2(valor2.ToString(),resultado.ToString());
      Limpa_Visor('');
      end;

    //Verifica se a opera��o � Multiplica��o
    if operacao = '*' then
      begin
      resultado := (valor1 * valor2);
      Escreve_valor2(valor2.ToString(),resultado.ToString());
      Limpa_Visor('');
      end;

     //Verifica se a opera��o � Porcentagem
     if operacao = '%' then
     begin
      resultado := ((valor1 * valor2) / 100);
      Escreve_valor2(valor2.ToString(),resultado.ToString());
      Limpa_Visor('');
     end;

     //Insere Dados na Base de Dados
     DMDados.Query_DML.Close;
     DMDados.Query_DML.SQL.Clear;
     DMDados.Query_DML.SQL.Add(' INSERT INTO HISTORICO(VALOR1, VALOR2, OPERACAO, RESULTADO) ' +
                                 ' VALUES( :VALOR1, :VALOR2, :OPERACAO, :RESULTADO ) ');
     DMDados.Query_DML.Params.ParamByName('VALOR1').AsString := valor1.ToString;
     DMDados.Query_DML.Params.ParamByName('VALOR2').AsString := valor2.ToString;
     DMDados.Query_DML.Params.ParamByName('OPERACAO').AsString := operacao;
     DMDados.Query_DML.Params.ParamByName('RESULTADO').AsString := resultado.ToString;
     DMDados.Query_DML.ExecSQL;
  end
  else
    Escreve_Informacao('n');
    operacao := '';
end;

procedure TFormCalculadora.Image_maisClick(Sender: TObject);
begin
  //Verifica se foi clicado o bot�o tento j� informa��es na tela
  // Ou seja, segue com a conta
  if (Label_valor.Text <> '') and (Label_informacao.Text <> '') and
  (Label_visor.Text <> '')then
  begin
    operacao := '+';
    Image_igualClick(sender);
  end;

  //verificar se possui valor digitado
  if Label_valor.Text = '' then      //Se n�o tiver valor de opera��es
  begin
    if (Label_visor.Text <> '') then   //Verificar se tem valor no visor
    begin
      operacao := '+';
      valor1 := Label_visor.Text.ToDouble;
      Escreve_valor1(valor1.ToString(),operacao);
      Escreve_Informacao(operacao);
      Limpa_Visor('')
    end
    else
      Escreve_Informacao('n')
  end
  else
  begin
    operacao := '+';
    valor1 := resultado;
    Escreve_Informacao(operacao);
    Escreve_valor1(valor1.ToString(),operacao);
    Limpa_Visor('');
  end
end;

procedure TFormCalculadora.Image_menosClick(Sender: TObject);
begin
  //Verifica se foi clicado o bot�o tento j� informa��es na tela
  // Ou seja, segue com a conta
  if (Label_valor.Text <> '') and (Label_informacao.Text <> '') and
  (Label_visor.Text <> '')then
  begin
    operacao := '-';
    Image_igualClick(sender);
  end;
  //verificar se possui valor digitado
  if Label_valor.Text = '' then      //Se n�o tiver valor de opera��es
    if (Label_visor.Text <> '') then   //Verificar se tem valor no visor
    begin
      valor1 := Label_visor.Text.ToDouble;
      operacao := '-';
      Escreve_valor1(valor1.ToString(),operacao);
      Escreve_Informacao(operacao);
      Limpa_Visor('')
    end
    else
      Escreve_Informacao('n')
  else
    valor1 := resultado;
    operacao := '-';
    Escreve_Informacao(operacao);
    Escreve_valor1(valor1.ToString(),operacao);
    Limpa_Visor('');
end;

procedure TFormCalculadora.Image_menuClick(Sender: TObject);
begin
  FormCalculadora.hide;
  FormHistorico.Show;
end;

procedure TFormCalculadora.Image_multiplica��oClick(Sender: TObject);
begin
  //Verifica se foi clicado o bot�o tento j� informa��es na tela
  // Ou seja, segue com a conta
  if (Label_valor.Text <> '') and (Label_informacao.Text <> '') and
  (Label_visor.Text <> '')then
  begin
    operacao := '*';
    Image_igualClick(sender);
  end;
  //verificar se possui valor digitado
  if Label_valor.Text = '' then      //Se n�o tiver valor de opera��es
    if (Label_visor.Text <> '') then   //Verificar se tem valor no visor
    begin
      valor1 := Label_visor.Text.ToDouble;
      operacao := '*';
      Escreve_valor1(valor1.ToString(),operacao);
      Escreve_Informacao(operacao);
      Limpa_Visor('')
    end
    else
      Escreve_Informacao('n')
  else
    valor1 := resultado;
    operacao := '*';
    Escreve_Informacao(operacao);
    Escreve_valor1(valor1.ToString(),operacao);
    Limpa_Visor('');
end;

procedure TFormCalculadora.Image_noveClick(Sender: TObject);
begin
  Escreve_Visor('9')
end;

procedure TFormCalculadora.Image_oitoClick(Sender: TObject);
begin
  Escreve_Visor('8')
end;

procedure TFormCalculadora.Image_quatroClick(Sender: TObject);
begin
  Escreve_Visor('4')
end;

procedure TFormCalculadora.Image_seisClick(Sender: TObject);
begin
  Escreve_Visor('6')
end;

procedure TFormCalculadora.Image_seteClick(Sender: TObject);
begin
  Escreve_Visor('7')
end;

procedure TFormCalculadora.Image_tresClick(Sender: TObject);
begin
  Escreve_Visor('3')
end;

procedure TFormCalculadora.Image_umClick(Sender: TObject);
begin
  Escreve_Visor('1')
end;

procedure TFormCalculadora.Image_virgulaClick(Sender: TObject);
begin
  Escreve_Visor(',');
end;

procedure TFormCalculadora.Image_zeroClick(Sender: TObject);
begin
  Escreve_Visor('0')
end;

end.
