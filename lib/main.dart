import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter/widgets.dart';
import 'package:productiovity_timer/widgets.dart';
import './timer.dart';
import './timermodel.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Work Timer',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      home: TimerHomePage(),
    );
  }
}
class TimerHomePage extends StatelessWidget {
  final CountDownTimer timer = CountDownTimer();
  TimerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    timer.startWork();
    return Scaffold(
      appBar: AppBar(
        title: Text('My Work Timer'),
      ),
        body: LayoutBuilder(builder: (BuildContext context, BoxConstraints
        constraints) {
          final double availableWidth = constraints.maxWidth;
          return Column(
              children: [Row(
                children: [
                  Padding(padding: EdgeInsets.all(5.0),),
                  Expanded(child: ProductivityButton(color: Color(0xff009688),
                    text: "Work", onPressed: () => timer.startWork(), size: 40.0,)),
                  Padding(padding: EdgeInsets.all(5.0),),
                  Expanded(child: ProductivityButton(color: Color(0xff607D8B),
                    text: "Short Break", onPressed: () => timer.startBreak(true), size: 40.0,)),
                  Padding(padding: EdgeInsets.all(5.0)),
                  Expanded(child: ProductivityButton(color: Color(0xff455A64),
                    text: "Long Break", onPressed: () => timer.startBreak(false), size: 40.0,))
                ],
              ),
                Expanded(
                    child: StreamBuilder(
                        initialData: '00:00',
                        stream: timer.stream(),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          TimerModel timer = (snapshot.data == '00:00') ? TimerModel('00:00',
                              1) : snapshot.data;
                          return Expanded(
                              child: CircularPercentIndicator(
                                radius: availableWidth / 3,
                                lineWidth: 10.0,
                                percent: timer.percent!,
                                center: Text( timer.time!,
                                    style: Theme.of(context).textTheme.headlineMedium),
                                progressColor: Color(0xff009688),
                              ));
                        })),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.all(5.0),),
                    Expanded(child: ProductivityButton(color: Color(0xff212121),
                        text: 'Stop', onPressed: () => timer.stopTimer(), size: 20.0)),
                    Padding(padding: EdgeInsets.all(5.0),),
                    Expanded(child: ProductivityButton(color: Color(0xff455A64),
                      text: "Restart", onPressed: () => timer.startTimer(), size: 40.0,))
                  ],
                ),
                Padding(padding: EdgeInsets.only(bottom: 10.0)),
              ]
          );
        }
      ),
    );

  }
}
