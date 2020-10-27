import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

VerletPhysics2D world;

ArrayList<Particle> particles;

ArrayList<VerletSpring2D> springs;

float Xpos, Ypos, Xinc, Yinc;

int Xquant, Yquant;

boolean showPoints, showLines;

void setup() {
  //size(1200, 600);
  fullScreen();
  background(0);
  showPoints = true;
  showLines = true;

  Xquant = (int) random(10, 70);
  Yquant = (int) random(10, 40);
  Xinc = random(5, 20);
  Yinc = random(5, 20);

  Xpos = 0;

  world = new VerletPhysics2D();
  world.addBehavior(new GravityBehavior2D(new Vec2D(0, 0.5)));

  particles = new ArrayList<Particle>();
  springs = new ArrayList<VerletSpring2D>();

  for (int i = 0; i < Xquant; i++) {
    Ypos = 0;
    for (int j = 0; j < Yquant; j++) {
      particles.add(new Particle(new Vec2D(Xpos, Ypos)));
      Ypos += Yinc;
    }
    Xpos += Xinc;
  }

  for (int i = 0; i < particles.size(); i++) {
    Particle p1 = particles.get(i);
    if ((i+1) % Yquant != 0) {
      Particle p2 = particles.get(i+1);
      springs.add(new VerletSpring2D(p1, p2, Yinc, 1));
    }
    if (i < Yquant * (Xquant - 1)) { 
      Particle p3 = particles.get(i + Yquant);
      springs.add(new VerletSpring2D(p1, p3, Xinc, 1));
    }
  }

  for (Particle p : particles) {
    world.addParticle(p);
  }

  for (VerletSpring2D s : springs) {
    world.addSpring(s);
  }

  Particle pI = particles.get(0);
  Particle pF = particles.get(Yquant * (Xquant - 1));

  pI.lock();
  pF.lock();
}

void draw() {
  background(0);

  world.update();

  stroke(255);
  if (showLines) {
    for (int i = 0; i < particles.size(); i++) {
      Particle p1 = particles.get(i);
      if ((i+1) % Yquant != 0) {
        Particle p2 = particles.get(i+1);
        line(p1.x, p1.y, p2.x, p2.y);
      }
      if (i < Yquant * (Xquant - 1)) { 
        Particle p3 = particles.get(i + Yquant);
        line(p1.x, p1.y, p3.x, p3.y);
      }
    }
  }
  if (showPoints) {
    for (Particle p : particles) {
      p.show();
    }
  }
  
  fill(255);
  text("'P' To show/hide the points\n'L' To show/hide the lines\n'N' To create a new cloth", width-250, 20);
}

void keyPressed() {
  if (key == 'p') {
    showPoints = !showPoints;
  }
  if (key == 'l') {
    showLines = !showLines;
  }
  if(key == 'n'){
    setup(showPoints, showLines);
  }
}

void setup(boolean Spoints, boolean Slines) {
  //size(1200, 600);
  fullScreen();
  background(0);
  showPoints = Spoints;
  showLines = Slines;

  Xquant = (int) random(10, 70);
  Yquant = (int) random(10, 40);
  Xinc = random(5, 20);
  Yinc = random(5, 20);

  Xpos = 0;

  world = new VerletPhysics2D();
  world.addBehavior(new GravityBehavior2D(new Vec2D(0, 0.5)));

  particles = new ArrayList<Particle>();
  springs = new ArrayList<VerletSpring2D>();

  for (int i = 0; i < Xquant; i++) {
    Ypos = 0;
    for (int j = 0; j < Yquant; j++) {
      particles.add(new Particle(new Vec2D(Xpos, Ypos)));
      Ypos += Yinc;
    }
    Xpos += Xinc;
  }

  for (int i = 0; i < particles.size(); i++) {
    Particle p1 = particles.get(i);
    if ((i+1) % Yquant != 0) {
      Particle p2 = particles.get(i+1);
      springs.add(new VerletSpring2D(p1, p2, Yinc, 1));
    }
    if (i < Yquant * (Xquant - 1)) { 
      Particle p3 = particles.get(i + Yquant);
      springs.add(new VerletSpring2D(p1, p3, Xinc, 1));
    }
  }

  for (Particle p : particles) {
    world.addParticle(p);
  }

  for (VerletSpring2D s : springs) {
    world.addSpring(s);
  }

  Particle pI = particles.get(0);
  Particle pF = particles.get(Yquant * (Xquant - 1));

  pI.lock();
  pF.lock();
}
