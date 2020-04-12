//
//  Array.swift
//  BaseProject
//
//  Created by David Thorn on 12.01.20.
//  Copyright © 2020 David Thorn. All rights reserved.
//

import Foundation

public extension Array {
    
    var isNotEmpty: Bool {
        return count > 0
    }
    
    func count(queue: DispatchQueue) -> Int {
        return queue.sync { return count }
    }
    
    func item(index: Int, queue: DispatchQueue) -> Element {
        return queue.sync { return self[index] }
    }
    
    mutating func add(elements: [Element] , queue: DispatchQueue) {
        queue.sync {
            self.append(contentsOf: elements)
        }
    }

    mutating func add(element: Element , queue: DispatchQueue) {
        queue.sync {
            self.append(element)
        }
    }
    
    
    
}



