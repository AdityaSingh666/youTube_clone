import 'package:flutter/material.dart';
import 'package:numeral/numeral.dart';
import 'package:youtube_app/pages/player.dart';
import 'package:youtube_app/services/apiClient.dart';
import 'package:timeago/timeago.dart' as timeago;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ApiClient _apiClient = ApiClient();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _apiClient.getVideos(),
        builder: (BuildContext ctx, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Something went wrong"),
            );
          } else {
            //print("Data is comming");
            //print(snapshot.data['items']);
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (c) => Player(snapshot.data[index]['id'])));
                          },
                          child: Image.network(snapshot.data[index]['snippet']
                              ['thumbnails']['high']['url']),
                        ),
                        Row(
                          children: [
                            const CircleAvatar(
                                backgroundImage: NetworkImage(
                                    'https://img.freepik.com/free-icon/man_318-233556.jpg')),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Text(
                                snapshot.data[index]['snippet']['title'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 60),
                          child: Row(
                            children: [
                              Text(Numeral(int.parse(snapshot.data[index]
                                      ['statistics']['viewCount']))
                                  .format()),
                                  const SizedBox(width:  20,),
                                  Text(timeago.format(DateTime.parse(snapshot.data[index]['snippet']['publishedAt'])))
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                });
          }
        });
  }
}
