
import 'package:flutter/material.dart';
import 'DoubleButton.dart';
import 'MenuButton.dart';
import '../../Services/FileManager.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        children: [
          const Text(
            'TicketMod',
            style: TextStyle(fontSize: 16.0, color: Colors.white),
          ),
          const Spacer(),

          DoubleButton(
              button1: const MenuButton(
                  title: 'Generate Tickets'
              ),
              button2: MenuButton(
                title: 'Load Tasks',
                onPressed: () {
                  // TODO: This should be in ViewModel
                  FileManager fileManager = FileManager();
                  fileManager.getStringFromDocx();
                }
              )
          )
        ],
      ),
    );
  }
}