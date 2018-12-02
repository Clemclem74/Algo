//Un typePiece est defini par son nom et ses mouvements possibles
protocol TypePieceProtocol:{
    //init -> TypePiece
    //On initialise un TypePiece avec un nom et ses mouvements possibles
    init()
    
    //Give_Nom: TypePiece -> String
    //Donne le nom du type de la piece
    func Give_Nom()->String
    
    //Set_Nom: TypePiece*(String|Vide) -> TypePiece
    //Modifie le nom du type de la piece
    mutating func Set_Nom(nom:String?)->Self
    
    //Give_Deplacement: TypePiece -> Deplacements
    //Donne les deplacements possibles d'un type de piece
    func Give_Deplacement() -> Deplacements
}

