import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './home/HomePage.dart';
import './mine/MinePage.dart';
import './service/ServicePage.dart';

class RootTabarPage extends StatefulWidget {
  @override
  _RootTabarPageState createState() => _RootTabarPageState();
}

class _RootTabarPageState extends State<RootTabarPage> {

int _tabIndex = 0;
  final tabTextStyleNormal = new TextStyle(color: const Color(0xff969696));
  final tabTextStyleSelected = new TextStyle(color: Colors.blue);

  var tabImages;
  var _body;
  var appBarTitles = ['首页','服务','我的'];

  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0);
  }

  void initData() {
    if (tabImages == null) {
      tabImages = [
        [
          getTabImage('images/home/首页@2x.png'),
          getTabImage('images/home/首页-蓝@2x.png')
        ],
        [
          getTabImage('images/home/服务@2x.png'),
          getTabImage('images/home/服务-蓝@2x.png')
        ],
        [
          getTabImage('images/home/我的@2x.png'),
          getTabImage('images/home/我的-蓝@2x.png')
        ]
      ];
    }
    _body = new IndexedStack(
      children: <Widget>[
        new HomePage(),
        new ServicePage(),
        new MinePage(),
      ],
      index: _tabIndex,
    );
  }

  TextStyle getTabTextStyle(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabTextStyleSelected;
    }
    return tabTextStyleNormal;
  }

  Image getTabIcon(int curIndex) {
    if (curIndex == _tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  Text getTabTitle(int curIndex) {
    return new Text(appBarTitles[curIndex], style: getTabTextStyle(curIndex));
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return new Scaffold(
        body: _body,
        bottomNavigationBar: new CupertinoTabBar(
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                icon: getTabIcon(0),
                title: getTabTitle(0)),
            new BottomNavigationBarItem(
                icon: getTabIcon(1),
                title: getTabTitle(1)),
            new BottomNavigationBarItem(
                icon: getTabIcon(2),
                title: getTabTitle(2)),
          ],
          currentIndex: _tabIndex,
          onTap: (index) {
            setState((){
              _tabIndex = index;
              }
            );
          },
        ),
      );
  }
}