//
//  ViewController.swift
//  RouterCoordianatorTraining
//
//  Created by Ruslan Abbasov on 19.09.2022.
//

import UIKit

public protocol HomeViewControllerDelegate: class {
    func homeViewControllerDidPressScheduleAppointment(_ viewController: HomeViewController)
}

public class HomeViewController: UIViewController {

    public weak var delegate: HomeViewControllerDelegate?


    @IBAction func didPressGoNextScreen(_ sender: Any) {
        delegate?.homeViewControllerDidPressScheduleAppointment(self)
    }

}



extension HomeViewController: StoryboardInstantiable {
    public class func instantiate(delegate: HomeViewControllerDelegate) -> HomeViewController {
        let viewController = instanceFromStoryboard()
        viewController.delegate = delegate
        return viewController
    }
}
