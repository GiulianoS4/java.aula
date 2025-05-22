-- Criação do banco de dados
CREATE DATABASE IF NOT EXISTS catalogo_games;
USE catalogo_games;

-- Criação da tabela de jogos
CREATE TABLE IF NOT EXISTS jogos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    genero VARCHAR(100) NOT NULL,
    desenvolvedora VARCHAR(100) NOT NULL,
    data_lancamento DATE,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Inserção de alguns jogos
INSERT INTO jogos (titulo, genero, desenvolvedora, data_lancamento) VALUES
('The Witcher 3', 'RPG', 'CD Projekt', '2015-05-19'),
('Counter-Strike 2', 'FPS', 'Valve', '2023-09-27'),
('Minecraft', 'Sandbox', 'Mojang Studios', '2011-11-18');

-- Consulta de teste
SELECT * FROM jogos;
