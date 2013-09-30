/*int state = 0;
 //Override back button
 boolean surfaceKeyDown(int code, KeyEvent event) {
 if (event.getKeyCode() == KeyEvent.KEYCODE_BACK) {
 if (state == 0) {
 state = 1;
 } else {
 state=0;
 }
 }
 return false;
 //return true actually also works...
 }
 
 boolean surfaceKeyUp(int code, KeyEvent event) {
 return true;
 //return false does not work here
 }
 */

void showVirtualKeyboard() {
  InputMethodManager imm = (InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE);
  imm.toggleSoftInput(InputMethodManager.SHOW_FORCED, 0);
}

void hideVirtualKeyboard() {
  InputMethodManager imm = (InputMethodManager) getSystemService(Context.INPUT_METHOD_SERVICE);
  imm.toggleSoftInput(InputMethodManager.HIDE_IMPLICIT_ONLY, 0);
}

public boolean surfaceTouchEvent(MotionEvent event) {
  super.surfaceTouchEvent(event);
  return gesture.surfaceTouchEvent(event);
}
void onCreate(Bundle bundle) {
  super.onCreate(bundle);
  getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
}//Gör så att skärmen inte kan sleepa

public void onDestroy() {
  super.onDestroy(); //call onDestroy on super class
}

