//
//  ViewController.swift
//  ReactiveMVVM
//
//  Created by Yarden Eitan on 9/2/17.
//  Copyright © 2017 Yarden Eitan. All rights reserved.
//

import UIKit
import Moya
import Moya_ObjectMapper
import RxSwift
import RxCocoa
import SDWebImage

class UsersViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var userViewModel: UserViewModel!
    
    convenience init(viewModel: UserViewModel) {
        self.init()
        self.userViewModel = viewModel
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTable()
    }
    
    func setupTable() {
        self.tableView
            .rx
            .setDelegate(self)
            .disposed(by: userViewModel.disposeBag)
        
        self.tableView.tableFooterView = UIView()

        self.tableView
            .rx
            .modelSelected(User.self)
            .subscribe(onNext: { (user) in
                if let selectedRowIndexPath = self.tableView.indexPathForSelectedRow {
                    self.tableView.deselectRow(at: selectedRowIndexPath, animated: true)
                }
                self.userViewModel.userSelected.onNext(user)
            })
            .disposed(by: userViewModel.disposeBag)

        self.userViewModel.rxUsers
            .asDriver()
            .drive(self.tableView.rx.items(cellIdentifier: "UserCell", cellType: UserTableViewCell.self)) { (row, element, cell) in
                cell.name.text = element.name
                if let avatarURL = element.photo {
                    cell.avatar.sd_setImage(with: URL(string: avatarURL))
                }
                cell.title.text = "\(element.title!) \(element.name!) \(element.surname)"
            }
            .disposed(by: userViewModel.disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .default
        setupTopNavigationTheme()
    }
    
    func setupTopNavigationTheme() {
        self.automaticallyAdjustsScrollViewInsets = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.topItem?.title = "Members"
        self.edgesForExtendedLayout = UIRectEdge.all
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = UIColor.white
    }
    

}

