//
//  Matrix.swift
//  SwiftLA
//
//  Created by Peng Wu on 2025/11/13.
//

public struct Matrix<Element> {
    internal var stotage: _MatrixStorage<Element>
    internal var part: _MatrixParts<Element>
}
