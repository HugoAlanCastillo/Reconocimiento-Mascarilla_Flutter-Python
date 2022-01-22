import 'package:app_qr/src/widgets/menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Notificación'),
        backgroundColor: Colors.deepPurple,
      ),
      drawer: MenuWidget(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 16),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(32),
                  bottomLeft: Radius.circular(32)),
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        children: <Widget>[],
                      ),
                    ),
                    Container(
                      width: 170,
                      height: 170,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage('assets/covid-icono.png'),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        children: <Widget>[],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 32),
                  child: Text(
                    '   Correo Institucional: \n ${bloc.email}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      /*    Column(
                        children: <Widget>[
                          Icon(
                            Icons.group_add,
                            color: Colors.white,
                          ),
                          Text(
                            'Friends',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.group,
                            color: Colors.white,
                          ),
                          Text(
                            'Groups',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.videocam,
                            color: Colors.white,
                          ),
                          Text(
                            'Videos',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ),
                          Text(
                            'Likes',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ) */
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3,
            padding: EdgeInsets.all(42),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                /*   
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(
                          Icons.table_chart,
                          color: Colors.grey,
                        ),
                        Text(
                          'Leaders',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(
                          Icons.show_chart,
                          color: Colors.grey,
                        ),
                        Text(
                          'Level up',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(
                          Icons.card_giftcard,
                          color: Colors.grey,
                        ),
                        Text(
                          'Leaders',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(
                          Icons.code,
                          color: Colors.grey,
                        ),
                        Text('QR code')
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(
                          Icons.blur_circular,
                          color: Colors.grey,
                        ),
                        Text('Daily bonus')
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(
                          Icons.visibility,
                          color: Colors.grey,
                        ),
                        Text('Visitors')
                      ],
                    ),
                  ],
                ),
              */
              ],
            ),
          )
        ],
      ),

      /*   body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage('assets/covid-icono.png'),
            radius: 100,
            /* child: Icon(Icons.add), */
          ),
          SizedBox(
            width: 20,
          ),

          Text(
            'Correo Insitucional:${bloc.email}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),

          //Text('Password: ${bloc.password}')
        ],
      ), */
    );
  }
}
