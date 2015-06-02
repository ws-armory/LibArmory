# LibArmory #

## Overview ##
This library allows to generate links to [ws-armory.github.io](http://ws-armory.github.io) pages.

The library is also available as [Curse package](http://www.curse.com/ws-addons/wildstar/231193-libarmory).


## API ##
- `LibArmory.generatelink()`: generate a [ws-armory.github.io](http://ws-armory.github.io) link to the current equiped items

## Usage ##
1. Load the library
```lua
local LibArmory = Apollo.GetPackage("Armory:LibArmory-1.0").tPackage
```

2. Use the `generatelink()` function

```lua
local link = LibArmory.generatelink()
```

## Integration ##
1. Add the library in the _toc.xml_ file

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Addon Author="Me" APIVersion="..." Name="MyAddon" Description="My awesome add-on">
        ...
        <Script Name="libs\LibArmory\LibArmory.lua"/>
	...
</Addon>
```

2. If your add-on is packaged using [Curse](http://curse.com/ws-addons/wildstar), add the library as a dependency in the _pkgmeta.yaml_ file

```yaml
package-as: MyAddon
enable-nolib-creation: no
...
externals:
  libs/LibArmory:
    url: https://github.com/ws-armory/LibArmory.git
    tag: 1.0
...
```

## The website ##

More details about the [ws-armory.github.io](http://ws-armory.github.io) website internals can be found on it's [dedicated webpage](https://github.com/ws-armory/ws-armory.github.io).


## Contact ##
* [Curse project's page](http://www.curse.com/ws-addons/wildstar/231193)
* [Armory chat room](https://gitter.im/ws-armory/chat/~chat)
* [Wildstar addon chat room](https://gitter.im/ws-armory/Armory/~chat)
* [Bug report and Feature request](https://github.com/ws-armory/Armory/issues)
* [Private message](https://github.com/olbat)
```
