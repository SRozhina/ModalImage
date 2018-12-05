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

## Author

sofia.rozhina@gmail.com

## License

ModalImage is available under the MIT license. See the LICENSE file for more info.
