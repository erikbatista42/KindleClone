//
//  BookPagerController.swift
//  KindleClone
//
//  Created by Erik Batista on 7/3/17.
//  Copyright © 2017 swift.lang.eu. All rights reserved.
//

import UIKit

class BookPagerController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var book:Book?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        navigationItem.title = self.book?.title
        
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        
        let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.scrollDirection = .horizontal
        
        collectionView?.isPagingEnabled = true
        layout?.minimumLineSpacing = 0
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(handleCloseBook))
    }
    
    func handleCloseBook() {
        dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 44 - 20)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return book?.pages.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let Pagecell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        let page = book?.pages[indexPath.item]
        Pagecell.textLabel.text = page?.text
        
//        if indexPath.item % 2 == 0 {
//            cell.backgroundColor = .red
//        } else {
//            cell.backgroundColor = .blue
//        }
        
        return Pagecell
    }
}
