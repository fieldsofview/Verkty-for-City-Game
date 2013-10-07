//Handle keyinput and structure addaition
void keyPressed() {
  if (keyCode==KeyEvent.KEYCODE_ENTER) {
    playerSwitch();

    if (!addable) {
      lastStructure.setPlaced(input);
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
    saveData();
  } else {
    input+= key;
    //println( input );
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
void onLongPress(float x, float y) {
  //println("*\nSCALE  "+scale+"\nMOUSEX "+mouseX+" MOUSEY "+mouseY+"\nPOSX "+posX+" POSY "+posY+"\n*");
  if (addable) {
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

//Zoom
void onPinch(float x, float y, float d) {
  println("FÖRE   "+d);
  if (scale>=0.03) {
    scale+=map(d, -200, 200, -0.1, 0.1);
  } else {
    scale=0.03;
  }
}

