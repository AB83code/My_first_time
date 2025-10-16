
import 'package:flutter/material.dart';
import 'package:flutter_radar_chart/flutter_radar_chart.dart';
class RadarWidget extends StatelessWidget {
  final Map<String,double> probs; const RadarWidget({super.key, required this.probs});
  @override Widget build(BuildContext context){
    final classes = probs.keys.toList();
    final data = [ classes.map((c)=> (probs[c] ?? 0.0) * 100).toList() ];
    return Padding(padding: const EdgeInsets.all(12),
      child: RadarChart.light(ticks: const [20,40,60,80,100], features: classes.map((c)=> c.toUpperCase()).toList(), data: data));
  }
}
