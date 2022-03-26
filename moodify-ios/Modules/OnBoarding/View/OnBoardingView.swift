//
//  OnBoardingView.swift
//  moodify-ios
//
//  Created by polykuzin on 26/03/2022.
//

import UIKit

final class OnBoardingView : BaseView {
    
    public func configure(with data: [_Step]) {
        self.viewState.states = data
    }
    
    @IBOutlet private weak var continueButton : UIButton!
    
    @IBOutlet private weak var collectionView : UICollectionView!
    
    @IBAction private func onContinueSelect() {
        self.scrollToNextCell()
    }
    
    private struct ViewState {
        
        var states : [_Step]
        
        struct Step : _Step {
            let title : String
            let descr : String
            let image : UIImage
        }
    }
    
    private var viewState = ViewState(states: []) {
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
        collectionView.register(OnBoardingCollectionCell.nib, forCellWithReuseIdentifier: OnBoardingCollectionCell.reuseId)
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
        return self.viewState.states.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = self.viewState.states[indexPath.item]
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnBoardingCollectionCell.reuseId, for: indexPath) as? OnBoardingCollectionCell
        else { return .init() }
        cell.configure(with: data)
        return cell
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
