mixin GetUtils {
  static bool valiDateUrl(String? input) {
    if (input != null) {
      return Uri.parse(input).host.isNotEmpty;
    } else {
      return false;
    }
  }
}
