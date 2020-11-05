//
//  CollectionVC.swift
//  CRUDTest
//
//  Created by 서주희 on 2020/11/05.
//

import UIKit

class CollectionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("CollectionVC viewDidLoad")
        
        let nib = UINib(nibName: "CollectionCell", bundle: nil)
        self.collectionView.register(nib, forCellWithReuseIdentifier: "CollectionCell")
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        cell.cellLabel?.text = "\(indexPath.row)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewCellWidth = collectionView.frame.width / 3 - 1
        return CGSize(width: collectionViewCellWidth, height: collectionViewCellWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    //    MARK: -view life cycle
        override func viewWillAppear(_ animated: Bool) {
            print("CollectionVC viewWillAppear")
        }
        
        override func viewDidAppear(_ animated: Bool) {
            print("CollectionVC viewDidAppear")
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            print("CollectionVC viewWillDisappear")
        }
        
        override func viewDidDisappear(_ animated: Bool) {
            print("CollectionVC viewDidDisappear")
        }
        
        deinit {
            print("CollectionVC deinit")
        }

}
