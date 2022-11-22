//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

// MARK: VIP Protocol
protocol ___VARIABLE_sceneName___RoutingLogic { }

protocol ___VARIABLE_sceneName___DataPassing {
    var dataStore: ___VARIABLE_sceneName___DataStore? { get }
}

// MARK: Module Body
class ___VARIABLE_sceneName___Router: ___VARIABLE_sceneName___RoutingLogic, ___VARIABLE_sceneName___DataPassing {
    
    // MARK: Variable
    weak var viewController: ___VARIABLE_sceneName___ViewController?
    var dataStore: ___VARIABLE_sceneName___DataStore?

}
