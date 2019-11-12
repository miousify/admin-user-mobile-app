class StoreModel {
  String id;
  String description;
  String caption;
  double sellingPrice;
  String category;
  bool available;
  String image;

  StoreModel(
      {this.id,
      this.description = "",
      this.category = "",
      this.caption = "",
      this.available = true,
      this.sellingPrice = 0,
      this.image = ""}) {
    print(id);
  }

  StoreModel.fromJson(Map map)
      : id = map['_id'],
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
