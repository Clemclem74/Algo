//Reserve est une collection de Piece car ce sont des pieces qui n'ont pas encore de position car elles ne sont pas sur le plateau 
protocol ReserveProtocol:Sequence{
    associatedtype IteratorPiece : IteratorProtocol
        where IteratorPiece.Element == Piece
    
    // init : -> Vide
    // Creation d'une Reserve, intialisee Vide
    init()
    

    //EstVide: Reserve -> Bool
    //Regarde si la reserve est Vide
    //Post: Si la reserve est vide on retourne Vrai sinon on retourne Faux
    func EstVide()->Bool

    //EstDansReserve: Reserve*Piece -> Bool
    //Regarde si il y a une piece dans la reserve
    //Pre: La piece n’a pas de position (est de type TypePiece*Vide)
    //Post: Si la piece est dans la reserve on retourne vrai sinon on retourne faux.
    func EstDansReserve(type:Piece)->Bool
    
    //Ajouter_piece: Reserve*Piece -> Reserve
    //Ajoute une piece de la reserve et remplace sa position par Vide
    //Pre: La piece a une position
    //Post: La piece a été ajouté dans la reserve du joueur et on a remplace sa position par vide, elle est maintenant de type TypePiece*Vide. Si jamais la piece n’a pas de postion alors on ne fait rien
    @discardableResult
    mutating func Ajouter_piece(type:Piece)->Self
    
    //Supprimer_piece: Reserve*Piece -> Reserve
    //Supprime une Piece de la Reserve
    //Pre: La Piece doit faire partie de la Reserve du joueur
    //Pre: La piece n’a pas de position (est de type TypePiece*Vide)
    //Post: La Piece a ete supprimee de la reserve du joueur. Si jamais elle n’en fait pas partie ou si elle n’est pas de type TypePiece*Vide alors on ne fait rien
    @discardableResult
    mutating func Supprimer_piece(Type:Piece)->Self

    // makeIteratorTypePiece : Reserve -> IteratorTypePiece
    // cree un iterateur sur la collection dans l'odre (?Comment on les tries)
    func makeIteratorTypePiece()->IteratorPiece
    
}