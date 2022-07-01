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
        
        struct FourthStep: _FourthStep {
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
        collectionView.register(FourthStepOnboardingCell.nib, forCellWithReuseIdentifier: FourthStepOnboardingCell.reuseId)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [
            UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor,
            UIColor(red: 234 / 255, green: 240 / 255, blue: 255 / 255, alpha: 1).cgColor,
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)

        let backgroundView = UIView(frame: self.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)

        self.insertSubview(backgroundView, at: 0)
    }
    
    public func configure(with data: [_Step]) {
        self.viewState = data
    }
    
    @IBAction private func onContinueSelect() {
        self.scrollToNextCell()
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
            // NOTIFICATIONS!
            let r = CGRect(x: 0, y: contentOffset.y, width: cellSize.width, height: cellSize.height)
            collectionView.scrollRectToVisible(r, animated: true)
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
        case is ViewState.FourthStep:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FourthStepOnboardingCell.reuseId, for: indexPath)
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
        return CGSize(width: width, height: height - 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
