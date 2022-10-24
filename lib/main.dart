import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();
  windowManager.waitUntilReadyToShow().then((_) async {
    // Hide window title bar
    //await windowManager.setTitleBarStyle(TitleBarStyle.hidden);
    await windowManager.hide();
    await windowManager.setSize(const Size(1920, 600));
    await windowManager.setAlignment(Alignment.topRight);
    //await windowManager.center();
    await windowManager.show();
    //await windowManager.setSkipTaskbar(false);
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
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
  String _keypress = "NONE";
  final player = AudioPlayer();
  static AudioCache audioCache = AudioCache(prefix: 'assets/sounds/');

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      player.audioCache = audioCache;
      await player.setSource(AssetSource("mouseclick.mp3"));
      // alternative to playListSilently
    });
  }

  void _showKeyPress(String keypressed) async {
    await player.seek(Duration.zero);
    await player.play(AssetSource("mouseclick.mp3"));

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
      appBar: PreferredSize(
        preferredSize: const Size(0, 200),
        child: DecoratedBox(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: const Center(
                child: Text("Remote Control Tester",
                    style: TextStyle(color: Colors.white, fontSize: 48.0)))),
      ),
      body: CallbackShortcuts(
        bindings: {
          const SingleActivator(LogicalKeyboardKey.enter): () {
            _showKeyPress("OK");
          },
          const SingleActivator(LogicalKeyboardKey.exit): () {
            _showKeyPress("EXIT");
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
          const SingleActivator(LogicalKeyboardKey.space): () {
            _showKeyPress("SPACE");
          },
          const SingleActivator(LogicalKeyboardKey.colorF3Blue): () {
            _showKeyPress("BLUE");
          },
          const SingleActivator(LogicalKeyboardKey.colorF2Yellow): () {
            _showKeyPress("YELLOW");
          },
          const SingleActivator(LogicalKeyboardKey.colorF1Green): () {
            _showKeyPress("GREEN");
          },
          const SingleActivator(LogicalKeyboardKey.colorF0Red): () {
            _showKeyPress("BLUE");
          },
          const SingleActivator(LogicalKeyboardKey.close): () {
            _showKeyPress("CLOSE");
          },
          const SingleActivator(LogicalKeyboardKey.play): () {
            _showKeyPress("PLAY");
          },
          const SingleActivator(LogicalKeyboardKey.mediaStop): () {
            _showKeyPress("STOP");
          },
          const SingleActivator(LogicalKeyboardKey.pause): () {
            _showKeyPress("PAUSE");
          },
          const SingleActivator(LogicalKeyboardKey.mediaPause): () {
            _showKeyPress("MEDIA PAUSE");
          },
          const SingleActivator(LogicalKeyboardKey.mediaPlayPause): () {
            _showKeyPress("MEDIA PLAY PAUSE");
          },
          const SingleActivator(LogicalKeyboardKey.browserForward): () {
            _showKeyPress("BROWSER FORWARD");
          },
          const SingleActivator(LogicalKeyboardKey.mediaFastForward): () {
            _showKeyPress("FAST FORWARD");
          },
          const SingleActivator(LogicalKeyboardKey.mediaSkipForward): () {
            _showKeyPress("SKIP FORWARD");
          },
          const SingleActivator(LogicalKeyboardKey.mediaStepForward): () {
            _showKeyPress("STEP FORWARD");
          },
          const SingleActivator(LogicalKeyboardKey.mediaSkipBackward): () {
            _showKeyPress("SKIP BACKWARD");
          },
          const SingleActivator(LogicalKeyboardKey.mediaRewind): () {
            _showKeyPress("REWIND");
          },
          const SingleActivator(LogicalKeyboardKey.digit0): () {
            _showKeyPress("0");
          },
          const SingleActivator(LogicalKeyboardKey.digit1): () {
            _showKeyPress("1");
          },
          const SingleActivator(LogicalKeyboardKey.digit2): () {
            _showKeyPress("2");
          },
          const SingleActivator(LogicalKeyboardKey.digit3): () {
            _showKeyPress("3");
          },
          const SingleActivator(LogicalKeyboardKey.digit4): () {
            _showKeyPress("4");
          },
          const SingleActivator(LogicalKeyboardKey.digit5): () {
            _showKeyPress("5");
          },
          const SingleActivator(LogicalKeyboardKey.digit6): () {
            _showKeyPress("6");
          },
          const SingleActivator(LogicalKeyboardKey.digit7): () {
            _showKeyPress("7");
          },
          const SingleActivator(LogicalKeyboardKey.digit8): () {
            _showKeyPress("8");
          },
          const SingleActivator(LogicalKeyboardKey.digit9): () {
            _showKeyPress("9");
          },
          const SingleActivator(LogicalKeyboardKey.f1): () {
            _showKeyPress("F1");
          },
          const SingleActivator(LogicalKeyboardKey.f2): () {
            _showKeyPress("F2");
          },
          const SingleActivator(LogicalKeyboardKey.f3): () {
            _showKeyPress("F3");
          },
          const SingleActivator(LogicalKeyboardKey.f4): () {
            _showKeyPress("F4");
          },
        },
        child: Focus(
          autofocus: true,
          child: Stack(children: [
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 100.0),
                      child: Text("Last button pressed",
                          style: TextStyle(
                            fontSize: 48.0,
                          )),
                    ),
                    Text(_keypress,
                        style: const TextStyle(
                          fontSize: 78.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ))
                  ]),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(
                "assets/images/stolenremote.png",
                scale: 0.9,
              ),
            )
          ]),
          /*
          Column(
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
        */
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
