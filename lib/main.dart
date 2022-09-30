import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _keypress = "";

  void _showKeyPress(String keypressed) {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _keypress = keypressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: CallbackShortcuts(
        bindings: {
          const SingleActivator(LogicalKeyboardKey.enter): () {
            _showKeyPress("OK");
          },
          const SingleActivator(LogicalKeyboardKey.arrowUp): () {
            _showKeyPress("ARROW UP");
          },
          const SingleActivator(LogicalKeyboardKey.arrowDown): () {
            _showKeyPress("ARROW DOWN");
          },
          const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
            _showKeyPress("ARROW LEFT");
          },
          const SingleActivator(LogicalKeyboardKey.arrowRight): () {
            _showKeyPress("ARROW RIGHT");
          },
          const SingleActivator(LogicalKeyboardKey.abort): () {
            _showKeyPress("ABORT");
          },
          const SingleActivator(LogicalKeyboardKey.accept): () {
            _showKeyPress("ACCEPT");
          },
          const SingleActivator(LogicalKeyboardKey.allCandidates): () {
            _showKeyPress("ALL CANDIDATES");
          },
          const SingleActivator(LogicalKeyboardKey.alphanumeric): () {
            _showKeyPress("ALPHANUMERIC");
          },
          const SingleActivator(LogicalKeyboardKey.channelUp): () {
            _showKeyPress("CHANNEL UP");
          },
          const SingleActivator(LogicalKeyboardKey.channelDown): () {
            _showKeyPress("CHANNEL DOWN");
          },
          const SingleActivator(LogicalKeyboardKey.exit): () {
            _showKeyPress("EXIT");
          },
          const SingleActivator(LogicalKeyboardKey.tvContentsMenu): () {
            _showKeyPress("TV CONTENTS MENU");
          },
          const SingleActivator(LogicalKeyboardKey.contextMenu): () {
            _showKeyPress("CONTEXT MENU");
          },
          const SingleActivator(LogicalKeyboardKey.select): () {
            _showKeyPress("SELECT");
          },
          const SingleActivator(LogicalKeyboardKey.backspace): () {
            _showKeyPress("BACKSPACE");
          },
          const SingleActivator(LogicalKeyboardKey.tvContentsMenu): () {
            _showKeyPress("TV CONTENTS MENU");
          },
        },
        child: Focus(
          autofocus: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Flexible(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 0.0),
                  child: Text(
                    "Press a key to see if it works",
                    style: TextStyle(
                      fontSize: 48.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                    child: Image.asset(
                  "assets/images/samsung-remote.png",
                  scale: 0.1,
                )),
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    _keypress,
                    style: const TextStyle(
                      fontSize: 48.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
