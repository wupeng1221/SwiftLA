//
//  Parts.swift
//  SwiftLA
//
//  Created by Peng Wu on 2025/11/13.
//

internal struct _MatrixParts<Element> {
    var rows: Int
    var cols: Int
    var size: Int { rows * cols }
    var rowStride: Int { strides[0] }
    var colStride: Int { strides[1] }
    var strides: [Int]
    var dimension: [Int] { [rows, cols] }
    var logicalPointer: UnsafeMutablePointer<Element>
}

internal struct _MatrixViewParts<Element, Pointer> {
    var rows: Int
    var cols: Int
    var size: Int { rows * cols }
    var rowStride: Int { strides[0] }
    var colStride: Int { strides[1] }
    var strides: [Int]
    var dimension: [Int] { [rows, cols] }
    var logicalPointer: Pointer
}

internal typealias _MatrixViewPartsImmutable<Element> = _MatrixViewParts<Element, UnsafePointer<Element>>
internal typealias _MatrixViewPartsMutable<Element> = _MatrixViewParts<Element, UnsafeMutablePointer<Element>>


