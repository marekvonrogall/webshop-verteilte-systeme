CREATE TABLE articles (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    availableQuantity INT NOT NULL CHECK (availableQuantity >= 0)
);

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(200) NOT NULL,
    card_number VARCHAR(16) UNIQUE NOT NULL
);

CREATE TABLE purchases (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    article_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE,
    FOREIGN KEY (article_id) REFERENCES articles(id) ON DELETE CASCADE
);

-- BEISPIEL DATEN
INSERT INTO articles (name, availableQuantity) VALUES
('Tasse blau', 10),
('Tasse rot', 20),
('Tasse gelb', 15);

INSERT INTO customers (full_name, card_number) VALUES
('John Doe', '1234567812345678'),
('Jane Smith', '8765432187654321');

INSERT INTO purchases (customer_id, article_id, quantity) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1);
