# ModalImage

[![CI Status](https://img.shields.io/travis/sofia.rozhina@gmail.com/ModalImage.svg?style=flat)](https://travis-ci.org/sofia.rozhina@gmail.com/ModalImage)
[![Version](https://img.shields.io/cocoapods/v/ModalImage.svg?style=flat)](https://cocoapods.org/pods/ModalImage)
[![License](https://img.shields.io/cocoapods/l/ModalImage.svg?style=flat)](https://cocoapods.org/pods/ModalImage)
[![Platform](https://img.shields.io/cocoapods/p/ModalImage.svg?style=flat)](https://cocoapods.org/pods/ModalImage)

An easy to use library for fulscreen modal image presentation with zooming capability. Opened image could be dismissed by tap anywhere or swipe image too far from center. You could change background opacity and color, duration of showing, use or not bars stubs (see in examples).

Planned:
- Implement image sharing
- Horizontal orientation support
- Carthage support

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

ModalImage is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ModalImage'
```

## Easy To Use

First of all add next import to your UIViewController
```swift
import ModalImage
```
and next call 
```swift
showFullScreenImage(from: imageView)
```
And voila

<img src="./ReadmeGiffs/Example.gif" width="300"/>

## More Features

Additionally you could change background color and opacity.
Just add a couple of parameters
```swift
showFullScreenImage(from: imageView, Background(color: .yellow, alpha: 1))
```
<img src="./ReadmeGiffs/Example_default.gif" width="300"/><img src="./ReadmeGiffs/Example_background.gif" width="300"/>

And of course you could use it separately.
```swift
showFullScreenImage(from: imageView, Background(color: .yellow))
```
```swift
showFullScreenImage(from: imageView, Background(alpha: 1))
```
Default values for background color is black and for alpha is 0.6

Also you could change animation duration (in seconds).
```swift
showFullScreenImage(from: imageView, animationDuration: 1)
```
<img src="./ReadmeGiffs/Example_default.gif" width="300"/><img src="./ReadmeGiffs/Example_duration.gif" width="300"/>
Default value is 0.25

And you could change usage of Navigation Bar and TabBar stubs. 
Also you could change animation duration (in seconds).
```swift
showFullScreenImage(from: imageView, useNavbar: false)
showFullScreenImage(from: imageView, useTabbar: false)
```
There are some examples to show the difference.

<img src="./ReadmeGiffs/Example_NavbarStub_Yes.gif" width="300"/><img src="./ReadmeGiffs/Example_NavbarStub_No.gif" width="300"/>

<img src="./ReadmeGiffs/Example_TabbarStub_Yes.gif" width="300"/><img src="./ReadmeGiffs/Example_TabbarStub_No.gif" width="300"/>

Default values are true.

To use all together use next initializer
```swift
showFullScreenImage(from: imageView, animationDuration: 0.25, Background(color: .black, alpha: 0.6), useNavbar: true, useTabbar: true)
```
There is possibility to show blur background for an image.
```swift
showFullScreenImageWithBlur(from: imageView, animationDuration: 0.25, backgroundColor: .darkGray, backgroundAlpha: 1)
```
<img src="./ReadmeGiffs/Example_Blur.gif" width="300"/>

P.S. Don't use blur background with navbar and tabbar true flags.

## Author

sofia.rozhina@gmail.com

## License

ModalImage is available under the MIT license. See the LICENSE file for more info.
