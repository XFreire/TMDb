//: Playground - noun: a place where people can play

@testable import TMDbCore
import RxSwift

enum APIError: Error {
    case invalidKey
}

// Observable creation

let empty = Observable<Int>.empty() // Completed only
let single = Observable.just("Hello") // Next and completed
let some = Observable.from(["🤔", "😎", "💩"]) // How many events are sent?: 4
let error = Observable<Data>.error(APIError.invalidKey)

let hello = Observable<String>.create { observer in // observer = future subscriber
    observer.onNext("Hello")
    observer.onCompleted()
    
    return Disposables.create()
}
