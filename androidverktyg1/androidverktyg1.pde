/*
*Verktyg for City Game @ Fields of View
 *
 *By Rufael Negash & Mosa Al-Husseini
 *
 *www.fieldsofview.in
 *
 */

import ketai.ui.*;
import java.lang.String;
import android.view.MotionEvent;
import android.text.InputType;
import android.view.inputmethod.EditorInfo;
import android.os.Build;
import android.os.Bundle;
import android.view.WindowManager;
import android.view.inputmethod.InputMethodManager;
import android.content.Context;
import android.inputmethodservice.KeyboardView.OnKeyboardActionListener;
import android.view.KeyEvent;
import android.view.View;
import java.util.Arrays;

ArrayList<String> optionsList = new ArrayList<String>();
ArrayList rounds;
ArrayList playerColors;
ArrayList<String>  playerList;
ArrayList observations;
ArrayList<Structure> structList;
RectButton[] buttons;

String playerName = "";
String timeStamp;
String s="";
String placed;

String info = "";
String lastPos="";

String input = "";

String option1="Regret latest move", option2="Set map background", option3="Set grid background", 
option4="Set white background", option5="Save Session", option6="About";


String player="";

int turnCounter=1, pCounter=0;
int noOfPlayers=4;

color currentcolor=100;

float px, py;
float scale;
float posX, posY;
boolean addable=true;
boolean newPlayer=false;
boolean locked = false;

PImage map;
Structure lastStructure;
KetaiGesture gesture;
KetaiList selectionList;

int distY=0;
int bs=50;

void setup() {
  println("NEW SESSION-----------------------------------------");
  size(displayWidth, displayHeight);
  orientation(PORTRAIT);  
  gesture = new KetaiGesture(this);

  optionsList.add(option1);
  optionsList.add(option2);
  optionsList.add(option3);
  optionsList.add(option4);
  optionsList.add(option5);
  optionsList.add(option6);

  rounds=new ArrayList<String>();
  playerList=new ArrayList<String>();
  playerColors=new ArrayList<Integer>();
  structList=new ArrayList<Structure>();

  timeStamp = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) +":"+ nf(minute(), 2);
  fill(0);
  //structList.add(new Structure(width/2, height/2));
  map=loadImage("200map.png");

  //Add players
  playerList.add("bharath");
  playerList.add("rachel");
  playerList.add("marcus");
  playerList.add("alex");

  playerList.add("maria");
  playerList.add("hanke");
  playerList.add("karim");
  /*playerList.add("anja");
   playerList.add("lena");
   playerList.add("anna");
   playerList.add("olivia");
   playerList.add("manua?");
   
   playerList.add("posci");
   */

  pushStyle();
  colorMode(HSB, 360, 100, 100);
  for (int i=0;i<playerList.size();i++) {
    float indClr=360/playerList.size()*(i+1);
    playerColors.add(color(indClr, 80, 80));
  }
  popStyle();

  for (int i=0;i<playerList.size();i++) {
    println(i+"  "+playerList.get(i));
  }
  println("Nr of players: "+playerList.size());

  //Init playerturns
  player=(String)playerList.get(pCounter);

  buttons = new RectButton[playerList.size()];


  for (int i=0;i<buttons.length;i++) {
    buttons[i]=new RectButton(10, 70+(distY+=(bs+5)), bs, 150, 175);
  }
  distY=0;

  scale=1;
  println("NEW SESSION-----------------------------------------");
}
int pcIndicator;
int bg=1;//int myOffset=60;
void draw() {
  update(mouseX, mouseY);

  pushMatrix();
  scale(scale);
  textSize(15);
  translate(px, py); 

  switch(bg) {
  case 0: 
    background(240);
    image(map, 0, 0, map.width, map.height);
    break;  
  case 1: 
    background(240);
    grid();
    break;  
  case 2: 
    background(240);
    break;  
  case 3: 
    break;
  }

  pushMatrix();
  posX=mouseX/scale-px;
  posY=mouseY/scale-py;

  ArrayList<Structure> temp=new ArrayList<Structure>();
  temp=structList;
  for (int i=0;i<temp.size();i++) {
    temp.get(i).display();
    lastStructure=temp.get(temp.size()-1);
    if (mousePressed) {
      lastPos=("X: "+(int)temp.get(temp.size()-1).getX()+" Y: "+(int)temp.get(temp.size()-1).getY()+" | "+input);
    }
  }
  popMatrix();  
  popMatrix();

  textSize(15);
  text(timeStamp, width-textWidth(timeStamp), height-20);
  textSize(30);
  text((turnCounter)+"| "+lastPos+" "+input+"\n"+player, 10, 60);

  pushMatrix();
  pushStyle();
  for (int i=0;i<buttons.length;i++) {
    buttons[i].display();
    String pShort=(String)playerList.get(i);
    fill((Integer)playerColors.get(i));
    text(pShort.substring(0, 2).toUpperCase(), 10, 160+(i*(bs+5)));
  }
  popStyle();
  popMatrix();
}

//Save data to the memory card
void saveData() {
  String[] roundsArray=new String[rounds.size()];
  rounds.toArray(roundsArray);
  String fileName=timeStamp.replaceAll("[-+.^:,]", "");
  saveStrings("//sdcard//DCIM/verktyg/sessions/rounds/"+fileName+".txt", roundsArray);
  saveFrame("//sdcard//DCIM/verktyg/sessions/rounds/img"+fileName+".png");
  println("SAVED "+fileName);
  for (Object s:rounds) {
    println(s);
  }
}


//Optionslist, not in use right now
void onKetaiListSelection(KetaiList klist) {
  String selection = klist.getSelection();

  if (selection == option1) {
    goBack();
  } else if (selection == option2) {
    bg=0;
  } else if (selection == option3) {
    bg=1;
  } else if (selection == option4) {
    bg=2;
  } else if (selection == option5) {
    saveData();
  } else if (selection == option6) {
  }
}

void grid() {
  pushStyle();
  int sc=1000, avs=100;
  noFill();
  stroke(150);
  for (int x=0;x<sc;x+=avs) {
    for (int y=0;y<sc;y+=avs) {
      rect(x, y, avs, avs);
    }
  }
  popStyle();
}

