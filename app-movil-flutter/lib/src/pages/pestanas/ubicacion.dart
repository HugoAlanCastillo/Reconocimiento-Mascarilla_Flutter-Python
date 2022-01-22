import 'package:flutter/material.dart';

class StatefulWidgetsExample extends StatefulWidget {
  const StatefulWidgetsExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _StatefulWidgetsExampleState();
}

class _StatefulWidgetsExampleState extends State<StatefulWidgetsExample> {
  bool _switchVal = true;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const Text('Switch'),
        Center(
          child: Switch(
            onChanged: (bool value) {
              setState(() => this._switchVal = value);
            },
            value: this._switchVal,
          ),
        ),
      ],
    );
  }
}
