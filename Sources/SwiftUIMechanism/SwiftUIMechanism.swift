import Dispatch



public enum Context {
    public fileprivate(set) static var current: View = .rootView(RootView())
}



public enum View: Equatable {
    case rootView(RootView)
    case viewA(ViewA)
    case viewB(ViewB)


    func add(subview: View) {
        switch self {
        case .rootView(let view):
            view.subviews.append(subview)
        case .viewA(let view):
            view.subviews.append(subview)
        case .viewB(let view):
            view.subviews.append(subview)
        }
    }
}



public class RootView: Equatable {
    public var subviews: [View]


    public init(subviews: [View] = []) {
        self.subviews = subviews
    }


    public static func ==(lhs: RootView, rhs: RootView) -> Bool {
        return lhs.subviews == rhs.subviews
    }
}



public class ViewA: Equatable {
    public var subviews: [View]


    public init(subviews: [View]) {
        self.subviews = subviews
    }


    public init(_ block: (() -> Void)? = nil) {
        self.subviews = []

        Context.current.add(subview: .viewA(self))

        if let block = block {
            let parent = Context.current
            Context.current = .viewA(self)
            block()
            Context.current = parent
        }
    }


    public static func ==(lhs: ViewA, rhs: ViewA) -> Bool {
        return lhs.subviews == rhs.subviews
    }
}



public class ViewB: Equatable {
    public var subviews: [View]


    public init(subviews: [View]) {
        self.subviews = subviews
    }


    public init(_ block: (() -> Void)? = nil) {
        self.subviews = []

        Context.current.add(subview: .viewB(self))

        if let block = block {
            let parent = Context.current
            Context.current = .viewB(self)
            block()
            Context.current = parent
        }
    }


    public static func ==(lhs: ViewB, rhs: ViewB) -> Bool {
        return lhs.subviews == rhs.subviews
    }
}
