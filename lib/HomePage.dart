import 'package:flutter/material.dart';
import 'package:imageapp/ImagesScreen.dart';
import 'package:imageapp/logic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

String searchWord = "";
List cubitList = [];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String search = "";
  TextEditingController imageForSearch = TextEditingController();

  navigateToImages() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: ((_) => ImagesScreen(
            search.replaceFirst(search[0], search[0].toUpperCase()))),
      ),
    );
  }

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
        title: Text("Images App"),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: BlocBuilder<ImageCubit, List>(
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background.jpg"),
                  fit: BoxFit.cover),
            ),
            child: Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 100.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.only(left: 20.0)),
                    SizedBox(
                      width: 300.0,
                      child: Card(
                        borderOnForeground: true,
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.blue, style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(20.0)),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(10.0),
                            hintText: "Search for images",
                            hintStyle: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          onChanged: (value) {
                            search = imageForSearch.text;
                            searchWord = search.replaceAll(" ", "+");
                          },
                          controller: imageForSearch,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 15.0),
                      child: IconButton(
                        onPressed: () async {
                          context.read<ImageCubit>().getImage(searchWord);
                          cubitList = await context.read<ImageCubit>().state;
                          navigateToImages();
                        },
                        icon: Icon(
                          Icons.image_search_rounded,
                          color: Colors.white,
                          size: 50.0,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
