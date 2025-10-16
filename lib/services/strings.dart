
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Strings extends InheritedWidget {
  final String locale;
  final Map<String, Map<String,String>> _t = {
    'en': {'app_title':'Pet Mood Radar','welcome':'Welcome','intro':'On‑device audio & face analysis. No raw recordings stored.','allow_mic':'Allow microphone','allow_cam':'Allow camera','cloud_optin':'Anonymous embedding export (optional)','consent_text':'I agree with the Privacy Policy and Terms of Use','start':'Start','policy':'Privacy','terms':'Terms','analysis_local':'Analysis runs locally. See policy.','species_cat':'Cat','species_dog':'Dog'},
    'ru': {'app_title':'Радар настроений питомца','welcome':'Добро пожаловать','intro':'Анализ аудио и «морды» выполняется на устройстве. Мы не храним сырые записи.','allow_mic':'Разрешить микрофон','allow_cam':'Разрешить камеру','cloud_optin':'Анонимный экспорт эмбеддингов (опционально)','consent_text':'Согласен(на) с Политикой и Условиями','start':'Начать','policy':'Политика','terms':'Условия','analysis_local':'Анализ локальный. См. политику.','species_cat':'Кот','species_dog':'Собака'},
    'lv': {'app_title':'Mājdzīvnieka garastāvokļa radars','welcome':'Laipni lūdzam','intro':'Audio un sejas analīze notiek ierīcē. Neuzglabājam izejas ierakstus.','allow_mic':'Atļaut mikrofonu','allow_cam':'Atļaut kameru','cloud_optin':'Anonīma iegulumu nosūtīšana (pēc izvēles)','consent_text':'Piekrītu Privātumam un Noteikumiem','start':'Sākt','policy':'Privātums','terms':'Noteikumi','analysis_local':'Analīze ierīcē. Sk. politiku.','species_cat':'Kaķis','species_dog':'Suns'},
    'de': {'app_title':'Stimmungsradar für Haustiere','welcome':'Willkommen','intro':'Audio- und Gesichtsanalyse erfolgt auf dem Gerät. Keine Rohdaten.','allow_mic':'Mikrofon erlauben','allow_cam':'Kamera erlauben','cloud_optin':'Anonymer Embedding-Export (optional)','consent_text':'Ich stimme Datenschutz & Nutzungsbedingungen zu','start':'Start','policy':'Datenschutz','terms':'Nutzungsbedingungen','analysis_local':'Analyse lokal. Siehe Richtlinie.','species_cat':'Katze','species_dog':'Hund'},
    'es': {'app_title':'Radar de ánimo de mascotas','welcome':'Bienvenido/a','intro':'El análisis de audio y rostro se realiza en el dispositivo. No guardamos brutos.','allow_mic':'Permitir micrófono','allow_cam':'Permitir cámara','cloud_optin':'Exportación anónima de embeddings (opcional)','consent_text':'Acepto la Política y los Términos','start':'Empezar','policy':'Privacidad','terms':'Términos','analysis_local':'Análisis local. Ver política.','species_cat':'Gato','species_dog':'Perro'},
    'pt': {'app_title':'Radar de humor do pet','welcome':'Bem-vindo(a)','intro':'A análise de áudio e rosto ocorre no dispositivo. Não armazenamos brutos.','allow_mic':'Permitir microfone','allow_cam':'Permitir câmera','cloud_optin':'Exportação anônima de embeddings (opcional)','consent_text':'Concordo com a Privacidade e os Termos','start':'Começar','policy':'Privacidade','terms':'Termos','analysis_local':'Análise local. Veja a política.','species_cat':'Gato','species_dog':'Cão'},
  };
  Strings({required this.locale, required super.child});
  String t(String key) => _t[locale]?[key] ?? _t['en']![key] ?? key;
  static Strings of(BuildContext context) => context.dependOnInheritedWidgetOfExactType<Strings>()!;
  static Future<void> setLocale(String code) async { final p=await SharedPreferences.getInstance(); await p.setString('locale', code); }
  static Future<String> getLocale() async { final p=await SharedPreferences.getInstance(); return p.getString('locale') ?? 'ru'; }
  @override bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
