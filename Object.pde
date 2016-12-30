// Character in game
class Object {
  
  protected String type;        // Type of object
  protected String[] data;
  protected float x, y, w, h;   // x, y, width and height
  protected int index;

  // Setup Object
  public Object(int index) {
    this.index = index;
    data = getFileData(index, ",");
    start(data);
  }
  
  public void start(String[] data) {
    // Set data that from textfile
    this.type = data[0];
    this.x = Float.parseFloat(data[1]) * width;
    this.y = Float.parseFloat(data[2]) * height;
    if(data[3].equals("width")) this.w = width;    // String is width -> w = width of monitor
    else this.w = Float.parseFloat(data[3]) * height;
    if(data[4].equals("height")) this.h = height;  // String is height -> h = height of monitor
    else this.h = Float.parseFloat(data[4]) * height;
  }
  
  public String[] getFileData(int index, String split) {  // Split data from that index line
    String[] data = split(strs[index], split);
    return data;
  }

  // Returning value
  public String getType() {
    return this.type;
  }
  
  public String[] getData() {
    return this.data;
  }

  public float getX() {
    return this.x;
  }

  public float getY() {
    return this.y;
  }

  public float getW() {
    return this.w;
  }

  public float getH() {
    return this.h;
  }

  // Setting value
  public void setType(String type) {
    this.type = type;
  }
  
  public void setData(String[] data) {
    this.data = data;
  }

  public void setX(float x) {
    this.x = x * width;
  }

  public void setY(float y) {
    this.y = y * height;
  }

  public void setW(float w) {
    this.w = w * width;
  }

  public void setH(float h) {
    this.h = h * height;
  }
}