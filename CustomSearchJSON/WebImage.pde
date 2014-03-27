class WebImage {
  PImage imageWeb;
  String path;
  String name;

  boolean nullImage = false;

  WebImage(String path) {
    this.path = path;
    try {
      imageWeb = loadImage(path); //java.io.IOException
      nullImage = false;
    }
    catch(NullPointerException e) {
      println(e);
      nullImage = true;
    }
  }

  void draw() {
    //   if (imageWeb != null) {
    //    image(imageWeb, 0, 0, width, height);

    //stroke(255);
    //text(path, 50, 250);
    //   }
  }

  void saveImage() {
    if (imageWeb != null) {
      name  = checkPath(path);
      imageWeb.save("data/"+name);
      stroke(255);
      text(name +"...saving", 50, 250);
    }
  }

  String checkPath(String s) {
    String[] names = splitTokens(s, "/");
    name = names[names.length - 1];
    return name;
  }
}
