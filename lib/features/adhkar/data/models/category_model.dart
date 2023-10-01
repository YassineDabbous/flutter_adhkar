import 'package:adhkar/features/adhkar/domain/entities/category.dart';

class CategoryModel extends Category {
  int id;
  String name;
  String image;
  int count;

  CategoryModel(this.id, this.name, this.image, this.count) : super(id, name, image, count);

  factory CategoryModel.fromJson(dynamic json) {
    print(json.toString());
    return CategoryModel(json['id'] as int, json['name'] as String, json['image'] as String, json['count'] as int);
  }

  static List<CategoryModel> listFromJson(dynamic json) {
    var jsonList = json as Iterable;
    return jsonList.map((e) => CategoryModel.fromJson(e)).toList();
  }
}
