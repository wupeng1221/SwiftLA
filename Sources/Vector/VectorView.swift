//
//  View.swift
//  SwiftLA
//
//  Created by Peng Wu on 2025/11/13.
//

public struct VectorView<Element> {
    internal var storage: _VectorViewStorage
    internal var parts: _VectorViewPartsImmutable
}
