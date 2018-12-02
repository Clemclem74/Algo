Piece= TypePiece*Position*Orientation
protocol PieceProtocol:{
    //init: -> Piece
    //creation d'une piece definie par son type, sa position et son orientation. On initialise cette piece a Vide.
    
    init()
    
    //Set_Nom: Piece*TypePiece -> Piece
    //Modifie le nom (Type) d’une piece
    //Pre: type est un Type existant
    //Post: On change le type de la piece, si le type n’existe pas on ne fait rien
    @discardableResult
    mutating func Set_Nom(type:TypePiece)->Self
    
    //Set_Position: Piece*(Position|Vide) -> Piece
    //Modifie la position d’une piece
    //Pre: La position de la piece doit être sur le plateau
    //Post: Si la position est sur le plateau on modifie sa position sinon on ne fait rien
    @discardableResult
    mutating func Set_Position(newPos:Position?)->Self

    //Set_Orientation: Piece*(Orientation|Vide) -> Piece
    //Modifie l'orientation d’une piece
    @discardableResult
    mutating func Set_Orientation(newOrient:Orientation?)->Self

    //Give_Nom: Piece -> TypePiece
    //Retourne le nom (Type) d’une piece
    func Give_Nom()->TypePiece
    
    //Give_Position: Piece -> (Position|Vide)
    //Retourne la position d’une piece
    //Pre: La piece doit être sur le plateau
    //Post: Si la piece est sur le plateau on retourne sa position sinon on retourne Vide(Si la piece est dans la reserve par exemple)
    func Give_Position()->?Position

    //Give_Orientation: Piece -> Orientation
    //Retourne l'orientation d’une piece
    func Give_Orientation()->Orientation

    //PieceAuFond: Piece -> Bool
    //Regarde si la piece est au fond
    func PieceAuFond()->Bool

    //EstKodama: Piece -> Bool
    //Regarde si la piece est un Kodama
    func EstKodama()->Bool

    //EstKodamaSamurai: Piece -> Bool
    //Regarde si la piece est un Kodama samuraï
    func EstKodamaSamurai()->Bool

    //EstRoi: Piece -> Bool
    //Regarde si la piece est un Roi
    func EstRoi()->Bool

    //TransformerKodamaSamurai: Piece -> Piece
    //On transforme le kodama en kodama samuraï
    //Pre: La piece doit être un kodama et doit etre au fond du plateau et ne pas avoir ete parachutee directement au fond
    //Post: On transforme le kodama en kodama samouraï. Si les preconditions ne sont pas remplies on ne fait rien.
    @discardableResult
    mutating func TransformerKodamaSamurai()->Self

    //TransformerKodama: Hand*Piece -> Hand
    //On transforme le kodama samuraï en kodama
    //Pre: La piece doit être un kodama et doit etre au fond du plateau et ne pas avoir ete parachutee directement au fond
    //Post: On transforme le kodama samouraï en kodama. Si les preconditions ne sont pas remplies on ne fait rien.
    @discardableResult
    mutating func TransformerKodama(piece:Piece)->Self

    //Deplacer_piece: Piece*Position -> Piece
    //On deplace une piece jusqu'a une position finale.
    //Pre: La Position finale correspond à une position sur laquelle la piece peut se deplacer 
    //Post: La piece est deplacee. Si la piece ne peut pas se deplacer sur la position finale alors rien n'est fait
    @discardableResult
    mutating func Deplacer_piece(PosFin:Position)->Self

}
