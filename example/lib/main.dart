import 'package:flutter/material.dart';
import 'package:slide_countdown_clock/slide_countdown_clock.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  Duration _duration = Duration(seconds: 1000000);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text(widget.title)),
      body: Container(height: size.height, width: size.width, child: ListView(children: _buildChildren(30))),
    );
  }

  List<Widget> _buildChildren(int num) {
    var result = List<Widget>();
    for (var i = 0; i < num; i++) {
      result.add(_buildSlideCountdownClock());
    }
    return result;
  }

  Widget _buildSlideCountdownClock() {
    return Padding(
      padding: EdgeInsets.only(bottom: 400),
      child: ChildrenWidget(),
    );
  }

  Widget _buildSpace() {
    return SizedBox(height: 50);
  }
}

class ChildrenWidget extends StatefulWidget {

  @override
  _ChildrenWidgetState createState() => _ChildrenWidgetState();
}

class _ChildrenWidgetState extends State<ChildrenWidget> with AutomaticKeepAliveClientMixin {
  Duration countDownDuration;

  @override
  void initState() {
    super.initState();
    print('_ChildrenWidgetState -> initState');
    final _targetDateTime = DateTime.utc(2019, 9, 6, 23, 59, 59);
    countDownDuration = _targetDateTime.difference(DateTime.now());
    print(countDownDuration);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SlideCountdownClock(
      duration: countDownDuration,
      slideDirection: SlideDirection.Down,
      separator: ":",
      textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      onDone: () {
//        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Clock 1 finished')));
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
