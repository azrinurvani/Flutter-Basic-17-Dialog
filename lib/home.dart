import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String data = "Belum ada input";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dialog"),
      ),
      body: Center(
        child: Text(
          data,
          style: TextStyle(
            fontSize: 35,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Telah diklik");
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Confirm"),
                content: const Text("Are you sure to delete this item ?"),
                actions: [
                  TextButton(
                    onPressed: () {
                      print("Klik No");
                      setState(() {
                        data = "FALSE";
                      });

                      Navigator.of(context)
                          .pop(false); //membuang lapisan terluar
                    },
                    child: const Text("No"),
                  ),
                  TextButton(
                    onPressed: () {
                      print("Klik Yes");
                      setState(() {
                        data = "TRUE";
                      });

                      Navigator.of(context)
                          .pop(true); //membuang lapisan terluar
                    },
                    child: const Text("Yes"),
                  ),
                ],
              );
            },
          ).then((value) => print(value));
        },
        child: const Icon(Icons.delete),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
