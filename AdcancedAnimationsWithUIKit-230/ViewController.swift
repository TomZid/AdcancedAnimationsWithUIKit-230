//
//  ViewController.swift
//  AdcancedAnimationsWithUIKit-230
//
//  Created by tom on 07/09/2017.
//  Copyright © 2017 tom. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var circle: UIView!
    var animator: UIViewPropertyAnimator!
    var isLhs = true

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func handleTap(_ sender: UITapGestureRecognizer) {
        let red: CGFloat = CGFloat(arc4random() % 255), blue = CGFloat(arc4random() % 255), green = CGFloat(arc4random() % 255);
        sender.view?.backgroundColor = UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 1)
    }

    @IBAction func handlePan(recognizer: UIPanGestureRecognizer) {

        let translation = recognizer.translation(in: circle)
        let dx: CGFloat = self.isLhs ? 90.0 : -90.0

        switch recognizer.state {
        case .began:
            animator = UIViewPropertyAnimator(duration: 1, curve: .easeOut, animations: {
                self.circle.frame = self.circle.frame.offsetBy(dx: dx, dy: 0);
            })
            animator .pauseAnimation()
        case .changed:
            animator.fractionComplete = translation.x / dx

        case .ended:
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
            self.isLhs = !self.isLhs
        default:
            NSLog("end")
        }
    }

}
