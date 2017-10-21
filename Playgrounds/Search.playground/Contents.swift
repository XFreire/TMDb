//: Playground - noun: a place where people can play

@testable import TMDbCore

import RxSwift
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let assembly = CoreAssembly(navigationController: UINavigationController())
let resultsViewController = assembly.searchAssembly.searchResultsViewController()

resultsViewController.view.frame = CGRect(x: 0, y: 0, width: 475, height: 667)


PlaygroundPage.current.liveView = resultsViewController
