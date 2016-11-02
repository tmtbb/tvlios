//
//  InvoiceHistoryDetailCustomCell.swift
//  HappyTravel
//
//  Created by J-bb on 16/10/28.
//  Copyright © 2016年 陈奕涛. All rights reserved.
//

import UIKit
// MARK: - 非常规cell
class InvoiceHistoryDetailCustomCell: UITableViewCell {

    
    var titleLabel:UILabel?
    var dateLabel:UILabel?
    var dateFormatter = NSDateFormatter()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        selectionStyle = .None
        accessoryType = .DisclosureIndicator
        if titleLabel == nil {
            titleLabel = UILabel()
            titleLabel?.font = UIFont.systemFontOfSize(15)
            titleLabel?.textColor = UIColor(red: 19 / 255.0, green: 31 / 255.0, blue: 50 / 255.0, alpha: 1.0)
        
            titleLabel?.textAlignment = .Left
            titleLabel?.backgroundColor = UIColor.clearColor()
           contentView.addSubview(titleLabel!)
        }
        titleLabel?.text = "所含服务（100）"
        

        
        if dateLabel == nil {
            dateLabel = UILabel()
            dateLabel?.font = UIFont.systemFontOfSize(12)
            dateLabel?.textAlignment = .Left
            dateLabel?.backgroundColor = UIColor.clearColor()
            dateLabel?.textColor = UIColor(red: 102 / 255.0, green: 102 / 255.0, blue: 102 / 255.0, alpha: 1.0)
            contentView.addSubview(dateLabel!)
            
        }
        dateLabel?.text = "2016.10.28 08:05-2016.10.28 08:05"
        
        addSubViewConstraints()
    }
    
    /**
     添加约束
     */
    func addSubViewConstraints() {
        
        titleLabel?.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(contentView).offset(10)
            make.top.equalTo(contentView).offset(15)
        })
        dateLabel?.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(titleLabel!)
            make.bottom.equalTo(contentView).offset(-15)
        })
    }
    
    /**
     
       数据填充
     - parameter orderNum:
     - parameter first_time_:
     - parameter final_time_: 
     */
    func setupData(orderNum:Int, first_time_:Int, final_time_:Int) {
        
        dateFormatter.dateFormat = "YYYY.MM.dd hh:mm"

        titleLabel?.text = "所含服务（\(orderNum))"
        let firstTime = dateFormatter.stringFromDate(NSDate(timeIntervalSince1970: Double(first_time_)))
        let finalTime = dateFormatter.stringFromDate(NSDate(timeIntervalSince1970: Double(final_time_)))
        dateLabel?.text = firstTime + "-" + finalTime
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
// MARK: - 上面 常规cell
class InvoiceHistoryDetailNormalCell: UITableViewCell {
    
    
    var titleLabel:UILabel?
    var infoLabel:UILabel?
    var bottomLine:UIView?

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .None
        
        if titleLabel == nil {
            titleLabel = UILabel()
            titleLabel?.backgroundColor = UIColor.clearColor()
            titleLabel?.font = UIFont.systemFontOfSize(15)
            titleLabel?.textColor =  UIColor(red: 102 / 255.0, green: 102 / 255.0, blue: 102 / 255.0, alpha: 1.0)
        }
        if infoLabel == nil {
            infoLabel = UILabel()
            infoLabel?.backgroundColor = UIColor.clearColor()
            infoLabel?.font = UIFont.systemFontOfSize(15)
            infoLabel?.textColor = UIColor(red: 19 / 255.0, green: 31 / 255.0, blue: 50 / 255.0, alpha: 1.0)

        }
        if bottomLine == nil {
            
            bottomLine = UIView()
            bottomLine?.backgroundColor = UIColor.init(decR: 231, decG: 231, decB: 231, a: 1)
            
        }
        
        contentView.addSubview(titleLabel!)
        contentView.addSubview(infoLabel!)
        contentView.addSubview(bottomLine!)
        addSubViewConstraints()
    }
    
    

    
    /**
     添加约束
     */
    func addSubViewConstraints() {
        titleLabel?.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(contentView).offset(10)
            make.centerY.equalTo(contentView)
        })
        infoLabel?.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(90)
            make.centerY.equalTo(titleLabel!)
        })
    
        bottomLine?.snp_makeConstraints(closure: { (make) in
            make.left.equalTo(titleLabel!)
            make.bottom.equalTo(contentView)
            make.right.equalTo(contentView)
            make.height.equalTo(1)
        })
    }
    
    
    /**
     
     数据填充
     - parameter text:
     - parameter isLast: 最后一个需要隐藏分割线
     */
    func setTitleLabelText(text:String, isLast:Bool) {
        if titleLabel != nil {
            
            titleLabel?.text = text
        }
        if bottomLine != nil {
            bottomLine?.hidden = isLast
        }
    }
    
    func setInfoLabelText(text:String, isPrice:Bool) {
        
        if infoLabel != nil {
            if isPrice {
                
                let attributeText = NSMutableAttributedString(string: text + " 元")
                attributeText.addAttributes([NSForegroundColorAttributeName : UIColor(red: 184 / 255.0, green: 37 / 255.0, blue: 37 / 255.0, alpha: 1.0)], range: NSMakeRange(0, text.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)))
                infoLabel?.attributedText = attributeText
                
            } else {
                
                infoLabel?.text = text
            }
        }
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}