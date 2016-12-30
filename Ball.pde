class Ball extends Object {
  private float ux, uy;    // Velocity x and y
  private String state;    // State of ball
  private double start;     // Start time
  private float xStart, yStart;    // Reference position
  private PImage pic;      // Picture of ball
  private float degree;    // Degree of garbage

  public Ball(int index) {    // Constructor
    super(index);
    // Cannot reset
    this.pic = loadImage("Garbage.png");    // Get picture
    // Can reset
    this.xStart = this.x;
    this.yStart = this.y;
    this.state = "Stop";      // State is stop
    this.start = getTimeMillis();    // Start time point
    print("Create ball");
  }

  public void reset() {    // Reset ball
    String[] data = getFileData(this.index, ",");    // get data from textfile
    start(data);
    println(data[1]);
    this.xStart = this.x;
    this.yStart = this.y;
    this.degree = 0;
    this.state = "Stop";
    this.start = getTimeMillis();
    println("Reset ball");
  }

  public void update() {    // Update garbage
    if (state.equals("Throw")) {      // State is throw ??
      double t = (getTimeMillis() - start) * 10;    // Get time
      this.x = (float)(this.xStart + this.ux * t);          // Set x
      this.y = (float)(this.yStart + (this.uy * t + 0.5 * g * t * t));    // set y
      if (x < 0 || x > width || y > height)    // Ball is out of frame
        state = "Stop";    // State is stop
      degree += 15;    // Add degree of garbage
    } else {
      this.degree = 0;    // Reset degree
      this.start = getTimeMillis();    // Reset time
    }
    // println("Update Ball");
  }

  public void render() {    // Draw garbage
    if (state.equals("Throw")) {    // State is throw ??
      pushMatrix();
      translate(this.x, this.y);
      rotate(radians(this.degree));    // Rotate garbage
      image(this.pic, 0, 0);     // Draw garbage
      popMatrix();
      // println("Draw Ball");
    }
  }

  private float getTimeMillis() {    // Get time
    return (1000 / frameRate * frameCount) / 1000;
  }

  public void throwBall(float u, float rad) {    // Ball is thrown
    if (u > MAXU)     // Limit u
      u = MAXU;
    this.ux = u * cos(rad);    // Set ux and uy
    this.uy = u * sin(rad);
    println("Ball is thrown");
  }

  public void collisionSwitch(Crusher crusher) {    // Collision of ball and switch
    if (x > crusher.getXSw()) {
      if (y >= crusher.getYSw() && y <= crusher.getYSw() + crusher.getHSw()) {
        // println("Ball touch switch");
        crusher.setDx(0);  //
        state = "Stop";
      } else {
        state = "Stop";
      }
    }
  }

  public float getUx() {
    return ux;
  }

  public float getUy() {
    return uy;
  }

  public String getState() {
    return state;
  }

  public void setUx(float ux) {
    this.ux = ux;
  }

  public void setUy(float uy) {
    this.uy = uy;
  }

  public void setState(String state) {
    this.state = state;
  }
}