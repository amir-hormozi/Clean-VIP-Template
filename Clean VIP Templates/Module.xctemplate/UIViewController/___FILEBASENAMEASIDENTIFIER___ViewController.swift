//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit

protocol ___VARIABLE_sceneName___DisplayLogic: AnyObject { }

class ___VARIABLE_sceneName___ViewController: UIViewController, ___VARIABLE_sceneName___DisplayLogic {
    
    // MARK: Variable
    var interactor: ___VARIABLE_sceneName___BusinessLogic!
    var router: (___VARIABLE_sceneName___RoutingLogic & ___VARIABLE_sceneName___DataPassing)?

    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Function
}
