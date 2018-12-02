func Set_Type_Test()->Int {
    var piece = Piece()
    var type_piece_inexistant = TypePiece() //Crée un type inexistant
    type_piece_inexistant.Set_Nom("KoKiKo")
    var ret : Int = 0
    
    do {
        try Set_Type(piece,type_piece_inexistant)
        print("Test type piece inexistant a echoue")
        ret+=1
    }
    catch {
        print("OK si type inexistant")
    }
	
	do {
        try Set_Type(piece,nil)
        print("Test type piece vide a echoue")
        ret+=1
    }
    catch {
        print("OK si type vide")
    }
    return ret
}




func Set_Position_Test()->Int{
    var piece = Piece()
    var position_non_dispo = Position()
    var piece_plateau = Piece()
    
    var ret : Int = 0

    do {
        try {
            Set_Position(main,piece_sans_position,(-1,-1))
            print("Test si une piece peut etre ajouter en dehors du plateau a echoue")
            ret+=1
        }
    }
    catch {
        print("OK si on essaye d'ajouter une piece en dehors du plateau")
    }
    return ret
}






func Set_Orientation()->Int {
	var piece = Piece()
    var orientation_inexistante = Orientation() //Crée une orientation inexistante
    orientation_inexistante.Set_Nom("KoKiKo")
    var ret : Int = 0
    
    do {
        try Set_Nom(piece,orientation_inexistante)
        print("Test orientation inexistante a echoue")
        ret+=1
    }
    catch {
        print("OK si orientation inexistante")
    }
}


