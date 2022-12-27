public class DIContainer {
    
    private let fabricStorage = DIContainerStorage<DIFabricObjectProvider>()
    private let instanceStorage = DIContainerStorage<DIInstanceObjectProvider>()
    
    public init() {
        
    }
    
    public func registerDependency<T>(_ type: T.Type,
                                      scope: DIObjectScope = .fabric,
                                      factory: @escaping () -> T) {
        
        switch scope {
        case .fabric:
            fabricStorage.register(type, factory: factory)
            
        case .instance:
            instanceStorage.register(type, factory: factory)
        }
        
    }
    
    public func loadDependency<E>() -> E {
        if instanceStorage.typeExists(E.self) {
            return instanceStorage.load(E.self)
        }
        if fabricStorage.typeExists(E.self) {
            return fabricStorage.load(E.self)
        }
        fatalError("Type \(String(describing: E.self)) not registered")
    }
    
    public func loadDependency<E, RE>(relativeTo relativeEntity: RE) -> E {
        if instanceStorage.typeExists(E.self) {
            return instanceStorage.load(E.self, relativeType: RE.self)
        }
        if fabricStorage.typeExists(E.self) {
            return fabricStorage.load(E.self, relativeType: RE.self)
        }
        fatalError("Type \(String(describing: E.self)) relative to \(String(describing: RE.self)) not registered")
    }
    
}
