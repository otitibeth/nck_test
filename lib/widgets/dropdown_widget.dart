import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  const DropdownWidget(
      {Key? key, required this.text, required this.handleSwapCylinder})
      : super(key: key);
  final String text;
  final handleSwapCylinder;

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  String dropdownValue = '00';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 7,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          alignment: Alignment.center,
          height: 44,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              value: dropdownValue,
              icon: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey,
              ),
              elevation: 16,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  widget.handleSwapCylinder(newValue);
                  dropdownValue = newValue!;
                });
              },
              items: <String>['00', '01', '02', '03']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
