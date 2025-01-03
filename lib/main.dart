import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remoteconfic/viewmodel/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProviderOfFetching(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<ProviderOfFetching>(context, listen: false).getInitialze();
  }

  @override
  Widget build(BuildContext context) {
    var a = Provider.of<ProviderOfFetching>(context, listen: false);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(a.name ?? ' no name '),
          Text(a.age.toString() ?? ' no age '),
        ],
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final remoteConfig = FirebaseRemoteConfig.instance;
//   int _counter = 0;
//   String _name = '';

//   @override
//   void initState() {
//     super.initState();
//     _initializeRemoteConfig();
//   }

//   Future<void> _initializeRemoteConfig() async {
//     try {
//       await remoteConfig.setConfigSettings(
//         RemoteConfigSettings(
//           fetchTimeout: Duration(seconds: 10),
//           minimumFetchInterval: Duration(seconds: 10), // Reduce for testing
//         ),
//       );

//       await remoteConfig.fetchAndActivate();

//       String fetchedName = remoteConfig.getString('name');
//       remoteConfig.onConfigUpdated.listen((e) async {
//         await remoteConfig.activate();
//       });

//       print("Fetched remote config 'name': $fetchedName");

//       setState(() {
//         _name = fetchedName;
//         _counter = remoteConfig.getInt('age');
//       });

//       remoteConfig.onConfigUpdated.listen((values) {
//         setState(() {
//           _name = remoteConfig.getString('name');
//         });
//       });
//     } catch (e) {
//       setState(() {
//         _name = 'Failed to fetch name';
//       });
//     }
//   }

//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Remote Config Name: $_name',
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 20),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
