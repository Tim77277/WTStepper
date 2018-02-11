
![Brand](https://github.com/Tim77277/WTStepper/blob/master/Images/brand.png "WTStepper")

[![Version](https://img.shields.io/cocoapods/v/WTStepper.svg?style=flat)](http://cocoapods.org/pods/WTStepper)
[![License](https://img.shields.io/cocoapods/l/WTStepper.svg?style=flat)](http://cocoapods.org/pods/WTStepper)
[![Platform](https://img.shields.io/cocoapods/p/WTStepper.svg?style=flat)](http://cocoapods.org/pods/WTStepper)

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
pod 'WTStepper'
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

WTStepper is available under the MIT license. See the LICENSE file for more info.

