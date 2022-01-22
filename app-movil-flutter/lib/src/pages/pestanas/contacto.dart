import 'package:flutter/material.dart';
import 'package:app_qr/src/widgets/menu_widget.dart';

class ContactoPage extends StatelessWidget {
  static final String routeName = 'contacto';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contacto'),
          backgroundColor: Colors.deepPurple,
        ),
        drawer: MenuWidget(),
        body: ListView(
          children: <Widget>[
            // Imagen

            Image(image: AssetImage('assets/covid-home.png')),

            // Title
            Title(),

            // Button Section
            //ButtonSection(),

            // Description
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Esta aplicación fue diseñada por alumnos de la institución TESE de la carrera ingeniería informática, octavo semestre. Para cumplir con el proyecto final de la materia Tecnologías Innovadoras por profesor Derlis Hernández Lara. \nEl proyecto consiste en notificar si no se está utilizando el cubrebocas o mascarilla correctamente.',
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 5.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
                    child: Text('Información de Contacto'),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  elevation: 0.0,
                  color: Colors.indigo.shade700,
                  textColor: Colors.white,
                  onPressed: () => inf_contac(context),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 110.0, vertical: 15.0),
                    child: Text('Desarrolladores'),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  elevation: 0.0,
                  color: Colors.indigo.shade700,
                  textColor: Colors.white,
                  onPressed: () => inf_Dev(context),
                ),
              ],
            ),
            SizedBox(height: 100.0),
          ],
        ));
  }

  void inf_contac(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Número de contacto'),
          content: Text('Hugo Alan Castillo González:\n 56-11-11-96-48'),
          actions: <Widget>[
            FlatButton(
              child: Text('Salir'),
              onPressed: () {
                Navigator.of(context).pop('ok');
              },
            ),
          ],
        );
      },
    );
  }
}

void inf_Dev(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Desarrolladores'),
        backgroundColor: Color(0xFFE0F7FA).withOpacity(1),
        content: Text(
          '•Hugo Alan Castillo González\n•Itzel Carolina Lulet Zamudio\n•Luis Ricarda Salazar Ibarra',
          textAlign: TextAlign.justify,
        ),
        actions: <Widget>[
          FlatButton(
            child: Text('Salir'),
            onPressed: () {
              Navigator.of(context).pop('ok');
            },
          ),
        ],
      );
    },
  );
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tecnológico de Estudios\nSuperiores de Ecatepec ',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Kanit',
                    fontSize: 20),
              ),
              Text(
                'Contacto: ',
                style:
                    TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Kanit'),
              ),
              Text('hugo.somnium@gmail.com',
                  style: TextStyle(color: Colors.black45, fontFamily: 'Kanit')),
            ],
          ),
          Expanded(child: Container()),
          Icon(Icons.contact_page, color: Colors.deepPurple),
          Text(''),
        ],
      ),
    );
  }
}
