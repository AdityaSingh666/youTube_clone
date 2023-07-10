import 'package:dio/dio.dart';

class ApiClient {
  Dio _dio = Dio();
 Future<dynamic>getVideos() async{
  const URL = "https://youtube.googleapis.com/youtube/v3/videos?part=snippet%2CcontentDetails%2Cstatistics%2Cplayer&chart=mostPopular&maxResults=200&regionCode=IN&key=AIzaSyDZ0zD9VawGJHYjWAtHgqQZS7J8OxPerbU";
  final Response response = await _dio.get(URL);
  //print(response.data);
  //print(response.data.runtimeType);
  return response.data['items'];
 }
}

