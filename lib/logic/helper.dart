///
///
///
///  remove HTML tags without applying its effects
String getTextBodyWithoutHtmlTags(String text) {
  return text
      .replaceAll("<p>", "")
      .replaceAll("</p>", "")
      .replaceAll("<h1>", "")
      .replaceAll("</h1>", "")
      .replaceAll("<h2>", "")
      .replaceAll("</h2>", "")
      .replaceAll("<h3>", "")
      .replaceAll("</h3>", "")
      .replaceAll("<code>", "")
      .replaceAll("</code>", "")
      .replaceAll("<pre>", "")
      .replaceAll("<ol>", "")
      .replaceAll("</ol>", "")
      .replaceAll("<BR/>", "")
      .replaceAll("<strong>", "")
      .replaceAll("</strong>", "")
      .replaceAll("<em>", "")
      .replaceAll("</em>", "");
}
