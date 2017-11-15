//: Playground - noun: a place where people can play

@testable import TMDbCore
import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

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

// Subscription
hello.subscribe{ event in
    switch event {
    case .next(let value):
        print(value)
    case .error(let error):
        print(error)
    case .completed:
        print("completed")
    }
}

// HTTP Request
struct UserResponse: Decodable {
    struct User: Decodable {
        struct Name: Decodable {
            let title: String
            let first: String
            let last: String
        }
        
        let name: Name
    }
    
    let results: [User]
}


let session = URLSession(configuration: .default)
let url = URL(string: "https://randomuser.me/api")!

let randomUser = Observable<Data>.create { observer in
    // 1
    let task = session.dataTask(with: url) { data, response, error in
        // 4
        if let error = error {
            observer.onError(error)
        } else {
            observer.onNext(data ?? Data())
            observer.onCompleted()
        }
    }
    
    // 2
    task.resume()
    
    // 3
    return Disposables.create {
        print("cancelled")
        task.cancel()
    }
}
let decoder = JSONDecoder()

let disposable = randomUser
    .map { data in
        try decoder.decode(UserResponse.self, from: data)
    }
    .subscribe(onNext: { userResponse in
        print(userResponse)
    })


//disposable.dispose()







