class RectButton extends Button {

  RectButton(int ix, int iy, int isize, color icolor, color ihighlight) {
    x = ix;
    y = iy;
    size = isize;
    basecolor = icolor;
    highlightcolor = ihighlight;
    currentcolor = basecolor;
  }

  boolean over() {
    if ( overRect(x, y, size, size) ) {
      over = true;
      return true;
    } else {
      over = false;
      return false;
    }
  }

  void display() {
    stroke(255);
    fill(currentcolor);
    rect(x, y, size, size);
  }
}



/*****************************************************/

class CircleButton extends Button { 

  CircleButton(int ix, int iy, int isize, color icolor, color ihighlight) {
    x = ix;
    y = iy;
    size = isize;
    basecolor = icolor;
    highlightcolor = ihighlight;
    currentcolor = basecolor;
  }

  boolean over() {
    if ( overCircle(x, y, size) ) {
      over = true;
      return true;
    } else {
      over = false;
      return false;
    }
  }

  void display() {
    stroke(255);
    fill(currentcolor);
    ellipse(x, y, size, size);
  }
}

