//
//  SocketDataPacket.swift
//  HappyTravel
//
//  Created by 陈奕涛 on 16/12/27.
//  Copyright © 2016年 陈奕涛. All rights reserved.
//

import Foundation
import RealmSwift



enum PacketType: Int8 {
    case Error = 0
    case User = 1
    case Chat = 2
}

class SocketDataPacket: SockHead {
    
    var data:NSData?
    
    override init(data: NSData) {
        super.init(data: data)
    }
    
    init(opcode: SocketManager.SockOpcode, model: Object, type t:PacketType = .User) {
        super.init()
        self.opcode = opcode.rawValue
        self.type = type
        self.data = ModelHelper.modelToData(model)
        self.bodyLen = Int16(self.data!.length)
        self.len = SockHead.size + self.bodyLen
    }
    init(opcode: SocketManager.SockOpcode, dict:[String : AnyObject],type t:PacketType = .User) {
        super.init()
        let data = try? NSJSONSerialization.dataWithJSONObject(dict, options: NSJSONWritingOptions.PrettyPrinted)
        self.opcode = opcode.rawValue
        self.type = type
        self.data = data
        self.bodyLen = Int16(self.data!.length)
        self.len = SockHead.size + self.bodyLen
    }
}
