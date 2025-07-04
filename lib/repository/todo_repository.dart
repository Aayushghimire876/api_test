import 'dart:convert';
import 'dart:math';

import 'package:api_test/model/todo_model.dart';
import 'package:http/http.dart' as http;

class TodoRepository {
  static Future<List<TodoModel>?> get todoModelList => null;

  static Future<List<TodoModel>?> fetchAlbum() async {
    final String url =
        'https://6866622d89803950dbb27925.mockapi.io/ap1/v1/GroceryItems';

        try {
          final response = await http.get(Uri.parse(url));

          if (response.statusCode == 200)  {
            final dataList =jsonDecode(response.body) as List<dynamic>?;

            // final todoModelList =
            //     dataList?.map((e) =>TodoModel fromJson((e)

            final todomodellist =dataList?.map((e) => TodoModel.fromJson((e)).to List() ?? []; 

            var todoModelList2 = todoModelList;
            for (var i in todoModelList2)  {
              log(i.title);
            }

           log(response.statusCode.toString() as num);


           return todoModelList;

          }

          return [;
        }catch (e) {
          log("Error ${e.toString()}" as num);
      