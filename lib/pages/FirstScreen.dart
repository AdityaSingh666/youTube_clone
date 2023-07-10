import 'package:flutter/material.dart';
import 'package:youtube_app/pages/home.dart';

// import 'package:youtube_app/services/apiClient.dart';

class firstScreen extends StatefulWidget {
  const firstScreen({super.key});

  @override
  State<firstScreen> createState() => _firstScreenState();
}

class _firstScreenState extends State<firstScreen> {

  AppBar _appBar(){
    return AppBar(
        title: SizedBox(
          height: 50,
          width: 150,
          child: Image.network("https://freelogopng.com/images/all_img/1656504144youtube-logo-png-white.png"),
        ),
        actions: [
          Icon(Icons.cast),
          Padding(padding: EdgeInsets.all(10)),
          Icon(Icons.notifications),
          Padding(padding: EdgeInsets.all(10)),
          Icon(Icons.search),
          Padding(padding: EdgeInsets.all(10)),
          Icon(Icons.circle),
          Padding(padding: EdgeInsets.only(right: 10))
        ],
        backgroundColor: Colors.black,
      );
  }

  List<BottomNavigationBarItem> _getItem(){
    return const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Colors.black),
        BottomNavigationBarItem(
            icon: Icon(Icons.shortcut),
            label: "shorts",
            backgroundColor: Colors.black),
        BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_outlined),
            label: "Home",
            backgroundColor: Colors.black),
        BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            label: "subscriptions",
            backgroundColor: Colors.black),
        BottomNavigationBarItem(
            icon: Icon(Icons.library_books_sharp),
            label: "Library",
            backgroundColor: Colors.black),
      ];
  }

  List<Widget>_Screen(){
    return [Home(), Text("shorts"), Text(""), Text("Subscriptions"), Text("Library")];
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _Screen()[index],
      // body: FutureBuilder(
      //   future: apiClient.getData(),
      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     return ListView.builder(
      //       itemCount: snapshot.data.length,
      //       itemBuilder: (context, index) {
      //         return Container(
      //           child: Image.network(snapshot.data["items"][index]["snippet"]["thumbnails"]["high"]["url"])
      //         );
      //       },
      //     );
      //   },
      // ),
      bottomNavigationBar:
          BottomNavigationBar(
            onTap: (int currentIndex){
              index = currentIndex;
              setState(() {
                
              });
            },
            currentIndex: index,items: _getItem()
    ));
    //backgroundColor: Colors.black,);
  }
}
