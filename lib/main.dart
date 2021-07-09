import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:video_player/video_player.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

//Video Player-------------------------------------------------------------------------------------------------------------------------------------------

VideoPlayerController _controller;

class PhotoVideoViewWidget extends StatelessWidget {
  final int type;
  final String url;
  final bool play;
  final int index;

  const PhotoVideoViewWidget(
      {Key key, this.type, this.url, this.play, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isVideo = false;
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    if (url.endsWith(".jpg")) {
      isVideo = true;
    }

    return isVideo
        ? Container(
        height: height * 0.7,

        child: Image.asset(
          url,
          fit: BoxFit.fill,
        ))
        : GestureDetector(
        onTap: () {
          if (_controller.value.isPlaying == true)
            _controller.pause();
          else
            _controller.play();
        },
        child: Container(
            height: height*0.7,
            width: width*0.945,
            child: VideoPlayer(_controller)
        )
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
  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.asset(
        'assets/images/post4.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
  }

  
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    bool isVideo = true;


//Vertical Scroll ------------------------------------------------------------------------------------------------------------------------------------------

    Widget boardView = Container(
      color: Colors.black,
      child: ListView.builder(

        scrollDirection: Axis.vertical,
        itemCount: postimgs.length,
        itemBuilder: (BuildContext context, int index) {


          return Padding(
            padding: const EdgeInsets.all(9.0),

            child: Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
              decoration: BoxDecoration(
                  border: Border. all(
                    color: Colors. black.withOpacity(0.4),
                  ),
                  borderRadius: BorderRadius. circular(9),
                  color: Colors.black,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/bgposts1.gif'),
                    fit: BoxFit.fill,
                  )
          ),

              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Card(
                   child: SizedBox(
                    width: width*0.976,
                    height: height*0.95,

                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        PhotoVideoViewWidget(
                          url: postimgs[index],
                          index: index,
                          type: 0,

                        ),
                      ],
                    ),
                    ),
                  elevation:20, shadowColor: Colors.black,
                  color: Colors.black87,
                ),


// Posts ---------------------------------------------------------------------------------------------------------------------------------------------
                  Container(
                    width: width*1,
                    height: height*2,

                    padding: const EdgeInsets.fromLTRB(10,10, 10,580),
                        child:Row(
                          children: [
                            CircleAvatar(
                            backgroundColor: Colors.redAccent,
                            backgroundImage: AssetImage(useravatar[index]),
                          ),
                          SizedBox(
                            width: 10,
                            height: 10,
                          ),
                          Text(username[index],
                          style: TextStyle(
                            color: Colors.red,
                            fontFamily: 'Mulish',
                            shadows: [Shadow(blurRadius: 0.3),],
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                          ),
                          ),
                            SizedBox(
                              width: 8,
                              ),
                             Icon(
                               Icons.add_circle_outline,
                               color: Colors.redAccent,
                               size: 30,
                             )
                              ]
                        ),
                        ),
                  Container(
                    width: width*1,
                    height: height*0.21,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(300,0, 0, 120),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const <Widget>[
                            Icon(
                              Icons.favorite_border,
                              color: Colors.redAccent,
                              size: 26.0,
                              ),
                            Icon(
                              Icons.add_comment_outlined,
                              color: Colors.redAccent,
                              size: 26.0,
                            ),
                            Icon(
                              Icons.share_outlined,
                              color: Colors.redAccent,
                              size: 26.0,
                            ),
                          ],
                        )
                    ),
                    color: Colors.white12.withOpacity(0),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      padding: EdgeInsets.all(12),
                      width: width*0.936,
                      height: height*0.15,
                     child: Text(
                      postcaption [index],
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Mulish',
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        ),
                     ),
                     decoration: BoxDecoration(
                     border: Border.all(
                     color: Colors. black.withOpacity(0.4),
                      ),
                     borderRadius: BorderRadius.circular(12),
                     color: Colors.black12.withOpacity(0.5),
                    ),
                    ),
                  ),
                ],
              ),
              height: height * 0.754,  //container attributes
              // color: Colors.red,
            ),
          );
        },
      ),
    );

//List Scaffold -------------------------------------------------------------------------------------------------------------------------------------------------

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(

        child: Container(

          child: Column(
            children: [

              Container(
                height: height * 0.1111,

                 child: CategoryList(
                  imgs: imgPath,
                  postcaption:[],
                  CategoryName: names,
                  postimgs: [],
                  username:[],
                  useravatar: [],
                ),
              ),

              Expanded(child: boardView)
            ],
          ),
          color: Colors.black,
        ),
      ),

//Bottom Bar ------------------------------------------------------------------------------------------------------------------------------------------------
      bottomNavigationBar: FFNavigationBar(

        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.black45,
          selectedItemBorderColor: Colors.transparent,
          selectedItemBackgroundColor: Colors.redAccent,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.white,
          unselectedItemIconColor: Colors.red,
          showSelectedItemShadow: false,
          barHeight: 55,
          itemWidth: 75,

        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        items: [
          FFNavigationBarItem(
            iconData: Icons.home,
            label: '',
              ),
          FFNavigationBarItem(
            iconData: Icons.search,
            label: '',
          ),
          FFNavigationBarItem(
            iconData: Icons.add_circle_outline,
            label: '',
          ),
          FFNavigationBarItem(
            iconData: Icons.people,
            label: '',
          ),
          FFNavigationBarItem(
            iconData: Icons.account_circle_outlined,
            label: '',
          ),
        ],
      ),
    );
  }
}


//Lists and Horizontal Scroll--------------------------------------------------------------------------------------------------------------------------------------------------------
class CategoryList extends StatelessWidget {
  const CategoryList({
    Key key,
    @required this.imgs,
    @required this.CategoryName,
    @required this.postimgs,
    @required this.postcaption,
    @required this.username,
    @required this.useravatar,

  }) : super(key: key);

  final List<String> imgs;
  final List<String> CategoryName;
  final List<String> postimgs;
  final List<IconData> postcaption;
  final List<String> username;
  final List<String> useravatar;
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: imgs.length,
      itemBuilder: (context, index) {

        return Column(
          children: [

            Container(

              margin: EdgeInsets.all(10.0),
              width: 40,
              height: 40,
              alignment: Alignment.center,

              child: Image.asset(
                imgs[index],
                fit: BoxFit.fill,
                scale: 1,
              ),

              decoration:
              BoxDecoration(shape: BoxShape.circle,
                color: Colors.black.withOpacity(0),

                  ),
            ),

            Row(
              children: [

                Text(
                  CategoryName[index],
                  style: TextStyle(color: Colors.redAccent,
                  fontFamily: 'Mulish',
                  fontWeight: FontWeight.w600 ,),
                ),

                Icon(
                  Icons.keyboard_arrow_right,
                  size: 15,
                  color: Colors.black,
                )
              ],
            ),
          ],
        );
      },
    );
  }
}

void selected() {

  print("Button Press");
}

//Video Player Display ----------------------------------------------------------------------------------------------------------------------------------------------------

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.asset(
      'assets/images/post4.mp4',
    );

    _initializeVideoPlayerFuture = _controller.initialize();
    FutureBuilder(
      //Display the video
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );

    FloatingActionButton(
       onPressed: () {
        setState(() {
//pause
          if (_controller.value.isPlaying) {
            _controller.pause();
          } else {
// play
            _controller.play();
          }
        });
      },
      child: Icon(
        _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {}
}

//List Items-----------------------------------------------------------------------------------------------------------------------------------------------------

List<String> names = [
  "Witcher 3",
  "Dragon Age",
  "Path of Exile",
  "Call of Duty: Mobile",
  "Skyrim",
  "Minecraft",
  "Final Fantasy IV: Online",
]; //horizontal list titles

List<String> imgPath = [
  "assets/images/witcher.png",
  "assets/images/DA.png",
  "assets/images/poe.png",
  "assets/images/cod.png",
  "assets/images/skyrim.png",
  "assets/images/age.png",
  "assets/images/ffxiv.png",
]; //horizontal list icons

List<String> postimgs = [
  "assets/images/post1.jpg",
  "assets/images/post2.jpg",
  "assets/images/post3.jpg",
  "assets/images/post4.mp4",
]; //posts for vertical scroll

List<String> postcaption =[
  "Found this art on tumblr the other day and it reminds me of if Geralt and Ciri might've gone to "
  "the Blue Mountains... Wishing there was some post game content for it. Really miss the game...\n#witcher3 #cdpr #gameart #witcher3art #witcherart",
  "Check out my Skyrim art!\n\n\n#skyrim #bathesda #dragonborn",
  "HD print for my DA4 art (work in progress) from @BioWare released at EA Play 2018 available on our website now!\n\n#bioware #DA4 #thedreadwolfrises #dragonageseries",
  "lol DRG xDD \n\n\n#ffxiv #finalfantasy #finalfantasy14 #ff14 #gamingmeme #meme",

]; //post captions

List <String> username =[
  "TheDraknoth",
  "Mikayla21",
  "DinoDignito",
  "BlueBoy_vuv",
];

List <String> useravatar =[
  "assets/images/pp1.jpg",
  "assets/images/pp2.jpg",
  "assets/images/pp3.jpg",
  "assets/images/pp4.jpg",
];