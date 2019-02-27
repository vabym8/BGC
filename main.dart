import 'package:flutter/material.dart';

void main() => runApp(App());

List<String> bloodGroup = ['A+',  'A-',  'B+',  'B-',  'AB+','AB-', 'O+',  'O-'];
//                ['A+',  'A-',  'B+',  'B-',  'AB+','AB-', 'O+',  'O-']
List<bool> apd = [true, false, false, false, true, false, false, false];
List<bool> and = [true, true, false, false, true, true, false, false];
List<bool> bpd = [false, false, true, false, true, false, false, false];
List<bool> bnd = [false, false, true, true, true, true, false, false];
List<bool> abpd = [false, false, false, false, true, false, false, false];
List<bool> abnd = [false, false, false, false, true, true, false, false];
List<bool> opd = [true, false, true, false, true, false, true, false];
List<bool> ond = [true, true, true, true, true, true, true, true];

//                ['A+',  'A-',  'B+',  'B-',  'AB+','AB-', 'O+',  'O-']
List<bool> apr = [true, true, false, false, false, false, true, true];
List<bool> anr = [false, true, false, false, false, false, false, true];
List<bool> bpr = [false, false, true, true, false, false, true, true];
List<bool> bnr = [false, false, false, true, false, false, false, true];
List<bool> abpr = [true, true, true, true, true, true, true, true];
List<bool> abnr = [false, true, false, true, false, true, false, true];
List<bool> opr = [false, false, false, false, false, false, true, true];
List<bool> onr = [false, false, false, false, false, false, false, true];

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {

  final List<Tab> myTabs = <Tab>[
    Tab(
      text: 'I CAN DONATE',
    ),
    Tab(text: 'I CAN RECEIVE'),
  ];

  List<bool> currentDonateList = apd;
  List<bool> currentReceiveList = apr;

  List<bool> getDonateBlood(){
      return currentDonateList;
  }

  List<bool> getReceiveBlood(){
    return currentReceiveList;
  }

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BloodGroup Compatibility',
      theme: ThemeData(
        primaryColor: Color(0xFFD0021B),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'BloodGroup Compatibility',
            style: TextStyle(
              fontFamily: 'Roboto',
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            tabs: myTabs,
            indicatorColor: Colors.white,
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                    color: Color(0xFFD0021B),
                    child: bloodGrid(getDonateBlood()),
                  ),
                  Container(
                    color: Color(0xFFD0021B),
                    child: bloodGrid(getReceiveBlood()),
                  ),
                ],
              ),
            ),
            Container(
              color: Color(0xFFD0021B),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      circleButton('A+'),
                      circleButton('A-'),
                      circleButton('B+'),
                      circleButton('B-'),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      circleButton('AB+'),
                      circleButton('AB-'),
                      circleButton('O+'),
                      circleButton('O-'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget circleButton(String type) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 10.0),
      child: FloatingActionButton(
        onPressed: () {
          setState(() {
            switch(type){
              case 'A+':
                
                currentDonateList = apd;
                currentReceiveList = apr;
                break;
              case 'A-':
                currentDonateList = and;
                currentReceiveList = anr;
                break;
              case 'B+':
                currentDonateList = bpd;
                currentReceiveList = bpr;
                break;
              case 'B-':
                currentDonateList = bnd;
                currentReceiveList = bnr;
                break;
              case 'AB+':
                currentDonateList = abpd;
                currentReceiveList = abpr;
                break;
              case 'AB-':
                currentDonateList = abnd;
                currentReceiveList = abnr;
                break;
              case 'O+':
                currentDonateList = opd;
                currentReceiveList = opr;
                break;
              case 'O-':
                currentDonateList = ond;
                currentReceiveList = onr;
                break;
            }
          });
        },
        child: Text(
          type,
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 25.0,
            color: Color(0xFFD0021B),
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget bloodGrid(List<bool> available){
    return GridView.count(
      children: <Widget>[
        bloodTile(bloodGroup[0], available[0]),
        bloodTile(bloodGroup[1], available[1]),
        bloodTile(bloodGroup[2], available[2]),
        bloodTile(bloodGroup[3], available[3]),
        bloodTile(' ',true),
        bloodTile(bloodGroup[4], available[4]),
        bloodTile(bloodGroup[5], available[5]),
        bloodTile(bloodGroup[6], available[6]),
        bloodTile(bloodGroup[7], available[7]),
      ],
      crossAxisCount: 3,
      crossAxisSpacing: 20.0,
      primary: false,
      padding: const EdgeInsets.all(20.0),
      mainAxisSpacing: 1.0,
    );
  }

  Widget bloodTile(String bloodGroup, bool enable){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FloatingActionButton(
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        onPressed: (){
        },
        child: bloodGroup.contains(' ') ? Icon(Icons.all_out, color: Color(0xFF820111), size: 50.0,) : Text(bloodGroup, style: TextStyle(fontFamily: 'Roboto', fontSize: 25.0, color: enable ? Color(0xFFD0021B) : Color(0xFFFFFFFF),),),
        backgroundColor: enable ? Color(0xFFFFFFFF) : Color(0xFF999999),
      ),
    );
  }
}
