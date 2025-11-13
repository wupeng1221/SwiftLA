//
//  MatrixViewMut.swift
//  SwiftLA
//
//  Created by Peng Wu on 2025/11/13.
//

public struct MatrixViewMut<Element> {
    internal var storage: _MatrixViewStorage<Element>
    internal var parts: _MatrixViewPartsMutable<Element>
}
