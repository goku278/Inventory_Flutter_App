class Items {
  Items({
    int? itemId,
    String? name,
    double? price,
    String? image,
    String? description
  }) {
    _itemId = itemId;
    _name = name;
    _price = price;
    _image = image;
    _description = description;
  }

  Items.fromJson(dynamic json) {
    _itemId = json['itemId'];
    _name = json['name'];
    _price = json['price'];
    _image = json['image'];
    _description = json['description'];
  }

  int? _itemId;
  String? _name;
  double? _price;
  String? _image;
  String? _description;

  int? get itemId => _itemId;

  String? get name => _name;

  double? get price => _price;

  String? get image => _image;

  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['itemId'] = _itemId;
    map['name'] = _name;
    map['price'] = _price;
    map['image'] = _image;
    map['description'] = _description;
    return map;
  }
}
