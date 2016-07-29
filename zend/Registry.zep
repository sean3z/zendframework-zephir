namespace Zend;

class Registry {

  private static instance;
  protected static className = "Zend\Registry";

  public final static function getInstance() -> <Zend\Registry> {
    if (self::instance === null) {
      let self::instance = new static();
    }

    return self::instance;
  }

  public final static function isRegistered(const string key) -> boolean {
    var instance;
    let instance = self::getInstance();
    
    return isset instance->{key};
  }

  public final static function __unsetInstance() -> void {
    let self::instance = null;
  }

  public final static function setClassName(const string className) -> void {
    if unlikely self::instance !== null {
        throw new \Exception("Registry is already initialized");
    }

    if unlikely typeof className != "string" {
        throw new \Exception("Argument is not a class name");
    }

    let self::className = className;
  }

  public static function get(const string key, noop = null) -> null | var {
    var instance, value;
    let instance = self::getInstance();

    if fetch value, instance->{key} {
      if gettype(value) == "object" && get_class(value) == "Closure" {
        let value = call_user_func(value, key);
        let instance->{key} = value;
      }

      return value;
    }

    return null;
     // throw new \Exception("No entry is registered for key ". key);
  }

  public static function set(const string key, const value) -> void {
    var instance;
    let instance = self::getInstance();

    let instance->{key} = value;
  }

  public static function remove(const string key) -> void {
    var instance;
    let instance = self::getInstance();

    let instance->{key} = null;
  }

  /**
  * ArrayObject polyfill (for legacy callers)
  */
  public final function offsetExists(const string key) -> boolean {
    return self::isRegistered(key);
  }

  public function offsetGet(key) {
    return self::get(key);
  }

  public final function offsetUnset(const string key) -> void {
    self::remove(key);
  }
}
