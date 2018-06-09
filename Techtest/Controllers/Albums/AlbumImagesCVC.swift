//
//  AlbumImagesCVC.swift
//  Techtest
//
//  Created by Ellan Esenaliev on 09.06.2018.
//  Copyright © 2018 Ellan Esenaliev. All rights reserved.
//

import UIKit

class AlbumImagesCVC: UICollectionViewController {
    
    var album: Album?
    var images = [AlbumImage]()
    
    var loadingState: LoadingState = .Loading
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Images"
        if let album = self.album {
            self.getImagesForAlbum(album: album)
        }
        self.registrXib()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func registrXib() {
        self.collectionView?.register(ImageCVCell.nib, forCellWithReuseIdentifier: ImageCVCell.identifier)
    }
    
    func getImagesForAlbum(album: Album) {
        NetworkManager.instance.getImagesForAlbum(albumId: album.id) { (images, error ) in
            self.loadingState = .Loaded
            if error == nil {
                self.images = images
                self.collectionView?.reloadData()
            }
        }
    }
}

// MARK: UICollectionViewDataSource

extension AlbumImagesCVC {
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if loadingState == .Loading {
            let loadinIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
            loadinIndicatorView.startAnimating()
            collectionView.backgroundView = loadinIndicatorView
        } else {
            collectionView.backgroundView = nil
        }
        return self.images.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCVCell.identifier, for: indexPath) as! ImageCVCell
        cell.setupImage(image: self.images[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: Constants.ALBUM_STORYBOARD, bundle: nil).instantiateViewController(withIdentifier: "FullImageVC") as! FullImageVC
        vc.image = self.images[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension AlbumImagesCVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 48) / 3, height: (collectionView.frame.width - 48) / 3)
    }
}
