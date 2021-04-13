import 'dart:convert';

QuickLink dataFromJson(String str) => QuickLink.fromJson(json.decode(str));

String dtaToJson(QuickLink quickLink) => json.encode(quickLink.toJson());

class QuickLink {
  QuickLink({
    this.data,
  });

  List<List<ItemQuickLink>> data;

  factory QuickLink.fromJson(Map<String, dynamic> json) => QuickLink(
    data: List<List<ItemQuickLink>>.from(json["data"].map((x) => List<ItemQuickLink>.from(x.map((x) => ItemQuickLink.fromJson(x))))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
  };
}

class ItemQuickLink {
  ItemQuickLink({
    this.title,
    this.content,
    this.url,
    this.authentication,
    this.webUrl,
    this.imageUrl,
  });

  String title;
  String content;
  String url;
  bool authentication;
  String webUrl;
  String imageUrl;

  factory ItemQuickLink.fromJson(Map<String, dynamic> json) => ItemQuickLink(
    title: json["title"],
    content: json["content"],
    url: json["url"],
    authentication: json["authentication"],
    webUrl: json["web_url"],
    imageUrl: json["image_url"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "content": content,
    "url": url,
    "authentication": authentication,
    "web_url": webUrl,
    "image_url": imageUrl,
  };
}

