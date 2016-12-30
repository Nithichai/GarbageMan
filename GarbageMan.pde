class GarbageManGame {
  private Officer officer;    // Create Officer
  private Ball ball;          // Create Garbage ball
  private Crusher crusher;    // Create Crusher
  private String mouseState;  // Mouse's state

  public GarbageManGame() {   // Constructor
    ball = new Ball(0);       // Crerate ball
    officer = new Officer(1, ball);    // Create officer
    crusher = new Crusher(2);          // Create crusher
    mouseState = "None";               // Set mouse's state
  }

  public void update() {    // Update game
    ball.collisionSwitch(crusher);    // Collision ball and switch
    officer.update();       // Update officer
    ball.update();          // Update ball
    crusher.update();       // Update crusher
  }

  public void render() {    // Render game
    officer.render();       // Draw officer
    ball.render();          // Draw crusher
    crusher.render();  // Draw crusher
  }

  public void mousePressed() {    // Work when mouse is pressed
    if (mouseState.equals("None") && !ball.getState().equals("Throw")) {  // Mouse is not pressed and ball is not thrown ??
      float dis = dist(officer.getX(), officer.getY(), mouseX, mouseY);   // get distance from mouse and officer
      if (dis < officer.getW()) {    // Mouse is not in officer?
        println("Pressed");
        mouseState = "Pressed";      // Mouse's state is pressed
      }
    }
  }

  public void mouseDragged() {    // Work when mouse is dragged
    if (mouseState.equals("Pressed")) {    // Mouse is pressed ??
      println("Dragged");
      mouseState = "Dragged";     // Mouse's state is dragged
      officer.setState("Throw");  // Officer's state is throw
    }
  }

  public void mouseReleased() {    // Work when mouse is dragged
    if (mouseState.equals("Dragged")) {    // Mouse's state is dragged
      println("Released");
      mouseState = "None";      // Mouse's state is None (Released)
      ball.reset();             // Reset ball
      ball.setState("Throw");   // Set ball's state is throw
      officer.setState("Ready");// Set officer's state is ready
      officer.throwing();       // Officer throw ball
    } else if (!ball.getState().equals("Throw")) {  // Ball's state is thrown ??
      println("Released");
      mouseState = "None";      // Mouse's state is None
      officer.setState("Ready");  // Officer's state is ready
      ball.setState("Stop");    // Ball's state is stop
    }
  }
}

GarbageManGame garbageManGame;    // Create game
String[] strs;        // Data from textfile
final float g = 10;   // Gravity
final float MAXU = 150;  // Max velocity
PImage bg;            // Create background image

void setup() {     // Setup
  fullScreen();    // Size of game 
  frameRate(30);   // Set framerate
  strs = loadStrings("data.txt");  // read date from textfile
  bg = loadImage("bg.png");    // Load background
  garbageManGame = new GarbageManGame();  // Set game
}

void draw() {    // Draw game
  imageMode(CORNER);
  image(bg, 0, 0, width, height);    // Set background
  garbageManGame.update();    // Update game 
  garbageManGame.render();    // Draw game
}

void mousePressed() { 
  garbageManGame.mousePressed();
}

void mouseDragged() {
  garbageManGame.mouseDragged();
}

void mouseReleased() {
  garbageManGame.mouseReleased();
}