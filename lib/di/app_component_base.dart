import 'dart:async';
import 'package:my_bloc_demo/di/shared_preference.dart';
import 'api_interface.dart';
import 'network_manager.dart';

class AppComponentBase extends AppComponentBaseRepository {
  static AppComponentBase? _instance;
  NetworkManager _networkManager = NetworkManager();
  ApiInterface _apiInterface = ApiInterface();
  StreamController<bool> _progressDialogStreamController = StreamController.broadcast();
  SharedPreference _sharedPreference = SharedPreference();
  Stream<bool> get progressDialogStream => _progressDialogStreamController.stream;


  static AppComponentBase getInstance() {
    if (_instance == null) {
      _instance = AppComponentBase();
    }
    return _instance!;
  }

  init() async {
    await _networkManager.initialiseNetworkManager();
    await _sharedPreference.initPreference();
  }

  shoProgressDialog(bool value){
    _progressDialogStreamController.sink.add(value);
  }


  dispose(){
    _progressDialogStreamController.close();
    _networkManager.disposeStream();
  }

  @override
  ApiInterface getApiInterface() {
    return _apiInterface;
  }

  @override
  SharedPreference getSharedPreference() {
    return _sharedPreference;
  }

  @override
  NetworkManager getNetworkManager() {
    return _networkManager;
  }

}

abstract class AppComponentBaseRepository {
  ApiInterface getApiInterface();

  SharedPreference getSharedPreference();

  NetworkManager getNetworkManager();
}
