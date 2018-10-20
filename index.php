
<?php

header('Content-Type: application/json');
require_once("Rest.inc.php");

class TEST extends Rest
{

    const HOST = 'mysql:host=localhost;dbname=api;';
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
        $this->pdo = new PDO(self::HOST, self::LOGIN, self::PWD, self::ATTR);

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

            if($this->get_request_method() != "GET"){ 
                $this->response('',406); // Retourne " Not acceptable " si !POST
            }

            $auteur = $this->_request['auteur'];
            $message = $this->_request['message'];

            if ( isset($this->_request['tag'])){
                $auteur = $this->_request['tag'] ;
            }
            else{
                $tag = array();
            }
            var_dump($tag);
            

        if (!empty($auteur) && is_string($auteur) && !empty($message) && is_string($message) && empty($tag) ){ // Si le Tag est Optionel.

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

        
        if (!empty($auteur) && is_string($auteur) && !empty($message) && is_string($message) && !empty($tag) && is_array($tag)){

            $req = $this->pdo->prepare('SELECT count(*) FROM `auteur` a JOIN `message` m ON a.auteur_id = m.auteur_id JOIN `ht_list` hl ON hl.message_id = m.message_id JOIN `hashtag` h ON h.hashtag_id = hl.hastag_id WHERE a.auteur_name = ? AND m.message_content = ? AND WHERE h.hashtag_name IN ('.implode(',' , $tag ) . ') ');
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



        // Else if avec tableau de tag
        else{
            $error = 'Données invalides';
			$this->response($this->json($error), 400);
        }
    }


    private function searchTag(String $message, String $auteur)
    {
        $req = $this->pdo->prepare('SELECT h.hashtag_name as Hashtag FROM `message` m JOIN `ht_list` l ON m.message_id = l.message_id JOIN `hashtag` h ON h.hashtag_id = l.hashtag_id WHERE message_content = ?');
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

        $tag = serialize($pushArray);
        $this->insertTag($message, $auteur, $tag);
    }


    private function insertTag(String $message, String $auteur, String $tag)
    {

        $req = $this->pdo->prepare('INSERT INTO `event` (`event_id`, `message_content`, `auteur`, `event_hashtag` ) VALUES ( NULL, :message_content, :auteur, :event_hashtag )');
        $req->bindValue(':message_content', $message, PDO::PARAM_STR);
        $req->bindValue(':auteur', $auteur, PDO::PARAM_STR);
        $req->bindValue(':event_hashtag', $tag, PDO::PARAM_STR);
        $req->execute();
        $this->createOk();
    }

    private function createOK()
    {
        $req = $this->pdo->query('SELECT * FROM event ORDER BY event_id DESC LIMIT 1 ');
        $r = $req->fetchAll();
        $this->response($this->json($r), 200);
    }




    private function events(){

        if($this->get_request_method() != "GET"){ // on verifie la methode POST
            $this->response('',406); // Retourne " Not acceptable " si !POST
        }

                        // Données à envoyer
            if ( isset($this->_request['auteur'])){
                $auteur = $this->_request['auteur'] ;
            }
            else{
                $auteur ="";
            }

            if ( isset($this->_request['limite'])){
                $limite = $this->_request['limite'] ;
                
            }
            else{
                $limite = 25;
            } 
            
            if ( isset($this->_request['page'])){
                $insert_page = $this->_request['page'] ;
            }
            else{
                $insert_page = 1;
            } 


            if ( empty($auteur) && is_numeric($limite) && is_numeric($insert_page) ){

                $page = ( $insert_page - 1 ) * $limite;

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

            if ( !empty($auteur) && is_numeric($limite) && is_numeric($insert_page) ){

                $page = ( $insert_page - 1 ) * $limite;

                $req = $this->pdo->prepare('SELECT * FROM `event` WHERE auteur = :auteur LIMIT :page, :limite ');
                $req->bindValue(':auteur', $auteur, PDO::PARAM_STR);
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
