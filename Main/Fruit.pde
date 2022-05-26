public class Fruit {

  PImage strawberry;
  PImage cherry;
  PImage apple;
  PImage orange;
  double x,y;
  ArrayList<PImage> randFruit;
  
  public Fruit () {}
  
  public Fruit (float x_, float y_) {
    x = x_;
    y = y_;
  }
  
  void display () {
    strawberry = loadImage("pacmanFruitsStrawberry.png");
    orange = loadImage("pacmanFruitsOrange.png");
    cherry = loadImage("pacmanFruitsCherry.png");
    apple = loadImage("pacmnaFruitsApple.png");
    randFruit.add(strawberry);
    randFruit.add(cherry);
    randFruit.add(apple);
    randFruit.add(orange);
    image(randFruit.get((int)(Math.random() * 3) + 4), )
    
  }

}
