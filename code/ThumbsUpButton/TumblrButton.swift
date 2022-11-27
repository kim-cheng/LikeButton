//
//  TumblrButton.swift
//  ThumbsUpButton
//
//  Created by kim on 2022/11/26.
//

import UIKit

class TumblrButton: UIView {

    private let PraiseBtnWH:CGFloat = 30
    private let BorkenTime:CGFloat = 0.8
    private let ToBrokenHeartWH:CGFloat = 120/195

    private var praiseBtn:UIButton!
    private var coverBtn:UIButton!
    private var cancelPraiseImg:UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initUI(){
        praiseBtn = UIButton(type: UIButton.ButtonType.custom)
        praiseBtn.frame = CGRectMake(0, 0, PraiseBtnWH, PraiseBtnWH)
        praiseBtn.setImage(UIImage(named: "icon_like"), for: .normal)
        praiseBtn.setImage(UIImage(named: "icon_likeon"), for: .selected)
        self.addSubview(praiseBtn)
        praiseBtn.addTarget(self, action: #selector(clickBtn), for: .touchUpInside)
        
        coverBtn = UIButton(type: UIButton.ButtonType.custom)
        coverBtn.frame = praiseBtn.frame
        coverBtn.alpha = 0
        coverBtn.setImage(UIImage(named: "big"), for: .selected)
        coverBtn.setImage(UIImage(named: "big"), for: .normal)
        self.insertSubview(coverBtn, belowSubview: praiseBtn)
        
        cancelPraiseImg = UIImageView(frame: CGRectMake(-20, -50, PraiseBtnWH*2, PraiseBtnWH*2*ToBrokenHeartWH))
        cancelPraiseImg.isHidden = true
        cancelPraiseImg.centerX = praiseBtn.centerX
        self.addSubview(cancelPraiseImg)
    }
    
    @objc func clickBtn(_ btn:UIButton){
        playAnimation()
        btn.isUserInteractionEnabled = false
        btn.isSelected = !btn.isSelected
        
    }
    
    func playAnimation(){
        if(!praiseBtn.isSelected){
            coverBtn.alpha = 1
            
            UIView.animate(withDuration: 1.0, animations: {
                self.coverBtn.frame = CGRectMake(-20, -100, self.PraiseBtnWH*2, self.PraiseBtnWH*2)
                let anima = CAKeyframeAnimation(keyPath: "transform.rotation")
                let value1 = -Double.pi/180*5
                let value2 = Double.pi/180*5
                let value3 = -Double.pi/180*5
                anima.values = [value1,value2,value3]
                anima.repeatCount = MAXFLOAT
                self.coverBtn.layer.add(anima, forKey: nil)
                self.coverBtn.alpha = 0
                self.coverBtn.centerX = self.praiseBtn.centerX
            }){ _ in
                self.coverBtn.frame = self.praiseBtn.frame
                self.praiseBtn.isUserInteractionEnabled = true
            }
        }else{
            self.cancelPraiseImg.isHidden = false
            let imgArray = [UIImage(named: "icon_like_broken1")!,UIImage(named: "icon_like_broken2")!,UIImage(named: "icon_like_broken3")!,UIImage(named: "icon_like_broken4")!]
            self.cancelPraiseImg.animationImages = imgArray
            self.cancelPraiseImg.animationDuration = BorkenTime
            self.cancelPraiseImg.animationRepeatCount = 1
            self.cancelPraiseImg.startAnimating()
            
            UIView.animate(withDuration: BorkenTime, animations: {
                self.cancelPraiseImg.frame = CGRectMake(-20, 0, self.PraiseBtnWH*2, self.PraiseBtnWH*2*self.ToBrokenHeartWH)
                self.cancelPraiseImg.alpha = 0
            }){_ in
                self.cancelPraiseImg.frame = CGRectMake(-20, -50, self.PraiseBtnWH*2, self.PraiseBtnWH*2*self.ToBrokenHeartWH)
                self.cancelPraiseImg.alpha = 1
                self.praiseBtn.isUserInteractionEnabled = true
            }
            
        }
    }


}
