
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
class PolicyPage extends StatefulWidget { final String fileName; const PolicyPage({super.key, required this.fileName}); @override State<PolicyPage> createState()=>_PolicyPageState(); }
class _PolicyPageState extends State<PolicyPage> {
  String text='Loading...';
  @override void initState(){ super.initState(); rootBundle.loadString('assets/policy/${widget.fileName}').then((v)=> setState(()=> text=v)).catchError((_){ setState(()=> text='Not available'); }); }
  @override Widget build(BuildContext context){ return Scaffold(appBar: AppBar(title: Text(widget.fileName)), body: SingleChildScrollView(padding: const EdgeInsets.all(16), child: Text(text))); }
}
