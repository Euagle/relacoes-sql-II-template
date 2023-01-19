-- Active: 1674131276745@@127.0.0.1@3306

-- Práticas
CREATE TABLE users(
    id TEXTE PRIMARY KEY UNIQUE NOT NULL,
    name TEXT NOT NULL,   
    email TEXT UNIQUE NOT NULL,
    password TEXT NOT NULL,
    create_at TEXT DEFAULT(DATETIME('now', 'localtime')) NOT NULL
);
SELECT DATETIME("now", "localtime");

DROP TABLE users;

INSERT INTO users(id, name, email, password)
VALUES(
    "001", "Gleice", "gleisjc123@gmail.com", "gle123"
),(
    "002", "Paulo", "paulo123@gmail.com", "ana123"
),("003","Pedro", "pedro123@gmail.com", "pedro123");

DELETE FROM users;

SELECT * FROM users;

--criando tabela de relação

CREATE TABLE follows(
    follower_id TEXT NOT NULL,
    followed_id TEXT NOT NULL, 
    FOREIGN KEY (follower_id) REFERENCES user(id),
        FOREIGN KEY (followed_id) REFERENCES user(id)

);
DROP TABLE follows;
SELECT * FROM follows;

--popule a tabela- pessoa a segue a pessoa b e 
--pessoa b segue 
--pessoa c não segue ngm

INSERT INTO follows(follower_id, followed_id)
VALUES("001", "002"),
("001", "003"),
("002", "001");

--FAZER uma consulta com a junção INNER JOIN entre as duas tabelas

SELECT * FROM users
INNER JOIN follows 
ON follows.follower_id =users.id
;

--criar uma junção para mmostrar a visualização das pessoas  qtmb nn seguem ngm

SELECT * FROM users
LEFT JOIN follows 
ON follows.follower_id =users.id
;

--CRIE uma consulta ue mantém o nosso relacionamento anterior, mas também retorne o nome da pessoa seguida e remova a ambiguidade e apliue a monenclatura camelCase.
SELECT * FROM users
LEFT JOIN follows 
ON follows.follower_id =users.id
INNER JOIN users AS userFollowed
ON follows.followed_id = userFollowed.id
;

--removendoo ambiguidade
SELECT 
users.id AS usersId,
 users.name, 
 users.email,
  users.password,
   users.create_at AS createAt,
    follows.follower_id AS followerId, 
    follows.followed_id AS followedId,
    userFollowed.name AS nameFollowed
    FROM users
    JOIN follows 
ON follows.follower_id =users.id
INNER JOIN users AS userFollowed
ON follows.followed_id = userFollowed.id
;

