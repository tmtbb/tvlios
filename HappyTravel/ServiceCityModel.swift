
//
//  ServiceCityModel.swift
//  HappyTravel
//
//  Created by 司留梦 on 17/1/4.
//  Copyright © 2017年 陈奕涛. All rights reserved.
//

import Foundation
import RealmSwift

//城市信息
class CityNameBaseInfo: Object {
    
    dynamic var city_name_:String?
    
    dynamic var city_code_:Int = 0
    
    dynamic var province_name_:String?
    
    dynamic var province_code_:Int = 0
    
}

class CityNameInfoModel: Object {
    
    let service_city_ = List<CityNameBaseInfo>()
    
}

//保险金额请求
class InsuranceBaseInfo: Object {
    
    dynamic var insurance_type_:Int64 = 0
    
    dynamic var order_price_:Int64 = 0
}
//保险金额返回
class InsuranceInfoModel: Object {
    
    dynamic var insurance_price_:Int64 = 0
    
}
//保险支付请求
class InsurancePayBaseInfo: Object {
    
    dynamic var insurance_price:Int64 = 0
    
    dynamic var insurance_username_:String?
}
class InsuranceSuccessModel: Object {
    
    dynamic var is_success_:Int64 = 0
    
}

