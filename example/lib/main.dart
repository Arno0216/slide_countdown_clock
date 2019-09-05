import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
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
      body: SingleChildScrollView(
          child: Container(
              height: size.height,
              width: size.width,
              child: ContentListView(
                scaffoldKey: _scaffoldKey,
              ))),
    );
  }

  Widget _buildSpace() {
    return SizedBox(height: 50);
  }
}

class ContentListView extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  ContentListView({this.scaffoldKey});

  @override
  _ContentListViewState createState() => _ContentListViewState();
}

class _ContentListViewState extends State<ContentListView> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView(
      shrinkWrap: false,
      scrollDirection: Axis.vertical,
//      addAutomaticKeepAlives: true,
//      addRepaintBoundaries: true,
      children: _buildChildren(10),
    );
//    return Swiper(
//        itemCount: 10,
//        itemBuilder: (context, index) {
//          return ChildrenWidget();
//        });
//    return GridView.count(
//      shrinkWrap: true,
//      primary: false,
//      padding: const EdgeInsets.all(20.0),
//      crossAxisSpacing: 10.0,
//      crossAxisCount: 1,
//      semanticChildCount: 10,
//      children: _buildChildren(10),
//    );
//    return PageView(
//      children: _buildChildren(10),
//    );
  }

  @override
  bool get wantKeepAlive => true;

  List<Widget> _buildChildren(int limit) {
    final size = MediaQuery.of(context).size;
    var childrenOutput = List<Widget>();
    for (int i = 1; i < limit; i++) {
      childrenOutput.add(ChildrenWidget());
    }
    return childrenOutput;
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
  Duration dur;

  @override
  void initState() {
    super.initState();
    final expDateTime = DateTime(2019, 09, 05, 23, 11, 22);
    dur = expDateTime.difference(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      height: 400,
//      width: size.height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Slide direction Up'),
          SlideCountdownClock(
            duration: dur,
            slideDirection: SlideDirection.Up,
            separator: ":",
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            shouldShowDays: true,
            onDone: () {
//              widget.scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Clock 1 finished')));
            },
          ),
//          SizedBox(height: 50),
//          Text('Slide direction Down'),
//          SlideCountdownClock(
//            duration: Duration(days: 12, minutes: 2),
//            slideDirection: SlideDirection.Down,
//            separator: ":",
//            textStyle: TextStyle(
//              fontSize: 20,
//              fontWeight: FontWeight.bold,
//            ),
//            onDone: () {
////              widget.scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Clock 1 finished')));
//            },
//          ),
//          SizedBox(height: 50),
//          Text('Use box Decoration'),
//          Padding(
//            padding: EdgeInsets.all(10),
//            child: SlideCountdownClock(
//              duration: Duration(days: 20, minutes: 1),
//              slideDirection: SlideDirection.Up,
//              separator: "-",
//              textStyle: TextStyle(
//                fontSize: 20,
//                fontWeight: FontWeight.bold,
//                color: Colors.white,
//              ),
//              separatorTextStyle: TextStyle(
//                fontSize: 20,
//                fontWeight: FontWeight.bold,
//                color: Colors.blue,
//              ),
//              padding: EdgeInsets.all(10),
//              decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
//              onDone: () {
////                widget.scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Clock 1 finished')));
//              },
//            ),
//          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
