import 'package:ecom_ui/controllers/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    var serverData = Provider.of<PostProvider>(context, listen: false);
    serverData.fetchProductData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("List API calling project"),
          centerTitle: true,
        ),
        body: Consumer<PostProvider>(
          builder: (_, data, child) {
            if (data.isloding) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else
              return ListView.builder(
                itemCount: data.postData.length,
                itemBuilder: (_, index) {
                  var postData = data.postData[index];
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(postData.id.toString()),
                          Text(postData.title),
                          Text(postData.body),
                          //Text(postData.userId.toString()),
                          SizedBox(
                            height: 60,
                          )
                        ],
                      ));
                },
              );
          },
        ));
  }
}
