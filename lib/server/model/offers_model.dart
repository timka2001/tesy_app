import 'dart:convert';

Offers offersFromJson(String str) => Offers.fromJson(json.decode(str));

String offersToJson(Offers data) => json.encode(data.toJson());

class Offers {
  List<Offer> offers;

  Offers({
    required this.offers,
  });

  factory Offers.fromJson(Map<String, dynamic> json) => Offers(
        offers: List<Offer>.from(json["offers"].map((x) => Offer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "offers": List<dynamic>.from(offers.map((x) => x.toJson())),
      };
}

class Offer {
  int id;
  String title;
  String town;
  Price price;

  Offer({
    required this.id,
    required this.title,
    required this.town,
    required this.price,
  });

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        id: json["id"],
        title: json["title"],
        town: json["town"],
        price: Price.fromJson(json["price"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "town": town,
        "price": price.toJson(),
      };
}

class Price {
  int value;

  Price({
    required this.value,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
      };
}
