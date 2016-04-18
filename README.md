## Zend Framework (via Zephir)

> Zephir - (ZE)nd Engine (PH)p (I)nt(R)mediate - is a high level language that eases the creation and maintainability of extensions for PHP. Zephir extensions are exported to C code that can be compiled and optimized by major C compilers such as gcc/clang/vc++. Functionality is then exposed to the PHP language.

#### Getting Started
To get started, you will need to install [Zephir](http://zephir-lang.com).

* [NGE: Use Zephir to Compile PHP Extensions](https://wiki.nge.wdig.com/display/NGE/Using+Zephir+to+compile+PHP+extensions)
* [Zephir Documentation](http://docs.zephir-lang.com/en/latest/index.html)

#### Zend Namespace
All modules hosted here live under the `Zend` namespace and can be accessed via the following:

```php
Zend\Registry::set('config', [1, 2, 3]);
$config = Zend\Registry::get('config');
```
> Note the `Zend\Registry` forward slash, instead of `Zend_Registry` underscore

#### Module Installation
You can use the modules here by invoking the following:
```bash
$ zephir build && sudo apachectl -k restart
```
This should build the `zend.so` extension and place it in your defined php extensions directory. From there you can include the module by updating your `php.ini` file:
```ini
[zf1]
extension=/Users/wrags002/zendframework/zend/ext/modules/zend.so
```

#### Zend Modules
A list of complete (ready-to-use) modules:
* [Registry](zend/Registry.zep)
