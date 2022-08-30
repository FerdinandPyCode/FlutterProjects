import 'package:flutter/material.dart';
import 'formulaire.dart';
import 'pagedetail.dart';
import 'tache.dart';
import 'todoprovider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

   

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'TodoApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late DatabaseHandler handler=DatabaseHandler();
  late Future<List<Todo>> todos=getList();

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    handler.initializeDB().whenComplete(() async {
      setState(() {
        todos = getList();
      });
    });
  }

  Future<List<Todo>> getList() async {
    return await handler.allTodo();
  }

  Future<void> _onRefresh() async {
    setState(() {
      todos = getList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        centerTitle: true,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            Container(
              height: 120.0,
              color: Colors.green,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Center(
                    child: CircleAvatar(
                      radius: 35.0,
                      backgroundColor: Colors.white,
                      child: Text(
                        "FA",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 25.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Ferdinand Yao ALLOWAKOU",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.0,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Card(
              elevation: 0.0,
              child: ListTile(
                
                title: Text(
                  'Options des tâches',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17.0, color: Colors.black),
                ),
                
              ),
              
            ),
            const Card(
              elevation: 3.0,
              margin: EdgeInsets.all(6.0),
              child: ListTile(
                //leading: Icon(Icons.),

                title: Text(
                  'Tâches à venir',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Card(
              margin: EdgeInsets.all(6.0),
              elevation: 3.0,
              child: ListTile(
                title: Text(
                  'Tâches réalisées',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Card(
              margin: EdgeInsets.all(6.0),
              elevation: 3.0,
              child: ListTile(
                title: Text(
                  'Tâches en cours',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                  //trailing: Icon(Icons.more_vert),
                ),
              ),
            ),
          ],
        ),
      ),

      body: FutureBuilder<List<Todo>>(
        future: todos,
        builder: (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}         yes'));
          } else {
            final items = snapshot.data ?? <Todo>[];
            print(" +++++++++++++++++++++++++++++++++++++++++> ${items.length}");
            return Scrollbar(
              child: RefreshIndicator(
                onRefresh: _onRefresh,
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Dismissible(
                      direction: DismissDirection.startToEnd,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: const Icon(Icons.delete_forever),
                      ),
                      key: ValueKey<int>(items[index].id),
                      onDismissed: (DismissDirection direction) async {
                        await handler.deleteTodo(items[index].id);
                        setState(() {
                          items.remove(items[index]);
                        });
                      },
                      child:Card(
                        elevation: 10.0,
                        child: InkWell(
                          splashColor: Colors.green,
                          onTap: () {
                            print(items[index].id);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (BuildContext context) {
                                return PageDetail(items[index]);
                              }),
                            );
                          },
                          child: Column(
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10.0, top: 10.0, bottom: 10.0),
                                    child: TexteAvecStyle(items[index].titre,
                                        color: Colors.green, fontSize: 20.0),
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.only(right: 10.0,top: 10.0,bottom: 5.0),
                                  //   child: TexteAvecStyle(
                                  //     item.dateenreg,
                                  //   ),
                                  // ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 7.5),
                                    child: Text(
                                      "${items[index].datebegin}",
                                      style: const TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.blue,
                                          fontStyle: FontStyle.italic),
                                    ), //TexteAvecStyle("${item.title}"),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 7.5),
                                    child: Text(
                                      "à",
                                      style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.blue,
                                          fontStyle: FontStyle.italic),
                                    ), //TexteAvecStyle("${item.title}"),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 7.5, top: 5.0, bottom: 10.0),

                                    child: Text(
                                      "${items[index].dateend}",
                                      style: const TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.blue,
                                          fontStyle: FontStyle.italic),
                                    ), //TexteAvecStyle("${item.title}"),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: (items[index].status == 0)
                                        ? TexteAvecStyle("Déjà fait",
                                        color: Colors.green)
                                        : (items[index].status == 1)
                                        ? TexteAvecStyle("En cours",
                                        color: Colors.blueAccent)
                                        : TexteAvecStyle("En Attente ...",
                                        color: Colors.red),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(
            context,

            MaterialPageRoute(builder: (BuildContext context) {
              return Formulaire();
            }),
          );
        },
        tooltip: 'ADD a task',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }



  Text TexteAvecStyle(data,
      {textAlign: TextAlign.center,
      color: Colors.indigo,
      fontSize: 15.0,
      fontStyle: FontStyle.italic}) {
    return Text(
      data,
      textAlign: textAlign,
      style: TextStyle(color: color, fontSize: fontSize, fontStyle: fontStyle),
    );

  }
}