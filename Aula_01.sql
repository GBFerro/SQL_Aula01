CREATE DATABASE Base01;

CREATE TABLE Cliente(
    id int NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cpf char(11) NOT NULL,

    CONSTRAINT PK_Cliente PRIMARY KEY (id),
    CONSTRAINT UN_Cliente_CPF UNIQUE (cpf)
);

CREATE TABLE Cliente_Fone(
    id_cliente int NOT NULL,
    numero VARCHAR(14),
    tipo int NOT NULL,

    CONSTRAINT PK_Cliente_Fone PRIMARY KEY (id_cliente, numero),
    CONSTRAINT FK_Cliente_Fone_Cliente FOREIGN KEY (id_cliente) REFERENCES Cliente (id)
);



INSERT INTO Cliente (id, nome, cpf) VALUES (1, 'Fabio', '12345678900')
INSERT INTO Cliente VALUES (2, 'Giovani', '45612378900')
INSERT INTO Cliente (id, cpf, nome) VALUES (3, '98765432100', 'Pestana')

INSERT INTO Cliente_Fone VALUES (1, '5516997080816', 1)
INSERT INTO Cliente_Fone VALUES (1, '190', 1)
INSERT INTO Cliente_Fone VALUES (2, '190', 1)

SELECT c.id as "identificador", c.nome, c.cpf FROM Cliente c
SELECT id_cliente, numero, tipo FROM Cliente_Fone

SELECT c.nome, cf.numero FROM Cliente c left join Cliente_Fone cf on c.id = cf.id_cliente
SELECT c.nome, cf.numero FROM Cliente c right join Cliente_Fone cf on c.id = cf.id_cliente

SELECT c.id as 'ID Cliente', cf.id_cliente as 'ID Cliente_Fone', c.nome as 'Cliente', cf.numero 
FROM Cliente c left join Cliente_Fone cf on c.id = cf.id_cliente

SELECT c.id as 'ID Cliente', cf.id_cliente as 'ID Cliente_Fone', c.nome as 'Cliente', cf.numero 
FROM Cliente c left join Cliente_Fone cf on c.id = cf.id_cliente
WHERE c.nome = 'Wario'

SELECT c.id as 'ID Cliente', cf.id_cliente as 'ID Cliente_Fone', c.nome as 'Cliente', cf.numero 
FROM Cliente c left join Cliente_Fone cf on c.id = cf.id_cliente
WHERE cf.numero like '%0808%'