//
//  Storage.swift
//  SwiftLA
//
//  Created by Peng Wu on 2025/11/13.
//

internal final class _MatrixStorage<Element> {
    var pointer: UnsafeMutablePointer<Element>
    var size: Int
    var capacity: Int

    init(from array: [Element]) {
        let initialCapacity = max(array.count, 1)

        self.pointer = UnsafeMutablePointer<Element>.allocate(
            capacity: initialCapacity
        )
        self.size = array.count
        self.capacity = initialCapacity

        if array.count > 0 {
            array.withUnsafeBufferPointer { sourceBuffer in
                pointer.initialize(
                    from: sourceBuffer.baseAddress!,
                    count: array.count
                )
            }
        }
    }

    init(capacity: Int) {
        let actualCapacity = max(capacity, 1)
        self.pointer = UnsafeMutablePointer<Element>.allocate(
            capacity: actualCapacity
        )
        self.size = 0
        self.capacity = actualCapacity
    }

    init(copying other: _MatrixStorage<Element>) where Element: Copyable {
        self.size = other.size
        self.capacity = other.capacity

        self.pointer = UnsafeMutablePointer<Element>.allocate(
            capacity: self.capacity
        )

        if size > 0 {
            pointer.initialize(from: other.pointer, count: size)
        }
    }

    deinit {
        if capacity > 0 {
            if size > 0 {
                pointer.deinitialize(count: size)
            }
            pointer.deallocate()
        }
    }
}

internal enum _MatrixViewStorage<Element> {
    case immutable
    case mutable
}

extension _MatrixStorage {
    internal func _isUniquelyReferenced() -> Bool {
        var mutableSelf: _MatrixStorage<Element> = self
        return isKnownUniquelyReferenced(&mutableSelf)
    }

    internal func _ensureUnique() -> _MatrixStorage<Element>? {
        if _isUniquelyReferenced() {
            return nil
        } else {
            return _MatrixStorage(copying: self)
        }
    }
}
