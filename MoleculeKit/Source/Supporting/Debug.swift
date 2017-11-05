//
//  Debug.swift
//  MoleculeKit
//
//  Created by Topic, Zdenek on 02/11/2017.
//  Copyright © 2017 Zdenek Topic. All rights reserved.
//

import Foundation

internal func debugReconcileTime(in object: Any, startTime: CFAbsoluteTime, threshold: CFAbsoluteTime = 0) {
    let timeElapsed = (CFAbsoluteTimeGetCurrent() - startTime) * 1000
    // - note: 60fps means you need to render a frame every ~16ms to not drop any frames.
    // This is even more important when used inside a cell.
    if timeElapsed > threshold  {
        print(String(format: "\(type(of: object)) %2f ms.", arguments: [timeElapsed]))
    }
}
