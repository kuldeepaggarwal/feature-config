# feature-config

Introduces Feature class.
Each instance of Feature class is feature configuration, and keeps
* feature name
* state (enabled or disabled)
* also may contain some feature-specific configuration as key-value

Features instantiates at application startup and keeps in memory while application is running.


### Using
```
Feature.find('awesome_feature')
=> #<Feature:0x0..>
```

```
Feature.find('awesome_feature').enabled?
=> true
```

```
Feature.find('awesome_feature').properties
=> { :host => 'localhost', :login => 'login', :log => 'whatever' }
```

Also, first-level properties accessible as instance methods:
```
Feature.find('awesome_feature').log
=> 'whatever'
```

### Configuring

Place all general configs under config/features as .yml files

```yml
awesome_feature: true
useless_feature: false
not_so_hot_feature: true
```

If you want to configure some features with additional properties
drop .yml file (or files) under config/features/configurations

```yml
awesome_feature:
  host: localhost
  port: 1111
  awesomeness: 'awesome'
```