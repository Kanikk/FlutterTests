import 'package:flutter/material.dart';
import 'car.dart';

class ListView1 extends StatefulWidget {
  final bool isVisible;
  final bool isCarNewFilter;
  const ListView1({
    Key? key,
    required this.isVisible,
    required this.isCarNewFilter,
  }) : super(key: key);

  @override
  State<ListView1> createState() => _ListView1State();
}

class _ListView1State extends State<ListView1> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: carsList.length,
      itemBuilder: (context, index) {
        final carElement = carsList[index];
        return Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: ListTile(
                  trailing: Column(
                    children: [
                      const Text("Color"),
                      Container(
                        color: carElement.color,
                        width: 15,
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: ListTile(
                  title: Text(
                    carElement.brand.displayTile,
                  ),
                ),
              ),
              if (widget.isVisible)
                Expanded(
                  child: ListTile(
                    title: Text(
                      carElement.milageKM,
                    ),
                  ),
                ),
              if (widget.isVisible)
                Expanded(
                  child: Column(
                    children: [
                      const ListTile(
                        title: Text(
                          "Is car new:",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Form(
                        child: CheckboxListTile(
                          value: carElement.isCarNew,
                          onChanged: (bool? value) {
                            if (value != null) {
                              setState(
                                () {
                                  carElement.isCarNew = value;
                                },
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
