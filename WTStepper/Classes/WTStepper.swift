//
//  WTStepper.swift
//  Pods
//
//  Created by Wei-Ting Lin on 2/8/18.
//

import UIKit
import QuartzCore

@IBDesignable
open class WTStepper: UIView {
    
    private var decrementButton: UIButton!
    private var counterLabel: UILabel!
    private var incrementButton: UIButton!
    fileprivate var decrementShape: CAShapeLayer!
    fileprivate var incrementShape: CAShapeLayer!
    
    /// The `Constants` use for the animation
    fileprivate let kActionKey    = "action"
    fileprivate let kincrementKey = "increment"
    fileprivate let kdecrementKey = "decrement"
    
    fileprivate static let kDefaultButtonColor  = UIColor(red: 55/255.0, green: 143/255.0, blue: 171/255.0, alpha: 1)
    fileprivate static let kDefaultCounterColor = UIColor(red: 72/255.0, green: 195/255.0, blue: 232/255.0, alpha: 1)
    fileprivate static let kDefaultButtonTextColor: UIColor  = .white
    fileprivate static let kDefaultCounterTextColor: UIColor = .white
    
    /// The `Valuable` use to determine the value of the stepper
    private(set) var counter: Int = 0
    
    open func setCounter(value: Int) {
        counter = value
        counterLabel.text = "\(counter)"
    }
    
    /// The `Valuable` use to indicate each step of the value should be incremented
    @IBInspectable open var step: Int = 1
    
    /// The `Valuable` controls the maximum value the stepper can reach
    @IBInspectable open var repeatEnabled: Bool = false
    
    /// The `Valuable` controls the shake animation
    @IBInspectable open var shakeEnabled: Bool = false
    
    /// The `Valuable` controls the maximum value the stepper can reach
    @IBInspectable open var maximum: Int = 100 {
        didSet {
            update()
        }
    }
    
    /// The `Valuable` controls the minimum value the stepper can reach
    @IBInspectable open var minimum: Int = 0 {
        didSet {
            update()
        }
    }
    
    /// The `Valuable` controls stepper's cornerRadius
    @IBInspectable open var cornerRadius: CGFloat = 0 {
        didSet {
            update()
        }
    }
    
    /// The `Valuable` controls the color of the decrementButton
    @IBInspectable open var decrementButtonColor: UIColor = kDefaultButtonColor {
        didSet {
            update()
        }
    }
    
    /// The `Valuable` controls decrementButton's text color
    @IBInspectable open var decrementButtonTextColor: UIColor = .white {
        didSet {
            update()
        }
    }
    
    /// The `Valuable` controls the text of the decrementButton
    @IBInspectable open var decrementButtonText: String = "" {
        didSet {
            update()
        }
    }
    
    @IBInspectable open var decrementButtonImage: UIImage? = nil {
        didSet {
            update()
        }
    }
    
    /// The `Valuable` controls the size of the decrementButton text
    @IBInspectable open var decrementButtonTextFontSize: CGFloat = 20 {
        didSet {
            update()
        }
    }
    
    /// The `Valuable` controls the color of the incrementButton
    @IBInspectable open var incrementButtonColor: UIColor = kDefaultButtonColor {
        didSet {
            update()
        }
    }
    
    /// The `Valuable` controls incrementButton's text color
    @IBInspectable open var incrementButtonTextColor: UIColor = kDefaultButtonTextColor {
        didSet {
            update()
        }
    }
    
    /// The `Valuable` controls incrementButton text
    @IBInspectable open var incrementButtonText: String = "" {
        didSet {
            update()
        }
    }
    
    /// The `Valuable` controls incrementButton image
    @IBInspectable open var incrementButtonImage: UIImage? = nil {
        didSet {
            update()
        }
    }
    
    /// The `Valuable` controls the size of the incrementButton text
    @IBInspectable open var incrementButtonTextFontSize: CGFloat = 20 {
        didSet {
            update()
        }
    }
    
    /// The `Valuable` controls counterLabel background color
    @IBInspectable open var counterBackgroundColor: UIColor = kDefaultCounterColor {
        didSet {
            update()
        }
    }
    
    /// The `Valuable` controls counterLabel text color
    @IBInspectable open var counterTextColor: UIColor = kDefaultCounterTextColor {
        didSet {
            update()
        }
    }
    
    /// The `Valuable` controls counterLabel text size
    @IBInspectable open var counterTextFontSize: CGFloat = 22 {
        didSet {
            update()
        }
    }
    
    
    /**
     increment Action Handler
     
     This function shows the click animation and decrements counter value by 1
     */
    @objc private func incrementActionHandler() {
        
        disableTouch()
        
        let clickAnimation     = getClickAnimation(for: kincrementKey)
        incrementShape.opacity = 0.15
        incrementShape.add(clickAnimation, forKey: kActionKey)
        
        if shakeEnabled {
            shakeCounter()
        }
        
        counter = (repeatEnabled && counter == maximum) ? minimum : min(counter + step, maximum)
        counterLabel.text = "\(counter)"
    }
    
    
    /**
     decrement Action Handler
     
     This function shows the click animation and increments counter value by 1
     */
    @objc private func decrementActionHandler() {
        
        disableTouch()
        
        let clickAnimation = getClickAnimation(for: kdecrementKey)
        decrementShape.opacity = 0.15
        decrementShape.add(clickAnimation, forKey: kActionKey)
        
        if shakeEnabled {
            shakeCounter()
        }
        
        counter = (repeatEnabled && counter == minimum) ? maximum : max(counter - step, minimum)
        
        counterLabel.text = "\(counter)"
    }
    
    
    /**
     This function is a shortcut to create click animation
     
     It will be use in the click action for both increment and decrement.
     You should not modify this function unless you want to have a different click animation
     */
    private func getClickAnimation(for key: String) -> CAKeyframeAnimation {
        var grayGoUp = CATransform3DIdentity
        grayGoUp = CATransform3DScale(grayGoUp, 2.5, 2.5, 2.5)
        
        let clickAnimation = CAKeyframeAnimation(keyPath: "transform")
        clickAnimation.values = [NSValue(caTransform3D:CATransform3DIdentity),
                                 NSValue(caTransform3D:grayGoUp)]
        clickAnimation.keyTimes = [0.0, 0.8]
        clickAnimation.duration = 0.15
        clickAnimation.beginTime = CACurrentMediaTime() + 0.01
        clickAnimation.fillMode =  kCAFillModeBackwards
        clickAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
        clickAnimation.setValue(key, forKey: kActionKey)
        clickAnimation.delegate = self
        return clickAnimation
    }
    
    private func shakeCounter() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.1
        animation.repeatCount = 1
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: counterLabel.center.x - 2, y: counterLabel.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: counterLabel.center.x + 2, y: counterLabel.center.y))
        counterLabel.layer.add(animation, forKey: "position")
    }
    
    /**
     Update UI
     
     This function is called every time an user have changed some value on the Inspector.
     It will update itself accordingly
     */
    private func update() {
        
        if let decrementButton = self.decrementButton {
            decrementButton.backgroundColor = decrementButtonColor
            decrementButton.setTitleColor(decrementButtonTextColor, for: .normal)
            decrementButton.setTitle(decrementButtonText, for: .normal)
            decrementButton.setImage(decrementButtonImage, for: .normal)
            decrementButton.titleLabel!.font = UIFont.boldSystemFont(ofSize: decrementButtonTextFontSize)
        }
        
        if let incrementButton = self.incrementButton {
            incrementButton.backgroundColor = incrementButtonColor
            incrementButton.setTitleColor(incrementButtonTextColor, for: .normal)
            incrementButton.setTitle(incrementButtonText, for: .normal)
            incrementButton.setImage(incrementButtonImage, for: .normal)
            incrementButton.titleLabel!.font = UIFont.boldSystemFont(ofSize: incrementButtonTextFontSize)
        }
        
        if let counterLabel = counterLabel {
            counterLabel.textColor = counterTextColor
            counterLabel.backgroundColor = counterBackgroundColor
            counterLabel.textAlignment = .center
            counterLabel.text = "\(counter)"
            counterLabel.font = UIFont.boldSystemFont(ofSize: counterTextFontSize)
            counterLabel.adjustsFontSizeToFitWidth = true
            counterLabel.minimumScaleFactor = 0.5
        }
        
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
    
    
    /**
     Set Layout
     
     This function is used to initialize required ui element such as incrementButton, decrementButton, counterLabel and shapes
     */
    private func setLayout() {
        
        let buttonWidth = self.frame.width / 4
        let labelWidth  = self.frame.width / 2
        
        /// initial decrement button
        if decrementButton == nil {
            decrementButton = UIButton(frame: CGRect(x: 0, y: 0, width: buttonWidth, height: self.frame.height))
            decrementButton.addTarget(self, action: #selector(self.decrementActionHandler), for: .touchUpInside)
        }
        
        /// initial increment button
        if incrementButton == nil {
            incrementButton = UIButton(frame: CGRect(x: buttonWidth + labelWidth, y: 0, width: buttonWidth, height: self.frame.height))
            incrementButton.addTarget(self, action: #selector(self.incrementActionHandler), for: .touchUpInside)
        }
        
        /// inital counter label
        if counterLabel == nil {
            counterLabel = UILabel(frame: CGRect(x: buttonWidth, y: 0, width: labelWidth, height: self.frame.height))
            counterLabel.text = "\(counter)"
        }
        
        self.addSubview(decrementButton)
        self.addSubview(counterLabel)
        self.addSubview(incrementButton)
        
        /// add increment shape for (incrementButton click animation)
        if incrementShape == nil {
            incrementShape = CAShapeLayer()
            incrementShape.path = UIBezierPath(ovalIn: CGRect(x: incrementButton.bounds.origin.x, y: incrementButton.bounds.origin.y, width: incrementButton.bounds.width, height: incrementButton.bounds.width)).cgPath
            incrementShape.bounds = (incrementShape.path?.boundingBox)!
            incrementShape.fillColor = UIColor.black.cgColor
            incrementShape.lineWidth = 1
            incrementShape.position = incrementButton.center
            incrementShape.transform = CATransform3DMakeScale(0.2, 0.2, 0.2)
            incrementShape.opacity = 0
            self.layer.addSublayer(incrementShape)
        }
        
        /// add decrement shape for (decrementButton click animation)
        if decrementShape == nil {
            decrementShape = CAShapeLayer()
            decrementShape.path = UIBezierPath(ovalIn: CGRect(x: decrementButton.bounds.origin.x, y: decrementButton.bounds.origin.y, width: decrementButton.bounds.width, height: decrementButton.bounds.width)).cgPath
            decrementShape.bounds = (decrementShape.path?.boundingBox)!
            decrementShape.fillColor = UIColor.black.cgColor
            decrementShape.lineWidth = 1
            decrementShape.position = decrementButton.center
            decrementShape.transform = CATransform3DMakeScale(0.2, 0.2, 0.2)
            decrementShape.opacity = 0
            self.layer.addSublayer(decrementShape)
        }
    }
    
    fileprivate func disableTouch() {
        self.incrementButton.isUserInteractionEnabled  = false
        self.decrementButton.isUserInteractionEnabled = false
    }
    
    fileprivate func enableTouch() {
        self.incrementButton.isUserInteractionEnabled  = true
        self.decrementButton.isUserInteractionEnabled = true
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        setLayout()
        update()
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension WTStepper: CAAnimationDelegate {
    public func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if let key = anim.value(forKey: kActionKey) as? String {
            switch key  {
            case kincrementKey:
                incrementShape.opacity  = 0
            case kdecrementKey:
                decrementShape.opacity = 0
            default:
                break
            }
        }
        enableTouch()
    }
}

