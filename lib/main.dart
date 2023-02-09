import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'my_assets.dart';

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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<double>? _accelerometerValues;

  final _streamSubscriptions = <StreamSubscription<dynamic>>[];

  @override
  Widget build(BuildContext context) {
    final accelerometer =
        _accelerometerValues?.map((double v) => v.toStringAsFixed(1)).toList();

    int initialPosition = 2;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height / 2;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SafeArea(
            child: ListView(
          children: [
            const DefaultTextStyle(
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 24,
                    color: Color(0xFF282A36)),
                child: Text('Top Figures')),
            const DefaultTextStyle(
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 16,
                    color: Color(0xFFA5A5A5)),
                child: Text('As melhores figuras de todos os tempos 🔥')),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Container(
                  height: 40,
                  width: 98,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: const Color(0xFF2B64F6),
                      borderRadius: BorderRadius.circular(20)),
                  child: const DefaultTextStyle(
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xFFFFFFFF)),
                      child: Text('NFT')),
                ),
                const SizedBox(
                  width: 16,
                ),
                Container(
                  height: 40,
                  width: 98,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFFA5A5A5))),
                  child: const DefaultTextStyle(
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xFFA5A5A5)),
                      child: Text('IMAGENS')),
                )
              ],
            ),
            const SizedBox(
              height: 36,
            ),
            Container(
              height: 414,
              width: width,
              child: Column(
                children: [
                  Container(
                    height: 334,
                    decoration: const BoxDecoration(
                        color: Color(0xFFC5F36D),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8))),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedPositioned(
                          duration: const Duration(milliseconds: 200),
                          right: 0 + _accelerometerValues![0] * initialPosition,
                          bottom:
                              -16 + _accelerometerValues![2] * initialPosition,
                          width: width,
                          child: Image.asset(nftDog),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: width,
                    height: 80,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFA5A5A5)),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.favorite,
                                color: Color(0xFF2B64F6),
                                size: 32,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  DefaultTextStyle(
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Color(0xFF282A36)),
                                      child: Text('5K')),
                                  DefaultTextStyle(
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 10,
                                          color: Color(0xFFA5A5A5)),
                                      child: Text('likes')),
                                ],
                              )
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: Color(0xFF282A36),
                                size: 32,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  DefaultTextStyle(
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Color(0xFF282A36)),
                                      child: Text('18')),
                                  DefaultTextStyle(
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 10,
                                          color: Color(0xFFA5A5A5)),
                                      child: Text('Disponíveis')),
                                ],
                              )
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.attach_money,
                                color: Color(0xFF282A36),
                                size: 32,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  DefaultTextStyle(
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                          color: Color(0xFF282A36)),
                                      child: Text('12,00')),
                                  DefaultTextStyle(
                                      style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontSize: 10,
                                          color: Color(0xFFA5A5A5)),
                                      child: Text('Reais')),
                                ],
                              )
                            ]),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        )),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: '',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: const Color(0xFF2B64F6),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    for (final subscription in _streamSubscriptions) {
      subscription.cancel();
    }
  }

  @override
  void initState() {
    super.initState();
    _streamSubscriptions.add(
      accelerometerEvents.listen(
        (AccelerometerEvent event) {
          setState(() {
            _accelerometerValues = <double>[event.x, event.y, event.z];
          });
        },
      ),
    );
  }
}
