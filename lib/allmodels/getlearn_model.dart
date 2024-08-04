
import 'dart:convert';

LearngetMode learngetModeFromJson(String str) => LearngetMode.fromJson(json.decode(str));

String learngetModeToJson(LearngetMode data) => json.encode(data.toJson());

class LearngetMode {
  Data? data;
  Support? support;

  LearngetMode({
    this.data,
    this.support,
  });

  factory LearngetMode.fromJson(Map<String, dynamic> json) => LearngetMode(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    support: json["support"] == null ? null : Support.fromJson(json["support"]),
  );



  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "support": support?.toJson(),
  };
}

class Data {
  int? id;
  String? name;
  int? year;
  String? color;
  String? pantoneValue;

  Data({
    this.id,
    this.name,
    this.year,
    this.color,
    this.pantoneValue,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    year: json["year"],
    color: json["color"],
    pantoneValue: json["pantone_value"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "year": year,
    "color": color,
    "pantone_value": pantoneValue,
  };
}

class Support {
  String? url;
  String? text;

  Support({
    this.url,
    this.text,
  });

  factory Support.fromJson(Map<String, dynamic> json) => Support(
    url: json["url"],
    text: json["text"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "text": text,
  };
}
