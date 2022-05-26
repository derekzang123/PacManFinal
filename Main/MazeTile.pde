public class MazeTile {
  
  double x,y;
  int width_ = 8;
  int height_ = 8;
  
  public MazeTile () {}
  
  public MazeTile (float x_, float y_, int w, int h) {
    x = x_;
    y = y_;
    width_ = w;
    height_ = h;
  }
  
  void display () {
    rect((float)x,(float)y,width_,height_);
  }
  
}
