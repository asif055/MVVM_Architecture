
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_archit/repository/auth_repository.dart';

import '../utils/utils.dart';

class AuthViewModel extends ChangeNotifier {

  final _myRepo = AuthRepository();

   bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
     setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      Utils.flushBarErrorMessage('Login Successfuly', context);
      if(kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if(kDebugMode) {
        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}