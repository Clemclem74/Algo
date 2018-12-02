protocol JoueurProtocol: {

    // init:  String -> Joueur
    // création d'un joueur, un joueur est définie par un nom, une main, une reserve et une orientation. A l'initialisation sa reverve est vide et sa main est composé de 4 pieces.
    init(nom:String) 
    
    // Give_hand: Joueur -> Hand
    // retourne la main qu'un joueur possède (les pieces qu'il a sur la plateau)
    func Give_hand()->Hand
    
    // Give_reserve: Joueur -> Reserve
    // retourne la reserve d'un joueur (les pieces qu'il a capturer)
    func Give_Reserve()->Reserve
    
    // Give_name: Joueur -> String
    // retourne le nom d'un joueur
    func Give_name()->String
    
    // Set_name: Joueur*String -> Joueur
    // Change le nom d'un joueur
    mutating func Set_Name(nom:String)->Self

    // Set_Hand: Joueur*Hand -> Joueur
    // Change la main d'un joueur
    mutating func Set_Hand(newHand:Hand?)->Self

    // Set_Reserve: Joueur*(Reserve|Vide) -> Joueur
    // Change la reserve d'un joueur
    mutating func Set_Reserve(newReserve:Reserve?)->Self
}