//
//  FeedViewController.swift
//  Petgram
//
//  Created by Ibad Momin on 4/18/23.
//

import UIKit
import ParseSwift

class FeedViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let refreshControl = UIRefreshControl()

    private var posts = [Post]() {
        didSet {
            // Reload table view data any time the posts variable gets updated.
            tableView.reloadData()
        }
    }

   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false

        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(onPullToRefresh), for: .valueChanged)
    }
    
    @objc private func onPullToRefresh() {
        refreshControl.beginRefreshing()
        queryPosts { [weak self] in
            self?.refreshControl.endRefreshing()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        queryPosts()
    }

    private func queryPosts(completion: (() -> Void)? = nil) {
        // TODO: Pt 1 - Query Posts
        // https://github.com/parse-community/Parse-Swift/blob/3d4bb13acd7496a49b259e541928ad493219d363/ParseSwift.playground/Pages/2%20-%20Finding%20Objects.xcplaygroundpage/Contents.swift#L66

        // 1. Create a query to fetch Posts
        // 2. Any properties that are Parse objects are stored by reference in Parse DB and as such need to explicitly use `include_:)` to be included in query results.
        // 3. Sort the posts by descending order based on the created at date
        // 4. TODO: Pt 2 - Only include results created yesterday onwards
        // 5. TODO: Pt 2 - Limit max number of returned posts

                        
        let yesterdayDate = Calendar.current.date(byAdding: .day, value: (-1), to: Date())!

        let query = Post.query()
            .include("user")
            .order([.descending("createdAt")])
            .where("createdAt" >= yesterdayDate) // <- Only include results created yesterday onwards
            .limit(10) // <- Limit max number of returned posts to 10

        // Find and return posts that meet query criteria (async)
        query.find { [weak self] result in
            switch result {
            case .success(let posts):
                // Update the local posts property with fetched posts
                self?.posts = posts
            case .failure(let error):
                let error = UIAlertController(title: "Alert", message: "Error occured", preferredStyle: .alert)
            }

            // Call the completion handler (regardless of error or success, this will signal the query finished)
            // This is used to tell the pull-to-refresh control to stop refresshing
            completion?()
        }
    }

}

extension FeedViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped me!")
    }
    
}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell else {
            return UITableViewCell()
        }
        cell.configure(with: posts[indexPath.row])
        return cell
    }
}

