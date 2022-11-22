//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//

import UIKit

// MARK: VIP Protocol
protocol ___VARIABLE_sceneName___DisplayLogic: AnyObject { }

// MARK: Module Body
class ___VARIABLE_sceneName___ViewController: UIViewController, ___VARIABLE_sceneName___DisplayLogic {
    
    // MARK: Variable
    var interactor: ___VARIABLE_sceneName___BusinessLogic!
    var router: (___VARIABLE_sceneName___RoutingLogic & ___VARIABLE_sceneName___DataPassing)?

    // MARK: LifeCycle
    init() {
        super.init(nibName: nil, bundle: nil)
        setupVipStructure()
    }
    
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Function
    func setupVipStructure() {
        let viewController = self
        let presenter = ___VARIABLE_sceneName___Presenter()
        let router = ___VARIABLE_sceneName___Router()
        let interactor = ___VARIABLE_sceneName___Interactor()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }
}
