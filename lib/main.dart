import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'cards.dart';

void main() => runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Playlist(),
    ));

class Playlist extends StatefulWidget {
  const Playlist({super.key});

  @override
  State<Playlist> createState() => _PlaylistState();
}

class _PlaylistState extends State<Playlist> {

  List<MyCard> music = [
    MyCard(author: "Landrine", time: "4:30", title: "Holy"),
    MyCard(author: "Kelly", time: "3:26", title: "Hallelujah"),
    MyCard(author: "Nathaniel ", time: "7:40", title: "Adonai")
  ];

  Widget myCards(music) {
    return Card(
      color: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("images/PXL_20230716_164934951.PORTRAIT~2.jpg"),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    music.title,
                    style:const TextStyle(
                        fontFamily: 'Name cat',
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(music.time),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          music.author,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            const Icon(
                Icons.play_circle_outline_rounded,
                size: 40,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          centerTitle: true,
          title: const Text("Music App"),
        ),
        body: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/20231214_010639.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Existing body content goes here
              Column(
                children: music.map( (music) => myCards(music)).toList(),
              ),
            ],
          ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: CupertinoColors.activeBlue,
        fixedColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
            label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.audiotrack),
            label: "Audio"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.music_video),
              label: "Video"
          )
        ],
      ),
    );
  }
}
