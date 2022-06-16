//
//  City.swift
//  SwiftUI + UIKit
//
//  Created by Omega on 15.06.2022.
//

import Foundation

public enum City: CaseIterable {
    case kazan
    case moskow
    case saintP
    case novgorod
    case cheboksary
    case ekaterinburg
    case novosibirsk
    
    public var cityName: String {
        switch self {
        case .kazan:
            return "Казань"
        case .moskow:
            return "Москва"
        case .saintP:
            return "Санкт-Петербург"
        case .novgorod:
            return "Нижний Новгород"
        case .cheboksary:
            return "Чебоксары"
        case .ekaterinburg:
            return "Екатеринбург"
        case .novosibirsk:
            return "Новосибирск"
        }
    }
    
    public var coordinates: String {
        switch self {
        case .kazan:
            return "55.7887, 49.1221"
        case .moskow:
            return "55.4513, 37.3693"
        case .saintP:
            return "59.9386, 30.3141"
        case .novgorod:
            return "56.3286, 44.0020"
        case .cheboksary:
            return "56.1322, 47.2519"
        case .ekaterinburg:
            return "56.8519, 60.6122"
        case .novosibirsk:
            return "55.0415,  82.9346"
        }
    }
    
    public var cityImage: String {
        switch self {
        case .kazan:
            return "kazan"
        case .moskow:
            return "moskow"
        case .saintP:
            return "saint-p"
        case .novgorod:
            return "nizhniy-novgorod"
        case .cheboksary:
            return "cheboksary"
        case .ekaterinburg:
            return "ekaterinburg"
        case .novosibirsk:
            return "novosibirsk"
        }
    }
    
    public var cityDescription: String {
        switch self {
        case .kazan:
            return "Казань - город татар. Образован хз когда и хз кем. Сейчас третья столица России."
        case .moskow:
            return "Москва - не Россия. Живут там одни богачи, а половина работников - это удаленщики."
        case .saintP:
            return "В Питере пить. Еще и соль, море, ветер. Мерзкий город в целом."
        case .novgorod:
            return "А где Верхний? Город старый и грязный, если вы не купили жилье в центре по цене Московских аппартаментов."
        case .cheboksary:
            return "Эх, родные ЧЕБОКСАРЫ... Пиво и тракторы. Больше и сказать нечего."
        case .ekaterinburg:
            return "На границе Европы. Легенда кожаного мяча оттуда. Уральские горы - это нечто."
        case .novosibirsk:
            return "Откуда там 3 миллиона жителей? Промышленный северный город. Достаточно грязный, зато зарплаты хорошие."
        }
    }
    
    public var cityURL: String {
        switch self {
        case .kazan:
            return "https://yandex.ru/maps/43/kazan/?ll=49.108795%2C55.796289&z=12"
        case .moskow:
            return "https://yandex.ru/maps/geo/moskva/53166393/?ll=37.646930%2C55.725146&z=10.87"
        case .saintP:
            return "https://yandex.ru/maps/geo/sankt_peterburg/53152804/?ll=30.304908%2C59.917952&z=11.13"
        case .novgorod:
            return "https://yandex.ru/maps/geo/nizhniy_novgorod/53105078/?ll=43.833528%2C56.304645&z=11.81"
        case .cheboksary:
            return "https://yandex.ru/maps/geo/cheboksary/53104617/?ll=47.266880%2C56.104037&z=12.72"
        case .ekaterinburg:
            return "https://yandex.ru/maps/geo/yekaterinburg/53166537/?ll=60.475066%2C56.788751&z=11.09"
        case .novosibirsk:
            return "https://yandex.ru/maps/geo/novosibirsk/53118058/?ll=82.956043%2C55.002021&z=11.13"
        }
    }
}
