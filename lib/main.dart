import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_firebase_notification/recommended.dart';
import 'package:get_storage/get_storage.dart';

import 'HomePage.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.instance.getInitialMessage();

    // app is open foreground 
    FirebaseMessaging.onMessage.listen((message){

      if(message.notification != null){
        print("Message: ${message.notification!.title}");
        print("Message: ${message.notification!.body}");
        // var snackBar = SnackBar(
        //   content: Text('${message.notification!.body}'),
        // );
        // ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
    
    // app is terminatted
    


    // app is open but terminatted

    FirebaseMessaging.onMessageOpenedApp.listen((message){
      if(message.notification != null){
        print("Message: ${message.notification!.title}");
        print("Message: ${message.notification!.body}");
        print("Message: ${message.data['path']}");
        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text('${message.notification!.body}'),
        // ));
      }
    });

    FirebaseMessaging.instance.getInitialMessage().then((message){
      if(message  != null){
        print("Message: ${message.notification!.title}");
        print("Message: ${message.notification!.body}");
        print("Message: ${message.data['path']}");
        Navigator.pushNamed(context, message.data['path']);

      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
      routes: {
        "recommended" : (contex) => const Recommended()
      },
    );
  }
}

