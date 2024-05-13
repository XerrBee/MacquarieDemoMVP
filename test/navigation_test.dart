import 'package:test/test.dart';
import 'package:comp3130/screens/login_or_register.dart';

void main() {
  test('Initial Page is Login Page', () {
    final toggler = PageTogglerImpl();
    expect(toggler.showLoginPage, true);
  });

  test('Toggle Pages Test', () {
    final toggler = PageTogglerImpl();
    toggler.togglePages();
    expect(toggler.showLoginPage, false);

    toggler.togglePages();
    expect(toggler.showLoginPage, true);
  });
}
