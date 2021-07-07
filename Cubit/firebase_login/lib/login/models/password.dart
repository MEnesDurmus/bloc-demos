class Password {
  final String value;
  final bool _isValid;

  Password.pure()
      : value = '',
        _isValid = false;

  Password(this.value, this._isValid);

  factory Password.fromValue(String password) {
    return Password(password, _validator(password));
  }

  static bool _validator(String value) => value.length > 7;

  bool get hasError {
    return value.length == 0 || _isValid;
  }

  bool get isValid {
    return _isValid;
  }
}
