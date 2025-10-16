
import 'dart:async';
import 'dart:typed_data';
import 'package:mic_stream/mic_stream.dart';

class AudioService {
  StreamSubscription<List<int>>? _subscription;
  final _controller = StreamController<Int16List>.broadcast();
  final int sampleRate = 16000;
  Stream<Int16List> get stream => _controller.stream;
  Future<void> start() async {
    final stream = await MicStream.microphone(
      audioSource: AudioSource.DEFAULT, sampleRate: sampleRate,
      channelConfig: ChannelConfig.CHANNEL_IN_MONO, audioFormat: AudioFormat.ENCODING_PCM_16BIT);
    _subscription = stream?.listen((d)=> _controller.add(Int16List.fromList(d)));
  }
  Future<void> stop() async { await _subscription?.cancel(); await _controller.close(); }
}
class SimpleVAD { bool isSpeech(Int16List f){ if(f.isEmpty) return false; double e=0; for(final s in f){ e+=s*s; } return e/f.length>200.0; } }
class MelSpectrogram{ List<List<double>> compute(Int16List a){ return [List.filled(64, 0.01)]; } }
