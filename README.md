# CombineReachability

CombineReachability adds easy to use Combine publishers for [ReachabilitySwift](https://github.com/ashleymills/Reachability.swift).
It adds the ability to react to network reachability changes in a reactive way using the power of Combine.
This library was inspired by the RxSwift Community's [RxReachability](https://github.com/RxSwiftCommunity/RxReachability) library.

## APIs

CombineReachability adds the following Combine publishers:

- `reachabilityChanged: AnyPublisher<Reachability, Never>`
- `status: AnyPublisher<Reachability.Connection, Never>`
- `isReachable: AnyPublisher<Bool, Never>`
- `isConnected: AnyPublisher<Void, Never>`
- `isDisconnected: AnyPublisher<Void, Never>`

## Common Usage

#### 1. Be sure to store an instance of `Reachability`, and start/stop the notifier by calling `try? reachability?.startNotifier()` and `reachability?.stopNotifier()` respectively.

```swift
class ViewController: UIViewController {

  var subscriptions = Set<AnyCancellable>()
  var reachability: Reachability?

  override func viewDidLoad() {
    super.viewDidLoad()
    reachability = Reachability()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    try? reachability?.startNotifier()
  }

  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    reachability?.stopNotifier()
  }
}

```

#### 2. Subscribe to any of the publishers to know when a reachability change happens.

```swift
extension ViewController {

  func testReachability() {

    reachability?.reachabilityChanged
      .sink(receiveValue: { reachability: Reachability in
        print("Reachability changed: \(reachability.currrentReachabilityStatus)")
      })
      .store(in: &subscriptions)

    reachability?.status
      .sink(receiveValue: { status: Reachability.NetworkStatus in
        print("Reachability status changed: \(status)")
      })
      .store(in: &subscriptions)

    reachability?.isReachable
      .sink(receiveValue: { isReachable: Bool in
        print("Is reachable: \(isReachable)")
      })
      .store(in: &subscriptions)

    reachability?.isConnected
      .sink(receiveValue: {
        print("Is connected")
      })
      .store(in: &subscriptions)

    reachability?.isDisconnected
      .sink(receiveValue: {
        print("Is disconnected")
      })
      .store(in: &subscriptions)
  }
```

## Static Usage

#### 1. Be sure to store an instance of `Reachability` somewhere on your `AppDelegate` or similar, and start the notifier.

```swift
import Reachability

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var reachability: Reachability?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    reachability = Reachability()
    try? reachability?.startNotifier()
    return true
  }
}

```

#### 2. Subscribe to any of the publishers to know when a reachability change happens.

```swift
extension ViewController {

  func testReachability() {

    Reachability.reachabilityChanged
      .sink(receiveValue: { reachability: Reachability in
        print("Reachability changed: \(reachability.currrentReachabilityStatus)")
      })
      .store(in: &subscriptions)

    Reachability.status
      .sink(receiveValue: { status: Reachability.NetworkStatus in
        print("Reachability status changed: \(status)")
      })
      .store(in: &subscriptions)

    Reachability.isReachable
      .sink(receiveValue: { isReachable: Bool in
        print("Is reachable: \(isReachable)")
      })
      .store(in: &subscriptions)

    Reachability.isConnected
      .sink(receiveValue: {
        print("Is connected")
      })
      .store(in: &subscriptions)

    Reachability.isDisconnected
      .sink(receiveValue: {
        print("Is disconnected")
      })
      .store(in: &subscriptions)
  }
```

## Installation

### Installation via CocoaPods

Add the following line to your Podfile and run `pod install`:

```ruby
pod 'CombineReachability'
```

### Installation via Swift Package Manager

- In Xcode select `File/Swift Packages/Add Package Dependency...`
- Paste `https://github.com/istvan-kreisz/CombineReachability.git` into the repository URL textfield.

## License

CombineReachability is available under the MIT license. See the LICENSE file for more info.