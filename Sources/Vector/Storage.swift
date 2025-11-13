//
//  Core.swift
//  SwiftLA
//
//  Created by Peng Wu on 2025/11/13.
//

internal class _VectorStorage<Element> {
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

    init(copying other: _VectorStorage<Element>) where Element: Copyable {
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

internal enum _VectorViewStorage {
    case immutable
    case mutable
}

extension _VectorStorage {
    internal func _isUniquelyReferenced() -> Bool {
        var mutableSelf: _VectorStorage<Element> = self
        return isKnownUniquelyReferenced(&mutableSelf)
    }

    internal func _ensureUnique() -> _VectorStorage<Element>? {
        if _isUniquelyReferenced() {
            return nil
        } else {
            return _VectorStorage(copying: self)
        }
    }
}
