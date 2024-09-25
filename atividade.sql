CREATE TABLE departamento (
    sigla_depto VARCHAR(15),
    nome_depto VARCHAR(50),
    qtdfuncionariosdepto INT NOT NULL,
    PRIMARY KEY (sigla_depto, nome_depto)
);

CREATE TABLE funcionario (	
    codfuncionario INT,
    nome_funcionario VARCHAR(50) NOT NULL,
    cargo VARCHAR(100) NOT NULL,
    sigla_depto VARCHAR(15) UNIQUE NOT NULL,
    PRIMARY KEY (codfuncionario, nome_funcionario),
    FOREIGN KEY (sigla_depto) REFERENCES departamento(sigla_depto)
);

CREATE TABLE projeto (
    sigla_projeto VARCHAR(15),
    nome_projeto VARCHAR(50),
    codfuncionario INT NOT NULL,
    sigla_depto VARCHAR(15) NOT NULL,
    PRIMARY KEY (sigla_projeto, nome_projeto),
    FOREIGN KEY (sigla_depto) REFERENCES departamento(sigla_depto),
    FOREIGN KEY (codfuncionario) REFERENCES funcionario(codfuncionario)
);

INSERT INTO departamento (sigla_depto, nome_depto, qtdfuncionariosdepto) VALUES
('HR', 'Recursos Humanos', 10),
('IT', 'Tecnologia da Informação', 25),
('FIN', 'Finanças', 15),
('MKT', 'Marketing', 20),
('DEV', 'Desenvolvimento', 30),
('ADM', 'Administração', 12),
('LOG', 'Logística', 8),
('VEND', 'Vendas', 18),
('SUP', 'Suporte', 14),
('R&D', 'Pesquisa e Desenvolvimento', 22);



INSERT INTO funcionario (codfuncionario, nome_funcionario, cargo, sigla_depto) VALUES
(1, 'Alice Pereira', 'Gerente de Recursos Humanos', 'HR'),
(2, 'Bruno Silva', 'Analista de Sistemas', 'IT'),
(3, 'Carlos Mendes', 'Contador', 'FIN'),
(4, 'Diana Costa', 'Coordenadora de Marketing', 'MKT'),
(5, 'Eduardo Lima', 'Desenvolvedor', 'DEV'),
(6, 'Fernanda Rocha', 'Assistente Administrativo', 'ADM'),
(7, 'Gustavo Almeida', 'Analista de Logística', 'LOG'),
(8, 'Helena Martins', 'Representante de Vendas', 'VEND'),
(9, 'Igor Ferreira', 'Técnico de Suporte', 'SUP'),
(10, 'Julia Santos', 'Pesquisadora', 'R&D');

INSERT INTO projeto (sigla_projeto, nome_projeto, codfuncionario, sigla_depto) VALUES
('P1', 'Implementação de Sistema', 2, 'IT'),
('P2', 'Campanha de Marketing', 4, 'MKT'),
('P3', 'Reforma Financeira', 3, 'FIN'),
('P4', 'Desenvolvimento de App', 5, 'DEV'),

('P5', 'Pesquisa de Mercado', 10, 'R&D'),
('P6', 'Otimização de Processos', 7, 'LOG'),
('P7', 'Treinamento de Vendas', 8, 'VEND'),
('P8', 'Suporte Técnico', 9, 'SUP'),
('P9', 'Atualização de Políticas', 1, 'HR'),
('P10', 'Análise de Dados', 2, 'IT');

--1.
SELECT sigla_depto, nome_depto FROM departamento
--2.
select distinct sigla_depto, nome_depto FROM departamento
--3.
SELECT nome_funcionario FROM funcionario
--4.
SELECT distinct nome_funcionario FROM funcionario
--5.
SELECT distinct nome_projeto FROM projeto
--6.
SELECT * FROM departamento 
HAVING (qtdfuncionartiosdepto) <11
--7.
SELECT * FROM departamento
HAVING (qtdfuncionariosdepto) >=15
--8
SELECT * FROM funcionario
HAVING (sigla_depto) = 'IT'
--9
SELECT * FROM  funcionario
order by cargo desc
--10
SELECT nome_depto, sigla_depto from departamento
order by sigla_depto asc
--11
SELECT * FROM projeto 
order by nome_projeto asc
--12
ALTER TABLE funcionario
add column data_admicao date,
add column salario float (2)
--13
ALTER TABLE projeto 
add column duracao float(2)
--14a
insert into funcionario(data_admicao, salario)
VALUES ('5/03/2007', 2000)
--14b
ALTER TABLE funcionario
modify column data_admicao date not null,
