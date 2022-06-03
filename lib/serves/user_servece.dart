import '../models/users_model.dart';
import 'package:http/http.dart' as http;

class UserService{
  Future<List<Users>?> getPosts() async{
    var client = http.Client();
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/users");
    var response = await client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      return usersFromJson(json);
    }
  }
}