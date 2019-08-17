//
//  ViewController.swift
//  MovieApp
//
//  Created by Kashee ram on 8/16/19.
//  Copyright © 2019 Kashee ram. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    var movieListCellId = "movieListCellId"
    
    lazy var movieListCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 15.0
        layout.minimumInteritemSpacing = 0.0
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .white
        return collection
    }()
    
    var movieList: Moviews?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieListCollection.register(MovieListCell.self, forCellWithReuseIdentifier: movieListCellId)
        setupViews()
        
        let urlString = baseURL + "/4/list/1?page=1&api_key=aff7482acfc580a62cbe62ee6e73a7a4"
        Service.shared.fetchGenericData(urlString: urlString) { (feed: Moviews) in
            self.movieList = feed
            self.movieListCollection.reloadData()
        }
        
        
    }

    private func setupViews() {
        view.addSubview(movieListCollection)
        movieListCollection.fillSuperview()
    }

}



extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: UICollectionViewDataSource
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList?.results.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: movieListCellId, for: indexPath) as! MovieListCell
        let movie = movieList?.results[indexPath.row]
        cell.movie = movie
        return cell
      
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
//        if indexPath.item == complaintArray.count {
//            if complaintArray.count == self.totalEntries {
//                self.activityView.stopAnimating()
//                return CGSize(width: collectionView.frame.width, height: 0)
//            }
//            return CGSize(width: collectionView.frame.width, height: 60)
//        }
//
//        let data = complaintArray[indexPath.row]
       
        
            return CGSize(width: collectionView.frame.width, height: 330)
      
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        if complaintArray.count > 0{
//            if (indexPath.row == complaintArray.count) {
//                if complaintArray.count < self.totalEntries {
//                    getMoreData()
//                } else {
//                    self.activityView.stopAnimating()
//                }
//            }
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        moveToViewComplaintScreen(index: indexPath.row)
    }
    
    func moveToViewComplaintScreen(index:Int) {
//        let viewComplaintVC = ViewComplaintsViewController()
//        let complaintDtl = complaintArray[index]
//        viewComplaintVC.complaintId = "\(complaintDtl.id)"
//        self.navigationController?.pushViewController(viewComplaintVC, animated: true)
    }
    
    
}
