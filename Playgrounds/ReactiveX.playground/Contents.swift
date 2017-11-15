//: Playground - noun: a place where people can play

@testable import TMDbCore
import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

enum APIError: Error {
    case invalidKey
    case notAnImage
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
        
        struct Picture: Decodable {
            let large: URL
        }
        
        let name: Name
        let picture: Picture
    }
    
    let results: [User]
}


let session = URLSession(configuration: .default)
let url = URL(string: "https://randomuser.me/api")!



let decoder = JSONDecoder()

func data(with url: URL) -> Observable<Data> {
    return Observable<Data>.create { observer in
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
            task.cancel()
        }
    }
}

func randomUser() -> Observable<UserResponse> {
    return data(with: url).map { data in
        try decoder.decode(UserResponse.self, from: data)
    }
}

func image(with url: URL) -> Observable<UIImage> {
    return data(with: url).map{
        guard let image = UIImage(data: $0) else {
            throw APIError.notAnImage
        }
        return image
    }
}

let disposable = randomUser()
    .map { $0.results[0] }
    .flatMap{ user in
        image(with: user.picture.large)
    }
    .subscribe(onNext: { image in
        let temp = image
        print(image)
    }, onError: { error in
        print(error)
    })

let cell = UITableViewCell()
let size = cell.imageView?.image?.size // optional chaining
let size2 = cell.imageView.flatMap{ $0.image }.flatMap{ $0.size }

//disposable.dispose()







