import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic.dart';

class ImagesScreen extends StatefulWidget {
  final title;
  ImagesScreen(this.title);

  @override
  State<ImagesScreen> createState() => _ImagesScreenState(this.title);
}

class _ImagesScreenState extends State<ImagesScreen> {
  final title;
  String _imageUrl = "";

  _ImagesScreenState(this.title);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    context.read<ImageCubit>().close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(title),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: BlocBuilder<ImageCubit, List>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: context.read<ImageCubit>().state.length,
              itemBuilder: ((context, index) {
                return Container(
                  child: Image(
                      image: NetworkImage(context
                          .watch<ImageCubit>()
                          .state[index]["webformatURL"]),
                      fit: BoxFit.contain),
                );
              }),
            );
          },
        ));
  }
}
