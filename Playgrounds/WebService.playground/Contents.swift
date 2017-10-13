//: Playground - noun: a place where people can play

@testable import TMDbCore
import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()
let webService = WebService()

// Load configuration
webService.load(Configuration.self, from: .configuration)
    .subscribe(onNext: { print($0.images.baseURL) })
    .disposed(by: disposeBag)

