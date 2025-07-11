import 'package:flutter/material.dart';
import 'package:km_test/providers/user_provider.dart';
import 'package:km_test/widgets/custom_button.dart';
import 'package:km_test/widgets/input_decoration.dart';
import 'package:provider/provider.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final _nameController = TextEditingController();
  final _sentenceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _sentenceController.dispose();
    super.dispose();
  }

  void _checkPalindrome() {
    final sentence = _sentenceController.text;
    if (sentence.isEmpty) {
      _showResultDialog('Please enter a sentence.');
      return;
    }
    final processed = sentence.replaceAll(' ', '').toLowerCase();
    final reversed = processed.split('').reversed.join('');

    final isPalindrome = processed == reversed;

    _showResultDialog(isPalindrome ? 'isPalindrome' : 'not palindrome');
  }

  void _showResultDialog(String message) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Palindrome Check'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  void _goToNextScreen() {
    if (_formKey.currentState!.validate()) {
      Provider.of<UserProvider>(
        context,
        listen: false,
      ).setName(_nameController.text);
      Navigator.pushNamed(context, '/second');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"), 
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons/ic_photo.png",
                    width: 115,
                    height: 115,
                  ),
                  const SizedBox(height: 50),
                  TextFormField(
                    controller: _nameController,
                    decoration: inputDecoration('Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _sentenceController,
                    decoration: inputDecoration('Palindrome'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a sentence';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 45),
                  customButton('CHECK', _checkPalindrome),
                  const SizedBox(height: 15),
                  customButton('NEXT', _goToNextScreen),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
