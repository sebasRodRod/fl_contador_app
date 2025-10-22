import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int contador = 0;

  void incrementar() {
    contador++;
    setState(() {});
  }

  void decrementar() {
    contador--;
    setState(() {});
  }

  void reiniciar() {
    contador = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const tamanio30 = TextStyle(fontSize: 30);

    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      appBar: AppBar(title: Text("HomeScreen"), elevation: 1.0),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Numero de clicks:", style: tamanio30),
            SizedBox(height: 20),
            Text("$contador", style: tamanio30),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingActionButton(
        incrementarFn: incrementar,
        decrementarFn: decrementar,
        reiniciarFn: reiniciar,
      ),
    );
  }
}

class CustomFloatingActionButton extends StatelessWidget {
  final Function incrementarFn;
  final Function decrementarFn;
  final Function reiniciarFn;

  const CustomFloatingActionButton({
    super.key,
    required this.incrementarFn,
    required this.decrementarFn,
    required this.reiniciarFn,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => incrementarFn(),
        ),
        FloatingActionButton(
          child: const Icon(Icons.remove),
          onPressed: () => decrementarFn(),
        ),
        FloatingActionButton(
          child: const Icon(Icons.refresh),
          onPressed: () => reiniciarFn(),
        ),
      ],
    );
  }
}
