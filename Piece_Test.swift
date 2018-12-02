func Set_Nom_Test()->Int {
    var piece = Piece()
    var type_piece_inexistant = TypePiece() //Crée un type inexistant
    type_piece_inexistant.Set_Nom("KoKiKo")
    var ret : Int = 0
    
    do {
        try Set_Nom(main,type_piece_inexistant)
        print("Test type piece inexistant a echoue")
        ret+=1
    }
    catch {
        print("OK si type inexistant")
    }
    return ret
}