import 'package:flutter/material.dart';
import 'add.dart';
import 'dbhelper.dart';
import 'model.dart';
import 'detail.dart';
import 'modifier.dart';
import 'dart:io';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late DatabaseHandler handler=DatabaseHandler();
  late Future<List<Human>> _humans=getList();
  

  @override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    handler.initializeDB().whenComplete(() async {
      setState(() {
        _humans = getList();
      });
    });
  }

  Future<List<Human>> getList() async {
    return await handler.allPeople();
  }

  Future<void> _onRefresh() async {
    setState(() {
      _humans = getList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('People management'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddScreen()),
          );
        },
        child:const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),

      body: FutureBuilder<List<Human>>(
        future: _humans,
        builder: (BuildContext context, AsyncSnapshot<List<Human>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            
            final items = snapshot.data ?? <Human>[];
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
                        await handler.deletepeople(items[index].id);
                        setState(() {
                          items.remove(items[index]);
                        });
                      },
                      child: Card(
                        elevation: 10.0,
                          child: InkWell(
                            splashColor: Colors.green,

                            onTap: () {
                              //print("+++++++++++++++++++++ ${items[index].id}");
                              Navigator.push(
                              context,
                              MaterialPageRoute(builder: (BuildContext context) {
                                return PageDetail(items[index]);
                              }),
                          );
                          _onRefresh();
                        },

                        onLongPress: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (BuildContext context) {
                                return EdditScreen(items[index]);
                              }),
                          );
                        },
                        
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Visibility(
                              visible: items[index].picture!='assets/2.png',
                              child: Container(
                                margin: const EdgeInsets.all(5.0),
                                height: 70.0,
                                width: 70.0,
                                child:CircleAvatar(
                                backgroundImage:FileImage(File(items[index].picture)),
                                radius: 30,
                                ),
                            
                              ),
                            ),
                           const SizedBox(width: 12.0,),
                           Visibility(
                              visible: items[index].picture=='assets/2.png',
                              child: Container(
                                margin: const EdgeInsets.all(5.0),
                                height: 70.0,
                                width: 70.0,
                                child:CircleAvatar(
                                backgroundImage: AssetImage(items[index].picture),
                                radius: 30,
                                ),
                              ),
                            ),
                           const SizedBox(width: 12.0,),
                          Container(
                            padding:const EdgeInsets.only(left:0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children:[
                                Text(
                                  "${items[index].lastname} ${items[index].firstname}",
                                  //textAlign: TextAlign.start,
                                  style:const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),

                              const SizedBox(height: 10.0,),
                                Text(
                                  "${items[index].mail} ",
                                  //textAlign: TextAlign.start,
                                  style:const TextStyle(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]),
                        )
                      ),
                    );
                  },
                ),
              ),
            );
          }
        },
      ),
    );
  }
}