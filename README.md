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
