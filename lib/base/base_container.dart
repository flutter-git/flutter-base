import 'package:flutter/material.dart';
import 'package:package_info/package_info.dart';

import 'navigator_manager.dart';

// File BaseContainer
// @project flutter_base
// @author minhhoang on 25-06-2020

class CustomNavigatorTabBar extends StatefulWidget {
  final List<Widget> children;
  final List<BottomNavigationBarItem> childrenBottomNavigator;
  final num defaultIndex;

  const CustomNavigatorTabBar(
      {Key key,
      @required this.children,
      this.defaultIndex = 0,
      @required this.childrenBottomNavigator})
      : assert(children != null && children.length > 0),
        assert(childrenBottomNavigator != null &&
            childrenBottomNavigator.length == children.length),
        super(key: key);

  @override
  _CustomNavigatorTabBarState createState() =>
      _CustomNavigatorTabBarState();

  static _CustomNavigatorTabBarState of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<
            _StateCustomNavigatorTabBarApp>()
        .data;
  }
}

class _CustomNavigatorTabBarState extends State<CustomNavigatorTabBar> {
  List<_BaseContainer> _children;
  List<BottomNavigationBarItem> _childrenBottomNavigator;
  num _currentIndex;
  PageController _pageController;
  num _defaultIndex;
  num _tapDouble=0;

  num get getCurrentIndex => _currentIndex;

  num get getDefaultIndex => _defaultIndex;

  set setCurrentIndex(num index) {
    if(_currentIndex!=index)
    setState(() {
      _currentIndex = index;
      _pageController.jumpToPage(index);
      _tapDouble=0;
    });else _tapDouble++;
    if(_tapDouble>0){
      NavigatorManager.actionPopUntil(index);
    }
  }

  @override
  void initState() {
    NavigatorManager.navTabBar.clear();
    _defaultIndex = widget.defaultIndex;
    _children = List.generate(widget.children.length, (index) {
      final keyNavigator = GlobalKey<NavigatorState>();
      final child = widget.children[index];
      NavigatorManager.navTabBar[index]=keyNavigator;
      return _BaseContainer(keyNavigator: keyNavigator, child: child,);
    });
    _currentIndex = _defaultIndex;
    _childrenBottomNavigator = widget.childrenBottomNavigator;
    _pageController = PageController(initialPage: _currentIndex);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return _StateCustomNavigatorTabBarApp(
      data: this,
      child: Scaffold(
        body: WillPopScope(
          onWillPop: () async {
            final navigatorCurrent = NavigatorManager.navTabBar[_currentIndex];
            final navigatorState = navigatorCurrent.currentState;
            final canPop = navigatorState.canPop();
            if (canPop)
              navigatorState.maybePop();
            else {
              if (_currentIndex == _defaultIndex)
                alertDialogYesNo(context, "Bạn có muốn thoát app");
              else
                setCurrentIndex = _defaultIndex;
            }
            return false;
          },
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: _children,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Colors.amber,
            unselectedItemColor: Colors.black,
            currentIndex: _currentIndex,
            onTap: (index) {
              setCurrentIndex = index;
            },
            items: _childrenBottomNavigator),
      ),
    );
  }
}

class _StateCustomNavigatorTabBarApp extends InheritedWidget {
  final _CustomNavigatorTabBarState data;

  _StateCustomNavigatorTabBarApp(
      {Key key, @required Widget child, @required this.data})
      : assert(child != null),
        assert(data != null),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_StateCustomNavigatorTabBarApp oldWidget) => true;
}

class _BaseContainer extends StatefulWidget {
  final GlobalKey<NavigatorState> keyNavigator;
  final Widget child;
  final bool wantKeepAlive;

  /// Initializes [key] for subclasses.
  const _BaseContainer(
      {Key key,
      @required this.keyNavigator,
      @required this.child,
      this.wantKeepAlive = true})
      : assert(keyNavigator != null),
        assert(child != null),
        super(key: key);

  @override
  _BaseContainerState createState() => _BaseContainerState();
}

class _BaseContainerState extends State<_BaseContainer>
    with AutomaticKeepAliveClientMixin {
  GlobalKey<NavigatorState> _keyNavigator;
  Widget _children;
  bool _wantKeepAlive;

  @override
  void initState() {
    _keyNavigator = widget.keyNavigator;
    _children = widget.child;
    _wantKeepAlive = widget.wantKeepAlive;
    super.initState();
  }

  @override
  void didUpdateWidget(_BaseContainer oldWidget) {
    if (oldWidget != widget)
      setState(() {
        this
          .._keyNavigator = widget.keyNavigator
          .._children = widget.child
          .._wantKeepAlive = widget.wantKeepAlive;
      });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Navigator(
        key: _keyNavigator,
        onGenerateRoute: (settings) =>
            NavigatorManager.onGenerateRouteRoot(settings, _children));
  }

  @override
  bool get wantKeepAlive => _wantKeepAlive;
}

Future<bool> alertDialogYesNo(BuildContext context, dynamic message) async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  String appName = packageInfo.appName;
  return showDialog(
          context: context,
          builder: (_) => AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                contentPadding: EdgeInsets.only(top: 10.0),
                content: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(5),
                          child: Text("$appName",
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      Divider(
                        height: 0.5,
                        color: Colors.grey[300],
                      ),
                      Container(
                          padding: EdgeInsets.all(20.0),
                          alignment: Alignment.center,
                          child: Text(message.toString())),
                      Divider(
                        color: Colors.grey,
                        height: 4.0,
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context, true);
                              },
                              splashColor: Colors.transparent,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(32.0)),
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(32.0)),
                                ),
                                child: Text(
                                  "Đồng ý",
                                  style: TextStyle(color: Color(0xff007aff)),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 0.3,
                            color: Colors.grey,
                            height: 40,
                          ),
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context, false);
                              },
                              splashColor: Colors.transparent,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(32.0),
                              ),
                              child: Container(
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(32.0),
                                  ),
                                ),
                                child: Text(
                                  "Bỏ qua",
                                  style: TextStyle(
                                      color: Color(0xff007aff),
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )) ??
      false;
}
