import 'package:flutter/material.dart';
import 'package:people/fetch_data.dart';
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
  late FetchData handler=FetchData();
  late Future<List<Human>> _humans=getList();
  

  /*@override
  void initState() {
    super.initState();
    handler = DatabaseHandler();
    handler.initializeDB().whenComplete(() async {
      setState(() {
        _humans = getList();
      });
    });
    FetchData().fetchPeople();
  }*/
  @override
  void initState() {
    super.initState();
    handler = FetchData();
    handler.fetchPeople().whenComplete(() async {
      setState(() {
        _humans = getList();
      });
    });
  }
  

  Future<List<Human>> getList() async {
    return await handler.fetchPeople();
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
                    return Card(
                      elevation: 10.0,
                        child: InkWell(
                          splashColor: Colors.green,

                          onTap: () {
                           
                            Navigator.push(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return PageDetail(items[index]);
                            }),
                        );
                        _onRefresh();
                      },

                      /*onLongPress: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return EdditScreen(items[index]);
                            }),
                        );
                      },*/
                      
                      child: /*Row(
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
                           margin: const EdgeInsets.all(5.0),
                           height: 70.0,
                           width: 70.0,
                           child:const CircleAvatar(
                           backgroundImage: AssetImage("assets/2.png"),
                           radius: 30,
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
                            ],
                          ),
                        )
                      
                      ]
                      ),*/

                        ListTile(
                          leading:Row(
                            children: [
                                Visibility(
                                visible: items[index].picture!='assets/2.png',
                                child: Container(
                                  margin: const EdgeInsets.all(5.0),
                                  height: 70.0,
                                  width: 70.0,
                                  child:CircleAvatar(
                                  backgroundImage:NetworkImage(items[index].picture),
                                  radius: 30,
                                  ),
                                ),
                              ),
                           
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
                            ],
                          ) ,
                          title: Text(
                            "${items[index].lastname} ${items[index].firstname}",
                            //textAlign: TextAlign.start,
                            style:const TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          subtitle:Text(
                            "${items[index].phone} ",
                            //textAlign: TextAlign.start,
                            style:const TextStyle(
                              color: Colors.black,
                              fontSize: 13.0,
                            ),
                          ),
                        ),
                      )
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