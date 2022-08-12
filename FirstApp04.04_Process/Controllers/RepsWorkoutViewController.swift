//
//  StartWorkoutViewController.swift
//  FirstApp04.04_Process
//
//  Created by Егор Филиппов on 24.04.2022.
//

import UIKit

class RepsWorkoutViewController: UIViewController {

    private let startWorkoutLabel = UILabel(text: "START WORKOUT", font: .robotoMedium24(), textColor: .specialGray)
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let startWorkoutImage: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "startWorkout")?.withRenderingMode(.alwaysOriginal)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let detaildLabel = UILabel(text: "Details", font: .robotoMedium14(), textColor: .specialLightBrown)
    
    private let workoutParametersView = WorkoutParametersView()
    
    var workoutModel = WorkoutModel()
    let customAlert = CustomAlert()
    
    private var numberOfSet = 1
    
    private lazy var finishButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("FINISH", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .specialGreen
        button.tintColor = .white
        button.titleLabel?.font = .robotoBold16()
        button.addTarget(self, action: #selector(addFinishButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLayoutSubviews() {
        closeButton.layer.cornerRadius = closeButton.frame.height / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        setDelegates()
        setWorkoutParameters()
    }
    
    private func setDelegates() {
        workoutParametersView.cellNextSetDelegate = self
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(startWorkoutLabel)
        view.addSubview(closeButton)
        view.addSubview(startWorkoutImage)
        view.addSubview(detaildLabel)
        view.addSubview(workoutParametersView)
        view.addSubview(finishButton)
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    @objc private func addFinishButton() {
        if numberOfSet == workoutModel.workoutSets {
            dismiss(animated: true)
            RealmManager.shared.updateStatusWorkoutModel(model: workoutModel)
        } else {
            alertOkCancel(title: "Warning", message: "You haven't finished your workout") {
                self.dismiss(animated: true)
            }
        }
    }
    
    private func setWorkoutParameters() {
        workoutParametersView.workoutNameLabel.text = workoutModel.workoutName
        workoutParametersView.numberOfSetsLabel.text = "\(numberOfSet)/\(workoutModel.workoutSets)"
        workoutParametersView.numberOfRepsLabel.text = "\(workoutModel.workoutReps)"
    }
}
// MARK: - NextSetProtocol
extension RepsWorkoutViewController: NextSetProtocol {
    func nextSetTapped() {
        if numberOfSet < workoutModel.workoutSets {
            numberOfSet += 1
            workoutParametersView.numberOfSetsLabel.text = "\(numberOfSet)/\(workoutModel.workoutSets)"
        } else {
            alertOk(title: "Error", message: "Finish your workout")
        }
    }
    
    func editingTapped() {
        customAlert.alertCustom(viewController: self, repsOrTimer: "Reps") { [self] sets, reps in
            if sets != "" && reps != "" {
                workoutParametersView.numberOfSetsLabel.text = "\(numberOfSet)/\(sets)"
                workoutParametersView.numberOfRepsLabel.text = reps
                
                guard let numberOfSets = Int(sets),
                      let numberOfReps = Int(reps) else { return }
                
                RealmManager.shared.updateSetsRepsWorkoutModel(model: workoutModel,
                                                               sets: numberOfSets,
                                                               reps: numberOfReps)
            }
        }
    }
}

//MARK: - setConstraints

extension RepsWorkoutViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            startWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            startWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            closeButton.centerYAnchor.constraint(equalTo: startWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30)
        ])
        NSLayoutConstraint.activate([
            startWorkoutImage.topAnchor.constraint(equalTo: startWorkoutLabel.bottomAnchor, constant: 30),
            startWorkoutImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            detaildLabel.topAnchor.constraint(equalTo: startWorkoutImage.bottomAnchor, constant: 30),
            detaildLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        ])
        NSLayoutConstraint.activate([
            workoutParametersView.topAnchor.constraint(equalTo: detaildLabel.bottomAnchor, constant: 3),
            workoutParametersView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            workoutParametersView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            workoutParametersView.heightAnchor.constraint(equalToConstant: 270)
        ])
        NSLayoutConstraint.activate([
            finishButton.topAnchor.constraint(equalTo: workoutParametersView.bottomAnchor, constant: 30),
            finishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            finishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            finishButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
