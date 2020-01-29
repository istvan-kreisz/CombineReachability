//
//  Reachability+Combine.swift
//
//
//  Created by István Kreisz on 27/01/2020.
//

import Foundation 
import Reachability
import Combine

public extension Reachability {
    
    static var reachabilityChanged: AnyPublisher<Reachability, Never> {
        return NotificationCenter.default.publisher(for: Notification.Name.reachabilityChanged)
            .compactMap { $0.object as? Reachability }
            .eraseToAnyPublisher()
    }
    
    static var status: AnyPublisher<Reachability.Connection, Never> {
        return reachabilityChanged
            .map { $0.connection }
            .eraseToAnyPublisher()
    }
    
    static var isReachable: AnyPublisher<Bool, Never> {
        return reachabilityChanged
            .map { $0.connection != .unavailable }
            .eraseToAnyPublisher()
    }
    
    static var isConnected: AnyPublisher<Void, Never> {
        return isReachable
            .filter { $0 }
            .map { _ in }
            .eraseToAnyPublisher()
    }
    
    static var isDisconnected: AnyPublisher<Void, Never> {
        return isReachable
            .filter { !$0 }
            .map { _ in }
            .eraseToAnyPublisher()
    }
}

public extension Reachability {
    
    var reachabilityChanged: AnyPublisher<Reachability, Never> {
        return NotificationCenter.default.publisher(for: Notification.Name.reachabilityChanged)
            .compactMap { $0.object as? Reachability }
            .eraseToAnyPublisher()
    }
    
    var status: AnyPublisher<Reachability.Connection, Never> {
        return reachabilityChanged
            .map { $0.connection }
            .eraseToAnyPublisher()
    }
    
    var isReachable: AnyPublisher<Bool, Never> {
        return reachabilityChanged
            .map { $0.connection != .unavailable }
            .eraseToAnyPublisher()
    }
    
    var isConnected: AnyPublisher<Void, Never> {
        return isReachable
            .filter { $0 }
            .map { _ in }
            .eraseToAnyPublisher()
    }
    
    var isDisconnected: AnyPublisher<Void, Never> {
        return isReachable
            .filter { !$0 }
            .map { _ in }
            .eraseToAnyPublisher()
    }
}
