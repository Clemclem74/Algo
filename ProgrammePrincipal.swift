func deplacer(plat:Plateau,joueur:Joueur)->Plateau
func saisir_piece_a_deplacer()->Piece
func saisir_position_finale()->Position
func saisir_piece_a_parachuter()->Piece



func saisir_position_finale()->Position {
    var pos = Position()
    var x : String?
    var y : String?
    print("A quelle position souhaitez vous d�placer la piece ?")
    repeat {
        x = readLine()
        y = readLine()
    } while(x != nil && y != nil)
    pos.ChangePosition(x,y)
    return pos
    
    
}

func demander_action()->String {
    print("Voulez vous vous d�placer ou parachuter une piece ? ")
    var res = readLine()
    while res == nil || (res != "Deplacer"  && res != "Parachuter"){
        print("Choix non possible")
        res = readLine()
    }
    guard let ret : String = res else {
        fatalError("Probl�me lors du choix de l'action")
    }
    return ret
}


func saisir_piece_a_deplacer()->Piece{
    var piece = Piece()
    print("Quelle pi�ce voulez vous d�placer ?")
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
    //Gestion de la d�claration du nom des joueurs. Si le nom reste vide on attribuera Joueur 1 et Joueur 2
print("Quel est le nom du premier joueur ?")
var l : String? = readLine()
guard let l1 = l else {
    plat.j1.ChangeName("Joueur 1")
}
print("Quel est le nom du deuxi�me joueur ?")
l = readLine()
guard let l2 = l else {
    plat.j2.ChangeName("Joueur 2")
}
plat.j1.name = l1
plat.j2.name = l2

while !fin_de_partie {
    tour_effectue=false
    //Changement du joueur et donc de l'adversaire � chaque tour 
    if tour%2==1{
        var joueur:Joueur = plat.j1
        var adversaire:Joueur = plat.j2
    }
    else {
        var joueur:Joueur = plat.j2
        var adversaire:Joueur = plat.j1
    }
    //V�rification que la partie n'est pas finie, donc les deux joueurs poss�dent un roi et qu'il n'est pas sur la derni�re ligne.
    if(plat.fin()!= nil){
        tour_effeectue=true
        fin_de_partie=true
    }
    //On cr�e le while pour v�rifier que le tour est effectu� (cr�� dans des cas o� le joueur veut avoir acc�s � sa r�serve mais qu'elle est vide), on redemandera alors le choix du d�but
    while(!tour_effectue){
        //on affiche le plateau et la r�serve pour demander � l'utilisateur ce qu'il veut faire
        afficherPlateau(plat)
        afficherReserve(joueur)
        action=demander_action()
        
        //Si le joueur veut se d�placer
        if action == "Deplacer" {
            do{
                piece = saisir_piece_a_deplacer()
                positionFinale = saisir_position_finale()
            } while(!est_deplacement_possible(piece,positionFinale))
            //Un deplacement n'est pas possible si la piece sort du plateau, si une piece nous appartenant est � cette place ou si ce deplacement n'est pas autoris� par les caract�ristiques de la piece
            
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
print("Le joueur %s a gagn�",joueur_gagnant.GiveName())
exit()
}