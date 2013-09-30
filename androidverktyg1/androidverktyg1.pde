/*
*Verktyg for City Game @ Fields of View
 *
 *By Rufael Negash & Mosa Al-Husseini
 *
 *www.fieldsofview.in
 *
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
//import java.io.FileWriter;

ArrayList<String> optionsList = new ArrayList<String>();
ArrayList rounds;
ArrayList playerColors;
ArrayList playerList;
ArrayList observations;
ArrayList<Structure> structList;

String playerName = "";
String timeStamp;
String s="";
String placed;

String info = "";
String lastPos="";

String input = "";

String option1="Regret latest move", option2="Set White background", option3="Set map background", 
option4="Show List of participants", option5="About";

final String P1="MaH", P2="SK", P3="RN", P4="HK";

String player="";

final int P1CLR = #B44272, P2CLR = #5842B4, P3CLR = #42B49E, P4CLR = #B49042;

int turnCounter=0, pCounter=0;
int noOfPlayers=4;

float px, py;
float scale;
float posX, posY;
boolean addable=true;
boolean newPlayer=false;

PImage bg;
Structure lastStructure;
KetaiGesture gesture;
KetaiList selectionList;

void setup() {
  size(displayWidth, displayHeight);
  orientation(PORTRAIT);  
  gesture = new KetaiGesture(this);
  optionsList.add(option1);
  optionsList.add(option2);
  optionsList.add(option3);
  rounds=new ArrayList<String>();
  playerList=new ArrayList<String>();
  playerColors=new ArrayList<Integer>();
  structList=new ArrayList<Structure>();
  timeStamp = year() + nf(month(), 2) + nf(day(), 2) + "-"  + nf(hour(), 2) +":"+ nf(minute(), 2);
  fill(0);
  //structList.add(new Structure(width/2, height/2));
  bg=loadImage("200map.png");

  //Add players
  playerList.add("bharath");
  playerList.add("rachel");
  playerList.add("marcus");
  playerList.add("alex");

  playerList.add("maria");
  playerList.add("hanke");
  playerList.add("karim");
  /* playerList.add("anja");
   playerList.add("lena");
   playerList.add("anna");
   playerList.add("olivia");
   playerList.add("manua?");
   
   playerList.add("posci");
   */
  pushStyle();
  colorMode(HSB, 360, 100, 100);
  for (int i=0;i<playerList.size();i++) {
    playerColors.add(color(random(360), 80, 80));
    //rounds.add(i+"  "+playerList.get(i));
  }
  popStyle();

  for (int i=0;i<playerList.size();i++) {
    println(i+"  "+playerList.get(i));
    //rounds.add(i+"  "+playerList.get(i));
  }
  println("Nr of players: "+playerList.size());
  //rounds.add("Nr of players: "+playerList.size());

  //Init playerturns
  player=(String)playerList.get(pCounter);

  scale=1;
}
boolean map=false;
void draw() {


  pushMatrix();
  scale(scale);
  textSize(15);
  translate(px, py); 
  if (map) { 
    image(bg, 0, 0, bg.width, bg.height);
  } else {
    background(240);
    pushStyle();
    noFill();
    strokeWeight(0.5);
    for (int x=0;x<width;x+=40) {
      for (int y=0;y<height;y+=40) {
        rect(x,y,40,40);
      }
    }
    popStyle();
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
  text(turnCounter+"| "+lastPos+" "+input+"\n"+player, 10, 40);
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
    map=false;
  } else if (selection == option3) {
    map=true;
  } else if (selection == option4) {
  }
}

