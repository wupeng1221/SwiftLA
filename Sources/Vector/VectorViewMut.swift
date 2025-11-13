//
//  VectorViewMut.swift
//  SwiftLA
//
//  Created by Peng Wu on 2025/11/13.
//

public struct VectorViewMut<Element> {
    internal var storage: _VectorViewStorage
    internal var parts: _VectorViewPartsMutable<Element>
}
