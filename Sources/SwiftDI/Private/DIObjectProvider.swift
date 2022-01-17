protocol DIObjectProvider {
    
    static var scope: DIObjectScope { get }
    
    init(factory: @escaping () -> Any)
    
    func provide() -> Any
    
}
