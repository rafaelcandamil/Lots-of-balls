//declare variables
int count = 100;
float [] x = new float[count];
float [] y= new float[count];
float [] velx = new float[count];
float [] vely = new float[count];
float [] diam = new float[count];
void setup() {
  //set size of canvas
  size(800, 600);

  //initialize variables
  for (int i = 0; i < count; i++) {

    x[i] = width/2;
    y [i] = height/2;
    diam [i] = random(10, 130);
    velx [i] = random(-5, 10);
    vely [i] = random(-5, 10);
  }
}

void draw() {
  //draw background to cover previous frame
  background(random(255),random(255),random(255));
  

  for (int i = 0; i < count; i++) {
    x[i] += velx[i];
    y[i] += vely[i];
    //draw ball
    ellipse(x[i], y[i], diam[i], diam[i]);
    if (x[i] + diam[i]/2 >= width) {
      velx[i] = -abs(velx[i]);    //if the ball hits the right wall, assign x[i] velocity the negative version of itself
    } else if (x[i] - diam[i]/2 <= 0) {
      velx[i] = abs(velx[i]);     //if the ball hits the left wall, assign x[i] velocity the positive version of itself
    }
    if (y[i] + diam[i]/2 >= height) {
      vely[i] = -abs(vely[i]);
    } else if (y[i] - diam[i]/2 <= 0) {
      vely[i] = abs(vely[i]);
    }
  }
}