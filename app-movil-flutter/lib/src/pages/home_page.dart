import 'package:flutter/material.dart';
import 'package:app_qr/src/widgets/menu_widget.dart';
import 'package:app_qr/src/provider/icono_string_util.dart';
import 'package:app_qr/src/provider/menu_provider.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detector Mascarilla'),
        backgroundColor: Colors.deepPurple,
      ),
      drawer: MenuWidget(),
      body: _lista(context),
    );
  }
}

Widget _lista(BuildContext context) {
  return FutureBuilder(
      future: menuProvider.cargarDatos(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('ERROR ${snapshot.error.toString()}'));
        }
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView(
          children: _listaItems(snapshot.requireData, context),
        );
      });
}

List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
  final List<Widget> opcioness = [];
  data.forEach((opt) {
    final widgetTemp = ListTile(
      title: Text(opt['texto']),
      leading: getIcon(opt['icon']),
      trailing: Icon(
        Icons.keyboard_arrow_right_sharp,
        color: Colors.deepPurple,
      ),
      onTap: () {
        print(opt['ruta']);
        Navigator.of(context).pushNamed(opt['ruta']);

        // showDialog(
        //     context: context,
        //     builder: (BuildContext context) =>
        //         _buildPopUpDialog(context, opt['texto']));

        // final route=MaterialPageRoute(builder:(context)=>AlertPage());
      },
    );
    opcioness
      ..add(widgetTemp)
      ..add(Divider());
  });
  return opcioness;
}

//Widget _buildPopUpDialog(BuildContext context, String opt) {
  //return new AlertDialog(
    //title: Text('Me diste click $opt'),
    //content: new Column(
      //mainAxisSize: MainAxisSize.min,
      //crossAxisAlignment: CrossAxisAlignment.start,
      //children: <Widget>[
        //new FlatButton(
          //onPressed: () {
            //Navigator.of(context).pop();
          //},
          //textColor: Theme.of(context).primaryColor,
          //child: Text('cerrar'),
        //)
      //],
    //),
  //);
//}
