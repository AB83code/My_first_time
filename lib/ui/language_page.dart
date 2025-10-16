
import 'package:flutter/material.dart';
import '../services/strings.dart';
class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});
  @override Widget build(BuildContext context){
    final langs = {'ru':'Русский','en':'English','lv':'Latviešu','de':'Deutsch','es':'Español','pt':'Português'};
    return Scaffold(appBar: AppBar(title: const Text('Language')), body: ListView(
      children: langs.entries.map((e)=> ListTile(title: Text(e.value), onTap: () async {
        await Strings.setLocale(e.key); if (context.mounted) Navigator.pop(context, e.key);
      })).toList(),
    ));
  }
}
