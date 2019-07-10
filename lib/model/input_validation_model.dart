import 'package:scoped_model/scoped_model.dart';

class InputValidationModel extends Model {
  bool _autoValidate = false;
  bool get validationSetting => _autoValidate;

  void changeValidationOption() {
    if (!_autoValidate){
      _autoValidate = true;
      notifyListeners();
    }
  }
}