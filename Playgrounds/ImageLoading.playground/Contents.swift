//: Playground - noun: a place where people can play

@testable import TMDbCore
import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let disposeBag = DisposeBag()
let assembly = CoreAssembly()
let imageRepository = assembly.imageLoadingRepository.imageRepository

imageRepository.image(at: "ncEmkHADNggjR0dlerOIHqmiY0O.jpg", size: .w780)
    .subscribe(onNext: {
        let image = $0
        print(image)
    })
    .disposed(by: disposeBag)
