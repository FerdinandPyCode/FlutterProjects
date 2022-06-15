import 'package:flutter/material.dart';
import 'package:whatsappclone/tabs/appeltab.dart';
import 'package:whatsappclone/tabs/messagetab.dart';
import 'package:whatsappclone/tabs/statustab.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'POwOP'),
    
    );
  }
}
//Color(int.parse(MyColors.greencolor))

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum HomeOptions {
  settings,
  newGroup,
  newBroadcast,
  whatsappWeb,
  starredMessages,
  statusPrivacy,
  clearCallLog,
  readMe,
}


class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  int _tabIndex=0;
  //final int _initialTabIndex=1;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TabController? _tabController;
  late List<Widget> _actionButtons;
  late List<List<PopupMenuItem<HomeOptions>>> _popupMenus;
  late bool _isSearching;
  late TextField _searchBar;
  late TextEditingController _searchBarController = TextEditingController();

  late List<Widget> _fabs;

  static const TextStyle _textBold = TextStyle(
    fontWeight: FontWeight.bold,
  );

  String _searchKeyword = '';

  @override
  void initState() {
    super.initState();
     _tabIndex = 1; // Start at second tab.
    _isSearching = false;
    _searchBarController =TextEditingController();
    _searchBarController.addListener(() {
      setState(() {
        _searchKeyword = _searchBarController.text;
      });
    });

    _searchBar =  TextField(
      controller: _searchBarController,
      autofocus: true,
      decoration:const InputDecoration(
        hintText: 'Search...',
        border: InputBorder.none,
      ),
    );

    _tabController = TabController(length: 4, vsync: this,initialIndex: _tabIndex);

    _tabController?.addListener(() {
      setState(() {
        _tabIndex = _tabController!.index;
        _isSearching = false;
        _searchBarController.text = "";
       
      });
    });

    _actionButtons = <Widget>[
      IconButton(
        tooltip: "Search",
        icon: const Icon(Icons.search),
        onPressed: () {
          setState(() {
            /*_searhBarOpen = true;
            _isSearching = true;
            _searchBarController?.text = "";*/
          });
        },
      ),
      PopupMenuButton<HomeOptions>(
        key: const Key('moreOptions'),
        tooltip: "More options",
        //onSelected: _selectOption,
        itemBuilder: (BuildContext context) {
          return _popupMenus[_tabIndex];
        },
      ),
    ];

    _popupMenus = [
      [],
      const[
        PopupMenuItem<HomeOptions>(
          child: Text("New group"),
          value: HomeOptions.newGroup,
        ),
        PopupMenuItem<HomeOptions>(
          child: Text("New broadcast"),
          value: HomeOptions.newBroadcast,
        ),
        PopupMenuItem<HomeOptions>(
          child: Text("WhatzApp Web"),
          key: Key('Web'),
          value: HomeOptions.whatsappWeb,
        ),
        PopupMenuItem<HomeOptions>(
          child: Text("Starred messages"),
          key: Key('Starred'),
          value: HomeOptions.starredMessages,
        ),
        PopupMenuItem<HomeOptions>(
          child: Text("Settings"),
          key: Key('Settings'),
          value: HomeOptions.settings,
        ),
        PopupMenuItem<HomeOptions>(
          child: Text("README", style: TextStyle(color: Colors.red)),
          value: HomeOptions.readMe,
        ),
      ],
      const[
        PopupMenuItem<HomeOptions>(
          child: Text("Status privacy"),
          value: HomeOptions.statusPrivacy,
        ),
        PopupMenuItem<HomeOptions>(
          child: Text("Settings"),
          value: HomeOptions.settings,
        ),
        PopupMenuItem<HomeOptions>(
          child: Text("README", style: TextStyle(color: Colors.red)),
          value: HomeOptions.readMe,
        ),
      ],
      const[
        PopupMenuItem<HomeOptions>(
          child: Text("Clear call log"),
          value: HomeOptions.clearCallLog,
        ),
        PopupMenuItem<HomeOptions>(
          child: Text("Settings"),
          value: HomeOptions.settings,
        ),
        PopupMenuItem<HomeOptions>(
          child: Text("README", style: TextStyle(color: Colors.red)),
          value: HomeOptions.readMe,
        ),
      ],
    ];
    _fabs = [
      Container(color: Colors.transparent,),
       FloatingActionButton(
          child: const Icon(Icons.message),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          onPressed: () async {
            
          }),
       SizedBox(
        height: 150.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
             FloatingActionButton(
                heroTag: 'newTextStatus',
                mini: true,
                child: const Icon(Icons.edit),
                backgroundColor: Colors.white,
                foregroundColor:Colors.green, //fabBgSecondaryColor,
                onPressed: () {
                  /*Application.router.navigateTo(
                    context,
                    Routes.newTextStatus,
                    transition: TransitionType.inFromRight,
                  );*/
                }),
            const SizedBox(
              height: 16.0,
            ),
             FloatingActionButton(
                heroTag: 'newStatus',
                child: const Icon(Icons.camera_alt),
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                onPressed: () {
                  /*Application.router.navigateTo(
                    context,
                    Routes.newStatus,
                    transition: TransitionType.inFromRight,
                  );*/
                }),
          ],
        ),
      ),
       FloatingActionButton(
          child: const Icon(Icons.add_call),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          onPressed: () {
            /*Application.router.navigateTo(
              context,
              Routes.newCall,
              transition: TransitionType.inFromRight,
            );*/
          }),
    ];
  }

  @override
  void dispose() {
    _searchBarController.dispose();
    _tabController?.dispose();
    super.dispose();
  }

   bool _searhBarOpen = false;

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async{
        if (_searhBarOpen) {
          setState(() {
            _searhBarOpen = false;
            _isSearching = false;
            _searchBarController.text = "";
          });
          return false;
        } else {
          return true;
        }
      },

      child: Scaffold(
        key: _scaffoldKey,
        appBar: (_tabIndex==0)?null:AppBar(
          backgroundColor: _isSearching ? Colors.white : null,
              leading: _isSearching
                  ? IconButton(
                      icon: const Icon(Icons.arrow_back),
                      color: const Color(0xff075e54),
                      onPressed: () {
                        setState(() {
                          _searhBarOpen = false;
                          _isSearching = false;
                          _searchBarController.text = "";
                        });
                      },
                    )
                  : null,
              title: _isSearching
                  ? _searchBar
                  : const Text(
                      'WhatsApp',
                      style: _textBold,
                    ),
              actions: _isSearching ? null : _actionButtons,
              bottom: _isSearching
              ? null
              : TabBar(
                  controller: _tabController,
                  tabs: <Widget>[
                    const Tab(
                      icon: Icon(Icons.camera_alt),
                    ),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            "CHATS",
                            style: _textBold,
                          ),
                          Container(
                              margin:
                                  const EdgeInsets.only(left: 4.0),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(9.0))),
                              alignment: Alignment.center,
                              height: 18.0,
                              width: 18.0,
                              child: const Text(
                                '22',
                                style:  TextStyle(
                                  fontSize: 9.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget> [
                          Text(
                            "STATUS",
                            key: Key('Status'),
                            style: _textBold,
                          ),
                          Padding(
                              padding:
                                  EdgeInsets.only(left: 4.0),
                              child: Text(
                                '•',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Tab(
                        child: Text(
                          "CALLS",
                          key: Key('Calls'),
                          style: _textBold,
                        ),
                      ),
                    ],
                    labelPadding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Container(color: Colors.transparent,),
            const MessageTab(),
            const StatusTab(),
            const AppelTAb(),
          ],
        ),
        floatingActionButton: _fabs[_tabIndex],
        ),
    );
  }
}
