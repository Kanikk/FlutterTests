import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test/widgets/car.dart';

class Forms extends StatefulWidget {
  TextEditingController mileage;
  Color color;
  Forms({Key? key, required this.mileage, required this.color}) : super(key: key);

  @override
  _FormsState createState() => _FormsState();
}

class _FormsState extends State<Forms> {
  // TextEditingController mymileage = TextEditingController();
  // Color mycolor = Colors.red;

  static final List<Color> items = [
    Colors.red,
    Colors.blue,
    Colors.black,
  ];
  Color value = items.first;

  Widget _buildColor() {
    return DropdownButton<Color>(
      value: value,
      onChanged: (Color? newValue) {
        setState(() {
          value = newValue!;
          widget.color = value;
        });
      },
      items: items.map((Color item) {
        return DropdownMenuItem<Color>(
          value: item,
          child: Text(
            "Color",
            style: TextStyle(
              color: item,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildMilage() {
    return TextFormField(
      controller: widget.mileage,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly
      ],
      decoration: InputDecoration(
        hintText: "Enter mileage here",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.all(16),
        isDense: true,
        constraints: const BoxConstraints(maxWidth: 150),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildMilage(),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _buildColor(),
          ),
        ),
      ],
    );
  }
}
