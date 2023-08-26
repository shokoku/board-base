CREATE TABLE user (
                       id VARCHAR(255) NOT NULL PRIMARY KEY,
                       pw VARCHAR(255) NOT NULL,
                       name VARCHAR(255) NOT NULL,
                       phone VARCHAR(50),
                       email VARCHAR(255)
);

INSERT INTO user (id, pw, name, phone, email) VALUES ('guest','1','게스트','010-0000-0000','guest@guest.com');

CREATE TABLE boardDTO (
                       id BIGINT PRIMARY KEY AUTO_INCREMENT,
                       title VARCHAR(255) NOT NULL,
                       content TEXT,
                       writer VARCHAR(255) NOT NULL,
                       created_date DATETIME DEFAULT CURRENT_TIMESTAMP,
                       FOREIGN KEY (writer) REFERENCES user(id)
);
