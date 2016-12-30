// Character in game : Officer
class Officer extends Object {

  private Ball ball;
  private String state;
  private PImage images[];
  private Animation animation;

  // Setup officer
  public Officer(int index, Ball ball) {
    super(index);
    this.ball = ball;
    this.state = "Ready";
    this.images = new PImage[8];
    for (int i = 0; i < images.length; i++) {
      images[i] = loadImage("Officer" + i + ".png");
    }
    animation = new Animation(images);
    animation.setLoop(false);
    animation.setDelay(0.03);
  }

  // Update officer
  public void update() {
    animation.update();
  }

  public void throwing() {    //Officer throw ball
    animation.start();
    println("Officer throw ball");
    float dx = x - mouseX;
    float dy = y - mouseY;
    float dis = dist(x, y, mouseX, mouseY) * 10;
    float rad = atan2(dy, dx);
    ball.throwBall(dis, rad);
  }

  // Draw officer
  public void render() {
    animation.render(x, y);
    if (state.equals("Throw")) {  // Show guideline
      drawGuideline();
    }
  }

  private void drawGuideline() {
    float dx = x - mouseX;
    float dy = y - mouseY;
    float dis = dist(x, y, mouseX, mouseY) * 10;
    float rad = atan2(dy, dx);
    if (dis > MAXU)
      dis = MAXU;
    float xp = x, yp = y, ux = dis * cos(rad), uy = dis * sin(rad);
    for (float i = 0; i < 1; i += 0.1) {
      xp = x + ux * i;
      yp = y + (uy * i +  0.5 * g * i * i);
      fill(255, 255, 255);
      noStroke();
      ellipse(xp, yp, 5, 5);
    }
  }

  public Ball getBall() {
    return ball;
  }

  public String getState() {
    return state;
  }

  public void setBall(Ball ball) {
    this.ball = ball;
  }

  public void setState(String state) {
    this.state = state;
  }
}