//
//  AlbumsCVC.swift
//  Techtest
//
//  Created by Ellan Esenaliev on 09.06.2018.
//  Copyright © 2018 Ellan Esenaliev. All rights reserved.
//

import UIKit

class AlbumsCVC: UICollectionViewController {
    
    var albums = [Album]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Albums"
        self.getAlbums()
        self.registrXib()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func registrXib() {
        self.collectionView?.register(AlbumCVCell.nib, forCellWithReuseIdentifier: AlbumCVCell.identifier)
    }
    
    private func getAlbums() {
        NetworkManager.instance.getAlbums { (albums, error) in
            if error == nil {
                self.albums = albums
                self.collectionView?.reloadData()
            }
        }
    }
}

// MARK: UICollectionViewDataSource

extension AlbumsCVC {

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.albums.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCVCell.identifier, for: indexPath) as! AlbumCVCell
        cell.setupAlbum(album: self.albums[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: Constants.ALBUM_STORYBOARD, bundle: nil).instantiateViewController(withIdentifier: "AlbumImagesCVC") as! AlbumImagesCVC
        vc.album = self.albums[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension AlbumsCVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width - 48) / 3, height: (collectionView.frame.width - 48) / 3)
    }
}
