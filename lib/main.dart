import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));
  runApp(const MyApp()) ;
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
//
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50)
              )
          ),
             child: Column(
              children: [
                const SizedBox(height: 50),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 30),
                  title:   Text('Hi Abhinav', style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white
                  )),
                  subtitle: Text('Good Morning', style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white54
                  ),),
                  trailing: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/abhi.jpg'),
                   ),
                  ),
                const SizedBox(height: 30),
              ],
            )
          ),
          Container(
            color: Theme.of(context).primaryColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(100)
                )
              ),
              child: GridView.count(
                shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 30,
                children: [
                  itemDashboard('Pens', CupertinoIcons.pen, Colors.deepOrange),
                  itemDashboard('Flude', CupertinoIcons.eyedropper, Colors.green),
                  itemDashboard('Pencils', CupertinoIcons.pencil, Colors.purple),
                  itemDashboard('Ruler', CupertinoIcons.rectangle_compress_vertical, Colors.indigo),
                  itemDashboard('Notenooks', CupertinoIcons.book_fill, Colors.teal),
                  itemDashboard('Plane Sheets', CupertinoIcons.rectangle_paperclip, Colors.blueAccent),
                  itemDashboard('Box', CupertinoIcons.cube_box_fill, Colors.pinkAccent),
                  itemDashboard('Contact', CupertinoIcons.phone, Colors.brown),
                  itemDashboard('Account', CupertinoIcons.person_2, Colors.yellowAccent),
                ],
              )
            )
          )
        ],
      ),
    );
  }

  itemDashboard(String title, IconData iconData, Color background) => Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          offset: const Offset(0, 5),
          color: Theme.of(context).primaryColor.withOpacity(.2),
          spreadRadius: 2,
          blurRadius: 6
        )
      ]
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: background,
            shape: BoxShape.circle
          ),
          child: Icon(iconData, color: Colors.white),
        ),
        const SizedBox(height: 8),
        Text(title, style: Theme.of(context).textTheme.titleMedium,)
      ],
    ),
  );
}


