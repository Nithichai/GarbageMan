class Animation {
  private int frames;       // Frame number
  private boolean isLoop;   // animation's loop
  private float delay;      // Delay of animaion
  private PImage[] pics;    // Pictures of anitmation
  private float startTime;  // point of time
  private String state;     // state of animation

  public Animation (PImage[] pics) {    // Constructor
    println("Start Animation");
    this.pics = pics;    // Set pictures
    state = "Stop";      // State is stop
  }

  public void start() {     // Start animation
    startTime = getTime();  // Get time
    frames = 0;             // Frame number is 0
    state = "Play";         // State is play
  }

  public void update() {      // Update animation
    if (state.equals("Play")) {    // State is play ??
      if (getTime() - startTime > delay && frames != pics.length - 1) {  // this frame is delay and frame is max
        frames++;    // Add number frame
        startTime = getTime();    // Start new time's point
      }
      if (isLoop && frames == pics.length - 1) {    // Animation should be looped and frame is  ??
        frames = 0;    // Frame is zero
      } else if (frames == pics.length - 1){    // Frame is max ??
        state = "Stop";    // State is stop
      }
    }
  }

  public void render(float x, float y) {    // Draw animation
    imageMode(CENTER);
    image(pics[frames], x, y);
  }

  public boolean getLoop() {
    return isLoop;
  }

  public void setLoop(boolean isLoop) {
    this.isLoop = isLoop;
  }
  
  public float getDelay() {
    return delay;
  }
  
  public void setDelay(float delay) {
    this.delay = delay;
  }

  private float getTime() {
    return (1000 / frameRate * frameCount) / 1000;
  }
}