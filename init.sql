-- Création de la table "users"
CREATE TABLE users (
    email VARCHAR(255) NOT NULL PRIMARY KEY, -- Email est utilisé comme clé primaire
    password VARCHAR(255) NOT NULL           -- Mot de passe de l'utilisateur
);

-- Création de la table "todos"
CREATE TABLE todos (
    id INT AUTO_INCREMENT PRIMARY KEY,      -- ID auto-incrémenté
    userEmail VARCHAR(255) NOT NULL,        -- Email de l'utilisateur (clé étrangère)
    title VARCHAR(255) NOT NULL,            -- Titre de la tâche
    description TEXT,                       -- Description de la tâche
    done BOOLEAN DEFAULT FALSE,             -- Statut (terminé ou non)
    FOREIGN KEY (userEmail) REFERENCES users(email) -- Relation avec la table "users"
);

-- Ajout d'utilisateurs
INSERT INTO users (email, password) VALUES
('test@gmail.com', 'test'),
('test1@gmail.com', 'test1'),
('test2@gmail.com', 'test2');

-- Ajout de tâches (todos)
INSERT INTO todos (userEmail, title, description, done) VALUES
('test@gmail.com', 'Acheter des courses', 'Acheter du lait, du pain et des œufs', FALSE),
('test1@gmail.com', 'Faire du sport', 'Courir 5 km ce soir', TRUE),
('test1@gmail.com', 'Révision', 'Revoir le chapitre 3 de maths', FALSE),
('test2@gmail.com', 'Préparer une réunion', 'Créer une présentation PowerPoint', TRUE);