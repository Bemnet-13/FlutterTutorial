import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  final dynamic _formulas = {
    '0':[1,0.001,0,0,3.28084,0.000621371,0,0],
    '1':[1000,1,0,0,3280.84,0.621371,0,0],
    '2':[0,0,1,0.0001,0,0,0.00220462,0.035274],
    '3':[0,0,1000,1,0,0,2.20462,35.274],
    '4':[0.3048,0.0003048,0,0,1,0.000189394,0,0],
    '5':[1609.34, 1.60934,0,0,5280,1,0,0],
    '6':[0,0,453.592,0.453592,0,0,1,16],
    '7':[0,0,28.3495,0.0283495,3.28084,0,0.0625, 1],
  };
  final Map<String, int> _measuresMap = {
  'meters' : 0,
  'kilometers' : 1,
  'grams' : 2,
  'kilograms' : 3,
  'feet' : 4,
  'miles' : 5,
    'pounds (lbs)' : 6,
    'ounces' : 7,
  };

  final List<String> _measures = [
    'meters',
    'kilometers',
    'grams',
    'kilograms',
    'feet',
    'miles',
    'pounds (lbs)',
    'ounces',
  ];
  double? _numberFrom;
  String? _startMeasures;
  String? _convertedMeasure;
  String? _resultMessage;
  @override
  void initState() {
    _numberFrom = 0;
    _startMeasures = _measures.first;
    _convertedMeasure = _measures.first; // Initialize _convertedMeasure
    _resultMessage = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle inputStyle = TextStyle(
      fontSize: 20.0,
      color: Colors.blue[900],
    );
    final TextStyle labelStyle = TextStyle(
      fontSize: 24,
      color: Colors.grey[700],
    );
    return MaterialApp(
      title: 'Measures Converter',
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Measures Converter')),
          backgroundColor: Colors.grey,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Value',
                  style: labelStyle,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Please insert the measure to be converted',
                  ),
                  onChanged: (text) {
                    var rv = double.tryParse(text);
                    if (rv != null) {
                      setState(() {
                        _numberFrom = rv;
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  'From',
                  style: labelStyle,
                ),
                DropdownButton<String>(
                  isExpanded: true,
                  value: _startMeasures,
                  items: _measures.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _startMeasures = value;
                    });
                  },
                ),
                SizedBox(
                  height: 40.0,
                ),
                Text(
                  'To',
                  style: labelStyle,
                ),
                SizedBox(
                  height: 40.0,
                ),
                DropdownButton(
                  isExpanded: true,
                  style: inputStyle,
                  items: _measures.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: inputStyle,
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _convertedMeasure = value;
                    });
                  },
                  value: _convertedMeasure,
                ),
                SizedBox(
                  height: 50.0,
                ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: inputStyle,
              ),
              onPressed: () {
                // Check if any of the fields are empty or the number is 0
                if (_startMeasures == null || _convertedMeasure == null || _numberFrom == 0) {
                  // Optionally, you could show an error message to the user here
                  print('Conversion criteria not met');
                  return;
                } else {
                  // Assuming you have a convert function that uses these values
                  convert(_numberFrom!, _startMeasures!, _convertedMeasure!);
                }
              },
              child: Text(
                'Convert',
                style: inputStyle,
              ),
            ),
                Text((_resultMessage! == null) ? '' : _resultMessage!,
                    style: labelStyle),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void convert(double value, String from, String to) {
    // Perform conversion logic here
    int? nFrom = _measuresMap[from];
    int? nTo = _measuresMap[to];
    double multiplier = _formulas[nFrom.toString()][nTo];
    var result = value * multiplier;
    if (result == 0){
      _resultMessage = "This conversion can not be preformed";
    }
    else{
      _resultMessage = '${_numberFrom.toString()} ${_startMeasures} are ${result.toString()} in ${_convertedMeasure}';
    }
    setState(() {
      _resultMessage = _resultMessage;
    });
  }
}

