# SwiftReactiveMVVM
A Swift 4 project that leverages Reactive libraries, caching, and object mapping, whilst using the MVVM + Coordinator Architecture

The idea behind this mini-project is to create a good skeleton for developers who want to leverage strong and useful 3rd party libraries to facilitate a Reactive driven app, that uses the Model / View Model / View + Coordinators architecture.

The 3rd party libraries used in this project:
* RxSwift (https://github.com/ReactiveX/RxSwift)
* RealmSwift (https://github.com/realm/realm-cocoa)
* RxRealm (https://github.com/RxSwiftCommunity/RxRealm)
* Moya (https://github.com/Moya/Moya)
* ObjectMapper (https://github.com/Hearst-DD/ObjectMapper)
* SDWebImage (https://github.com/rs/SDWebImage)

## Introduction
Recently I was inspired by the new wave of newer better architectures than the archaic Model / View / View Controller. These newer architectures are better for numerous reasons, if for easier testing, better modularity, create a less bulky view controller, make code collaboration easier, etc. One architecture that really stuck out is the MVVM + Coordinators approach. I urge you to read more about it here: https://medium.com/@giovannyorozco24/mvvm-and-coordinator-pattern-together-8920fc0f1f55 and here: https://academy.realm.io/posts/mobilization-lukasz-mroz-mvvm-coordinators-rxswift/ .

If you will notice, with this architecture comes always the addition of "Reactive Programming" as part of it. It definitely isn't supposed to come as part of the architecture, but reactive programming seems to resonate well with MVVM. If you have never heard of reactive programming before, you should read a few tutorials (https://www.raywenderlich.com/158026/introducing-rxswift-reactive-programming-swift) before starting to use it, as it is something you really need to wrap your head around initially.

## Project Details
I have decided to make use of an open and public API called https://uinames.com/. With this API, I display a table of random users which then you can click on each user to see more details.

This entire project is using reactive programming and the project folder hierarchy is split into folders that fit the MVVM+C pattern: Models, View Models, Views, Networking, Coordinator.

* SDWebImage is used to load and cache the image URLS into images for each user that is displayed. 
* Realm is used  to store the users information on disk if there is network issues and we wish to have the data offline. 
* Moya is used  for easier use and encapsulation of the networking model.
* ObjectMapper is used  to make the parsing of the returned JSON from the server into a Swift Object as easy as possible.
* RxSwift is used  for making everything reactive :)

### Feel free to contribute to this project if you see any places for improvement, happy Swifting!
