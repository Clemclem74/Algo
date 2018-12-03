func Give_Joueur1_Test(){
	var plat = Plateau()
  var joueur = Joueur()
  plat.Set_Joueur1(joueur:joueur)
	if Give_Joueur1() == joueur {
    	print("Ok pour Give_Joueur1()")
  }
  else{
      print("Erreur pour Give_Joueur1()")
      ret+=1
  }
  return ret
}

func Give_Joueur2_Test(){
	var plat = Plateau()
  var joueur = Joueur()
  plat.Set_Joueur2(joueur:joueur)
	if Give_Joueur2() == joueur {
    	print("Ok pour Give_Joueur2()")
  }
  else{
      print("Erreur pour Give_Joueur2()")
      ret+=1
  }
  return ret
}
