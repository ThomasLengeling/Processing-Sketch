import oscP5.*;
import netP5.*;

OscP5 oscP5;

boolean msg = false;

void setupOSC() {
  oscP5 = new OscP5(this, 32000);
}


void oscEvent(OscMessage theOscMessage) {
  //imprime informacion sobre le mensaje recibido
  //  print("### received an osc message.");
  //  println(theOscMessage.addrPattern());
  //  println(" typetag: "+theOscMessage.typetag());

  if ( theOscMessage.checkAddrPattern("/amp")) {
    //  println("tag "+theOscMessage.get(0).intValue());
    float val = theOscMessage.get(1).floatValue();
    if (msg) println("amp/ "+val);
 //   gpAmp.updateLinear(val);
  }
  else if ( theOscMessage.checkAddrPattern("/pitch")) {
    //    println("tag "+theOscMessage.get(0).intValue());
    float val = theOscMessage.get(1).floatValue();
    if (msg)  println("freq/ "+val);
  //  gpPitch.updateLog(val);
  }
  
  else if ( theOscMessage.checkAddrPattern("/onset")) {
    //  println("tag "+theOscMessage.get(0).intValue());
    int val = theOscMessage.get(0).intValue();
    if(msg)   println("onset/ "+val);
 //   gpOnset.update();
  }
}

