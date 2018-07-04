//
//  HeartViewController.swift
//  feelae
//
//  Created by Johanna Khenkittisak on 04/07/2018.
//  Copyright © 2018 Thibaut Marsal. All rights reserved.
//

import UIKit

class HeartViewController: UIViewController, URLSessionDownloadDelegate {
    
    
    
    let shapeLayer = CAShapeLayer()
    
    lazy var percentageLabel: UILabel = {
        let label = UILabel()
        label.text = "Start"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 22)
        return label
    }()
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Détection du\n pouls"
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 12)
        return titleLabel
    }()
    lazy var bpmLabel: UILabel = {
        let bpmLabel = UILabel()
        bpmLabel.text = "❤️\n bpm"
        bpmLabel.numberOfLines = 2
        bpmLabel.textAlignment = .center
        bpmLabel.font = UIFont.boldSystemFont(ofSize: 12)
        return bpmLabel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        let trackLayer = CAShapeLayer()
        let circulatPath = UIBezierPath(arcCenter: .zero , radius: 100, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
      
        
        trackLayer.path = circulatPath.cgPath
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.lineWidth = 10
        trackLayer.fillColor = UIColor.white.cgColor
        trackLayer.lineCap = kCALineCapRound
        trackLayer.position = view.center
        view.layer.addSublayer(trackLayer)
        
        
        
        
        
        
        
        shapeLayer.path = circulatPath.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = kCALineCapRound
        shapeLayer.strokeEnd = 0
        shapeLayer.position = view.center
        shapeLayer.transform = CATransform3DMakeRotation(-CGFloat.pi/2, 0, 0, 1)
        view.layer.addSublayer(shapeLayer)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
        view.addSubview(percentageLabel)
        view.addSubview(titleLabel)
        view.addSubview(bpmLabel)
        
        let midX = self.view.bounds.midX
        let midY = self.view.bounds.midY
        
        titleLabel.frame = CGRect(x: 0, y: 0, width: 80, height: 130)
        bpmLabel.frame = CGRect(x: 0, y: 0, width: 80, height: 130)
        
        titleLabel.frame.origin = CGPoint(x:  midX - 40.0, y: midY - 100.0)
        bpmLabel.frame.origin = CGPoint(x:  midX - 40.0, y: midY - 20)
        
        percentageLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        percentageLabel.center = view.center
        
        
        
        
    }
    
    let urlString = "https://blog.tomasmahrik.com/wp-content/uploads/2015/06/swift.jpg"
    private func beginDownloadingFile(){
        shapeLayer.strokeEnd = 0
        let configuration = URLSessionConfiguration.default
        let operationQueue = OperationQueue()
        let urlSession = URLSession(configuration: configuration, delegate: self, delegateQueue: operationQueue)
        
        guard let url = URL(string: urlString) else { return }
        
        let downloadTask = urlSession.downloadTask(with: url)
        downloadTask.resume()
    }
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64,totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
        
        print(totalBytesWritten,totalBytesExpectedToWrite)
        let percentage = CGFloat(totalBytesWritten) / CGFloat(totalBytesExpectedToWrite)
        
        DispatchQueue.main.async {
            self.percentageLabel.text = "\(Int(percentage * 100))"
            self.shapeLayer.strokeEnd = percentage
        }
        
        
    }
    
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("finish")
    }
    
    
    fileprivate func animateCircle() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "basic")
    }
    
    @objc private func handleTap(){
        //        animateCircle()
        beginDownloadingFile()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

