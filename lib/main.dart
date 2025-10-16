
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'services/strings.dart';
import 'ui/onboarding_page.dart';
import 'ui/dashboard_page.dart';
import 'ui/policy_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final locale = await Strings.getLocale();
  final p = await SharedPreferences.getInstance();
  final onboarded = p.getBool('onboarded') ?? false;
  runApp(AppRoot(initialLocale: locale, onboarded: onboarded));
}

class AppRoot extends StatefulWidget {
  final String initialLocale; final bool onboarded;
  const AppRoot({super.key, required this.initialLocale, required this.onboarded});
  @override State<AppRoot> createState()=> _AppRootState();
}
class _AppRootState extends State<AppRoot> {
  late String locale;
  @override void initState(){ super.initState(); locale = widget.initialLocale; }
  @override Widget build(BuildContext context) {
    return Strings(locale: locale, child: MaterialApp(
      title: 'Pet Mood Radar', theme: ThemeData(useMaterial3: true), routes: {
        '/onboarding': (_)=> const OnboardingPage(),
        '/dashboard': (_)=> const DashboardPage(),
        '/policy': (ctx){ final arg = ModalRoute.of(ctx)?.settings.arguments as String? ?? 'privacy_en.md'; return PolicyPage(fileName: arg); },
        '/reboot': (_)=> FutureBuilder(future: Strings.getLocale(), builder: (c,s){
          if(s.connectionState!=ConnectionState.done) return const Scaffold(body: Center(child: CircularProgressIndicator()));
          locale = s.data as String? ?? 'en';
          WidgetsBinding.instance.addPostFrameCallback((_){ Navigator.pushReplacementNamed(c, widget.onboarded?'/dashboard':'/onboarding'); });
          return const Scaffold();
        })
      },
      home: widget.onboarded ? const DashboardPage() : const OnboardingPage(),
    ));
  }
}
