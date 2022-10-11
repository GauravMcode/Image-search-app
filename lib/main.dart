import 'package:flutter/material.dart';
import 'package:imageapp/logic.dart';
import 'HomePage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ImageCubit>(
          create: (context) => ImageCubit(),
        ),
        // BlocProvider<LoadingCubit>(
        //   create: (context) => LoadingCubit(),
        // )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Image App",
        home: HomePage(),
      ),
    );
  }
}
