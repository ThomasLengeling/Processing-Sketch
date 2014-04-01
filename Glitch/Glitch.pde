import processing.video.*;

Capture video;

PImage img;

void setup() {
  size(640, 480);
  video = new Capture(this, width, height);
  video.start();
}

void captureEvent(Capture camera) {
  camera.read();

  img = createImage(width, height, RGB);
  video.loadPixels();
  arrayCopy(video.pixels, img.pixels);
}

void draw() {

  loadPixels();

  int randPos = 0;
  if (frameCount  % 100 == 0)
    randPos = (int)random(0, video.height -4);

  int randPosY = 0;

  // if (frameCount  % 100 == 0)
  randPosY = (int)random(20, 50);

  // Begin a loop for displaying pixel rows of 4 pixels height
  for (int y = 0; y < video.height -57; y++) {
    if (img != null) {
      img.loadPixels();

      // Put 4 rows of pixels on the screen
      if (frameCount % 50 == 0)
        randPosY = (int)random(20, 50);
      for (int x = 0; x < video.width; x++) {
        if (frameCount % 100 == 0)
          randPosY = (int)random(20, 50);
        if (y < video.height -4) {
          pixels[x + (y + 0 + randPosY)* width] = img.pixels[  (y + 0 )* video.width + randPos + x];
          pixels[x + (y + 1 + randPosY) * width] = img.pixels[ (y + 1) * video.width + randPos + 1 + x];
          pixels[x + (y + 2 + randPosY) * width] = img.pixels[ (y + 2) * video.width + randPos + 2 + x];
          pixels[x + (y + 3 + randPosY) * width] = img.pixels[ (y + 3) * video.width + randPos + 3 + x];

          pixels[x + (y + 4 + randPosY)* width] = img.pixels[  (y + 4 )* video.width + randPos + 4 + x];
          pixels[x + (y + 5 + randPosY) * width] = img.pixels[ (y + 5) * video.width + randPos + 5 + x];
          pixels[x + (y + 6 + randPosY) * width] = img.pixels[ (y + 6) * video.width + randPos + 6 + x];
          pixels[x + (y + 7 + randPosY) * width] = img.pixels[ (y + 7) * video.width + randPos + 7 + x];
        }
      }
    }
    else {
      break;
    }
  }

  updatePixels();

}
