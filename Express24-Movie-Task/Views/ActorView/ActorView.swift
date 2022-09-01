//
//  ActorView.swift
//  Express24-Movie-Task
//
//  Created by Yunus on 01/09/22.
//

import UIKit
import RxSwift

final class ActorView: UIViewController {
    
    private lazy var tableView: UITableView = {
        let table = UITableView.makeTableView(delegateDataSourece: self)
        ActorHeaderCell.register(to: table)
        ActorFilmsCell.register(to: table)
        return table
    }()
    private let disposeBag = DisposeBag()
    
    var viewModel: ActorViewModel? {
        didSet {
            self.setupBindings()
        }
    }
    
    override func loadView() {
        super.loadView()
        view.addSubviews(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        tableView.backgroundColor = .backgroundColor
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setupBindings() {
        guard let viewModel = viewModel else {
            return
        }
        
        viewModel.isDataLoaded
            .subscribe(onNext: { [weak self] _ in
                self?.tableView.reloadData()
            }).disposed(by: disposeBag)

    }
}

extension ActorView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return viewModel?.actorMovies?.cast.count ?? 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = ActorHeaderCell.dequeue(on: tableView, at: indexPath)!
            cell.setup(viewModel?.actor)
            return cell
        } else {
            let cell = ActorFilmsCell.dequeue(on: tableView, at: indexPath)!
            let cast = viewModel?.actorMovies?.cast[indexPath.row]
            cell.setup(cast)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "About actor"
        } else {
            return "Actor movies"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            tableView.deselectRow(at: indexPath, animated: true)
        } else {
            tableView.deselectRow(at: indexPath, animated: true)
            if let cast = viewModel?.actorMovies?.cast[indexPath.row] {
                viewModel?.go2MovieDetailView(movie: cast)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let view = view as? UITableViewHeaderFooterView {
            view.backgroundView?.backgroundColor = UIColor.blue
            view.textLabel?.backgroundColor = UIColor.clear
            view.textLabel?.textColor = UIColor.white
        }
    }
   
}
