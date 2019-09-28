import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
        
        let movieList = UserViewController(nibName: "UserViewController", bundle: nil)
            movieList.title = "Favorite Movies"
            return true
            
            let navigationController = UINavigationController(rootViewController: movieList)
            
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        
       override func numberOfSections(in tableView: UITableView) -> Int
        {
            return 1
        }

        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
            return movieList.count
        }
        }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {

    }
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)


    cell.textLabel?.text = movieList[indexPath.row][0],
    
     print("\(#function) --- section = \(indexPath.section), row = \(indexPath.row)")

    return cell
}



class Movie {
    var movieName: String
    var hasSeen: Bool
    
    init(movieName: String, hasSeen: Bool) {
        self.movieName = movieName
        self.hasSeen = false
    }
}
