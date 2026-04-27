use ibisnatal;

CREATE TABLE usuarios (
    idUsuario INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    login VARCHAR(50) NOT NULL,
    pass VARCHAR(255) NOT NULL,
    setor VARCHAR(50) NOT NULL,    
    PRIMARY KEY (idUsuario)
)ENGINE = INNODB;

INSERT INTO usuarios (nome, login, pass, setor)
VALUES ( "GSMN", "Dev", "$2a$10$V8LXv8wXh7TkoHMQlmOC0.vBGpaOEaSHNiHqqlVXkb0ajlDJfn2NO", "Desenvolvimento");
