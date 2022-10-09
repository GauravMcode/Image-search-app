import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imageapp/HomePage.dart';

class ImageCubit extends Cubit<List> {
  ImageCubit() : super([]);

  void getImage(String search) async {
    var response = await http.get(Uri.parse(
        "https://pixabay.com/api/?key=30453232-7c71263cd2d9336dd53be6295&q=$search"));

    var data = await json.decode(response.body);
    List imageList = data["hits"];
    print(imageList);
    emit(imageList);
  }

  @override
  void onChange(Change<List> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}
