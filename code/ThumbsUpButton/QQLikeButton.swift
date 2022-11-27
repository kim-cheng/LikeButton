//
//  QQLikeButton.swift
//  ThumbsUpButton
//
//  Created by kim on 2022/11/26.
//

import UIKit

class QQLikeButton: UIButton {
    var explosionLayer:CAEmitterLayer!
    var explosionCell:CAEmitterCell!
    var touch:Bool!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupExplosion()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")

    }
    
    func setupExplosion(){
        explosionCell = CAEmitterCell()
        explosionCell.name = "explosionCell"
        explosionCell.alphaSpeed = -1.0
        explosionCell.alphaRange = 0.1
        explosionCell.lifetime = 1
        explosionCell.lifetimeRange = 0.1
        explosionCell.velocity = 40.0
        explosionCell.velocityRange = 10.0
        explosionCell.scale = 0.08
        explosionCell.scaleRange = 0.02
        explosionCell.contents = UIImage(named:"spark_yellow")?.cgImage
        
        explosionLayer = CAEmitterLayer()
        self.layer.addSublayer(explosionLayer)

        explosionLayer.emitterSize = CGSizeMake(self.bounds.size.width+40, self.bounds.size.height+40)
        explosionLayer.emitterShape = CAEmitterLayerEmitterShape.circle
        explosionLayer.emitterMode = CAEmitterLayerEmitterMode.outline
        explosionLayer.renderMode = CAEmitterLayerRenderMode.additive
        explosionLayer.emitterCells = [explosionCell]

        self.setImage(UIImage(named: "dislike"), for: .normal)
        self.setImage(UIImage(named: "liek_orange"), for: .selected)

        self.addTarget(self, action:#selector(btnClick), for: .touchUpInside)
        
    }
    
    @objc func btnClick(_ button: UIButton?) {

        if (button?.isSelected == false) {
            // 点赞
            button?.isSelected = true
            print("点赞")
        } else {
            // 取消点赞
            button?.isSelected = false
            print("取消赞")
        }
    }
    
    override func layoutSubviews() {
        self.explosionLayer.position = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
        super.layoutSubviews()

    }
    
    override var isSelected: Bool{
        
        willSet{
             touch=newValue
        }
        
        didSet{
            if(touch == true){
                let animation = CAKeyframeAnimation()
                animation.keyPath = "transform.scale"
                animation.values = [1.5,2.0,0.8,1.0]
                animation.duration = 0.5
                animation.calculationMode = CAAnimationCalculationMode.cubic
                self.layer.add(animation, forKey: nil)
                self.perform(#selector(startAnimation), with: nil, afterDelay: 0.25)
            }else{
                self.stopAnimation()
            }
        }
    }
    
    @objc func startAnimation(){
        explosionLayer.lifetime = 1
        explosionLayer.birthRate = 1
        self.explosionLayer.setValue(NSNumber(value: 100), forKeyPath: "emitterCells.explosionCell.birthRate")
        self.explosionLayer.beginTime = CACurrentMediaTime()
        self.perform(#selector(stopAnimation), with: nil, afterDelay: 1.15)
    }
    
    @objc func stopAnimation(){
        self.explosionLayer.setValue(0, forKey:"emitterCells.explosionCell.birthRate")
        explosionLayer.lifetime = 0
        explosionLayer.birthRate = 0
        
        self.explosionLayer.removeAllAnimations()
        
    }


}
