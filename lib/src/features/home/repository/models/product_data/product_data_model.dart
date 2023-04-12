class ProductDataModel {
  int? id;
  String? name;
  String? barcode;
  String? description;
  SubCategory? subCategory;
  Category? brand;
  Quantity? quantity;
  ProductPrice? productPrice;
  String? image;

  ProductDataModel(
      {this.id,
      this.name,
      this.barcode,
      this.description,
      this.subCategory,
      this.brand,
      this.quantity,
      this.productPrice,
      this.image});

  ProductDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    barcode = json['barcode'];
    description = json['description'];
    subCategory = json['subCategory'] != null
        ? SubCategory.fromJson(json['subCategory'])
        : null;
    brand = json['brand'] != null ? Category.fromJson(json['brand']) : null;
    quantity =
        json['quantity'] != null ? Quantity.fromJson(json['quantity']) : null;
    productPrice = json['productPrice'] != null
        ? ProductPrice.fromJson(json['productPrice'])
        : null;
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> mapData = {};
    mapData['id'] = id;
    mapData['name'] = name;
    mapData['barcode'] = barcode;
    mapData['description'] = description;
    if (subCategory != null) {
      mapData['subCategory'] = subCategory!.toJson();
    }
    if (brand != null) {
      mapData['brand'] = brand!.toJson();
    }
    if (quantity != null) {
      mapData['quantity'] = quantity!.toJson();
    }
    if (productPrice != null) {
      mapData['productPrice'] = productPrice!.toJson();
    }
    mapData['image'] = image;
    return mapData;
  }
}

class SubCategory {
  int? id;
  String? name;
  String? image;
  String? description;
  Category? category;

  SubCategory(
      {this.id, this.name, this.image, this.description, this.category});

  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> mapData = {};
    mapData['id'] = id;
    mapData['name'] = name;
    mapData['image'] = image;
    mapData['description'] = description;
    if (category != null) {
      mapData['category'] = category!.toJson();
    }
    return mapData;
  }
}

class Category {
  int? id;
  String? name;
  String? image;
  String? description;

  Category({this.id, this.name, this.image, this.description});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> mapData = {};
    mapData['id'] = id;
    mapData['name'] = name;
    mapData['image'] = image;
    mapData['description'] = description;
    return mapData;
  }
}

class Quantity {
  int? id;
  int? quantity;
  String? unit;
  double? unitValue;
  int? pastQuantity;

  Quantity(
      {this.id, this.quantity, this.unit, this.unitValue, this.pastQuantity});

  Quantity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    unit = json['unit'];
    unitValue = json['unitValue'];
    pastQuantity = json['pastQuantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> mapData = {};
    mapData['id'] = id;
    mapData['quantity'] = quantity;
    mapData['unit'] = unit;
    mapData['unitValue'] = unitValue;
    mapData['pastQuantity'] = pastQuantity;
    return mapData;
  }
}

class ProductPrice {
  int? id;
  double? price;
  double? unitPrice;
  double? mrp;

  ProductPrice({this.id, this.price, this.unitPrice, this.mrp});

  ProductPrice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    unitPrice = json['unitPrice'];
    mrp = json['mrp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> mapData = {};
    mapData['id'] = id;
    mapData['price'] = price;
    mapData['unitPrice'] = unitPrice;
    mapData['mrp'] = mrp;
    return mapData;
  }
}
