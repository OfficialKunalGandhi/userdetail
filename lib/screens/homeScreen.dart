import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userdetail/server/apiClient.dart';
import 'package:userdetail/utils/appColor.dart';
import 'package:userdetail/utils/appText.dart';
import 'package:userdetail/widget/listItemWidget.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppText.userList),centerTitle: true,backgroundColor: AppColor.darkBlur),
      body: FutureBuilder(
        future: ApiClient().getUsers(),
        builder:(context, snapshot)  {

          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {


            return ListItemWidget(usersModel:  snapshot.data![index]);
          },);
        }
      ),

    );
  }
}
