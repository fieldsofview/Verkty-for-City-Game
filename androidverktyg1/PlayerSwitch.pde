
//Handles playerswitches between turns
void playerSwitch() {

  println("P-info "+pCounter+" "+player);

  if (pCounter>=playerList.size()-1||pCounter<0) {
    pCounter=0;
    lastStructure.setColor((Integer)playerColors.get(pCounter));
  } else {
    lastStructure.setColor((Integer)playerColors.get(pCounter));
    pCounter++;
    turnCounter++;
  }

  player=(String)playerList.get(pCounter);
}

void goBack() {
  if (pCounter==0) {
    pCounter=playerList.size()-1;
  } else {
    pCounter--;
  }
  player=(String)playerList.get(pCounter);
  turnCounter--;
  rounds.remove(rounds.size() - 1);
  structList.remove(structList.size() - 1);
}

