import pyodbc

cnxn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};'
                      'SERVER=34.136.62.4;'
                      'DATABASE=desafio_SQL;'
                      'UID=sqlserver;'
                      'PWD=b0u9t9p12;')

cursor = cnxn.cursor() # gerenciador de comandos do banco
cursor.execute('SELECT * FROM CONTATO;')

for i in cursor.fetchall():
    print('ID: ',i[0])
    print('Telefone: ',i[1])
    print('E-mail: ',i[2],'\n')
