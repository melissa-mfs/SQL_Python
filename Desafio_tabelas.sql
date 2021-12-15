--TABELAS SEM FK
CREATE TABLE "BANCO"
(
	COD_BANCO INT,
	NOME CHAR(30) NOT NULL,
	CONSTRAINT PK_BANCO PRIMARY KEY (COD_BANCO)
);

CREATE TABLE "CONTATO"
(
	ID_CONTATO INT,
	TELEFONE CHAR(9) NULL,
	EMAIL CHAR(30) NULL,
	CONSTRAINT PK_CONTATO PRIMARY KEY (ID_CONTATO)
);

CREATE TABLE "EMPREENDIMENTOS"
(
	MATRICULA CHAR(10),
	NOME CHAR(30) NOT NULL,
	RUA CHAR(40) NOT NULL,
	BAIRRO CHAR(40) NOT NULL,
	CIDADE CHAR(30) NOT NULL,
	ESTADO CHAR(3) NOT NULL,
	CONSTRAINT PK_EMPRE PRIMARY KEY (MATRICULA)
);

--TABELAS COM FK
CREATE TABLE "DADOS_BANCARIOS"
(
	N_CONTA CHAR(9),
	TIPO CHAR(8) NOT NULL,
	BANCO INT NOT NULL,
	CONSTRAINT PK_DBANCO PRIMARY KEY (N_CONTA),
	CONSTRAINT FK_BANCO FOREIGN KEY(BANCO)
	REFERENCES BANCO(COD_BANCO)
);

CREATE TABLE "CLIENTE"
(
	CPF CHAR(11),
	RG CHAR(9) NOT NULL,
	NOME CHAR(45) NOT NULL,
	DATA_NASC DATE NOT NULL,
	NACIONALIDADE CHAR(15) NOT NULL,
	EST_CIVIL CHAR(10) NOT NULL,
	CONTATO INT,
	D_BANCARIOS CHAR(9),
	PROFISSAO CHAR(25) NOT NULL,
	ESTADO CHAR(3) NOT NULL,
	CIDADE CHAR(25) NOT NULL,
	ENDERECO CHAR(45) NOT NULL,
	CONSTRAINT PK_FISICA PRIMARY KEY (CPF),
	CONSTRAINT FK_C_CONTATO FOREIGN KEY (CONTATO)
	REFERENCES CONTATO(ID_CONTATO),
	CONSTRAINT FK_C_DBANCARIOS FOREIGN KEY (D_BANCARIOS)
	REFERENCES DADOS_BANCARIOS(N_CONTA)
);

CREATE TABLE "AGENTE_VENDAS"
(
	CNPJ CHAR(15),
	CPF CHAR(11) NULL,
	EMPRESA CHAR(45) NOT NULL,
	NOME CHAR(45) NOT NULL,
	CONTATO INT,
	D_BANCARIOS CHAR(9),
	PROFISSAO CHAR(25) NOT NULL,
	ESTADO CHAR(4) NOT NULL,
	CIDADE CHAR(25) NOT NULL,
	ENDERECO CHAR(45) NOT NULL, 
	CONSTRAINT PK_JURIDICA PRIMARY KEY (CNPJ),
	CONSTRAINT FK_AV_CONTATO FOREIGN KEY (CONTATO)
	REFERENCES CONTATO(ID_CONTATO),
	CONSTRAINT FK_AV_DBANCARIOS FOREIGN KEY (D_BANCARIOS)
	REFERENCES DADOS_BANCARIOS(N_CONTA)
);

CREATE TABLE "VENDA"
(
	COD_CLI CHAR(11),
	MATRICULA CHAR(10),
	COD_AGE CHAR(15),
	DATA_VENDA DATE NOT NULL,
	VALOR DECIMAL(19,2) NOT NULL,
	CONSTRAINT PK_VENDA PRIMARY KEY (COD_CLI, MATRICULA),
	CONSTRAINT FK_CLIENTE FOREIGN KEY (COD_CLI)
	REFERENCES CLIENTE(CPF),
	CONSTRAINT FK_EMPRE FOREIGN KEY (MATRICULA)
	REFERENCES EMPREENDIMENTOS(MATRICULA),
	CONSTRAINT FK_A_VENDAS FOREIGN KEY (COD_AGE)
	REFERENCES AGENTE_VENDAS(CNPJ)
);

--inserindo valores
INSERT INTO BANCO VALUES
--	(COD_BANCO, NOME)
	('001', 'Banco do Brasil S.A'),
	('033', 'Banco Santander (Brasil) S.A'),
	('104', 'Caixa Econ�mica Federal'),
	('237', 'Banco Bradesco S.A'),
	('341', 'Banco Ita� S.A'),
	('260', 'Nu Pagamentos S.A');

INSERT INTO CONTATO VALUES
--	(ID_CONTATO, TELEFONE, EMAIL)
	('001', '999990001', 'AV.DS@GMAIL.COM'),
	('002', '999990002', NULL),
	('003', '999990003', 'AV.DS@HOTMAIL.COM'),
	('004', NULL, 'DS@GMAIL.COM'),
	('005', NULL, 'DS@HOTMAIL.COM'),
	('006', NULL, 'DS@LIVE.COM'),
	('007', '999990007', NULL),
	('008', NULL, 'DS@DS.COM'),
	('009', '999990009', 'AV.DS@TENDA.COM'),
	('010', '999990010', NULL),
	('011', '999990011', NULL),
	('012', '999990012', NULL),
	('013', '999990013', NULL);

INSERT INTO EMPREENDIMENTOS VALUES 
--	(COD_EMPRE, NOME, RUA, BAIRRO, CIDADE, ESTADO)
	('0001', 'Viva Barra Funda', 'Rua do Bosque', 'Barra Funda', 'S�o Paulo', 'SP'),
	('0002', 'Reserva Amantikir', 'Rua Turvolandia', 'Bonsucesso', 'Guarulhos', 'SP'),
	('0003', 'Cama�ari Park', 'Avenida Jorge Amado', 'Jardim Limoeiro','Cama�ari', 'BA'),
	('0004', 'Recanto da Lagoa', 'R Dirceu D Braga', 'Trevo', 'Belo Horizonte', 'MG'),
	('0005', 'Vila Ravena', 'Rua Mitsuharu Matsushita', 'Ch�cara Est�ncia Paulista', 'Suzano', 'SP'),
	('0006', 'Residencial Vila Florida', 'AVENIDA MARIO FONSECA VIANA', 'ANGICOS', 'VESPASIANO', 'MG'),
	('0007', 'Costa Portuguesa', 'Rua da B�lgica', 'Abrantes','Cama�ari', 'BA'),
	('0008', 'Alegria', 'Rua Rom�nia', 'Parque Marechal Rondon', 'Cachoeirinha', 'RS'),
	('0009', 'Viva Sapopemba', 'Rua Clenio Wanderley', 'Fazenda da Juta', 'S�o Paulo', 'SP'),
	('0010', 'Alto S�o Francisco', 'Rua Inoc�ncio de Oliveira Alves', 'Rubem Berta', 'Porto Alegre', 'RS'),
	('0011', 'Vivere', 'Pra�a Amianto Capital', 'Guaianases', 'S�o Paulo', 'SP'),
	('0012', 'Reserva dos Eucaliptos II', 'Rua Ant�nio Louren�o Rosa', 'Mato Grande', 'Canoas', 'RS'),
	('0013', 'Reserva do Conde', 'Rua Professor Moura Bastos', 'Iapi','Salvador', 'BA'),
	('0014', 'Brisas Salvador Norte', 'Rua Boquira', 'Jardim das Margaridas','Salvador', 'BA'),
	('0015', 'Vista Tropical', 'Rua Geraldo Brasil', 'Cajazeiras XI','Salvador', 'BA');

INSERT INTO DADOS_BANCARIOS VALUES
--	(N_CONTA, TIPO, BANCO)
	('000000001', 'CORRENTE', '001'),
	('000000002', 'POUPAN�A', '104'),
	('000000003', 'SAL�RIO', '341'),
	('000000004', 'CORRENTE', '001'),
	('000000005', 'SAL�RIO', '341'),
	('000000006', 'SAL�RIO', '341'),
	('000000007', 'CORRENTE', '033'),
	('000000008', 'CORRENTE', '001'),
	('000000009', 'CORRENTE', '033'),
	('000000010', 'CORRENTE', '001'),
	('000000011', 'CORRENTE', '260'),
	('000000012', 'CORRENTE', '260'),
	('000000013', 'CORRENTE', '260');

INSERT INTO CLIENTE VALUES 
--	(CPF, RG, NOME, DATA_NASC, NACIONALIDADE, EST_CIVIL, CONTATO, D_BANCARIOS, PROFISSAO, ESTADO, CIDADE,ENDERECO)
	('00000000001', '000000001','Ayla','19780329','BRASILEIRO', 'SOLTEIRO', '002','000000001', 'ESTAGI�RIA', 'SP', 'MAU�', 'RUA EXEMPLO'),
	('00000000002', '000000002', 'Henry','19980329','BRASILEIRO', 'SOLTEIRO', '004','000000002', 'SEGURAN�A', 'MG', 'BELO HORIZONTE', 'RUA EXEMPLO'),
	('00000000003', '000000003', 'Gabrielly','19880329','BRASILEIRO', 'SOLTEIRO', '005','000000004', 'SECRET�RIA', 'MG', 'BELO HORIZONTE', 'RUA EXEMPLO'),
	('00000000004', '000000004', 'Yago','19880329','BRASILEIRO', 'CASADO', '006','000000007', 'AUXILIAR DE LIMPEZA', 'BA','SALVADOR', 'RUA EXEMPLO'),
	('00000000005', '000000005', 'Sophia','19770329', 'BRASILEIRO', 'CASADO', '007','000000008', 'DO LAR', 'BA', 'SALVADOR', 'RUA EXEMPLO'),
	('00000000006', '000000006', 'Anthony','19750329', 'BRASILEIRO', 'SOLTEIRO', '008','000000009', 'PINTOR', 'RS', 'CANOAS', NULL),
	('00000000007', '000000007', 'Emanuelly','19890329','BRASILEIRO', 'CASADO', '010','000000010', 'CARPINTEIRA', 'RS', 'CANOAS', 'RUA EXEMPLO'),
	('00000000008', '000000008', 'Yuri','19870329', 'BRASILEIRO', 'CASADO', '011','000000011', 'ENFERMEIRO', 'SP','SUZANO', 'RUA EXEMPLO'),
	('00000000009', '000000009', 'Ryan','19900329', 'BRASILEIRO', 'SOLTEIRO', '012','000000012', 'VENDEDOR', 'SP', 'GUARULHOS', NULL),
	('00000000010', '000000010', 'Manuel','19740329','BRASILEIRO', 'SOLTEIRO', '013','000000013', 'GERENTE', 'SP', 'GUARULHOS', 'RUA EXEMPLO');

INSERT INTO AGENTE_VENDAS VALUES
--	(CNPJ, CPF, EMPRESA, NOME, CONTATO, D_BANCARIOS, PROFISSAO, ESTADO, CIDADE, ENDERECO)
	('000931894000133', '00000000011', 'IMOBILIARIA FRANCA LTDA','Ana', '001', '000000003','CORRETOR', 'SP','SUZANO', 'RUA EXEMPLO'),
	('075538298000197', '00000000012', 'IMOBILIARIA JARDIM JARAGUA LTDA','Amanda', '003', '000000005','CORRETOR', 'MG', 'BELO HORIZONTE', 'RUA EXEMPLO'),
	('71476527000135', '00000000013', 'CONSTRUTORA TENDA S.A','Carlos', '009', '000000006','VENDEDOR', 'RS', 'CANOAS', NULL);

INSERT INTO VENDA VALUES
	('00000000001','0001', '000931894000133', '20210305', '180000.00'),
	('00000000002','0005', '075538298000197',  '20210303','175000.00'),
	('00000000003','0007', '075538298000197', '20210307','240000.00'),
	('00000000004','0003','000931894000133', '20210302','128000.00'),
	('00000000005','0002', '71476527000135', '20210301', '240000.00'),
	('00000000006','0008', '000931894000133', '20210308','180000.00'),
	('00000000007','0004', '71476527000135', '20210309', '128000.00'),
	('00000000008','0009','000931894000133', '20210306','175000.00'),
	('00000000009','0005','000931894000133', '20210310','180000.00'),
	('00000000010','0006','71476527000135', '20210311', '128000.00');

--Buscas
--dados do cliente
SELECT 	CLIENTE.NOME, CLIENTE.NACIONALIDADE, CLIENTE.EST_CIVIL, CLIENTE.PROFISSAO,
CLIENTE.RG, CLIENTE.CPF, CLIENTE.ENDERECO, CLIENTE.CIDADE, CLIENTE.ESTADO, VENDA.COD_AGE
FROM CLIENTE INNER JOIN VENDA ON CLIENTE.CPF = VENDA.COD_CLI 
WHERE COD_CLI = '00000000001';

--dados do agende de venda
SELECT DISTINCT AGENTE_VENDAS.NOME, AGENTE_VENDAS.PROFISSAO, AGENTE_VENDAS.CPF, AGENTE_VENDAS.ENDERECO,
 AGENTE_VENDAS.EMPRESA, AGENTE_VENDAS.CNPJ, AGENTE_VENDAS.CIDADE, AGENTE_VENDAS.ESTADO
 FROM AGENTE_VENDAS INNER JOIN VENDA ON AGENTE_VENDAS.CNPJ = VENDA.COD_AGE
 WHERE COD_AGE = '000931894000133';

 --dados empreendimeto
 SELECT	EMPREENDIMENTOS.MATRICULA, EMPREENDIMENTOS.NOME, EMPREENDIMENTOS.RUA, EMPREENDIMENTOS.BAIRRO,
 EMPREENDIMENTOS.CIDADE, EMPREENDIMENTOS.ESTADO, VENDA.VALOR FROM EMPREENDIMENTOS 
 INNER JOIN VENDA ON EMPREENDIMENTOS.MATRICULA = VENDA.MATRICULA
 WHERE VENDA.COD_CLI = '00000000001';

drop table VENDA;
drop table AGENTE_VENDAS;
drop table CLIENTE;
drop table DADOS_BANCARIOS;
drop table EMPREENDIMENTOS;
drop table CONTATO;
drop table BANCO;

