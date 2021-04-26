//
//  CircularView.swift
//  CreativeKids(Updated)
//
//  Created by Creative Kids on 10/04/21.
//

import Foundation
import UIKit

class CircularProgressView: UIView {
    var progressLyr = CAShapeLayer()
    var trackLyr = CAShapeLayer()
    var percentLabel = UILabel()
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
            self.makeCircularPath()
    }
    var progressClr = UIColor.white {
        didSet {
            progressLyr.strokeColor = progressClr.cgColor
        }
    }
    var trackClr = UIColor.white {
        didSet {
            trackLyr.strokeColor = trackClr.cgColor
        }
    }
    
    var percentagetext = String() {
        didSet {
            percentLabel.text = percentagetext
        }
    }
    
    func makeCircularPath() {
        self.backgroundColor = UIColor.clear
        self.layer.cornerRadius = self.frame.size.width/2
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2), radius: (self.frame.size.width - 1.5)/2, startAngle: CGFloat(-0.5 * .pi), endAngle: CGFloat(1.5 * .pi), clockwise: true)
        trackLyr.path = circlePath.cgPath
        trackLyr.fillColor = UIColor.clear.cgColor
        trackLyr.strokeColor = trackClr.cgColor
        trackLyr.lineWidth = 12
        trackLyr.strokeEnd = 1.0
        layer.addSublayer(trackLyr)
        progressLyr.path = circlePath.cgPath
        progressLyr.fillColor = UIColor.clear.cgColor
        progressLyr.strokeColor = progressClr.cgColor
        progressLyr.lineWidth = 10
        progressLyr.strokeEnd = 0.0
        progressLyr.lineCap = .round
        trackLyr.addSublayer(progressLyr)
        percentLabel = UILabel(frame: CGRect(x: (self.frame.width - 50) / 2 ,y: (self.frame.height - 25) / 2, width: 50, height: 25))
        percentLabel.textAlignment = .center
//        percentLabel.text = percentagetext
        percentLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        self.addSubview(percentLabel)
    }
    func setProgressWithAnimation(duration: TimeInterval, value: Float) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = 0
        animation.toValue = value
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        progressLyr.strokeEnd = CGFloat(value)
        progressLyr.add(animation, forKey: "animateprogress")
        percentLabel.text = "\(Int(value * 100))%"
    }
}

