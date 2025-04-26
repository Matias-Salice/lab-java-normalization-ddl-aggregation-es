CREATE TABLE author (
                        id INT PRIMARY KEY AUTO_INCREMENT,
                        name VARCHAR(80) NOT NULL
);

CREATE TABLE article (
                         id INT PRIMARY KEY AUTO_INCREMENT,
                         title VARCHAR(255) NOT NULL,
                         word_count INT NOT NULL ,
                         views INT,
                         author_id INT NOT NULL,
                         FOREIGN KEY (author_id) REFERENCES author(id)
);


INSERT INTO author (name) VALUES ('Maria Charlotte'),
                                 ('Juan Perez'),
                                 ('Gemma Alcocer');

INSERT INTO article (title, word_count, views, author_id) VALUES ('Best Paint Colors', 814, 14, 1),
                                                                 ('Small Space Decorating Tips', 1146, 221, 2),
                                                                 ('Hot Accessories', 986, 105, 1),
                                                                 ('Mixing Textures', 765, 22, 1),
                                                                 ('Kitchen Refresh', 1242, 307, 2),
                                                                 ('Homemade Art Hacks', 1002, 193, 1),
                                                                 ('Refinishing Wood Floors', 1571, 7542, 3);


CREATE TABLE customer (
                          id INT PRIMARY KEY AUTO_INCREMENT,
                          name VARCHAR(80) NOT NULL,
                          status VARCHAR(30) NOT NULL,
                          total_mileage INT NOT NULL
);

CREATE TABLE aircrafts(
                          id INT PRIMARY KEY,
                          model VARCHAR(30) NOT NULL,
                          total_seats INT NOT NULL
);

CREATE TABLE flight(
                       flight_number VARCHAR(30) PRIMARY KEY,
                       aircraft_id INT NOT NULL,
                       flight_mileage INT NOT NULL,
                       FOREIGN KEY (aircraft_id) REFERENCES aircrafts(id)
);





CREATE TABLE booking (
                         id INT PRIMARY KEY AUTO_INCREMENT,
                         customer_id INT NOT NULL,
                         flight_number VARCHAR(30) NOT NULL,
                         FOREIGN KEY (customer_id) REFERENCES customer(id),
                         FOREIGN KEY (flight_number) REFERENCES flight(flight_number)
);

INSERT INTO customer (name, status, total_mileage) VALUES ('Agustine Riviera',  'Silver', 115235),
                                                          ('Alaina Sepulvida',  'None',    6008),
                                                          ('Tom Jones',         'Gold',   205767),
                                                          ('Sam Rio',           'None',    2653),
                                                          ('Jessica James',     'Silver', 127656),
                                                          ('Ana Janco',         'Silver', 136773),
                                                          ('Jennifer Cortez',   'Gold',   300582),
                                                          ('Christian Janco',   'Silver',  14642);


INSERT INTO aircrafts VALUES (1, 'Boeing 747', 400),
                             (2, 'Airbus A330',236),
                             (3, 'Boeing 777', 264);

INSERT INTO flight VALUES  ('DL143', 1,  135),
                           ('DL122', 2, 4370),
                           ('DL53',  3, 2078),
                           ('DL222', 3, 1765),
                           ('DL37',  1,  531);


INSERT INTO booking (customer_id, flight_number) VALUES (1, 'DL143'),
                                                        (1, 'DL122'),
                                                        (2, 'DL122'),
                                                        (1, 'DL143'),
                                                        (3, 'DL122'),
                                                        (3, 'DL53'),
                                                        (1, 'DL143'),
                                                        (4, 'DL143'),
                                                        (1, 'DL143'),
                                                        (3, 'DL222'),
                                                        (5, 'DL143'),
                                                        (4, 'DL143'),
                                                        (6, 'DL222'),
                                                        (7, 'DL222'),
                                                        (5, 'DL122'),
                                                        (4, 'DL37'),
                                                        (8, 'DL222');

SELECT COUNT(*) AS Vuelos_Totales FROM flight;

SELECT AVG(flight_mileage) AS Media_Vuelos FROM flight;

SELECT AVG(total_seats) AS Media_De_Asientos FROM aircrafts;

SELECT status, AVG(total_mileage) FROM customer GROUP BY status;

SELECT status, MAX(total_mileage) AS Maximo_Millas_Recorridas FROM customer GROUP BY status;

SELECT COUNT(*) FROM aircrafts WHERE model LIKE '%Boeing%';

SELECT * FROM flight WHERE flight_mileage BETWEEN 300 AND 2000;

SELECT c.status, AVG(f.flight_mileage) AS distancia_media
FROM booking b
         JOIN customer c ON b.customer_id = c.id
         JOIN flight f ON b.flight_number = f.flight_number
GROUP BY c.status;

SELECT a.model, COUNT(*) AS total_reservas
FROM booking b
         JOIN customer c ON b.customer_id = c.id
         JOIN flight f ON b.flight_number = f.flight_number
         JOIN aircrafts a ON f.aircraft_id = a.id
WHERE c.status = 'Gold'
GROUP BY a.model
ORDER BY total_reservas DESC
    LIMIT 1;





