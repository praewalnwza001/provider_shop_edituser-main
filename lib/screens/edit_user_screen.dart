import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_profile_provider.dart';

class EditUserScreen extends StatefulWidget {
  static const routeName = '/edit-user';
  const EditUserScreen({super.key});

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  final TextEditingController _usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final userProvider = context.read<UserProfileProvider>();
    _usernameController.text = userProvider.username;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  void _saveUsername() {
    final newName = _usernameController.text.trim();
    if (newName.isNotEmpty) {
      context.read<UserProfileProvider>().changeUsername(newName);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Username'),
        actions: [
          IconButton(icon: const Icon(Icons.save), onPressed: _saveUsername),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _usernameController,
          decoration: const InputDecoration(labelText: 'New Username'),
        ),
      ),
    );
  }
}