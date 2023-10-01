import 'package:adhkar/features/adhkar/data/models/category_model.dart';
import 'package:adhkar/features/adhkar/data/models/dhikr_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:adhkar/core/app/net/api.dart';

abstract class RemoteAdhkarDataSource {
  Future<List<CategoryModel>> getCategories();
  Future<List<DhikrModel>> getAdhkar(int id);
}

class RemoteAdhkarDataSourceImpl extends RemoteAdhkarDataSource {
  @override
  Future<List<DhikrModel>> getAdhkar(int id) async {
    //empty response : {"success":true,"data":[],"message":"Posts retrieved successfully"}
    //data => {"data":[{"id":1,"category_id":1,"title":"","content":"","image":"","audio":"","count":100,"created_at":null,"updated_at":null}]}
    var reponse = await http.get(Uri.parse(API.adhkar + '?category_id=$id'));
    if (reponse.statusCode == 200) {
      var jsonObject = json.decode(reponse.body);
      return DhikrModel.listFromJson(jsonObject['data']);
    } else {
      print("can't get adhkar; error ${reponse.statusCode}");
      throw Exception('error ${reponse.statusCode}');
    }
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    var reponse = await http.get(Uri.parse(API.categories));
    print(reponse);
    if (reponse.statusCode == 200) {
      var jsonObject = json.decode(reponse.body);
      return CategoryModel.listFromJson(jsonObject['data']);
    } else {
      print("can't get adhkar; error ${reponse.statusCode}");
      throw Exception('error ${reponse.statusCode}');
    }
  }
}

// class RemoteAdhkarWithDio extends RemoteAdhkarDataSource {
//   @override
//   Future<List<DhikrModel>> getAdhkar(int id) async {
//     final a = await DioHelper.getDio()
//         .get(API.adhkar)
//         .then((response) => {print(response), DhikrModel.listFromJson(response)})
//         .catchError((onError, stackTrace) => {print("can't get adhkar; error $stackTrace"), throw Exception('error $onError')});
//     //TODO
//     throw UnimplementedError();
//   }

//   @override
//   Future<List<CategoryModel>> getCategories() {
//     // TODO: implement getCategories
//     throw UnimplementedError();
//   }
// }
