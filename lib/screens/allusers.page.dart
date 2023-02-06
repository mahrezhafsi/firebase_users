import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:users_fire_base/screens/widget/users.list.dart';


import '../model/user.model.dart';
class Allusers extends StatefulWidget {
  const Allusers({Key? key}) : super(key: key);

  @override
  State<Allusers> createState() => _AllusersState();
}

class _AllusersState extends State<Allusers> {
  @override
  Widget build(BuildContext context) {
    List<User> allusers=[];
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('users').orderBy('name').snapshots(),
        builder: (context ,snp){
          if(snp.hasError){
            return Center(child: Text('Error'),);
          }
          if(snp.hasData){
           //llusers = snp.data!.docs.map((docs) => User.fromjson(doc.data() as Map<String,dynamic>)).toList();
            allusers =snp.data!.docs
                .map((doc) => User.fromjson(doc.data() as Map<String,dynamic>)).toList();
            return ListUsers(users: allusers);
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}


