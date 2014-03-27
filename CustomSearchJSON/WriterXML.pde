class WriterXML {
  XML xml;

  WriterXML(String name) {
    println("LOADING XML "+name);
    xml = loadXML(name);
  }

  void writeNewImage(int index, String url) {
    XML xmImage = xml.addChild("image");

    XML indexXML  = xmImage.addChild("index");
    indexXML.setIntContent(index);

    XML urlXML     = xmImage.addChild("url");
    urlXML.setContent(url);

    saveXML(xml, "data/imagenes.xml");
  }

  void writeNewImage(int index, String url, String title, String filename) {
    XML xmImage = xml.addChild("image");

    XML indexXML  = xmImage.addChild("index");
    indexXML.setIntContent(index);

    XML urlXML     = xmImage.addChild("url");
    urlXML.setContent(url);

    XML titleXML  = xmImage.addChild("title");
    titleXML.setContent(title);

    XML fileXML     = xmImage.addChild("filename");
    fileXML.setContent(filename);

    saveXML(xml, "data/imagenes.xml");
  }
}
