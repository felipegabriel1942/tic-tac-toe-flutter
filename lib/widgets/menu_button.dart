import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 16,
      right: 16,
      child: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {
          _showMenuDialog(context);
        },
      ),
    );
  }

  void _showMenuDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Menu'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Configurações'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.exit_to_app),
                title: const Text('Sair do Jogo'),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.close),
                title: const Text('Fechar'),
                onTap: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          ),
        );
      },
    );
  }
}
