class Username {
  final String value;
  final bool _isValid;

  Username.pure()
      : value = '',
        _isValid = false;

  Username(this.value, this._isValid);

  factory Username.fromValue(String username) {
    return Username(username, _validator(username));
  }

  static bool _validator(String value) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value);

  bool get hasError {
    return value.length == 0 || _isValid;
  }

  bool get isValid {
    return _isValid;
  }
}
