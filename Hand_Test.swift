func Est_Dans_Main_Test()->Int {
    var main = Hand()
    var type_piece_inexistant = TypePiece() //Crée un type inexistant
    type_piece_inexistant.Set_Nom("KoKiKo")
    var ret : Int = 0
    
    do {
        try est_dans_main(main,type_piece_inexistant)
        print("Test type piece inexistant a echoue")
        ret+=1
    }
    catch {
        print("OK si type inexistant")
    }
    return ret
}



func Avoir_Piece_Test()->Int{
    var main = Hand()
    var position_inexistante = Position()
    position_inexistante.Set_Position(-1,-1)
    var ret : Int = 0
    do {
        try Avoir_Piece(main:main,positionFinale:position_inexistante)
        print("Test type piece inexistant a echoue")
        ret+=1
    }
    catch {
        print("OK si type inexistant")
    }
    return ret
}




func Ajouter_Piece_Test()->Int{
    var main = Hand()
    var piece_sans_position = Piece()
    var piece_plateau = Piece()
    
    piece_plateau.Set_Position(2,2)
    
    var ret : Int = 0
    do {
        try {
            Ajouter_Piece(main,piece_plateau,(1,1))
            print("Test si une piece qui a une position peut etre ajoute a echoue")
            ret+=1
        }
    }
    catch {
        print("OK si il y a une piece qui a deja une position")
    }
    do {
        try {
            Ajouter_Piece(main,piece_sans_position,(2,2))
            print("Test si une piece peut etre ajouter a une position deja occupe a echoue")
            ret+=1
        }
    }
    catch {
        print("OK si il y a deja une pieces a la position rentree en parametre")
    }
    do {
        try {
            Ajouter_Piece(main,piece_sans_position,(-1,-1))
            print("Test si une piece peut etre ajouter en dehors du plateau a echoue")
            ret+=1
        }
    }
    catch {
        print("OK si on essaye d'ajouter une piece en dehors du plateau")
    }
    return ret
}



func Supprimer_Piece_Test()->Int{
    var main = Hand()
    var piece_pas_dans_main = Piece()
    
    var ret : Int = 0
    do {
        try {
            //ici on verifie que la piece n'est pas dans la main mais on n'est pas oblige car a auccun moment on a ajouter la piece a la main et la main est initialise a vide donc la piece n'en fait forcement pas partie
            if !main.Est_Dans_Main(piece_pas_dans_main){
                Supprimer_Piece(main,piece_plateau,(1,1))
                print("Test si une piece qui n'est pas dans la main peut etre supprimer de la main a echoue")
                ret+=1
            }
        }
    }
    catch {
        print("OK si on essaye de supprimer une piece qui n'est pas dans la main")
    }
    return ret
}


var nb_erreur : Int = 0
nb_erreur+=Est_Dans_Main_Test()
nb_erreur+=Avoir_Piece_Test()
nb_erreur+=Ajouter_Piece_Test()
nb_erreur+=Supprimer_Piece_Test()

