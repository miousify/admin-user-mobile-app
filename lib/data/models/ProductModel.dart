class ProductModel {
  String id;
  String title;
  String description;
  String caption;
  double sellingPrice;
  String category;
  bool available;
  String image;

  ProductModel(
      {this.id,
      this.title = "",
      this.description = "",
      this.category = "",
      this.caption = "",
      this.available = true,
      this.sellingPrice = 0,
      this.image = ""}) {
    print(id);
  }
  ProductModel.fromJson(Map map)
      : id = map['_id'],
        title = map["title"],
        description = map['description'],
        caption = map['caption'],
        sellingPrice = map['"sellingPrice'],
        category = map['category'],
        available = map['available'],
        image = map['image'];

  Map getMap() {
    return {};
  }
}

ProductModel model = ProductModel();

class ProductListModel {
  List<ProductModel> items = List<ProductModel>();
  ProductListModel(List convertedList) {
    convertedList.forEach((node) {
      var product = node['item'];
      print(product);
      this.items.add(ProductModel.fromJson(product));
    });
  }
}
