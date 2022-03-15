import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:video_player/video_player.dart';
import 'dart:math';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePage(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            //mage.asset("assets/images/add_icon.png",fit: BoxFit.cover,height: 45,),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.comment_outlined),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'profil',
          ),
        ],
        backgroundColor: Color(0xFF141518),
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[700],
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Map> tiktokItems = [
    {"title": "assets/videos/video_1.mp4"},
    {"title": "assets/videos/video_2.mp4"},
    {"title": "assets/videos/video_3.mp4"},
    {"title": "assets/videos/video_4.mp4"},
    {"title": "assets/videos/video_5.mp4"},
    {"title": "assets/videos/video_6.mp4"},
    {"title": "assets/videos/video_7.mp4"},
    {"title": "assets/videos/video_8.mp4"},
    {"title": "assets/videos/video_9.mp4"},
    {"title": "assets/videos/video_10.mp4"},
    {"title": "assets/videos/video_11.mp4"},
    {"title": "assets/videos/video_12.mp4"},
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: double.infinity,
          scrollDirection: Axis.vertical,
          viewportFraction: 1.0),
      items: tiktokItems.map((item) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              color: Colors.black,
              child: Stack(
                children: [
                  VideoWidget(videoURL:item['title']),
                  const PostContent(),
                ],
              ),
            );
          },
        );
      }).toList(),
    );
  }
}

class VideoWidget extends StatefulWidget {
  const VideoWidget({Key? key, required this.videoURL}) : super(key: key);
  final String videoURL;

  @override
  _VideoWidgetState createState() => _VideoWidgetState(this.videoURL);
}

class _VideoWidgetState extends State<VideoWidget> {
  final String videoURL;
  _VideoWidgetState(this.videoURL);
  late VideoPlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.asset(videoURL)
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(_controller);
  }
}

class PostContent extends StatelessWidget {
  const PostContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(top: 40.0),
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "Following",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Text(
                "For You",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        Expanded(
            child: Row(
          children: [
            Expanded(
                child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "@r1onseulement",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Ah on va encore rire un peu today",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.music_note,
                        color: Colors.white,
                        size: 15,
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Original Sound - extremesport_95",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )),
            SizedBox(
              //color: Colors.green,
              width: 80.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                      height: 80.0,
                      child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Container(
                            margin:const EdgeInsets.only(bottom: 15),
                            child: const CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage("assets/images/profile.png"),
                            ),
                          ),
                          Container(
                            padding:const EdgeInsets.all(2.0),
                            margin:const EdgeInsets.only(bottom: 5),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child:const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 15,
                            ),
                          )
                        ],
                      )),
                  SizedBox(
                    height: 80.0,
                    child: Column(
                      children: [
                        Icon(
                            Icons.favorite,
                          color: Colors.white.withOpacity(0.85),
                          size: 45.0,
                        ),
                        const Text(
                          "25.0K",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 80.0,
                    child: Column(
                      children: [
                        Icon(
                          Icons.comment,
                          color: Colors.white.withOpacity(0.85),
                          size: 45.0,
                        ),
                        const Text(
                          "500",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 80.0,
                    child: Column(
                      children: [
                        Icon(
                          Icons.share,
                          color: Colors.white.withOpacity(0.85),
                          size: 45.0,
                        ),
                        const Text(
                          "75",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  const AnimatedLogo(),
                ],
              ),
            )
          ],
        ))
      ],
    );
  }
}

class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({Key? key}) : super(key: key);

  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<AnimatedLogo> with SingleTickerProviderStateMixin{
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 4000),
    );
    _controller.repeat();
    super.initState();
  }
    @override
    void dispose(){
      _controller.dispose();
      super.dispose();
    }


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
        builder: (_,child){
      return Transform.rotate(angle: _controller.value*2*pi);
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 25),
          height: 45,
          width: 45,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: const DecorationImage(
              image: AssetImage("assets/images/disc-icon.png"),
            )
          ),
          child: Image.asset("assets/images/tiktok-logo.png"),
    ),
    );
  }
}
