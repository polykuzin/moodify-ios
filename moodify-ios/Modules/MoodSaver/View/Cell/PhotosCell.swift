//
//  PhotosCell.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 12.05.2022.
//

import UIKit
import CoreTableView

protocol _Photos: CellData {
    var photos: [UIImage] { get set }
    var addImage: (() -> ())? { get set }
}

extension _Photos {
    
    func prepare(cell: UITableViewCell, for tableView: UITableView, indexPath: IndexPath) {
        guard let cell = cell as? PhotosCell else { return }
        cell.configure(with: self)
    }
    
    func cell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        tableView.register(PhotosCell.nib, forCellReuseIdentifier: PhotosCell.identifire)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotosCell.identifire, for: indexPath) as? PhotosCell
        else { return .init() }
        return cell
    }
}

class PhotosCell: UITableViewCell {

    @IBOutlet private weak var noImagesStackView: UIStackView!
    @IBOutlet private weak var photosCollection: UICollectionView!
    @IBOutlet private weak var collectionLayout: UICollectionViewFlowLayout!
    
    var photos: [UIImage] = [] {
        didSet {
            self.photosCollection.reloadData()
            if !photos.isEmpty {
                self.photosCollection.isHidden = false
                self.noImagesStackView.isHidden = true
            } else {
                self.photosCollection.isHidden = true
                self.noImagesStackView.isHidden = false
            }
        }
    }
    
    var onAddImage: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
    }
    
    public func configure(with data: _Photos) {
        self.onAddImage = data.addImage
        self.photos = data.photos
    }
    
    private func setupView() {
        self.photosCollection.dataSource = self
        self.collectionLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        self.photosCollection.register(PhotoCell.nib, forCellWithReuseIdentifier: PhotoCell.reuseId)
    }
    
    @IBAction func addImage(_ sender: UIButton) {
        self.onAddImage?()
    }
}

extension PhotosCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.reuseId, for: indexPath) as? PhotoCell
        else { return .init() }
        cell.configure(with: photos[indexPath.row])
        return cell
    }
}
