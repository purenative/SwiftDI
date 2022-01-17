final class DIContainerStorage<OP: DIObjectProvider> {
    
    private var providers = [DIEntityTypeKey: OP]()
    
    func regiter<T>(_ type: T.Type, factory: @escaping () -> T)  {
        let provider = OP(factory: factory as () -> Any)
        let key = DIEntityTypeKey(type, scope: OP.scope)
        providers[key] = provider
    }
    
    func load<T>(_ type: T.Type) -> T {
        let key = DIEntityTypeKey(type, scope: OP.scope)
        let provider = providers[key]!
        return provider.provide() as! T
    }
    
    func typeExists<T>(_ type: T.Type) -> Bool {
        let key = DIEntityTypeKey(type, scope: OP.scope)
        return providers.keys.contains(key)
    }
    
}
