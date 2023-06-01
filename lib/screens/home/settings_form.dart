import 'package:flutter_firebase/common/constants.dart';
import 'package:flutter/material.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _sugars = ['0', '1', '2', '3', '4'];

  String _currentName = '';
  String _currentSugars = '';
  String _currentStrength = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Text(
            'Update your brew settings.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: TextInputDeclaration.copyWith(hintText: 'Email'),
            validator: (val) => val?.isEmpty == true ? 'Enter a name' : null,
            keyboardType: TextInputType.name,
            onChanged: (val) => setState(() => _currentName = val),
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField(
            decoration: TextInputDeclaration,
            value: _currentSugars == '' ? _sugars[0] : _sugars[0],
            items: _sugars.map((val) => DropdownMenuItem(value: val, child: Text('$val Sugars'))).toList(),
            onChanged: (val) => _currentSugars = val ?? '',
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () async {
              print('BottomSheet ------ $_currentName, $_currentSugars, $_currentStrength');
            },
            style: ButtonStyle(
                elevation: MaterialStateProperty.resolveWith((states) => 7),
                backgroundColor: MaterialStateColor.resolveWith((states) => Colors.red.shade600),
                padding: MaterialStateProperty.resolveWith((states) => const EdgeInsets.symmetric(horizontal: 40, vertical: 9))),
            child: const Text(
              'UPDATE',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ],
      ),
    );
  }
}
