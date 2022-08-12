//
//  StatisticsTableViewCell.swift
//  FirstApp04.04_Process
//
//  Created by Егор Филиппов on 13.04.2022.
//

//import UIKit
//
//class StatisticsTableViewCell: UITableViewCell {
//
//    private let statisticsBackgroundCell: UIView = {
//       let background = UIView()
//        background.backgroundColor = .none
//        background.translatesAutoresizingMaskIntoConstraints = false
//        return background
//    }()
//
//    private let nameLabel: UILabel = {
//       let nameLabel = UILabel()
//        nameLabel.text = "Biceps"
//        nameLabel.textColor = .specialBlack
//        nameLabel.font = .robotoMedium22()
//        nameLabel.translatesAutoresizingMaskIntoConstraints = false
//        return nameLabel
//    }()
//    private let beforeLabel: UILabel = {
//       let beforeLabel = UILabel()
//        beforeLabel.text = "Before: 20"
//        beforeLabel.textColor = .specialLightBrown
//        beforeLabel.font = .robotoMedium14()
//        beforeLabel.translatesAutoresizingMaskIntoConstraints = false
//        return beforeLabel
//    }()
//    private let nowLabel: UILabel = {
//       let nowLabel = UILabel()
//        nowLabel.text = "Now: 20"
//        nowLabel.textColor = .specialLightBrown
//        nowLabel.font = .robotoMedium14()
//        nowLabel.translatesAutoresizingMaskIntoConstraints = false
//        return nowLabel
//    }()
//    private let differenceLabel: UILabel = {
//       let progressLabel = UILabel()
//        progressLabel.text = "+2"
//        progressLabel.textColor = .specialGreen
//        progressLabel.font = .robotoMedium24()
//        progressLabel.translatesAutoresizingMaskIntoConstraints = false
//        return progressLabel
//    }()
//    private let lineLabel: UILabel = {
//       let lineLabel = UILabel()
//        lineLabel.backgroundColor = .specialLine
//        lineLabel.translatesAutoresizingMaskIntoConstraints = false
//        return lineLabel
//    }()
//
//
//
//    var labelViewCell = UIStackView()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        setupViews()
//        setConstraints()
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setupViews() {
//        addSubview(statisticsBackgroundCell)
//        addSubview(nameLabel)
//
//        labelViewCell = UIStackView(arrangedSubviews: [beforeLabel, nowLabel],
//                                    axis: .horizontal,
//                                    spacing: 10)
//        addSubview(labelViewCell)
//        addSubview(differenceLabel)
//        addSubview(lineLabel)
//
//    }
//    func cellConfigure(differenceWorkout: DifferenceWorkout) {
//        nameLabel.text = differenceWorkout.name
//        beforeLabel.text = "Before: \(differenceWorkout.firstReps)"
//        nowLabel.text = "Now: \(differenceWorkout.lastReps)"
//
//
//        let difference = differenceWorkout.lastReps - differenceWorkout.firstReps
//        differenceLabel.text = "\(difference)"
//
//        switch difference {
//        case ..<0: differenceLabel.textColor = .specialGreen
//        case 1...: differenceLabel.textColor = .specialDarkYellow
//        default: differenceLabel.textColor = .specialGray
//        }
//    }
//}
//
//extension StatisticsTableViewCell {
//
//    private func  setConstraints() {
//        NSLayoutConstraint.activate([
//            statisticsBackgroundCell.topAnchor.constraint(equalTo: topAnchor, constant: 10),
//            statisticsBackgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
//            statisticsBackgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
//            statisticsBackgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
//        ])
//        NSLayoutConstraint.activate([
//            nameLabel.topAnchor.constraint(equalTo: statisticsBackgroundCell.topAnchor, constant: 0),
//            nameLabel.leadingAnchor.constraint(equalTo: statisticsBackgroundCell.leadingAnchor, constant: 0)
//        ])
//        NSLayoutConstraint.activate([
//            labelViewCell.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0),
//            labelViewCell.leadingAnchor.constraint(equalTo: statisticsBackgroundCell.leadingAnchor, constant: 0),
//            labelViewCell.heightAnchor.constraint(equalToConstant: 20)
//        ])
//        NSLayoutConstraint.activate([
//            differenceLabel.centerYAnchor.constraint(equalTo: statisticsBackgroundCell.centerYAnchor),
//            differenceLabel.trailingAnchor.constraint(equalTo: statisticsBackgroundCell.trailingAnchor, constant: 0)
//        ])
//        NSLayoutConstraint.activate([
//            lineLabel.leadingAnchor.constraint(equalTo: statisticsBackgroundCell.leadingAnchor, constant: 0),
//            lineLabel.trailingAnchor.constraint(equalTo: statisticsBackgroundCell.trailingAnchor, constant: 0),
//            lineLabel.bottomAnchor.constraint(equalTo: statisticsBackgroundCell.bottomAnchor, constant: 0),
//            lineLabel.heightAnchor.constraint(equalToConstant: 1)
//        ])
//
//    }
//}
import UIKit

class StatisticTableViewCell: UITableViewCell {
    
    let differenceLabel: UILabel = {
        let label = UILabel()
        label.text = "+2"
        label.font = .robotoMedium24()
        label.textColor = .specialGreen
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Biceps"
        label.font = .robotoMedium24()
        label.textColor = .specialGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let beforeLabel = UILabel(text: "Before: 18")
    private let nowLabel = UILabel(text: "Now: 20")
    
    private var stackView = UIStackView()
    
    private let lineView: UIView = {
       let view = UIView()
        view.backgroundColor = .specialLine
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(differenceLabel)
        addSubview(nameLabel)
        
        stackView = UIStackView(arrangedSubviews: [beforeLabel, nowLabel],
                                axis: .horizontal,
                                spacing: 10)
        addSubview(stackView)
        addSubview(lineView)
    }
    
    func cellConfigure(differenceWorkout: DifferenceWorkout) {
        
        nameLabel.text = differenceWorkout.name
        beforeLabel.text = "Before: \(differenceWorkout.firstReps)"
        nowLabel.text = "Now: \(differenceWorkout.lastReps)"
        
        let difference = differenceWorkout.lastReps - differenceWorkout.firstReps
        differenceLabel.text = "\(difference)"
        
        switch difference {
        case ..<0: differenceLabel.textColor = .specialDarkYellow
        case 1...: differenceLabel.textColor = .specialGreen
        default: differenceLabel.textColor = .specialGray
        }
    }

    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            differenceLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            differenceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            differenceLabel.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameLabel.trailingAnchor.constraint(equalTo: differenceLabel.leadingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
