//: Playground - noun: a place where people can play

@testable import TMDbCore
import RxSwift

// Observable creation

let empty = Observable<Int>.empty() // Completed only
let single = Observable.just("Hello") // Next and completed
let some = Observable.from(["🤔", "😎", "💩"]) // How many events are sent?: 4

