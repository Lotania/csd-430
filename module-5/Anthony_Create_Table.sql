DROP TABLE IF EXISTS anthony_movies_data;

CREATE TABLE IF NOT EXISTS anthony_movies_data (
    id INT AUTO_INCREMENT PRIMARY KEY,
    movie_name VARCHAR(150) NOT NULL,
    production_company VARCHAR(150) NOT NULL,
    runtime_minutes INT,
    budget_USD INT NOT NULL,
    box_office_USD BIGINT NOT NULL,
    release_date DATE
);

INSERT INTO anthony_movies_data (movie_name, production_company, runtime_minutes, budget_USD, box_office_USD, release_date) VALUES
    ('Rat Race', 'Alphaville Films, Zucker Productions', 112, 48000000, 85498534, '2001-08-17'),
    ('Harry Potter and the Deathly Hallows - Part 2', 'Warner Bros. Pictures, Heyday Films', 130, 125000000, 1342942050, '2011-07-07'),
    ('Avatar', '20th Century Fox, Lightstorm Entertainment, Dune Entertainment, Ingenious Film Partners', 162, 237000000, 2923710708, '2009-12-10'),
    ('Alexander and the Terrible, Horrible, No Good, Very Bad Day', 'Walt Disney Pictures, 21 Laps Entertainment, The Jim Henson Company', 81, 28000000, 100654149, '2014-10-06'),
    ('Warrior', 'Mimran Schur Pictures, Solaris Entertainment, Filmtribe', 140, 25000000, 23308615, '2011-09-09'),
    ('Toy Story', 'Pixar Animation Studios', 81, 30000000, 401157969, '1995-11-19'),
    ('Aladdin', 'Walt Disney Pictures, Rideback', 128, 183000000, 1054304000, '2019-05-08'),
    ('Frozen', 'Walt Disney Animation Studios', 102, 150000000, 1284879663, '2013-11-19'),
    ('Foodfight!', 'Threshold Animation Studios, Fireman''s Fund Insurance Company', 87, 65000000, 120323, '2012-06-15'),
    ('Johnny English', 'StudioCanal, Working Title Films', 88, 40000000, 160466000, '2003-04-11'),
    ('The World''s End', 'Relativity Media, Working Title Films, Big Talk Pictures, Dentsu', 109, 20000000, 46089287, '2013-07-10'),
    ('Insidious', 'Haunted Movies, Stage 6 Films, Alliance Films, IM Global', 101, 1500000, 100106454, '2011-04-01'),
    ('Fast X', 'Universal Pictures, Original Film, One Race Films, Perfect Storm Entertainment, Roth/Kirschenbaum Films', 141, 378800000, 714375114, '2023-05-12'),
    ('The Avengers', 'Marvel Studios', 143, 225000000, 1515100211, '2012-4-11')
;