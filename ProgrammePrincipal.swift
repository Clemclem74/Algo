func Deplacer(plat:Plateau,joueur:Joueur)->Plateau
func Saisir_Piece_A_Deplacer()->Piece
func Saisir_Position_Finale()->Position
func Saisir_Piece_A_Parachuter()->Piece



func Saisir_Position_Finale()->Position {
    var pos = Position()
    var x : String?
    var y : String?
    print("A quelle position souhaitez vous déplacer la piece ?")
    repeat {
        x = readLine()
        y = readLine()
    } while(x != nil && y != nil)
    pos.Change_Position(x,y)
    return pos
    
    
}

func Demander_Action()->String {
    print("Voulez vous vous déplacer ou parachuter une piece ? ")
    var res = readLine()
    while res == nil || (res != "Deplacer"  && res != "Parachuter"){
        print("Choix non possible")
        res = readLine()
    }
    guard let ret : String = res else {
        fatalError("Problème lors du choix de l'action")
    }
    return ret
}


func Saisir_Piece_A_Deplacer()->Piece{
    var piece = Piece()
    print("Quelle pièce voulez vous déplacer ?")
    return piece
}






var plat = Plateau()        //Initialisation du plateau 
//Initialisation des joueurs :  A l'initialisation, les 

var action : String
var piece : Piece 
var piece_a_capturer : Piece
var tour : Int = 1
var positionFinale : Position
var tour_effectue : Bool 
var fin_de_partie : Bool = false
    //Gestion de la déclaration du nom des joueurs. Si le nom reste vide on attribuera Joueur 1 et Joueur 2
print("Quel est le nom du premier joueur ?")
var l : String? = readLine()
guard let l1 = l else {
    plat.j1.ChangeName("Joueur 1")
}
print("Quel est le nom du deuxième joueur ?")
l = readLine()
guard let l2 = l else {
    plat.j2.ChangeName("Joueur 2")
}
plat.j1.name = l1
plat.j2.name = l2

while !fin_de_partie {
    tour_effectue=false
    //Changement du joueur et donc de l'adversaire à chaque tour 
    if tour%2==1{
        var joueur:Joueur = plat.j1
        var adversaire:Joueur = plat.j2
    }
    else {
        var joueur:Joueur = plat.j2
        var adversaire:Joueur = plat.j1
    }
    //Vérification que la partie n'est pas finie, donc les deux joueurs possèdent un roi et qu'il n'est pas sur la dernière ligne.
    if(plat.fin()!= nil){
        tour_effeectue=true
        fin_de_partie=true
    }
    //On crée le while pour vérifier que le tour est effectué (créé dans des cas où le joueur veut avoir accès à sa réserve mais qu'elle est vide), on redemandera alors le choix du début
    while(!tour_effectue){
        //on affiche le plateau et la réserve pour demander à l'utilisateur ce qu'il veut faire
        afficherPlateau(plat)
        afficherReserve(joueur)
        action=demander_action()
        
        //Si le joueur veut se déplacer
        if action == "Deplacer" {
            do{
                piece = saisir_piece_a_deplacer()
                positionFinale = saisir_position_finale()
            } while(!est_deplacement_possible(piece,positionFinale))
            //Un deplacement n'est pas possible si la piece sort du plateau, si une piece nous appartenant est à cette place ou si ce deplacement n'est pas autorisé par les caractéristiques de la piece
            
            if (adversaire.GiveHand.avoir_piece(positionFinale)){
                //capturer une piece
                piece_a_capturer = plat.PiecePosition(positionFinale)
                adversaire.GiveHand.supprimer_piece(piece_a_capturer)
                if estKodamaSamourai(piece_a_capturer){
                    joueur.GiveHand.transformer_Kodama(piece_a_capturer)
                }
                joueur.GiveReserve.ajouter_piece(piece_a_capturer)
            }
            joueur.GiveHand.deplacer_piece(piece,positionFinale)
            if estKodama(piece){
                if (joueur.GiveHand.est_au_fond(piece)){
                    joueur.GiveHand.transformer_KodamaSamourai(piece)
                }
            }
            tour_effectue=true
            
        }
            
        else if action=="Parachuter"{
            if (!joueur.GiveReserve.est_vide()){
                do{
                    piece = saisir_piece_a_parachuter()
                    positionFinale = saisir_position_finale()
                } while(!est_vide(positionFinale))
                //Un parachutage est possible uniquement si la case est vide 
                joueur.GiveHand.ajouter_piece(piece)
                joueur.GiveHand.supprimer_piece(piece)
                tour_effectue = true
            }
        }
    }
    
    
    if tour%2==1{
        plat.j1=joueur
        plat.j2=adversaire
    }
    else {
        plat.j2=joueur
        plat.j1=adversaire
    }
    tour = tour + 1
}
let joueur_gagnant=plat.fin()
print("Le joueur %s a gagné",joueur_gagnant.GiveName())
exit()
}
