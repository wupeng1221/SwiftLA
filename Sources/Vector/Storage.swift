//
//  Core.swift
//  SwiftLA
//
//  Created by Peng Wu on 2025/11/13.
//

internal class _VectorStorage<Element> {
    var buffer:         UnsafeMutablePointer<Element>
    var count:          Int
    var capacity:       Int
}

