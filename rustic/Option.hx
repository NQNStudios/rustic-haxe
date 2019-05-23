package rustic;

class Option {
  public static function isSome<T>(o: haxe.ds.Option<T>): Bool {
    switch (o) {
    case Some(_): return true;
    default: return false;
    }
  }

  public static function isNone<T>(o: haxe.ds.Option<T>): Bool {
    return !isSome(o);
  }

  // Because haxe has optional parameters, this replaces expect().
  public static function unwrap<T>(o: haxe.ds.Option<T>, errorMessage = 'Tried to unwrap a None value.'): T {
        switch (o) {
            case Some(value):
                return value;
            case None:
                throw errorMessage;
        }
    }

  public static function unwrapOr<T>(o: haxe.ds.Option<T>, defaultValue: T): T {
    if (isSome(o)) return unwrap(o);
    else return defaultValue;
  }

  public static function unwrapOrElse<T>(o: haxe.ds.Option<T>, defaultFunction: Void -> T) {
    if (isSome(o)) return unwrap(o);
    else return defaultFunction();
  }

  // There are also map(), map_or(), and map_or_else(), ok_or(), ok_or_else(), and(), and_then(), iter(), or(), or_else(), xor(), get_or_insert(), get_or_insert_with(), take(), replace(), unwrap_or_default(), transpose(), which might be relevant to Haxe Options.
  // take() and replace() might be very nontrivial -- can a static extension modify an enum's value?
}
