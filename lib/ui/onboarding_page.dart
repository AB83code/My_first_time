
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import '../services/strings.dart';
import 'language_page.dart';

class OnboardingPage extends StatefulWidget { const OnboardingPage({super.key}); @override State<OnboardingPage> createState()=>_OnboardingPageState(); }
class _OnboardingPageState extends State<OnboardingPage> {
  bool mic=false, cam=false, cloud=false, agree=false;
  Future<void> _requestPerms() async { final mr=await Permission.microphone.request(); final cr=await Permission.camera.request(); setState(()=> { mic=mr.isGranted, cam=cr.isGranted }); }
  Future<void> _finish() async { if(!agree){ ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please consent'))); return; }
    final p=await SharedPreferences.getInstance(); await p.setBool('onboarded', true); if(mounted) Navigator.pushReplacementNamed(context, '/dashboard'); }
  @override Widget build(BuildContext context){
    final S = Strings.of(context);
    return Scaffold(appBar: AppBar(title: Text(S.t('welcome')), actions:[ IconButton(icon: const Icon(Icons.language), onPressed: () async {
      final code = await Navigator.push(context, MaterialPageRoute(builder: (_)=> const LanguagePage())); if (code!=null && mounted) Navigator.pushReplacementNamed(context, '/reboot'); }) ]),
      body: Padding(padding: const EdgeInsets.all(16), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(S.t('app_title'), style: const TextStyle(fontSize:22, fontWeight: FontWeight.bold)), const SizedBox(height:8), Text(S.t('intro')), const Divider(),
        CheckboxListTile(value: mic, onChanged: (_)=> _requestPerms(), title: Text(S.t('allow_mic'))),
        CheckboxListTile(value: cam, onChanged: (_)=> _requestPerms(), title: Text(S.t('allow_cam'))),
        SwitchListTile(value: cloud, onChanged: (v)=> setState(()=>cloud=v), title: Text(S.t('cloud_optin'))),
        Row(children:[ Checkbox(value: agree, onChanged: (v)=> setState(()=> agree = v ?? false)), Expanded(child: Text(S.t('consent_text'))) ]),
        Row(children:[ TextButton(onPressed: ()=> Navigator.pushNamed(context, '/policy', arguments: 'privacy_ru.md'), child: Text(S.t('policy'))),
                        TextButton(onPressed: ()=> Navigator.pushNamed(context, '/policy', arguments: 'terms_ru.md'), child: Text(S.t('terms'))), ]),
        const Spacer(), ElevatedButton(onPressed: _finish, child: Text(S.t('start'))),
      ])));
  }
}
