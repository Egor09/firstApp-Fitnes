//
//  WeatherView.swift
//  FirstApp04.04_Process
//
//  Created by Сергей Горбачёв on 04.04.2022.
//

import UIKit

class WeatherView: UIView {

    private let headerLabelView: UILabel = {
        let header = UILabel()
        header.text = "Солнечно"
        header.textColor = .specialGray
        header.font  = .robotoMedium18()
        header.translatesAutoresizingMaskIntoConstraints = false
        header.adjustsFontSizeToFitWidth = true
        return header
    }()
    
    private let infoWeatherLabelView: UILabel = {
        let infoWeather = UILabel()
        infoWeather.text = "Хорошая погода, чтобы позаниматься на улице"
        infoWeather.translatesAutoresizingMaskIntoConstraints = false
        infoWeather.adjustsFontSizeToFitWidth = true
        infoWeather.numberOfLines = 20
        infoWeather.textColor = .specialGray
        infoWeather.font = .robotoMedium14()
        return infoWeather
    }()
    
    
    private let imageWeatherView: UIImageView = {
       let imageWeather = UIImageView()
        imageWeather.image = UIImage(named: "sunImage")
        imageWeather.translatesAutoresizingMaskIntoConstraints = false
        return imageWeather
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraint()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
      
        addSubview(headerLabelView)
        addSubview(infoWeatherLabelView)
        addSubview(imageWeatherView)
    }
    
    private func updateLabel(model: WeatherModel) {
        headerLabelView.text = model.weather[0].myDescription + " \(model.main.temperatureCelsius)°C"
        
        switch model.weather[0].weatherDescription {
        case "clear sky":
            infoWeatherLabelView.text = "Лучше остаться дома и провести домашнюю тренировку"
        default :
            infoWeatherLabelView.text = "No data"
        }
    }
    
    private func updateImage(data: Data) {
        guard let image = UIImage(data: data) else { return }
        imageWeatherView.image = image
    }
    
    public func setWeather(model: WeatherModel) {
        updateLabel(model: model)
    }
    
    public func setImage(data: Data) {
        updateImage(data: data)
    }
}

extension WeatherView {
    private func setConstraint() {
        NSLayoutConstraint.activate([
            headerLabelView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 11),
            headerLabelView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            headerLabelView.widthAnchor.constraint(equalToConstant: 80),
            headerLabelView.heightAnchor.constraint(equalToConstant: 21)
        ])
        
        NSLayoutConstraint.activate([
            infoWeatherLabelView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11),
            infoWeatherLabelView.topAnchor.constraint(equalTo: headerLabelView.bottomAnchor, constant: 5),
//            infoWeatherLabelView.widthAnchor.constraint(equalToConstant: 171),
            infoWeatherLabelView.heightAnchor.constraint(equalToConstant: 31)
        ])
        
        NSLayoutConstraint.activate([
            imageWeatherView.leadingAnchor.constraint(equalTo: infoWeatherLabelView.trailingAnchor, constant: 6),
            imageWeatherView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            imageWeatherView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            imageWeatherView.heightAnchor.constraint(equalToConstant: 62),
            imageWeatherView.widthAnchor.constraint(equalToConstant: 62)
            
        ])
    }
}
