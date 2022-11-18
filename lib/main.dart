import 'package:flutter/material.dart';
import 'package:csim/constants/global_variables.dart';
import 'package:csim/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CSIM',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hello. '),
        ),
        body: Column(
          children: [
            const Center(
              child: const Text(
                'Flutter Demo Home Page',
              ),
            ),
            Builder(builder: (context) {
             return ElevatedButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, AuthScreen.routeName)
                  },
                  child: Text('Click'),);
          
  }),
          ],
        ),
      ),
    );
  }
}
