//
//  AppCoordinator.swift
//  ReactiveMVVM
//
//  Created by Yarden Eitan on 9/2/17.
//  Copyright © 2017 Yarden Eitan. All rights reserved.
//

import Foundation
import UIKit
import RxSwift

class AppCoordinator {
    weak var navigationController: UINavigationController?
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    var userSelected = PublishSubject<User>()
    let disposeBag = DisposeBag()

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
        self.navigationController?.navigationBar.backgroundColor = UIColor.white
        
        userSelected
            .subscribe(onNext: { user in
                let viewController = self.storyboard.instantiateViewController(withIdentifier: "UserDetailsViewController") as! UserDetailsViewController
                viewController.user = user
                self.navigationController?.pushViewController(viewController, animated: true)
            }).disposed(by: disposeBag)
        
        start()
    }
    
    func start() {
        let viewModel = UserViewModel()
        let viewController = storyboard.instantiateViewController(withIdentifier: "UsersViewController") as! UsersViewController
        viewController.userViewModel = viewModel
        
        viewModel.userSelected.asObservable()
            .bind(to: userSelected)
            .disposed(by: disposeBag)
        
        navigationController?.pushViewController(viewController, animated: true)

    }
}
