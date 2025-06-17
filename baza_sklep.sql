CREATE DATABASE IF NOT EXISTS sklep CHARACTER SET utf8mb4 COLLATE utf8mb4_polish_ci;
USE sklep;

CREATE TABLE klienci (
    id INT PRIMARY KEY AUTO_INCREMENT,
    imie VARCHAR(50) NOT NULL,
    nazwisko VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefon VARCHAR(15)
);

CREATE TABLE produkty (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nazwa VARCHAR(100) NOT NULL,
    kategoria VARCHAR(50) NOT NULL,
    cena DECIMAL(10,2) NOT NULL
);

CREATE TABLE zamowienia (
    id INT PRIMARY KEY AUTO_INCREMENT,
    klient_id INT NOT NULL,
    data_zamowienia DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (klient_id) REFERENCES klienci(id)
);

CREATE TABLE pozycje_zamowienia (
    id INT PRIMARY KEY AUTO_INCREMENT,
    zamowienie_id INT NOT NULL,
    produkt_id INT NOT NULL,
    ilosc INT NOT NULL,
    FOREIGN KEY (zamowienie_id) REFERENCES zamowienia(id),
    FOREIGN KEY (produkt_id) REFERENCES produkty(id)
);

INSERT INTO klienci (imie, nazwisko, email, telefon) VALUES
('Jan', 'Kowalski', 'jan@domena.pl', '500100200'),
('Anna', 'Nowak', 'anna@domena.pl', '511222333'),
('Piotr', 'Wiśniewski', 'piotr@domena.pl', '523654987'),
('Maria', 'Zając', 'maria@domena.pl', '533321111'),
('Tomasz', 'Lewandowski', 'tomasz@domena.pl', '544123456'),
('Agnieszka', 'Wójcik', 'agnieszka@domena.pl', '555987123'),
('Krzysztof', 'Mazur', 'krzysztof@domena.pl', '566000999');

INSERT INTO produkty (nazwa, kategoria, cena) VALUES
('Myszka Logitech', 'Elektronika', 89.99),
('Klawiatura', 'Elektronika', 149.99),
('Monitor 24"', 'Elektronika', 799.99),
('Kubek firmowy', 'Gadżety', 19.99),
('Pendrive 64GB', 'Elektronika', 49.99),
('Notes', 'Papiernicze', 9.99),
('Długopis', 'Papiernicze', 2.49);

INSERT INTO zamowienia (klient_id, data_zamowienia) VALUES
(1, '2025-06-15 10:00:00'),
(2, '2025-06-15 11:30:00'),
(3, '2025-06-15 12:45:00'),
(4, '2025-06-15 14:15:00'),
(5, '2025-06-15 15:30:00'),
(1, '2025-06-15 16:45:00'),
(2, '2025-06-15 17:00:00');

INSERT INTO pozycje_zamowienia (zamowienie_id, produkt_id, ilosc) VALUES
(1, 1, 1),
(1, 5, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 1),
(5, 6, 3),
(6, 7, 2),
(7, 2, 1);
