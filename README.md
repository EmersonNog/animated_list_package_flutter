# Animated List

![Teste](https://github.com/hnvn/flutter_shimmer/workflows/unit%20test/badge.svg) 

A package that allows you to easily add transition and glow effects to a list.

## Packages used

- [x] shimmer: ^3.0.0
- [x] flutter_staggered_animations: ^1.1.1

## How to use

Example of how to add the dependency in your `pubspec.yaml` file:

```yaml
dependencies:
  animated_list: ^0.0.1 
```

Example of how to implement it in your project

```dart
import 'package:list_animated/list_animated.dart';
``` 

```dart
ListAnimated(
  text: "Animated List Item",
  icon: Icons.star,
  colorBorder: Colors.grey,
  colorShine: Colors.amber,
  duration: Duration(seconds: 2),
  horizontalOffset: 500.0, 
  colorIcon: Colors.red, 
  colorText: Colors.black,
),
```

## Example 

<p>
    <img src="https://github.com/EmersonNog/animated_list_package_flutter/blob/main/assets/teste_pratico.gif?raw=true" width="500"/> 
    <img src="https://github.com/EmersonNog/animated_list_package_flutter/blob/main/assets/teste.gif?raw=true" width="500"/> 
</p>

