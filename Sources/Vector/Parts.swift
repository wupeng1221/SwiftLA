//
//  Parts.swift
//  SwiftLA
//
//  Created by Peng Wu on 2025/11/13.
//

internal struct _VectorParts<Element> {
    var logicalPointer: UnsafeMutablePointer<Element>
    var size: Int
    var stride: Int
}

internal struct _VectorViewParts<Element, Pointer> {
    var logicalPointer: Pointer
    var size: Int
    var stride: Int
}

internal typealias _VectorViewPartsImmutable<Element> = _VectorViewParts<
    Element, UnsafePointer<Element>
>
internal typealias _VectorViewPartsMutable<Element> = _VectorViewParts<
    Element, UnsafeMutablePointer<Element>
>
