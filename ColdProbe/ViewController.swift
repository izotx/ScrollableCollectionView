//
//  ViewController.swift
//  ColdProbe
//
//  Created by Janusz Chudzynski on 4/12/16.
//  Copyright © 2016 Janusz Chudzynski. All rights reserved.
//

import UIKit

class MainHeader:UICollectionReusableView {
    
}

class SectionHeader:UICollectionReusableView {
    @IBOutlet weak var title: UILabel!
    
}

class TargetHeaderCell: UICollectionViewCell{
    @IBOutlet weak var label: UILabel!
    
}


class TargetCell: UICollectionViewCell{
    @IBOutlet weak var label: UILabel!
    

}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
 
    @IBOutlet weak var collectionViewWidth: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = UIColor.clearColor()
        
        collectionViewWidth.constant = 5300 + 52
        scrollView.contentSize = collectionView.frame.size
        
        collectionView.reloadData()
        print(collectionView.frame)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 53 * 3 + 1
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
       
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellHeader", forIndexPath: indexPath) as! TargetHeaderCell
            cell.label.text = "header"
            return cell
        
        }
        
        
     let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! TargetCell
        cell.label.text = "\(indexPath.row)"
        cell.backgroundColor = UIColor.lightGrayColor()
        
        return cell
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int{
        return 14
    }

 
    override func viewDidAppear(animated: Bool) {
       
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if indexPath.row == 0 {
            return CGSizeMake(collectionView.frame.width - 20, 50)
        }
        return CGSizeMake(100, 100)
        
    }
    
}

