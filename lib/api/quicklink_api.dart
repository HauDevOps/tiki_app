import 'dart:convert';

QuickLink welcomeFromJson(String str) => QuickLink.fromJson(json.decode(str));

String welcomeToJson(QuickLink data) => json.encode(data.toJson());

class QuickLink {
  QuickLink({
    this.data,
  });

  List<QuickLinkData> data;

  QuickLink.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<QuickLinkData>();
      json['data'].forEach((v) {
        data.add(new QuickLinkData.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuickLinkData {
  QuickLinkData({
    this.title,
    this.content,
    this.url,
    this.authentication,
    this.webUrl,
    this.imageUrl,
  });

  String title;
  Content content;
  String url;
  bool authentication;
  String webUrl;
  String imageUrl;

  factory QuickLinkData.fromJson(Map<String, dynamic> json) => QuickLinkData(
        title: json["title"],
        content: contentValues.map[json["content"]],
        url: json["url"],
        authentication: json["authentication"],
        webUrl: json["web_url"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": contentValues.reverse[content],
        "url": url,
        "authentication": authentication,
        "web_url": webUrl,
        "image_url": imageUrl,
      };
}

enum Content { EMPTY, TIKI_LIVE }

final contentValues =
    EnumValues({"": Content.EMPTY, "TikiLIVE": Content.TIKI_LIVE});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
