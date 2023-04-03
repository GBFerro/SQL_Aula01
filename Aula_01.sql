CREATE DATABASE Base01;

CREATE TABLE Cliente(
    id int NOT NULL,
    nome VARCHAR(100) NOT NULL,
    cpf char(11) NOT NULL,

    CONSTRAINT PK_Cliente PRIMARY KEY (id),
    CONSTRAINT UN_Cliente UNIQUE (cpf)
);

CREATE TABLE Cliente_Fone(
    id_cliente int NOT NULL,
    numero VARCHAR(14),
    tipo int NOT NULL,

    CONSTRAINT PK_Cliente_Fone PRIMARY KEY (id_cliente, numero),
    CONSTRAINT FK_Cliente_Fone_Cliente FOREIGN KEY (id_cliente) REFERENCES Cliente (id)
);