//
// Copyright (c) Bytedance Inc. and its affiliates.
//
// This source code is licensed under the MIT license found in the
// LICENSE file in the root directory of this source tree.
//

import Foundation

public class DCListDataController: NSObject {
    public var objects = [Any]()

    public func objectAtIndexPath(_ indexPath: IndexPath) -> Any? {
        guard let object = objects[dc_safe: indexPath.row] else {
            return nil
        }
        return object
    }

    public func addObject(_ object: Any) {
        objects.append(object)
    }

    public func forEach<T>(_ closure: (_ object: T, _ indexPath: IndexPath) -> Void) {
        for (rowIndex, object) in objects.enumerated() {
            if let _object = object as? T {
                let indexPath = IndexPath(row: rowIndex, section: 0)
                closure(_object, indexPath)
            }
        }
    }
}
