class Crusher extends Object {

  private float dx;    // Speed
  private PImage pic;
  private float xSw, ySw, wSw, hSw;

  public Crusher(int index) {    // Constructor
    super(index);
    String[] data = getFileData(index, ",");    // Get data from textfile
    int level = int(data[5]);                   // Get level of switch
    pic = loadImage("CrusherLV" + level + ".png");    // Set image
    this.xSw = x;
    this.ySw = level * height / 6;
    this.wSw = w;
    this.hSw = 1 * height / 6;
    println(hSw);
    this.dx = float(data[6]);      // Set dx
  }

  public void update() {    // Update crusher
    x += dx;    // Add x by dx
    xSw = x;
  }

  public void render() {    // Draw crusher
    imageMode(CORNER);
    image(pic, x, y);
  }

  public float getDx() {
    return dx;
  }
  
  public float getXSw() {
    return this.xSw;
  }
  
  public float getYSw() {
    return this.ySw;
  }
  
  public float getWSw() {
    return this.wSw;
  }
  
  public float getHSw() {
    return this.hSw;
  }

  public void setDx(float dx) {
    this.dx = dx;
  }
}