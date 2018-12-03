Piece= TypePiece*Position*Orientation
protocol PieceProtocol:{
    //init: -> Piece
    //creation d'une piece definie par son type, sa position et son orientation. On initialise cette piece a Vide.
    
    init()
    
    //Set_Nom: Piece*TypePiece -> Piece
    //Modifie le nom (Type) d'une piece
    //Pre: type est un Type existant
    //Post: On change le type de la piece, si le type n'existe pas on ne fait rien
    @discardableResult
    mutating func Set_Type(type:TypePiece)->Self
    
    //Set_Position: Piece*(Position|Vide) -> Piece
    //Modifie la position d置ne piece
    //Pre: La position de la piece doit 黎re sur le plateau
    //Post: Si la position est sur le plateau on modifie sa position sinon on ne fait rien
    @discardableResult
    mutating func Set_Position(newPos:Position?)->Self

    //Set_Orientation: Piece*(Orientation|Vide) -> Piece
    //Modifie l'orientation d置ne piece
    @discardableResult
    mutating func Set_Orientation(newOrient:Orientation?)->Self

    //Give_Nom: Piece -> TypePiece
    //Retourne le nom (Type) d置ne piece
    func Give_Type()->TypePiece
    
    //Give_Position: Piece -> (Position|Vide)
    //Retourne la position d置ne piece
    //Pre: La piece doit 黎re sur le plateau
    //Post: Si la piece est sur le plateau on retourne sa position sinon on retourne Vide(Si la piece est dans la reserve par exemple)
    func Give_Position()->?Position

    //Give_Orientation: Piece -> Orientation
    //Retourne l'orientation d置ne piece
    func Give_Orientation()->Orientation

    //Piece_Au_Fond: Piece -> Bool
    //Regarde si la piece est au fond
    func Piece_Au_Fond()->Bool

    //Est_Kodama: Piece -> Bool
    //Regarde si la piece est un Kodama
    func Est_Kodama()->Bool

    //Est_Kodama_Samurai: Piece -> Bool
    //Regarde si la piece est un Kodama samura・
    func Est_Kodama_Samurai()->Bool

    //Est_Roi: Piece -> Bool
    //Regarde si la piece est un Roi
    func Est_Roi()->Bool

    //Transformer_Kodama_Samurai: Piece -> Piece
    //On transforme le kodama en kodama samurai
    //Pre: La piece doit etre un kodama et doit etre au fond du plateau et ne pas avoir ete parachutee directement au fond
    //Post: On transforme le kodama en kodama samourai Si les preconditions ne sont pas remplies on ne fait rien.
    @discardableResult
    mutating func Transformer_Kodama_Samurai()->Self

    //Transformer_Kodama: Hand*Piece -> Hand
    //On transforme le kodama samura・en kodama
    //Pre: La piece doit etre un kodama et doit etre au fond du plateau et ne pas avoir ete parachutee directement au fond
    //Post: On transforme le kodama samourai en kodama. Si les preconditions ne sont pas remplies on ne fait rien.
    @discardableResult
    mutating func Transformer_Kodama(piece:Piece)->Self

    //Deplacer_Piece: Piece*Position -> Piece
    //On deplace une piece jusqu'a une position finale.
    //Pre: La Position finale correspond ・une position sur laquelle la piece peut se deplacer 
    //Post: La piece est deplacee. Si la piece ne peut pas se deplacer sur la position finale alors rien n'est fait
    @discardableResult
    mutating func Deplacer_Piece(PosFin:Position)->Self

}
