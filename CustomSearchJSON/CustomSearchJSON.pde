import java.net.URL;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.io.Reader.*;
import java.io.InputStreamReader;

import com.google.gson.Gson;

/*
start every search 0 -10, .. 500
 */

ArrayList imagesWeb;

int currIndexImages = 0;
int startIndex      = 1;

int tmpIndex        = 0;

PFont f;

//XMLs
IndexXML  rdXML;
WriterXML wrXML;

Timer time;

void setup() {
  size(300, 300);

  //FONT
  //printArray(PFont.list());
  f = createFont("Georgia", 16);
  textFont(f);

  //XML
  rdXML =  new IndexXML("lastIndex.xml");
  wrXML =  new WriterXML("imagenes.xml");

  startIndex = rdXML.readLastIndex();
  tmpIndex   = startIndex;
  println("START INDEX");
  println(startIndex);

  imagesWeb = new ArrayList();

  time = new Timer(int(60000 * 3.0));

  /*
  try {
    tmpIndex =  Search(startIndex);
  }
  catch(MalformedURLException ex) {
    println(ex);
  }
  catch( URISyntaxException ex) {
    println(ex);
  }
  catch( IOException ex) {
    println(ex);
  }
  */
}

void draw() {
  background(0);
  if (imagesWeb.size() > 0) {
    WebImage wImg = (WebImage)imagesWeb.get(currIndexImages);
    wImg.draw();
  }

  time.update();

  float tm = time.getCurrentTime();
  text(tm, 50, 50);
  text( ((time.end==true)? "true":"false"), 50, 80);
  text(tmpIndex, 50, 120);

  if (time.end == true) {
    try {
      startIndex = Search(tmpIndex);
    }
    catch(MalformedURLException ex) {
      println(ex);
    }
    catch( URISyntaxException ex) {
      println(ex);
    }
    catch( IOException ex) {
      println(ex);
    }
    rdXML.writeLastIndex(startIndex);
    tmpIndex = startIndex;
    time.restart();
    imagesWeb.clear();
  }
}


void keyPressed() {
  if (key == 'a') {
    if (currIndexImages > 0)
      currIndexImages--;
  }

  if (key == 's') {
    if (currIndexImages < imagesWeb.size() - 1)
      currIndexImages++;
  }

  if (key == 'm') {
    println( rdXML.readLastIndex() );
  }

  if ( key == 'n') {
    rdXML.writeLastIndex((int)random(100));
  }
}
