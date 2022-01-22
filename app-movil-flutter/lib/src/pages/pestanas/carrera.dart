import 'package:flutter/material.dart';
import 'package:app_qr/src/widgets/scan_button.dart';

class HomePage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: Text('Carrera'),
        actions: [
          //IconButton(icon: Icon(Icons.delete_forever), onPressed: () {})
        ],
      ),
      //bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
