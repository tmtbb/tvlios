//
//  AppointmentDetailCell.swift
//  HappyTravel
//
//  Created by J-bb on 16/11/10.
//  Copyright © 2016年 陈奕涛. All rights reserved.
//

import UIKit

class AppointmentDetailCell: UITableViewCell {

    lazy private var iconImageView:UIImageView = {
       let imageView = UIImageView()
        imageView.layer.cornerRadius = AtapteWidthValue(45) / 2
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(named: "default-head")
        return imageView
    }()
    var nicknameLabel:UILabel = {
       let label = UILabel()
        label.text = "二郎神"
        label.font = UIFont.systemFontOfSize(S15)
        label.backgroundColor = UIColor.clearColor()
        label.textColor = colorWithHexString("#131f32")
        return label
    }()
    var serviceTypeLabel:UILabel = {
       
        let label = UILabel()
        label.text = "二郎神"
        label.font = UIFont.systemFontOfSize(S15)
        label.backgroundColor = UIColor.clearColor()
        label.textColor = colorWithHexString("#131f32")
        return label
    }()
    var dateLabel:UILabel = {
       let label = UILabel()
                label.text = "2016/03/04 - 2016/03/04"
        label.font = UIFont.systemFontOfSize(S15)
        label.backgroundColor = UIColor.clearColor()
        label.textColor = colorWithHexString("#131f32")
        return label
    }()
    var cityLabel:UILabel = {
        let label = UILabel()
        label.text = "杭州"
        label.font = UIFont.systemFontOfSize(S12)
        label.textColor = colorWithHexString("#999999")
        return label
    }()
    var cityImageView:UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "map_meet")
        return imageView
    }()
    var detailIconImageView:UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage(named: "appointment-detail")
        return imageView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .None
        contentView.addSubview(iconImageView)
        contentView.addSubview(nicknameLabel)
        contentView.addSubview(serviceTypeLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(cityImageView)
        contentView.addSubview(cityLabel)
        contentView.addSubview(detailIconImageView)
        addSubviewContraints()
    }
    
    
    func addSubviewContraints() {
        iconImageView.snp_makeConstraints { (make) in
            make.top.equalTo(contentView).offset(AtapteHeightValue(13))
            make.left.equalTo(contentView).offset(AtapteWidthValue(15))
            make.height.equalTo(AtapteWidthValue(45))
            make.width.equalTo(AtapteHeightValue(45))
        }
        nicknameLabel.snp_makeConstraints { (make) in
            make.top.equalTo(contentView).offset(AtapteHeightValue(24))
            make.left.equalTo(iconImageView.snp_right).offset(AtapteWidthValue(20))
        }
        serviceTypeLabel.snp_makeConstraints { (make) in
            make.left.equalTo(nicknameLabel)
            make.top.equalTo(nicknameLabel.snp_bottom).offset(AtapteHeightValue(9))
        }
        dateLabel.snp_makeConstraints { (make) in
            make.left.equalTo(serviceTypeLabel)
            make.top.equalTo(serviceTypeLabel.snp_bottom).offset(AtapteHeightValue(13))
        }
        cityImageView.snp_makeConstraints { (make) in
            make.left.equalTo(dateLabel)
            make.width.equalTo(22 / 1.5)
            make.height.equalTo(30 / 1.5)
            make.top.equalTo(dateLabel.snp_bottom).offset(AtapteHeightValue(17))
            make.bottom.equalTo(contentView).offset(AtapteHeightValue(-22))
        }
        cityLabel.snp_makeConstraints { (make) in
            make.left.equalTo(cityImageView.snp_right).offset(10)
            make.centerY.equalTo(cityImageView)
        }
        detailIconImageView.snp_makeConstraints { (make) in
            make.top.equalTo(nicknameLabel)
            make.right.equalTo(contentView.snp_right).offset(AtapteWidthValue(-15))
        }
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}