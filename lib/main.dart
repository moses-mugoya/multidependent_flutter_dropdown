import 'package:drop_down_app/repository.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kenya Counties',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Repository repository = Repository();
  List<String> _counties = ["Choose county"];
  List<String> _subCounty = ["Choose subcounty"];
  String _selectedCounty = "Choose county";
  String _selectedSubCounty = "Choose subcounty";

  @override
  initState() {
    _counties = List.from(_counties)..addAll(repository.getCounties());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dependent DropDown'),
        centerTitle: true,
        elevation: 1.0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        child: Column(
          children: <Widget>[
            DropdownButton<String>(
              isExpanded: true,
              items: _counties.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              onChanged: (value) => _onSelectedCounty(value),
              value: _selectedCounty,
            ),
            DropdownButton<String>(
              isExpanded: true,
              items: _subCounty.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
              }).toList(),
              // onChanged: (value) => print(value),
              onChanged: (value) => _onSelectedSubCounty(value),
              value: _selectedSubCounty,
            ),
          ],
        ),
      ),
    );
  }

  void _onSelectedCounty(String value) {
    setState(() {
      _selectedSubCounty = "Choose ..";
      _subCounty = ["Choose .."];
      _selectedCounty = value;
      _subCounty = List.from(_subCounty)
        ..addAll(repository.getSubByCounty(value));
    });
  }

  void _onSelectedSubCounty(String value) {
    setState(() => _selectedSubCounty = value);
  }
}
