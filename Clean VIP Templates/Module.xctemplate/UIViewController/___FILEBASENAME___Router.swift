//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

protocol ___VARIABLE_sceneName___RoutingLogic { }

protocol ___VARIABLE_sceneName___DataPassing {
    var dataStore: ___VARIABLE_sceneName___DataStore? { get }
}

class ___VARIABLE_sceneName___Router: ___VARIABLE_sceneName___RoutingLogic, ___VARIABLE_sceneName___DataPassing {
    
    // MARK: Variable
    weak var viewController: ___VARIABLE_sceneName___ViewController?
    var dataStore: ___VARIABLE_sceneName___DataStore?

}
