import 'package:flutter/material.dart';

class DropDownComponent extends StatefulWidget {
  final String title;
  final List<String> values;
  final String? selected;
  final BuildContext context;
    const DropDownComponent(
      {Key? key,
      required this.context,
      required this.title,
      required this.values,
      required this.selected,})
      : super(key: key);


  @override
  _DropDownComponentState createState() => _DropDownComponentState();
}

class _DropDownComponentState extends State<DropDownComponent> {
  @override
  Widget build(BuildContext context) {
    return component(widget.context, widget.title, widget.values, widget.selected);
  }

  Widget component(BuildContext context, String title, List<String> values,
      String? selected) {
    return Container(
      padding: const EdgeInsets.only(top: 8, bottom: 30),
      margin: EdgeInsets.only(top: 10, bottom: 0.0, left: 40, right: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$title",
            style: TextStyle(fontSize: 25, fontFamily: "RobotMono"),
          ),
          Container(
            width: (MediaQuery.of(context).size.width * 40) / 100,
            padding: EdgeInsets.only(left: 15.0),
            decoration: BoxDecoration(
                color: Color(0xFF8CC63E),
                borderRadius: BorderRadius.circular(20)),
            child: DropdownButton(
              menuMaxHeight: 5 * 48,
              value: selected,
              dropdownColor: Color(0xFF8CC63E),
              underline: Container(color: Colors.transparent),
              items: values.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selected = value;
                });
              },
            ),
          )
        ],
      ),
    );
  }

}
