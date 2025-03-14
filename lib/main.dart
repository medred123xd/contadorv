import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
        ),
        home: const MyHomePage(title:'contador'),
        debugShowCheckedModeBanner:false,
    );
  }
}

class MyHomePage extends StatefulWidget{
  const MyHomePage({super.key,required this.title});
  final String title;
  @override
  State<MyHomePage> createState()=> _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
int _counter =0;
void _incrementcounter(){
  setState((){
    _counter++;
  });
}
void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  void _mitad () {
    setState(() {
      if (_counter % 2 == 0) {
        _counter = _counter ~/ 2;
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('El número no tiene mitad exacta')),
        );
      }
    });
  }

  void _doble() {
    setState(() {
      _counter *= 2;
    });
  }


@override
 Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(widget.title),
      ),
      body: Center(
        child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children:<Widget>[
          const Text('has presionado el boton esta cantidad de veces:'),
           Text(
            '$_counter',
            style: Theme.of(context).textTheme.headlineMedium,
          )
        ]
      )
    ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _incrementcounter,
            tooltip: 'Incrementar',
            child: const Icon(Icons.add),
          ),

              const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip: 'Decrementar',
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _mitad,
            tooltip: 'Dividir a la mitad',
            child: const Text('÷2'),
            
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _doble,
            tooltip: 'Duplicar',
            child: const Text('x2'),
            
          ),
        ]
      ),
    );
 }
}