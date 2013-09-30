
//Handles playerswitches between turns
void playerSwitch() {

  if (pCounter>playerList.size()-2||pCounter<0) {
    pCounter=0;
  } else {
    pCounter++;
  }
  player=(String)playerList.get(pCounter);
  println("P-info "+pCounter+" "+player);

  lastStructure.setColor((Integer)playerColors.get(pCounter));

  //popStyle();
}

void goBack() {
  if (pCounter==0) {
    pCounter=playerList.size()-1;
  }
  else {
    pCounter--;
  }
  player=(String)playerList.get(pCounter);
  turnCounter--;
  rounds.remove(rounds.size() - 1);
  structList.remove(structList.size() - 1);
}

/*

 //OLD
 void playerSwitch() {
 if (pCounter>=noOfPlayers||pCounter<1) {
 pCounter=1;
 } else {
 pCounter++;
 }
 println(player);
 switch (pCounter) {
 case 1:
 lastStructure.setColor(P1CLR);
 player=P1;
 break;
 case 2:
 lastStructure.setColor(P2CLR);
 player=P2;
 break;
 case 3:    
 lastStructure.setColor(P3CLR);
 player=P3;
 break;
 case 4:    
 lastStructure.setColor(P4CLR);
 player=P4;
 break;
 default:
 lastStructure.setColor(P1CLR);
 player=P1;
 break;
 }
 }
 */
