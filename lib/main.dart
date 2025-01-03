import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe_flutter/injectable.dart';
import 'package:tic_tac_toe_flutter/models/game_state.dart';
import 'package:tic_tac_toe_flutter/screens/game_screen.dart';
import 'package:tic_tac_toe_flutter/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic-Tac-Toe Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: GoogleFonts.pressStart2pTextTheme(),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const HomeScreen(),
        '/game': (context) => GameScreen(gameState: getIt<GameState>())
      },
    );
  }
}
