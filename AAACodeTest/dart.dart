
abstract class Doer {
  void doSomething();
}

class EffectiveDoer extends Doer {
  void doSomething() {
    print("object");
  }
}
main() {
 var d = EffectiveDoer();
 d.doSomething();
}
