const express = require('express');
const mysql = require('mysql2');
const app = express();

// Configurer le middleware pour gérer les requêtes JSON
app.use(express.json());

// Configurer la connexion MySQL
const db = mysql.createConnection({
    host: 'mysql-db', // Si votre API tourne dans un conteneur, utilisez le nom du service Docker
    user: 'admin',
    password: 'adminpassword',
    database: 'tododb'
});

db.connect((err) => {
    if (err) {
        console.error('Erreur de connexion MySQL :', err);
    } else {
        console.log('Connecté à MySQL');
    }
});

// Exemple d'endpoint : récupérer tous les todos
app.get('/todos', (req, res) => {
    db.query('SELECT * FROM todos', (err, results) => {
        if (err) {
            res.status(500).send(err);
        } else {
            res.json(results);
        }
    });
});

// Démarrer le serveur
const PORT = 3000;
app.listen(PORT, () => {
    console.log(`API en écoute sur http://localhost:${PORT}`);
});
