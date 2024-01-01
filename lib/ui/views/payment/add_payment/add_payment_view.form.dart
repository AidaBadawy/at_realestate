// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String LandlordValueKey = 'landlord';

final Map<String, TextEditingController> _AddPaymentViewTextEditingControllers =
    {};

final Map<String, FocusNode> _AddPaymentViewFocusNodes = {};

final Map<String, String? Function(String?)?> _AddPaymentViewTextValidations = {
  LandlordValueKey: null,
};

mixin $AddPaymentView {
  TextEditingController get landlordController =>
      _getFormTextEditingController(LandlordValueKey);

  FocusNode get landlordFocusNode => _getFormFocusNode(LandlordValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_AddPaymentViewTextEditingControllers.containsKey(key)) {
      return _AddPaymentViewTextEditingControllers[key]!;
    }

    _AddPaymentViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _AddPaymentViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AddPaymentViewFocusNodes.containsKey(key)) {
      return _AddPaymentViewFocusNodes[key]!;
    }
    _AddPaymentViewFocusNodes[key] = FocusNode();
    return _AddPaymentViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    landlordController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    landlordController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          LandlordValueKey: landlordController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _AddPaymentViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AddPaymentViewFocusNodes.values) {
      focusNode.dispose();
    }

    _AddPaymentViewTextEditingControllers.clear();
    _AddPaymentViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get landlordValue => this.formValueMap[LandlordValueKey] as String?;

  set landlordValue(String? value) {
    this.setData(
      this.formValueMap..addAll({LandlordValueKey: value}),
    );

    if (_AddPaymentViewTextEditingControllers.containsKey(LandlordValueKey)) {
      _AddPaymentViewTextEditingControllers[LandlordValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasLandlord =>
      this.formValueMap.containsKey(LandlordValueKey) &&
      (landlordValue?.isNotEmpty ?? false);

  bool get hasLandlordValidationMessage =>
      this.fieldsValidationMessages[LandlordValueKey]?.isNotEmpty ?? false;

  String? get landlordValidationMessage =>
      this.fieldsValidationMessages[LandlordValueKey];
}

extension Methods on FormViewModel {
  setLandlordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LandlordValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    landlordValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      LandlordValueKey: getValidationMessage(LandlordValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _AddPaymentViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _AddPaymentViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormViewModel model) => model.setValidationMessages({
      LandlordValueKey: getValidationMessage(LandlordValueKey),
    });
