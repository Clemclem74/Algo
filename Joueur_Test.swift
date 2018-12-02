func Set_Name_Test()->Int{
    var ret : Int = 0
    var name = nil
    do {
        try Set_Name(name:name)
        print("Test de nom vide a échoué")
        ret+=1
    }
    catch {
        print("OK si nom vide")
    }
    return ret
}

var nb_erreur : Int = 0
nb_erreur+=Set_Name_Test()
