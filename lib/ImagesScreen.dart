import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic.dart';

bool isLoading = true;

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
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    context.read<ImageCubit>().deactivate();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, List>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(title),
              backgroundColor: Colors.deepPurpleAccent,
            ),
            body: isLoading
                ? Center(
                    child: CircularProgressIndicator(
                    backgroundColor: Colors.deepPurpleAccent,
                    strokeWidth: 5.0,
                  ))
                : ListView.builder(
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
                  ));
      },
    );
  }
}
