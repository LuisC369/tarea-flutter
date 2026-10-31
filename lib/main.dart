import 'package:flutter/material.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador de Metas',
      debugShowCheckedModeBanner: false,
      // CAMBIO DE DISENO: esquema de colores propio (verde azulado + naranja para más placer)
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
          secondary: Colors.deepOrange,
        ),
        scaffoldBackgroundColor: const Color(0xFFE0F2F1),
        useMaterial3: true,
      ),
      home: const PaginaPrincipal(titulo: 'Contador de Metas UMG'),
    );
  }
}

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key, required this.titulo});

  final String titulo;

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  int _contador = 0;

  void _incrementarContador() {
    setState(() {
      _contador++;
    });
  }

  void _reiniciarContador() {
    setState(() {
      _contador = 0;
    });
    debugPrint('El contador fue reiniciado a 0');
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('¡Contador reiniciado!'),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }

  void _mostrarDialogo() {
    debugPrint('Boton "Ver mi progreso" presionado. Valor: $_contador');
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.emoji_events, color: Colors.amber, size: 48),
        title: const Text('Tu progreso'),
        content: Text(
          _contador >= 10
              ? '¡Excelente! Ya llevas $_contador metas cumplidas.'
              : 'Llevas $_contador metas. ¡Sigue así, tú puedes!',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        leading: const Icon(Icons.school),
        title: Text(
          widget.titulo,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.flag_circle, size: 80, color: Colors.teal),
              const SizedBox(height: 16),
              const Text(
                'Metas cumplidas hoy:',
                style: TextStyle(fontSize: 22, color: Colors.black87),
              ),
              Text(
                '$_contador',
                style: const TextStyle(
                  fontSize: 72,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Presiona el botón + cada vez que cumplas una meta',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                onPressed: _mostrarDialogo,
                icon: const Icon(Icons.visibility),
                label: const Text('Ver mi progreso'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 12),
              TextButton.icon(
                onPressed: _reiniciarContador,
                icon: const Icon(Icons.refresh),
                label: const Text('Reiniciar'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.deepOrange,
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementarContador,
        tooltip: 'Sumar meta',
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add_task),
      ),
    );
  }
}
