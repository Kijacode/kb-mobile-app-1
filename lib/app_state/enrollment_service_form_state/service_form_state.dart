import 'package:flutter/foundation.dart';

class ServiceFormState with ChangeNotifier {
  // intial state
  Map _formState = Map();
  Map _hiddenFields = Map();
  Map _hiddenSections = Map();
  bool _isEditableMode = true;

  // selector
  Map get formState => _formState;
  Map get hiddenFields => _hiddenFields;
  Map get hiddenSections => _hiddenSections;
  bool get isEditableMode => _isEditableMode;

  //reducers
  void resetFormState() {
    _formState.clear();
    _hiddenFields.clear();
    _hiddenSections.clear();
    notifyListeners();
  }

  void setHiddenFields(Map hiddenFields) {
    _hiddenFields = hiddenFields;
    notifyListeners();
  }

  void setHiddenSections(Map hiddenSections) {
    _hiddenSections = hiddenSections;
    notifyListeners();
  }

  void updateFormEditabilityState({bool isEditableMode = true}) {
    _isEditableMode = isEditableMode;
    notifyListeners();
  }

  void setFormFieldState(String id, dynamic value) {
    _formState[id] = value ?? '';
    notifyListeners();
  }
}
