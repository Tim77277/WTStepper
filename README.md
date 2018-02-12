
![Brand](https://github.com/Tim77277/WTStepper/blob/master/Images/brand.png "WTStepper")

[![Version](https://img.shields.io/cocoapods/v/WTStepper.svg?style=flat)](http://cocoapods.org/pods/WTStepper)
[![License](https://img.shields.io/cocoapods/l/WTStepper.svg?style=flat)](http://cocoapods.org/pods/WTStepper)
[![Platform](https://img.shields.io/cocoapods/p/WTStepper.svg?style=flat)](http://cocoapods.org/pods/WTStepper)

## Screen
![WTStepperDemoGif](https://thumbs.gfycat.com/PitifulCreamyHare-size_restricted.gif)


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
* Xcode 9
* iOS 8.x+
* Swift 4

## Installation

WTStepper is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'WTStepper', '~> 1.0.1'
```

## Usage

### StoryBoard:

Just drop an UIView and set its' class to WTStepper
![StoryBoard](https://github.com/Tim77277/WTStepper/blob/master/Images/storyboard.png "StoryBoard")

### Code:

```swift

/// Initialization ///
let stepper = WTStepper(frame: CGRect(x: 100, y: 100, width: 100, height: 30))


/* Appearence */

/// The counter label (label in the center)
stepper.counterTextColor = .white
stepper.counterBackgroundColor = <YOUR COUNTER COLOR>

/// The increment button (right button)
stepper.incrementButtonText = "+"
stepper.incrementButtonTextColor = .white
stepper.incrementButtonColor = <YOUR INCREMENET BUTTON COLOR>

/// The decrement button (left button)
stepper.decrementButtonText = "-"
stepper.decrementButtonTextColor = .white
stepper.decrementButtonColor = <YOUR DECREMENET BUTTON COLOR>

/// The cornerRadious of the stepper, default is 0
stepper.cornerRadius = 5


/* Animation */

/// If the shake animation should be on
stepper.shakeEnabled  = false


/* Funtional Settings */ 

/// The increment / decrement for each step
stepper.step = 1

/// This value is a get/set valuable, it can be used to set a initial value or retriving the value.
stepper.value = 5

/// The maximum value the stepper can reach
stepper.maximum = 10

/// The minimum value the stepper can reach
stepper.minimum = 0

/// If the counter should be reset once the value is either larger than maximum or less than minimum.
stepper.repeatEnabled = false


/// Remeber add it to the view
self.view.addSubview(stepper)



```

## Author

WEI-TING LIN, gsl0318@hotmail.com

## License

The MIT License (MIT)

Copyright © 2017 WTStepper

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

