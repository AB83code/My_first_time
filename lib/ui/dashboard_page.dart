
import 'package:flutter/material.dart';
import '../services/strings.dart';
import 'language_page.dart';
import 'radar_widget.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});
  @override Widget build(BuildContext context){
    final S = Strings.of(context);
    final probs = const {'calm':0.5,'play':0.2,'alert':0.15,'fear':0.05,'pain':0.05,'attention':0.05};
    return Scaffold(appBar: AppBar(title: Text(S.t('app_title')), actions:[
      IconButton(icon: const Icon(Icons.language), onPressed: () async {
        final code = await Navigator.push(context, MaterialPageRoute(builder: (_)=> const LanguagePage()));
        if (code!=null && context.mounted) Navigator.pushReplacementNamed(context, '/reboot');
      })
    ]),
    body: Column(children:[ Expanded(child: RadarWidget(probs: Map.of(probs))), Padding(padding: const EdgeInsets.all(8), child: Text(S.t('analysis_local')) ) ]));
  }
}
