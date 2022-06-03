import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/album_model.dart';

Future<Album> getAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
  final jsonresponse = json.decode(response.body);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonresponse[0]);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}