import 'package:flutter/material.dart';
import 'package:whatsapp2/single_call_widget.dart';
import 'package:whatsapp2/single_chat_widget.dart';
import 'package:whatsapp2/single_status_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late TabController controller;
  Widget? icon;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this)
      ..addListener(() {
        switch (controller.index) {
          case 0:
            icon == null
                ? Container()
                : Icons.message;
            break;
          case 1:
            icon = const Icon(Icons.message);
            break;
          case 2:
            icon = const Icon(Icons.camera_enhance);
            break;
          case 3:
            icon = const Icon(Icons.call);
            break;
          default:
        }
        setState(() {});
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget openPopUp() {
    return PopupMenuButton(
      itemBuilder: (context) {
        return List.generate(
            3,
            (index) => const PopupMenuItem(
                  child: Text('Setting'),
                ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        floatingActionButton: SizedBox(
          width: 50,
          height: 50,
          child: FloatingActionButton(
            child: icon,
            onPressed: () {},
          ),
        ),

        appBar: AppBar(
          actions: [
            // Widget for the search button
            const Icon(Icons.search),
            // Implement Search functionality here
            // Widget for implementing the three-dot menu
            PopupMenuButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              itemBuilder: (context) {
                return [
                  // In this case, we need 5 popupmenuItems one for each option.
                  const PopupMenuItem(child: Text('New Group')),
                  const PopupMenuItem(child: Text('New Broadcast')),
                  const PopupMenuItem(child: Text('Linked Devices')),
                  const PopupMenuItem(child: Text('Starred Messages')),
                  const PopupMenuItem(child: Text('Settings')),
                ];
              },
            ),
          ],
          backgroundColor: const Color(0xff128C7E),
          title: const Text('WhatsApp'),
          bottom: TabBar(
            controller: controller,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.white,
            tabs: const [
              Tab(
                  iconMargin: EdgeInsets.all(100),
                  child: Icon(
                    Icons.camera_alt_rounded,
                  )),
              Tab(
                child: Text('CHATS', style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child: Text('STATUS', style: TextStyle(color: Colors.white)),
              ),
              Tab(
                child: Text('CALLS', style: TextStyle(color: Colors.white)),
              ),
            ],
            labelColor: Colors.white,
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: const [
            Center(child: Text('This feature is coming soon')),
            ChatsTab(),
            StatusTab(),
            CallTab(),
          ],
        ),
      ),
    );
  }
}
