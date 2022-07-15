object DMDados: TDMDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 391
  Width = 782
  object FDConexao: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\berla\Desktop\Desenvolvimento\Delphi\Projeto C' +
        'alculadora\Win32\Debug\calculadora.db'
      'OpenMode=ReadWrite'
      'LockingMode=Normal'
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 48
    Top = 24
  end
  object Query_Listar_Dados: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      'select *'
      'from historico')
    Left = 161
    Top = 24
    object Query_Listar_Dadosidhistorico: TFDAutoIncField
      FieldName = 'idhistorico'
      Origin = 'idhistorico'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object Query_Listar_Dadosvalor1: TStringField
      FieldName = 'valor1'
      Origin = 'valor1'
      Size = 50
    end
    object Query_Listar_Dadosvalor2: TStringField
      FieldName = 'valor2'
      Origin = 'valor2'
      Size = 50
    end
    object Query_Listar_Dadosoperacao: TStringField
      FieldName = 'operacao'
      Origin = 'operacao'
    end
    object Query_Listar_Dadosresultado: TStringField
      FieldName = 'resultado'
      Origin = 'resultado'
      Size = 50
    end
  end
  object Query_DML: TFDQuery
    Connection = FDConexao
    SQL.Strings = (
      '')
    Left = 321
    Top = 24
  end
end
