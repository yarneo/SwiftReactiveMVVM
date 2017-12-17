//
//  UserDetailsViewController.swift
//  ReactiveMVVM
//
//  Created by Yarden Eitan on 9/2/17.
//  Copyright © 2017 Yarden Eitan. All rights reserved.
//

import UIKit
import Moya
import RxSwift
import ObjectMapper

class UserDetailsViewController: UIViewController, UITableViewDelegate {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var tableView: UITableView!

    var user: User?
    var disposeBag: DisposeBag! = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = .lightContent

        if let imageURL = self.user?.photo {
            imageView.sd_setImage(with: URL(string: imageURL))
        }
        self.username.text = self.user?.surname
        self.fullName.text = self.user?.name
        
        self.tableView
            .rx
            .setDelegate(self)
            .disposed(by: disposeBag)
        
        self.tableView.tableFooterView = UIView()
        
        let dataSource = Observable.just(self.user!.details)
        dataSource.bind(to: tableView.rx.items(cellIdentifier: "DetailsCell", cellType: DetailsTableViewCell.self)) { (row, element, cell) in
            cell.textLabel?.text = element.0
            cell.detailTextLabel?.text = element.1
        }.disposed(by: disposeBag)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupTopNavigationTheme()
    }

    func setupTopNavigationTheme() {
        UIApplication.shared.statusBarStyle = .lightContent
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.backgroundColor = UIColor.clear
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.edgesForExtendedLayout = UIRectEdge.all
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.navigationItem.backBarButtonItem?.tintColor = UIColor.white
    }

}
