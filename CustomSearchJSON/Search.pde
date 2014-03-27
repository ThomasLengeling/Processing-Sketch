int Search(int index)  throws MalformedURLException, URISyntaxException, IOException {

  String key = "";
  String qry = "picasso paintings"; // search key word
  String cx  = "";
  String fileType = "png,jpg";
  //String imgType  = "";
  String searchType = "image";
  int start   = index;

  int indexReturn  = index;

  println("START INDEX "+indexReturn);

  //URL url = new URL ("https://www.googleapis.com/customsearch/v1?key=" +key+ "&cx=" +cx+ "&q=" +qry+ "&fileType="+fileType+"&imgType="+imgType+"&searchType="+searchType+"&start="+start+"&num=10&alt=json");

  URL url = new URL ("https://www.googleapis.com/customsearch/v1?key=" +key+ "&cx=" +cx+ "&q=" +qry+ "&fileType="+fileType+"&searchType="+searchType+"&start="+start+"&num=10&alt=json");

  // URL url =  new URL("https://www.googleapis.com/customsearch/v1?q=nebulas&cx=001609494755766729867%3Aez8fjbajppw&key=AIzaSyDoWXkPTvfnzCjmyauvDaRjVyTPpxxYIvM&alt=json");

  HttpURLConnection conn = (HttpURLConnection) url.openConnection();
  conn.setRequestMethod("GET");
  conn.setRequestProperty("Accept", "application/json");
  BufferedReader br = new BufferedReader(new InputStreamReader ( ( conn.getInputStream() ) ) );
  GResults results = new Gson().fromJson(br, GResults.class);

  conn.disconnect();

  for (int i=0; i < 10; i++) {
    results.getThing(i);
    String path  = results.getLink(i);
    try{
    WebImage webImg;
    webImg = new WebImage(path);
    webImg.saveImage();
    imagesWeb.add( webImg );
    wrXML.writeNewImage(i + indexReturn, path);
    }catch(Error e){
     println("error "+e); 
    }
  }

  indexReturn = index + 10;

  println("DONE SAVING IMG LAST INDEX "+indexReturn);
  return indexReturn;
}
