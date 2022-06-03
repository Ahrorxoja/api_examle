import 'package:api_get_data/serves/user_servece.dart';
import 'package:flutter/material.dart';

import '../models/users_model.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  List<Users>? post;
  var isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    post = await UserService().getPosts();
    if (post != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Users"),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: post?.length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.red,
              padding: EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(post![index].name),
                          Text(post![index].email)
                        ],
                      ),
                    ),
                    Text(post![index].phone),
                  ],
                ),
            );
          },
        ),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
