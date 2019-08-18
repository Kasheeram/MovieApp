//
//  MovieListController.swift
//  MovieApp
//
//  Created by Kashee ram on 8/17/19.
//  Copyright © 2019 Kashee ram. All rights reserved.
//

import UIKit

class MovieListController: UIViewController {

    let nowPlayingMoviesCellId = "nowPlayingMoviesCellId"
    let popularMoviesCellId = "popularMoviesCellId"
    
    lazy var segmenControll: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["     Now Playing     ", "Popular"])
        segment.selectedSegmentIndex = 0
        segment.addTarget(self, action: #selector(handleSegmentAction), for: .valueChanged)
        return segment
    }()
    
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        cv.backgroundColor = .white
        return cv
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.edgesForExtendedLayout = .all
        self.navigationItem.titleView = segmenControll
        collectionView.register(NowPlayingMoviesCell.self, forCellWithReuseIdentifier: nowPlayingMoviesCellId)
        collectionView.register(PopularMoviesCell.self, forCellWithReuseIdentifier: popularMoviesCellId)
        setupViews()
        
    }
    
    private func setupViews() {
        view.addSubview(collectionView)
        collectionView.fillSuperview()
        
    }
    
    @objc private func handleSegmentAction(sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        scrollToMenuIndex(index: index)
        
    }
    
}


extension MovieListController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: nowPlayingMoviesCellId, for: indexPath) as! NowPlayingMoviesCell
            cell.backgroundColor = .purple
            cell.mainController = self
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: popularMoviesCellId, for: indexPath) as! PopularMoviesCell
            cell.backgroundColor = .red
            cell.mainController = self
            return cell
        }
        
    }
    
    func  collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    @objc func scrollToMenuIndex(index: Int) {
        let indexPath = IndexPath(item: index, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = Int(targetContentOffset.pointee.x / view.frame.width)
        segmenControll.selectedSegmentIndex = index

    }
    
    
    
}