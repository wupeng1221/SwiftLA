//
//  Vector.swift
//  SwiftLA
//
//  Created by Peng Wu on 2025/11/13.
//

public struct Vector<Element> {
    internal var storage: _VectorStorage<Element>
    internal var parts: _VectorParts<Element>
}
