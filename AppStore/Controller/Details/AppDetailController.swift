//
//  AppDetailController.swift
//  AppStore
//
//  Created by Rishabh Raj on 27/06/19.
//  Copyright © 2019 Rishabh Raj. All rights reserved.
//

import UIKit

class AppDetailController : BaseListController, UICollectionViewDelegateFlowLayout {
    
    var appId : String! {
        didSet{
//            print("here is my appId:",appId)
            let urlString = "http://itunes.apple.com/lookup?id=\(appId ?? "")"
            WebService.shared.fetchGenericJSONData(urlString: urlString) { (result: SearchResult?, error) in
                let app = result?.results.first
                self.app = app
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
//                print(result?.results.first?.releaseNotes)
            }
           
        }
    }
    
    var app : Result?
    
    private let detailCellId = "cellId"
    
    private let previewCellId = "previewCellId"
    
     private let reviewCellId = "reviewCellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        collectionView.register(AppDetailCell.self, forCellWithReuseIdentifier: detailCellId)
        
        collectionView.register(PreviewCell.self, forCellWithReuseIdentifier: previewCellId)
        
        collectionView.register(ReviewRowCell.self, forCellWithReuseIdentifier: reviewCellId)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: detailCellId, for: indexPath) as! AppDetailCell
            cell.app = app
            return cell
        }else if indexPath.item == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: previewCellId, for: indexPath) as! PreviewCell
            cell.horizontalController.app = self.app
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reviewCellId, for: indexPath) as! ReviewRowCell
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var height : CGFloat = 280
        
        if indexPath.item == 0 {
            // calculate the size
            let dummyCell = AppDetailCell(frame: .init(x: 0, y: 0, width: view.frame.width, height: 10000))
            dummyCell.app = app
            dummyCell.layoutIfNeeded()
            
            let estimatedSize = dummyCell.systemLayoutSizeFitting(.init(width: view.frame.width, height: 1000))
            
            height = estimatedSize.height
        }else if indexPath.item == 1 {
            height = 500
        }else {
            height = 280
        }
       
        return .init(width: view.frame.width, height: height)
    }
}
