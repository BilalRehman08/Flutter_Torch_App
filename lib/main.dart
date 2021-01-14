import 'package:flutter/material.dart';
import 'package:torch/torch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isVisible = true;
  var textt = "Turn On";

  void toff() {
    setState(() {
      textt = "Turn Off";
    });
  }

  void ton() {
    setState(() {
      textt = "Turn On";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Torch App")),
        backgroundColor: Colors.grey[600],
      ),
      backgroundColor: Colors.grey[900],
      body: Container(
        child: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              GestureDetector(
                  onTap: () {
                    if (_isVisible) {
                      _isVisible = false;
                      toff();

                      Torch.turnOn();
                    } else {
                      _isVisible = true;
                      ton();
                      Torch.turnOff();
                    }
                  },
                  child: Column(
                    children: [
                      Icon(
                        Icons.lightbulb_outline,
                        color: _isVisible
                            ? Colors.grey[600]
                            : Colors.yellow.shade600,
                        size: 100,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: _isVisible
                            ? Colors.grey[600]
                            : Colors.yellow.shade600,
                        padding: EdgeInsets.all(8),
                        child: Text(
                          textt,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ))
            ])),
      ),
    );
  }
}
