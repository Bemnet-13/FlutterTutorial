import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage:NetworkImage('https://bemnet-13.github.io/UGR-2248-14-js-css-html/src/images/bemnet_a.jpg'),
                ),
              Text(
                  'Bemnet Aschalew',
                   style: TextStyle(
                     fontSize: 30.0,
                     color: Colors.white,
                     fontWeight: FontWeight.bold,
                     fontFamily: 'Pacifico',
                   )
              ),
              Text(
                'AN ENTHUSIASTIC STUDENT',
                style: TextStyle(
                  fontFamily: 'SourceSans',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 2.0,
                ),
              ),
              SizedBox(
                height: 10.0,
                width: 250.0,
                child: Divider(
                  color: Colors.white,
                ),
              ),
              Card(
                // padding: EdgeInsets.all(15.0),
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.black26,
                    ),
                    title: Text(
                      '+251-955-4229',
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontFamily: 'SourceSans',
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),

              Card(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                // padding: EdgeInsets.all(15.0),
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.email_rounded,
                      color: Colors.black26,
                    ),
                    title: Text(
                      'bem1313asch@gmail.com',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'SourceSans',
                      ),
                    ),
                  )
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}