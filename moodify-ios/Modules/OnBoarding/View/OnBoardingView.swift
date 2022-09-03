//
//  OnBoardingView.swift
//  moodify-ios
//
//  Created by polykuzin on 26/03/2022.
//

import UIKit

protocol _Step {
    var title: String { get }
    var description: String { get }
}

final class OnBoardingView : BaseView {
    
    public var onFirstRun: (() -> ())?
    public var onAllowNotifications: (() -> ())?
    
    @IBOutlet private weak var pagesStack: UIStackView!
    @IBOutlet private weak var continueButton : UIButton!
    @IBOutlet private weak var collectionView : UICollectionView!
    
    struct ViewState {
        
        struct FirstStep: _FirstStep {
            var title: String
            var description: String
        }
        
        struct SecondStep: _SecondStep {
            var title: String
            var description: String
        }
        
        struct ThirdStep: _ThirdStep {
            var title: String
            var description: String
        }
    }
    
    private var viewState: [_Step] = [] {
        didSet {
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func awakeFromNib() {
        collectionView.delegate = self
        collectionView.dataSource = self
        continueButton.setTitle("step_button_title".localized(using: "OnBoarding"), for: .normal)
        collectionView.register(FirstStepOnBoardingCell.nib, forCellWithReuseIdentifier: FirstStepOnBoardingCell.reuseId)
        collectionView.register(SecondStepOnboardingCell.nib, forCellWithReuseIdentifier: SecondStepOnboardingCell.reuseId)
        collectionView.register(ThirdStepOnboardingCell.nib, forCellWithReuseIdentifier: ThirdStepOnboardingCell.reuseId)
        pagesStack.arrangedSubviews.forEach {
            $0.layer.cornerRadius = $0.frame.height / 2
        }
    }
    
    public func configure(with data: [_Step]) {
        self.viewState = data
    }
    
    @IBAction private func onContinueSelect() {
        self.scrollToNextCell()
        if let _ = collectionView.visibleCells.first as? FirstStepOnBoardingCell {
            self.onAllowNotifications?()
            self.animatePageDot(for: 1)
        } else if let _ = collectionView.visibleCells.first as? SecondStepOnboardingCell {
            self.animatePageDot(for: 2)
        } else {
            self.onFirstRun?()
        }
    }
    
    private func animatePageDot(for index: Int) {
        let shapeLayer = CAShapeLayer()
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            shapeLayer.removeFromSuperlayer()
        }
        let path = UIBezierPath()
        let x = self.pagesStack.frame.origin.x
        let y = self.pagesStack.frame.origin.y + 3
        let startOffset = (self.pagesStack.spacing + 8) * CGFloat(index - 1)
        let endOffset = (self.pagesStack.spacing + 8) * CGFloat(index)
        path.move(to: CGPoint(x: x + startOffset, y: y))
        path.addLine(to: CGPoint(x: x + endOffset, y: y))
        shapeLayer.strokeColor = UIColor.button.cgColor
        shapeLayer.lineWidth = 6
        shapeLayer.lineCap = .round
        shapeLayer.path = path.cgPath
        self.layer.addSublayer(shapeLayer)
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 0.3
        shapeLayer.add(animation, forKey: "line")
        CATransaction.commit()
        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
            self.pagesStack.arrangedSubviews[index].backgroundColor = .button
        }, completion: { _ in
            self.pagesStack.arrangedSubviews[index - 1].backgroundColor = .sliderTrack
        })
    }
}

extension OnBoardingView : UICollectionViewDelegate {
    
    private func scrollToNextCell() {
        let guide = self.safeAreaLayoutGuide
        let width =  UIScreen.main.bounds.width
        let height = guide.layoutFrame.size.height
        let cellSize = CGSize(width: width, height: height - 70)
        let contentOffset = collectionView.contentOffset
        
        if collectionView.contentSize.width <= collectionView.contentOffset.x + cellSize.width {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let rootVC = storyboard.instantiateViewController(identifier: "Main") as? MoodTabBarController
            else { return }
            UIApplication.shared.keyWindow?.rootViewController = rootVC
        } else {
            let r = CGRect(x: contentOffset.x + cellSize.width, y: contentOffset.y, width: cellSize.width, height: cellSize.height)
            collectionView.scrollRectToVisible(r, animated: true);
        }
    }
}

extension OnBoardingView : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewState.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let data = self.viewState[safe: indexPath.item] else { return .init() }
        switch data {
        case is ViewState.FirstStep:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstStepOnBoardingCell.reuseId, for: indexPath) as? FirstStepOnBoardingCell
            else { return .init() }
            cell.configure(with: data as! ViewState.FirstStep)
            return cell
        case is ViewState.SecondStep:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondStepOnboardingCell.reuseId, for: indexPath) as? SecondStepOnboardingCell
            else { return .init() }
            cell.configure(with: data as! ViewState.SecondStep)
            return cell
        case is ViewState.ThirdStep:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThirdStepOnboardingCell.reuseId, for: indexPath) as? ThirdStepOnboardingCell
            else { return .init() }
            cell.configure(with: data as! ViewState.ThirdStep)
            return cell
        default:
            return .init()
        }
    }
}

extension OnBoardingView : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let guide = self.safeAreaLayoutGuide
        let width =  UIScreen.main.bounds.width
        let height = guide.layoutFrame.size.height
        return CGSize(width: width, height: height - 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
