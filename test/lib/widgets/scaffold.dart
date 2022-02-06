import 'package:flutter/material.dart';
import 'list.dart';
import 'form.dart';
import 'car.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isVisible = true;
  bool isCarNewFilter = false;

  var carsList1 = carsList;
  var carsList2 = carsList.where((element) => element.isCarNew).toList();

  _createCar() {
    carsList.add(
      Car(
        color: dropdownValue,
        mileage: int.parse(textFieldController.text),
      ),
    );
  }

  Color dropdownValue = Colors.red;
  TextEditingController textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 400,
            child: Forms(
              color: dropdownValue,
              mileage: textFieldController,
            ),
          ),
          Center(
            child: Container(
              alignment: Alignment.center,
              child: ListView1(
                isVisible: isVisible,
                isCarNewFilter: isCarNewFilter,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => setState(() => _createCar()),
            child: const Text("Add car"),
          ),
          ElevatedButton(
            onPressed: () => setState(() => isVisible = !isVisible),
            child: const Text("Hide"),
          ),
          ElevatedButton(
            onPressed: () => setState(
              () {
                isCarNewFilter = !isCarNewFilter;

                if (isCarNewFilter) {
                  carsList = carsList2;
                } else {
                  carsList = carsList1;
                }
              },
            ),
            child: const Text("Show car"),
          ),
        ],
      ),
    );
  }
}
