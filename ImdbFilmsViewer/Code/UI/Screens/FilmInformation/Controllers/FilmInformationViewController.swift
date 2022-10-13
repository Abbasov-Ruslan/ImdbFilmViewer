//
//  FilmInformationViewController.swift
//  RouterCoordianatorTraining
//
//  Created by Ruslan Abbasov on 20.09.2022.
//

import UIKit

public protocol FilmInformationViewControllerDelegate: class {
    func homeViewControllerDidPressShowFilmInformation(_ viewController: FilmInformationViewController)
}

public class FilmInformationViewController: UIViewController {

    // MARK: - Instance Properties
    public weak var delegate: FilmInformationViewControllerDelegate?

    // MARK: - Actions
    @IBAction internal func didPressScheduleAppointment(_ sender: AnyObject) {
        delegate?.homeViewControllerDidPressShowFilmInformation(self)
    }
}

// MARK: - StoryboardInstantiable
extension FilmInformationViewController: StoryboardInstantiable {
  public class func instantiate(delegate: FilmInformationViewControllerDelegate) -> FilmInformationViewController {
    let viewController = instanceFromStoryboard()
    viewController.delegate = delegate
    return viewController
  }
}
