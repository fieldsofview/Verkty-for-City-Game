//Handle keyinput and structure addaition
void keyPressed() {
  int exit=0;
  if (keyCode==KeyEvent.KEYCODE_ENTER) {
    playerSwitch();
    if (!addable) {
      lastStructure.setPlaced(input);
      println(input + " " + timeStamp + "\n");
      //Add turninfromation to the rounds arraylist
      rounds.add(timeStamp+":"+ nf(second(), 2)+"\n"+s+"\n"+input+" | "+lastPos+"\n\n");
      input="";
      hideVirtualKeyboard();
      addable=true;
    }
  } else if (keyCode == KeyEvent.KEYCODE_DEL) {
    if (input.length()>0) {
      input = input.substring(0, input.length()-1);
    }
  } else if (keyCode == BACK) {
    hideVirtualKeyboard();
  } else {
    input+= key;
    println( input );
  }

  if (key == CODED) {
    if (keyCode == MENU) {
      selectionList = new KetaiList(this, optionsList);
    }
  }
}
//Panning
void mouseDragged() {
  px+=(mouseX-pmouseX);
  py+=(mouseY-pmouseY);
}


//Add new structure
void onTap(float x, float y) {
  //println("*\nSCALE  "+scale+"\nMOUSEX "+mouseX+" MOUSEY "+mouseY+"\nPOSX "+posX+" POSY "+posY+"\n*");
  if (addable) {
    turnCounter++;
    s=player+"||"+turnCounter;
    textSize(15);
    //playerSwitch();
    structList.add(new Structure(posX, posY));

    showVirtualKeyboard();
    addable=false;
  } else {
    hideVirtualKeyboard();
    addable=true;
  }
  println("placed: " + info);
}
void onLongPress( float x, float y) {
  saveData();
}
//Zoom
void onPinch(float x, float y, float d) {
  println("FÖRE   "+d);
  if (scale>=0.03) {
    scale+=map(d, -200, 200, -0.1, 0.1);
  } else {
    scale=0.03;
  }
}

void onRotate(float x, float y, float ang) {
  println ("rotate");
}

void onFlick( float x, float y, float px, float py, float v) {
  for (int i=0;i<playerList.size();i++) {
    println(playerList.get(i));
  }
}

