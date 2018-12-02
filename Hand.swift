//Hand est une collection de pieces
protocol HandProtocol: Sequence{
    associatedtype IteratorPiece : IteratorProtocol
        where IteratorPiece.Element == Piece
    
    // init : -> Hand
    // Creation d'une main, intialise a Vide
    init()

    // Initialiser_Debut : Hand -> Hand
    // Initialisation de la main avec les 4 pieces du debut
    func Initialiser_Debut()->Self
    
    //EstDansMain: Hand*TypePiece -> Bool
    //Regarde si il y a un type de piece dans la main
    //Pre: Ce type existe
    //Post: Si il y a cette piece dans la main on retourne Vrai sinon on retourne Faux
    func EstDansMain(type:TypePiece)->Bool
    
    //Avoir_Piece: Hand*Position -> Bool
    //Verifie si a un position donnee il y a une piece de la main qui occupe cette position
	
    //Post: Retourne vrai si il possede une piece faux sinon
    func AvoirPiece(pos:Postion)->Bool
    
    //Ajouter_piece: Hand*Piece*Position -> Hand
    //Ajoute une piece de la main
    //Pre: La position ne doit pas �tre occup�e par une autre piece lorsque on l�ajoute
    //Pre: La piece n�a pas encore de position
    //Pre: La position doit etre sur le plateau
    //Post: La piece a �t� ajout� dans la main du joueur a la position donnee. Si jamais il y a deja une piece sur cette position ou si la piece a deja une position ou si elle n�est pas sur le plateau on ne fait rien 
    @discardableResult
    mutating func Ajouter_piece(piece:Piece,pos:Position)->Self
    
    //Supprimer_piece: Hand*Piece -> Hand
    //Supprime une piece de la main
    //Pre: La piece doit faire partie de la main du joueur
    //Post: La piece a �t� supprim�e de la main du joueur. Si jamais elle n�en fait pas partie on ne fait rien
    @discardableResult
    mutating func Supprimer_piece(piece:Piece)->Self

 ** // Set_Hand: Hand*Hand -> Hand
    // Change la main d'un joueur
    mutating func Set_Hand(newHand:Hand)->Self
    
    // makeIteratorPiece : Hand -> IteratorPiece
    // cree un iterateur sur la collection dans l'odre (?Comment on les tries)
    func makeIteratorPiece()->IteratorPiece
    
}
