public class DIContainer {
    
    private let fabricStorage = DIContainerStorage<DIFabricObjectProvider>()
    private let instanceStorage = DIContainerStorage<DIInstanceObjectProvider>()
    
    func registerDependency<T>(_ type: T.Type,
                               scope: DIObjectScope = .fabric,
                               factory: @escaping () -> T) {
        
        switch scope {
        case .fabric:
            fabricStorage.regiter(type, factory: factory)
            
        case .instance:
            instanceStorage.regiter(type, factory: factory)
        }
        
    }
    
    func loadDependency<T>() -> T {
        if instanceStorage.typeExists(T.self) {
            return instanceStorage.load(T.self)
        }
        if fabricStorage.typeExists(T.self) {
            return fabricStorage.load(T.self)
        }
        fatalError("Type \(String(describing: T.self)) not registered")
    }
    
}
