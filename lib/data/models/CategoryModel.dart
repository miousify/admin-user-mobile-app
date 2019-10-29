class CategoryModel {
  String id;
  String description;
  String caption;
  double sellingPrice;
  String category;
  bool available;
  String image;

  CategoryModel(
      {this.id,
      this.description = "",
      this.category = "",
      this.caption = "",
      this.available = true,
      this.sellingPrice = 0,
      this.image = ""}) {
    print(id);
  }

  CategoryModel.fromJson(Map map)
      : id = map['_id'],
        description = map['description'],
        caption = map['caption'],
        sellingPrice = map['"sellingPrice'],
        category = map['category'],
        available = map['available'],
        image = map['image'];
}

class CategoryListModel {
  List<CategoryModel> items = List<CategoryModel>();
  CategoryListModel(List convertedList) {
    convertedList.forEach((node) {
      var product = node['item'];
      this.items.add(CategoryModel.fromJson(product));
    });
  }
}
