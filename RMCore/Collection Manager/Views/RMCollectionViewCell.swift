//
//  RMCollectionViewCell.swift
//  RMCore
//
//  Created by Ryan Mannion on 4/29/16.
//  Copyright © 2016 Ryan Mannion. All rights reserved.
//

import Foundation
import Bond

public class RMCollectionViewCell : UICollectionViewCell {
    public var collectionRow: RMCollectionRow!
    internal var observers = [DisposableType]()
    
    public required override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func flushObservers() {
        observers.forEach { $0.dispose() }
        observers.removeAll()
    }

    public func observe<T>(observable: Observable<T>, observe: @escaping (T) -> Void) {
        let observer = observable.observe { (value) in
            observe(value)
        }
        observers.append(observer)
    }
    
    public func observeNew<T>(observable: Observable<T>, observe: @escaping (T) -> Void) {
        let observer = observable.observeNew { (value) in
            observe(value)
        }
        observers.append(observer)
    }
}
