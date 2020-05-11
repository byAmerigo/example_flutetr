import 'package:example/view/add_page.dart';
import 'package:example/view/profile_page.dart';
import 'package:example/view/settings_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  PageController _myPageController;
  List<Widget> _pageList = [ProfilePage(), SettingsPage()];
  int _currentPage = 0;

  @override
  void initState() {
    _myPageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _myPageController.dispose();
    super.dispose();
  }

  void handleChangePage(int toPageIndex) {
    _myPageController.animateToPage(toPageIndex,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    setState(() {
      _currentPage = toPageIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: PageView.builder(
        itemCount: _pageList.length,
        controller: _myPageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (BuildContext context, int index) {
          return _pageList[index];
        },
      ),
      bottomNavigationBar: buildBottomAppBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  SizedBox buildFloatingActionButton() {
    return SizedBox(
      height: 65,
      width: 65,
      child: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                title: Text("Vuoi creare qualcosa?"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud"),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RaisedButton(
                          child: Text('Prova'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        AddPage(),
                                transitionsBuilder:
                                    (context, animation1, animation2, child) {
                                  print(animation1.value);
                                  return SlideTransition(
                                    position: Tween<Offset>(
                                      //prova a cambiare i valori di offset per decidere da che parte far partire l'animazione.
                                      //il primo numero indicano l'asse orizzontale (-1 è sinistra, 1 è destra)
                                      //il secondo invece l'asse horizzontale(-1 è in alto, 1 è in basso)
                                      begin: const Offset(0, 1),
                                      end: Offset.zero,
                                    ).animate(animation1),
                                    child: child,
                                  );
                                },
                                transitionDuration:
                                    //cambia la durata per decidere quanto tempo deve metterci a cambiare pagina
                                    Duration(milliseconds: 2000),
                              ),
                            );
                          },
                        )
                      ],
                    )
                  ],
                ),
              ));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        elevation: 2.0,
      ),
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
      color: Colors.red,
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 75,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            buildNavItem(indexPage: 0, icon: Icons.people),
            buildNavItem(indexPage: 1, icon: Icons.settings),
          ],
        ),
      ),
    );
  }

  Widget buildNavItem({int indexPage, IconData icon}) {
    var isActive = indexPage == _currentPage ? true : false;
    var color = isActive ? Colors.white : Colors.black26;

    return IconButton(
        iconSize: 30.0,
        icon: Icon(icon, color: color),
        onPressed: () {
          handleChangePage(indexPage);
        });
  }
}
