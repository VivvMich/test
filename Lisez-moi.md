<h1> Test VivvMich </h1>

<h2> POST event</h2>

<p>http://localhost/test/API/createEvent</p>

Paramêtres au format JSON

{
    "auteur" => "Obligatoire",
    "message" => "obligatoire",
    "Tag" => [Optionel]
}

<h2> GET event</h2>

<p>http://localhost/test/API/Events</p>

Si aucun paramêtre => retourne la liste des 25 premiers évenements

Paramêtres au format JSON

{
    "auteur" => "Optionel",
    "Tag" => "Optionel",
    "limite" => Optionel => valeur par defaut 25,
    "Page" => Optionel=> valeur par defaut 1
}


Pour la mise en place du serveur, j'utilise Filezilla ou je met les fichiers dans l'espace alloué au serveur sans oublié le fichier .htaccess.