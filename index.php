
<?php

header('Content-Type: application/json');
require_once("Rest.inc.php");

class TEST extends Rest
{

    const HOST = 'mysql:host=localhost;dbname=api;'; // Base de Donnée
    const LOGIN = 'root';
    const PWD = "";
    const ATTR = [
        PDO::ATTR_ERRMODE => 
        PDO::ERRMODE_EXCEPTION,
        PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
        PDO::ATTR_DEFAULT_FETCH_MODE =>
        PDO::FETCH_ASSOC
    ];

    private $pdo = NULL;

    public $data ="";

    public function __construct()
    {
        parent::__construct();
        $this->connectDB();
        //
    }

            // Encodage en JSON



    private function connectDB()
    {
        $this->pdo = new PDO(self::HOST, self::LOGIN, self::PWD, self::ATTR); // Connection à la base de donnée

    }

    public function apiOn()
    {

        $func = strtolower(trim(str_replace("/","",$_REQUEST['rquest'])));
        
        if((int)method_exists($this,$func) > 0){
            $this->$func();
        }
        else{
            $this->response('',404); // Retourne une page 404 si requete non valide
        }
    }


    
    private function createEvent()
    {

            if($this->get_request_method() != "POST"){ 
                $this->response('',406); // Retourne " Not acceptable " si !POST
            }

            $auteur = $this->setRequest('auteur', '');
            $message = $this->setRequest('message', '');
            $tag = $this->setRequest('tag', '');

        if (!empty($auteur) && is_string($auteur) && !empty($message) && is_string($message) && empty($tag) ){ // On recherche si un auteur A à ecrit le Message B ( si Oui on crée l'event dans la BDD)

            $req = $this->pdo->prepare('SELECT count(*) FROM `auteur` a INNER JOIN `message` m ON a.auteur_id = m.auteur_id WHERE a.auteur_name = ? AND m.message_content = ?' );
            $req->bindValue(1, $auteur, PDO::PARAM_STR);
            $req->bindValue(2, $message, PDO::PARAM_STR);
            $req->execute();
            $r = $req->fetchColumn();

            if ($r == '1'){
                $this->searchTag($message, $auteur);
            }
            else{
                $this->response('', 204);
            }
        }

        
        if (!empty($auteur) && is_string($auteur) && !empty($message) && is_string($message) && !empty($tag) && is_array($tag)){ // Recherche avec le tag en plus


            $req = $this->pdo->prepare("SELECT count(*) FROM `auteur` a JOIN `message` m ON a.auteur_id = m.auteur_id JOIN `ht_list` hl ON hl.message_id = m.message_id JOIN `hashtag` h ON h.hashtag_id = hl.hashtag_id WHERE a.auteur_name = :auteur AND m.message_content = :message AND h.hashtag_name IN ('".implode("','",$tag)."')");
            $req->bindParam(':auteur', $auteur, PDO::PARAM_STR);
            $req->bindParam(':message', $message, PDO::PARAM_STR);
            $req->execute();
            $r = $req->fetchColumn();
    
                if ($r == '1'){
                    $this->searchTag($message, $auteur); // Si une ligne est retournée on l'inscrit dans la BDD
                }
                else{
                    $this->response('', 204);
                }
        }
        // Else if avec tableau de tag
        else{
            $error = 'Données invalides';
			$this->response($this->json($error), 400);
        }
    }


    private function searchTag(String $message, String $auteur) // Cherche le Tag du message pour les futures recherche.
    {
        $req = $this->pdo->prepare('SELECT h.hashtag_id as Hashtag FROM `message` m JOIN `ht_list` l ON m.message_id = l.message_id JOIN `hashtag` h ON h.hashtag_id = l.hashtag_id WHERE message_content = ?');
        $req->bindValue(1, $message, PDO::PARAM_STR);
        $req->execute();
        $r = $req->fetchAll();
        $array = $r;
        $pushArray = [];

        foreach ($array as $key => $value){

            foreach ($value as $key2 => $val){

                array_push($pushArray, $val);
            }
        }
        $this->insertEvent($message, $auteur, $pushArray);
    }


    private function insertEvent(String $message, String $auteur, Array $pushArray) // Insertion des infos dans la table event.
    {

        $req = $this->pdo->prepare('INSERT INTO `event` (`event_id`, `message_content`, `auteur`) VALUES ( NULL, :message_content, :auteur)');
        $req->bindValue(':message_content', $message, PDO::PARAM_STR);
        $req->bindValue(':auteur', $auteur, PDO::PARAM_STR);
        $req->execute();
        $this->createOk($pushArray);
    }

    private function createOK(Array $pushArray)
    {
        $req = $this->pdo->query('SELECT * FROM event ORDER BY event_id DESC LIMIT 1 ');
        $r = $req->fetchAll();
        $id = $r[0]["event_id"]; // on récupère l'ID de l'event nouvellement créé.
        var_dump($id);

        // On lie l'event aux tags.

        foreach ($pushArray as $key => $value) {
            $req2 = $this->pdo->prepare(' INSERT INTO `event_ht_list` (`event_id`, `hashtag_id`) VALUES (:event_id, :hashtag_id) ');
            $req2->bindValue(':event_id', (int)$id, PDO::PARAM_INT);
            $req2->bindValue(':hashtag_id', (int)$value, PDO::PARAM_STR);
            $req2->execute();
        }

        $this->response($this->json($r), 200);
    }


    private function events(){

        if($this->get_request_method() != "GET"){ // on verifie la methode POST
            $this->response('',406); // Retourne " Not acceptable " si !POST
        }


                        // Données à envoyer
            $auteur = $this->setRequest('auteur', '');
            $limite = $this->setRequest('limite', 25);
            $insert_page = $this->setRequest('page', 1);
            $tag = $this->setRequest('tag', '');



            if ( empty($auteur) && empty($tag) && is_string($auteur) && is_string($tag) && is_numeric($limite) && is_numeric($insert_page) ){

                $page = ( $insert_page - 1 ) * $limite; // Pagination

                
                $req = $this->pdo->prepare('SELECT * FROM `event` LIMIT :page, :limite ');
                $req->bindValue(':limite', $limite, PDO::PARAM_INT);
                $req->bindValue(':page', $page, PDO::PARAM_INT);
                $req->execute();

                
                $r = $req->fetchall();

                if ( !empty($r)){
                    $this->response($this->json($r), 200); // OK
                }
                else{
                    $this->response($this->json('Aucune données trouvées'), 204); // Aucun contenue.
                }
            }


            if ( !empty($auteur) || !empty($tag) && is_string($auteur) && is_string($tag) && is_numeric($limite) && is_numeric($insert_page) ){
                
               $page = ( $insert_page - 1 ) * $limite; // Pagination


                $req = $this->pdo->prepare('SELECT e.* FROM `event` e JOIN `event_ht_list` l ON e.event_id = l.event_id JOIN `hashtag` h ON h.hashtag_id = l.hashtag_id WHERE e.auteur = :auteur OR h.hashtag_name = :hashtag  LIMIT :page, :limite ');
                $req->bindParam(':auteur', $auteur, PDO::PARAM_STR);
                $req->bindParam(':hashtag', $tag, PDO::PARAM_STR);
                $req->bindParam(':limite', $limite, PDO::PARAM_INT);
                $req->bindParam(':page', $page, PDO::PARAM_INT);
                $req->execute();

                $r = $req->fetchall();

                if ( !empty($r)){
                    $this->response($this->json($r), 200); // OK
                }
                else{
                    $this->response($this->json('Aucune données trouvées'), 204); // Aucun contenue.
                }

            }
                        
    }



    private function setRequest(String $name, $value){

        $set = json_decode(file_get_contents('php://input'), true);

        if (isset($set[$name])){
            return $set[$name];
        }
        else{
             return $value;
        } 
    }



    private function json($data)
    {
        if(is_array($data))
        {
            return json_encode($data);
        }
     }

         
            

}


$test = new TEST;
$test->apiOn();

?>
