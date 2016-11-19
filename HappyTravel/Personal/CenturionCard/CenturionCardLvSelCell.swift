//
//  CenturionCardLvSelCell.swift
//  HappyTravel
//
//  Created by 陈奕涛 on 16/10/20.
//  Copyright © 2016年 陈奕涛. All rights reserved.
//

import Foundation
import XCGLogger

protocol CenturionCardLvSelCellDelegate : NSObjectProtocol {
    
    func selectedAction(index: Int)
    
}

class CenturionCardLVItem: UICollectionViewCell {
    lazy var icon: UIImageView = {
       let iconImage = UIImageView()
        iconImage.userInteractionEnabled = true
        return iconImage
    }()
    var titleLabel: UILabel = {
       let label = UILabel.init(text: "", font: UIFont.systemFontOfSize(S12), textColor: colorWithHexString("#666666"))
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(icon)
        icon.snp_makeConstraints { (make) in
            make.centerX.equalTo(contentView)
            make.top.equalTo(AtapteWidthValue(10))
            make.size.equalTo(CGSizeMake(AtapteWidthValue(30), AtapteWidthValue(30)))
        }
        
        contentView.addSubview(titleLabel)
        titleLabel.snp_makeConstraints { (make) in
            make.centerX.equalTo(contentView)
            make.top.equalTo(icon.snp_bottom).offset(AtapteWidthValue(4))
            make.height.equalTo(S12)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CenturionCardLvSelCell : UITableViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    weak var delegate:CenturionCardLvSelCellDelegate?
    var indirector: UIImageView = UIImageView.init(image: UIImage.init(named: "indirector"))
    
    let centurionCardTitle = [0: "一星会员",
                              1: "二星会员",
                              2: "三星会员",
                              3: "四星会员"]
    
    let centurionCardIcon = [0: [0: "primary-level-disable", 1: "primary-level"],
                             1: [0: "middle-level-disable", 1: "middle-level"],
                             2: [0: "advanced-level-disable", 1: "advanced-level"],
                             3: [0: "dingji-level-disable", 1: "dingji-level"]]
    let itemWidth: CGFloat = ScreenWidth / 4
    
    var selectIndex: NSInteger?
    
    
    //collectionView
    lazy var contentCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .Horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSizeMake(self.itemWidth, AtapteWidthValue(70))
        let collectionView = UICollectionView.init(frame: CGRectZero, collectionViewLayout: layout)
        collectionView.backgroundColor = colorWithHexString("#f2f2f2")
        collectionView.registerClass(CenturionCardLVItem.classForCoder(), forCellWithReuseIdentifier: "CenturionCardLVItem")
        return collectionView
    }()
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return centurionCardTitle.count
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let item: CenturionCardLVItem = collectionView.dequeueReusableCellWithReuseIdentifier("CenturionCardLVItem", forIndexPath: indexPath) as! CenturionCardLVItem
        let selector = Int((DataManager.currentUser?.centurionCardLv)! > indexPath.row)
        item.icon.image = UIImage.init(named: centurionCardIcon[indexPath.row]![selector]!)
        item.titleLabel.text = centurionCardTitle[indexPath.row]
        return item
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        delegate?.selectedAction(Int(indexPath.row))
        
        collectionView.reloadData()
        
        let left = (itemWidth / 2.0 ) * (2.0 * CGFloat(indexPath.row) + 1)-10
        indirector.snp_remakeConstraints { (make) in
            make.left.equalTo(left)
            make.bottom.equalTo(2)
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .None
        
        contentCollection.delegate = self
        contentCollection.dataSource = self
        contentView.addSubview(contentCollection)
        contentCollection.snp_makeConstraints { (make) in
            make.edges.equalTo(contentView)
        }
        
        contentView.addSubview(indirector)
        indirector.snp_makeConstraints { (make) in
            make.left.equalTo(ScreenWidth/(CGFloat(self.centurionCardTitle.count)*2)-10)
            make.bottom.equalTo(2)
        }
        
        let indexPath = NSIndexPath.init(forRow: (DataManager.currentUser?.centurionCardLv)!-1, inSection: 0)
        collectionView(contentCollection, didSelectItemAtIndexPath: indexPath)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
