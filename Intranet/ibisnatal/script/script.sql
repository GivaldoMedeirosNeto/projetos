use ibisnatal;

CREATE TABLE usuarios (
    idUsuario INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    login VARCHAR(50) NOT NULL,
    pass VARCHAR(50) NOT NULL,
    setor VARCHAR(50) NOT NULL,    
    PRIMARY KEY (idUsuario)
)ENGINE = INNODB;

