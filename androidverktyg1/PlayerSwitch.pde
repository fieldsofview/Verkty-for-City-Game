
//Handles playerswitches between turns
void playerSwitch() {
  if (pCounter>=playerList.size()-1||pCounter<0) {
    pCounter=0;
    lastStructure.setColor((Integer)playerColors.get(pCounter));
  } else {
    pCounter++;
    lastStructure.setColor((Integer)playerColors.get(pCounter));
  }
  pcIndicator=(Integer)playerColors.get(pCounter);

  player=(String)playerList.get(pCounter);

  println("P-info "+pCounter+" "+player);
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

