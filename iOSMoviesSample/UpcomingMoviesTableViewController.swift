//
//  TableViewController.swift
//  iOSMoviesSample
//
//  Created by fj on 19/06/2017.
//  Copyright © 2017 Spiral Apps. All rights reserved.
//

import UIKit

class UpcomingMoviesTableViewController: UITableViewController {

    var movies = [Movie]() {
        didSet {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewDidAppear(_ animated: Bool) {
        loadUpcoming()
    }

    private func loadUpcoming() {
        ApiMovieDataSource.getUpconming { [weak self] result in
            switch result {
            case .success(let data):
                self?.movies.append(contentsOf: data)
            case .failure:
                self?.showError(message: R.string.commons.errorGeneric(), retryWith: self?.loadUpcoming)
            }
        }
    }

    private func showError(message: String, retryWith: (() -> Void)?) {
        let alertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)

        if let retryWith = retryWith {
            let retryAction = UIAlertAction(title: "Retry", style: .default, handler: { _ in
                retryWith()
            })
            alertController.addAction(retryAction)
        }

        self.present(alertController, animated: true, completion: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Movie", for: indexPath)

        let movie = movies[indexPath.row]

        // Configure the cell...
        cell.textLabel?.text = movie.title
        cell.detailTextLabel?.text = movie.overview

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
