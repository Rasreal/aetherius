import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/lat_lng.dart';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _downloaded = prefs.getBool('ff_downloaded') ?? _downloaded;
  }

  late SharedPreferences prefs;

  String audioTemp1 = '';
  String audioTemp2 = '';
  String audioTemp3 = '';

  bool _downloaded = false;
  bool get downloaded => _downloaded;
  set downloaded(bool _value) {
    _downloaded = _value;
    prefs.setBool('ff_downloaded', _value);
  }

  bool _downloaded2 = false;
  bool get downloaded2 => _downloaded2;
  set downloaded2(bool _value) {
    _downloaded = _value;
    prefs.setBool('ff_downloaded', _value);
  }

  bool _downloaded3 = false;
  bool get downloaded3 => _downloaded3;
  set downloaded3(bool _value) {
    _downloaded = _value;
    prefs.setBool('ff_downloaded', _value);
  }

  String country = '';

  String email = '';

  bool checkPolicy = false;

  String password = '';

  String plan = '';

  String displayName = '';

  int step = 1;
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
