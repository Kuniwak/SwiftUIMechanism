# Why the following code can work...?

```swift
ViewA {
    ViewB()
}


XCTAssertEqual(Context.current, .rootView(RootView(subviews: [
    .viewA(ViewA(subviews: [
        .viewB(ViewB(subviews: [])),
    ]))
])))
```


See [`SwiftUIMechanism.swift`](./Sources/SwiftUIMechanism/SwiftUIMechanism.swift).

[![CircleCI](https://circleci.com/gh/Kuniwak/SwiftUIMechanism/tree/master.svg?style=svg)](https://circleci.com/gh/Kuniwak/SwiftUIMechanism/tree/master)
