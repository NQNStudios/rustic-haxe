package tests;

class TestMain extends utest.Test {
  public static function main() {
    utest.UTest.run([new OptionTest()]);
  }
}