class IndexXML {
  XML xml;
  int lastIndex;
  String name;

  IndexXML(String name) {
    println("LOADING XML "+name);
    xml = loadXML(name);
    this.name = name;
  }

  int readLastIndex() {
    println("READ LAST INDEX");
    int il = xml.getChild("index").getIntContent();
    println("INDEX "+lastIndex);
    return il;
  }

  void writeLastIndex(int lastIndex) {

    XML[] children = xml.getChildren("index");
    for (int i = 0; i < children.length; i++) {
      xml.removeChild(children[i]);
    }

    println("WRITE LAST INDEX");
    this.lastIndex = lastIndex;

    XML xmLImage = xml.addChild("index");
    xmLImage.setIntContent(lastIndex);

    println("LAST INDEX "+lastIndex);
    saveXML(xml, "data/"+name);
  }
}
