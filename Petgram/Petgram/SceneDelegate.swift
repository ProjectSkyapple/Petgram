//
//  SceneDelegate.swift
//  Petgram
//
//  Created by Aaron Jacob on 4/11/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
            guard let _ = (scene as? UIWindowScene) else { return }

            NotificationCenter.default.addObserver(forName: Notification.Name("login"), object: nil, queue: OperationQueue.main) { [weak self] _ in
                self?.login()
            }

            NotificationCenter.default.addObserver(forName: Notification.Name("logout"), object: nil, queue: OperationQueue.main) { [weak self] _ in
                self?.logout()
            }

            // if User.current != nil {
            //    login()
            // }
        
            logout()
        }

        private func login() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            self.window?.rootViewController = storyboard.instantiateViewController(withIdentifier: "FeedNavigationController")
        }

        private func logout() {
            // Programmatically set the current displayed view controller.
            let storyboard = UIStoryboard(name: "Authentication", bundle: nil)
            self.window?.rootViewController = storyboard.instantiateViewController(withIdentifier: "AuthenticationNavigationController")
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }


}

