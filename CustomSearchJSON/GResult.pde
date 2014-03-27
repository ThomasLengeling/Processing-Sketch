import java.util.List;

public class GResults {

  public String link;
  public String htmlFormattedUrl;

  public List<GResults> items;

  public String getLink() {
    return link;
  }

  public String getUrl() {
    return htmlFormattedUrl;
  }

  public void setUrl(String htmlFormattedUrl) {
    this.htmlFormattedUrl = htmlFormattedUrl;
  }

  public List<GResults> getItems() {
    return items;
  }

  public void setLink(String link) {
    this.link = link;
  }

  public void setGroups(List<GResults> items) {
    this.items = items;
  }

  public void getThing (int i) {
    System.out.println(items.get(i));
  }

  public String getLink(int i) {
    return items.get(i).toString();
  }

  public String toString() {
    return String.format("%s", link);
  }
}
