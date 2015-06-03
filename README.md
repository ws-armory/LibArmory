# LibArmory #
[![Gitter chat](https://badges.gitter.im/gitterHQ/gitter.png)](https://gitter.im/ws-armory)

## Summary ##
* [Overview](#overview)
* [Usage](#usage)
* [Integration](#integration)
* [Developer Notes](#developer-notes)
  * [How does it work](#how-does-it-work)
  * [Technical details](#technical-details)
  * [The website](#the-website)
* [Contact](#contact)

## Overview ##
This library allows to generate links to [ws-armory.github.io](http://ws-armory.github.io) pages.

The [ws-armory.github.io](http://ws-armory.github.io/) is used for two things: visualize the equipments and get a short link for sharing purpose.

The library is also available as [Curse package](http://www.curse.com/ws-addons/wildstar/231193).


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
    <Addon Author="Me" APIVersion="..." Name="MyAddon" Description="My awesome addon">
            ...
            <Script Name="libs\LibArmory\LibArmory.lua"/>
    	    ...
    </Addon>
    ```
2. If your addon is packaged using [Curse](http://curse.com/ws-addons/wildstar), add the library as a dependency in the _pkgmeta.yaml_ file

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

## Developer Notes ##

### How does it work ###

Wildstar in-game API exposes unique _#_ to reference each objects, information about this objects can be found in different online databases such as [Jabbithole](http://www.jabbithole.com).

This addon gather couples of (_slot_id_, _item_id_) then generates a link to the website based on this couples.

Information about items are then gathered by the website using the [Jabbithole](http://www.jabbithole.com) online database ([more details](https://github.com/ws-armory/ws-armory.github.io) about the website internals).


### Technical details ###

The addon is really simple, it's work only rely on three functions of the `GameLib` API: `PlayerUnit:GetEquippedItems()`, `Item:GetSlot()` and `Item:GetItemId()`.

It pretty much looks like as:

```lua
var url = InitUrl()

for key, item in ipairs(GameLib.GetPlayerUnit():GetEquippedItems()) do
	AddItemToUrl(url,item:GetSlot(), item:GetItemId())
end

--- generated links are looking like:
--- http://ws-armory.github.io/?0=17830&1=13449&4=13329&5=30459&7=28056&10=28012
```

That's all, as said before, really simple !


### The website ###

More details about the website internals can be found on it's [dedicated webpage](https://github.com/ws-armory/ws-armory.github.io).


## Contact ##
* [Curse project's page](http://www.curse.com/ws-addons/wildstar/231193)
* [Armory chat room](https://gitter.im/ws-armory)
* [Bug report and Feature request](https://github.com/ws-armory/Armory/issues)
```
