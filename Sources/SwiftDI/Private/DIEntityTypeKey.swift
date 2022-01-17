final class DIEntityTypeKey: Hashable {
    
    let entityName: String
    let scope: DIObjectScope
    
    init<T>(_ type: T.Type, scope: DIObjectScope) {
        entityName = String(describing: type)
        self.scope = scope
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(entityName)
        hasher.combine(scope)
    }
    
    static func ==(lhs: DIEntityTypeKey, rhs: DIEntityTypeKey) -> Bool {
        lhs.hashValue == rhs.hashValue
    }
    
}
