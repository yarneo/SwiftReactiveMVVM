//
//  UserViewModel.swift
//  ReactiveMVVM
//
//  Created by Yarden Eitan on 9/2/17.
//  Copyright © 2017 Yarden Eitan. All rights reserved.
//

import UIKit
import RxSwift
import Moya
import RealmSwift
import RxRealm

class UserViewModel {
    
    var users = [User]()
    var rxUsers = Variable<[User]>([])
    var disposeBag = DisposeBag()
    var provider = MoyaProvider<NetworkService>()
    let realm: Realm
    
    var userSelected = PublishSubject<User>()
    
    func loadUsers() -> PrimitiveSequence<SingleTrait, [User]> {
        return self.provider.rx
            .request(.fetchUsers(amount: API.amount))
            .mapArray(User.self)
            .do(onNext: { users in
//                if let u = users.users {
//                    try! self.realm.write {
//                        self.realm.add(u, update: true)
//                    }
//                }
                self.users = users
                self.rxUsers.value = self.users
            })
    }
    
    init() {
        self.realm = try! Realm()
        self.users = Array(realm.objects(User.self)) 
        self.rxUsers.value = self.users

        self.loadUsers().subscribe().disposed(by: self.disposeBag)
    }

}
