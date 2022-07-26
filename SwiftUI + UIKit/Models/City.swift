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
    case yoshkarOla

    public var baseUrl: String {
        "https://yandex.ru/maps/"
    }

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
        case .yoshkarOla:
            return "Йошкар-Ола"
        }
    }

    public var latitude: Double {
        switch self {
        case .kazan:
            return 55.7887
        case .moskow:
            return 55.8555
        case .saintP:
            return 59.9386
        case .novgorod:
            return 56.3286
        case .cheboksary:
            return 56.1322
        case .ekaterinburg:
            return 56.8519
        case .novosibirsk:
            return 55.0415
        case .yoshkarOla:
            return 56.6019
        }
    }

    public var longitude: Double {
        switch self {
        case .kazan:
            return 49.1221
        case .moskow:
            return 37.543
        case .saintP:
            return 30.3141
        case .novgorod:
            return 44.0020
        case .cheboksary:
            return 47.2519
        case .ekaterinburg:
            return 60.6122
        case .novosibirsk:
            return 82.9346
        case .yoshkarOla:
            return 47.9526
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
        case .yoshkarOla:
            return "yoshkar-ola"
        }
    }

    var cityObjects: [Object] {
        switch self {
        case .kazan:
            return [
                .init(
                    id: 1,
                    objectIcon: "kazan-kul-sharif",
                    objectName: "Мечеть Кул-Шариф",
                    timeOfWork: "9:00 - 17:00",
                    objectDescription: Description.kulCharif.rawValue,
                    reachInfo: [
                        .init(id: 0, imagePath: "car", transportType: "Такси", transportVariables: "~300 P"),
                        .init(
                            id: 1,
                            imagePath: "bus",
                            transportType: "Автобус",
                            transportVariables: "Ост. «Батурина», № 22, 28, 28а, 89"
                        ),
                        .init(
                            id: 2,
                            imagePath: "underground",
                            transportType: "Метро",
                            transportVariables: "Ст. «Кремлевская»"
                        ),
                        .init(
                            id: 3,
                            imagePath: "trolleybus",
                            transportType: "Троллейбус",
                            transportVariables: "Ост. «Центральный стадион», № 2"
                        )
                    ]
                ),
                .init(
                    id: 2,
                    objectIcon: "kazan-cup",
                    objectName: "Загс Чаша",
                    timeOfWork: "9:00 - 16:00",
                    objectDescription: Description.chasha.rawValue,
                    reachInfo: [
                        .init(
                            id: 4,
                            imagePath: "bus",
                            transportType: "Автобус",
                            transportVariables: "№1, 6, 15, 22, 28, 29, 35, 37, 47, 74, 75, 89, 98, 117"
                        ),
                        .init(
                            id: 2,
                            imagePath: "underground",
                            transportType: "Метро",
                            transportVariables: "Ст. «Козья слобода»"
                        )
                    ]
                ),
                .init(
                    id: 3,
                    objectIcon: "kazan-kremlin",
                    objectName: "Казанский кремль",
                    timeOfWork: "8:00 - 18:00",
                    objectDescription: Description.kazanKremlin.rawValue,
                    reachInfo: [
                        .init(
                            id: 1,
                            imagePath: "bus",
                            transportType: "Автобус",
                            transportVariables: "Ост. «Батурина», № 22, 28, 28а, 89"
                        ),
                        .init(
                            id: 2,
                            imagePath: "underground",
                            transportType: "Метро",
                            transportVariables: "Ст. «Кремлевская»"
                        ),
                        .init(
                            id: 3,
                            imagePath: "trolleybus",
                            transportType: "Троллейбус",
                            transportVariables: "1, 4, 10, 17, 18"
                        )
                    ]
                )
            ]
        case .moskow:
            return [
                .init(
                    id: 4,
                    objectIcon: "moskow-kremlin",
                    objectName: "Московский Кремль",
                    timeOfWork: "9:00 - 17:00",
                    objectDescription: Description.moskowKremlin.rawValue,
                    reachInfo: [
                        .init(id: 0, imagePath: "car", transportType: "Такси", transportVariables: "~300 P"),
                        .init(
                            id: 1,
                            imagePath: "bus",
                            transportType: "Автобус",
                            transportVariables: "Ост. «Батурина», № 22, 28, 28а, 89"
                        ),
                        .init(
                            id: 2,
                            imagePath: "underground",
                            transportType: "Метро",
                            transportVariables: "Ст. «Кремлевская»"
                        ),
                        .init(
                            id: 3,
                            imagePath: "trolleybus",
                            transportType: "Троллейбус",
                            transportVariables: "Ост. «Центральный стадион», № 2"
                        )
                    ]
                ),
                .init(
                    id: 5,
                    objectIcon: "sobor-vasiliy",
                    objectName: "Собор Василия Блаженного",
                    timeOfWork: "9:00 - 16:00",
                    objectDescription: Description.vasiliy.rawValue,
                    reachInfo: [
                        .init(id: 0, imagePath: "car", transportType: "Такси", transportVariables: "~300 P"),
                        .init(
                            id: 1,
                            imagePath: "bus",
                            transportType: "Автобус",
                            transportVariables: "Ост. «Батурина», № 22, 28, 28а, 89"
                        ),
                        .init(
                            id: 2,
                            imagePath: "underground",
                            transportType: "Метро",
                            transportVariables: "Ст. «Кремлевская»"
                        ),
                        .init(
                            id: 3,
                            imagePath: "trolleybus",
                            transportType: "Троллейбус",
                            transportVariables: "Ост. «Центральный стадион», № 2"
                        )
                    ]
                ),
                .init(
                    id: 6,
                    objectIcon: "izmailovskiy-park",
                    objectName: "Измайловский парк",
                    timeOfWork: "24 часа",
                    objectDescription: Description.ismailovskiy.rawValue,
                    reachInfo: [
                        .init(id: 0, imagePath: "car", transportType: "Такси", transportVariables: "~300 P"),
                        .init(
                            id: 1,
                            imagePath: "bus",
                            transportType: "Автобус",
                            transportVariables: "Ост. «Батурина», № 22, 28, 28а, 89"
                        ),
                        .init(
                            id: 2,
                            imagePath: "underground",
                            transportType: "Метро",
                            transportVariables: "Ст. «Кремлевская»"
                        ),
                        .init(
                            id: 3,
                            imagePath: "trolleybus",
                            transportType: "Троллейбус",
                            transportVariables: "Ост. «Центральный стадион», № 2"
                        )
                    ]
                )
            ]
        case .saintP:
            return [
                .init(
                    id: 7,
                    objectIcon: "hermitage",
                    objectName: "Эрмитаж",
                    timeOfWork: "8:00 - 17:00",
                    objectDescription: Description.ermitage.rawValue,
                    reachInfo: [
                        .init(id: 0, imagePath: "car", transportType: "Такси", transportVariables: "~300 P"),
                        .init(
                            id: 1,
                            imagePath: "bus",
                            transportType: "Автобус",
                            transportVariables: "Ост. «Батурина», № 22, 28, 28а, 89"
                        ),
                        .init(
                            id: 2,
                            imagePath: "underground",
                            transportType: "Метро",
                            transportVariables: "Ст. «Кремлевская»"
                        ),
                        .init(
                            id: 3,
                            imagePath: "trolleybus",
                            transportType: "Троллейбус",
                            transportVariables: "Ост. «Центральный стадион», № 2"
                        )
                    ]
                ),
                .init(
                    id: 8,
                    objectIcon: "isaakievskiy",
                    objectName: "Исаакиевский собор",
                    timeOfWork: "6:00 - 20:00",
                    objectDescription: Description.isaakievskiy.rawValue,
                    reachInfo: [
                        .init(id: 0, imagePath: "car", transportType: "Такси", transportVariables: "~300 P"),
                        .init(
                            id: 1,
                            imagePath: "bus",
                            transportType: "Автобус",
                            transportVariables: "Ост. «Батурина», № 22, 28, 28а, 89"
                        ),
                        .init(
                            id: 2,
                            imagePath: "underground",
                            transportType: "Метро",
                            transportVariables: "Ст. «Кремлевская»"
                        ),
                        .init(
                            id: 3,
                            imagePath: "trolleybus",
                            transportType: "Троллейбус",
                            transportVariables: "Ост. «Центральный стадион», № 2"
                        )
                    ]
                ),
                .init(
                    id: 9,
                    objectIcon: "petropavlovskaya",
                    objectName: "Петропавловская крепость",
                    timeOfWork: "24 часа",
                    objectDescription: Description.petropavlovskaya.rawValue,
                    reachInfo: [
                        .init(id: 0, imagePath: "car", transportType: "Такси", transportVariables: "~300 P"),
                        .init(
                            id: 1,
                            imagePath: "bus",
                            transportType: "Автобус",
                            transportVariables: "Ост. «Батурина», № 22, 28, 28а, 89"
                        ),
                        .init(
                            id: 2,
                            imagePath: "underground",
                            transportType: "Метро",
                            transportVariables: "Ст. «Кремлевская»"
                        ),
                        .init(
                            id: 3,
                            imagePath: "trolleybus",
                            transportType: "Троллейбус",
                            transportVariables: "Ост. «Центральный стадион», № 2"
                        )
                    ]
                )
            ]
        case .novgorod:
            return [
                .init(
                    id: 10,
                    objectIcon: "nizhniy-kremlin",
                    objectName: "Нижегородский кремль",
                    timeOfWork: "8:00 - 17:00",
                    objectDescription: Description.nizhniyKremlin.rawValue,
                    reachInfo: [
                        .init(id: 0, imagePath: "car", transportType: "Такси", transportVariables: "~300 P"),
                        .init(
                            id: 1,
                            imagePath: "bus",
                            transportType: "Автобус",
                            transportVariables: "Ост. «Батурина», № 22, 28, 28а, 89"
                        ),
                        .init(
                            id: 2,
                            imagePath: "underground",
                            transportType: "Метро",
                            transportVariables: "Ст. «Кремлевская»"
                        ),
                        .init(
                            id: 3,
                            imagePath: "trolleybus",
                            transportType: "Троллейбус",
                            transportVariables: "Ост. «Центральный стадион», № 2"
                        )
                    ]
                ),
                .init(
                    id: 11,
                    objectIcon: "nizhniy-naberezhnaya",
                    objectName: "Набережная Федоровского",
                    timeOfWork: "24 часа",
                    objectDescription: Description.nizhniyNaberezhnaya.rawValue,
                    reachInfo: [
                        .init(id: 0, imagePath: "car", transportType: "Такси", transportVariables: "~300 P"),
                        .init(
                            id: 1,
                            imagePath: "bus",
                            transportType: "Автобус",
                            transportVariables: "Ост. «Батурина», № 22, 28, 28а, 89"
                        ),
                        .init(
                            id: 2,
                            imagePath: "underground",
                            transportType: "Метро",
                            transportVariables: "Ст. «Кремлевская»"
                        ),
                        .init(
                            id: 3,
                            imagePath: "trolleybus",
                            transportType: "Троллейбус",
                            transportVariables: "Ост. «Центральный стадион», № 2"
                        )
                    ]
                ),
                .init(
                    id: 12,
                    objectIcon: "nizhniy-lestnitsa",
                    objectName: "Чкаловская лестница",
                    timeOfWork: "24 часа",
                    objectDescription: Description.nizhniyLestnitsa.rawValue,
                    reachInfo: [
                        .init(id: 0, imagePath: "car", transportType: "Такси", transportVariables: "~300 P"),
                        .init(
                            id: 1,
                            imagePath: "bus",
                            transportType: "Автобус",
                            transportVariables: "Ост. «Батурина», № 22, 28, 28а, 89"
                        ),
                        .init(
                            id: 2,
                            imagePath: "underground",
                            transportType: "Метро",
                            transportVariables: "Ст. «Кремлевская»"
                        ),
                        .init(
                            id: 3,
                            imagePath: "trolleybus",
                            transportType: "Троллейбус",
                            transportVariables: "Ост. «Центральный стадион», № 2"
                        )
                    ]
                )
            ]
        case .cheboksary:
            return [.init(
                id: 13,
                objectIcon: "No",
                objectName: "No",
                timeOfWork: "No",
                objectDescription: "",
                reachInfo: [
                    .init(id: 0, imagePath: "car", transportType: "Такси", transportVariables: "~300 P"),
                    .init(
                        id: 1,
                        imagePath: "bus",
                        transportType: "Автобус",
                        transportVariables: "Ост. «Батурина», № 22, 28, 28а, 89"
                    ),
                    .init(
                        id: 2,
                        imagePath: "underground",
                        transportType: "Метро",
                        transportVariables: "Ст. «Кремлевская»"
                    ),
                    .init(
                        id: 3,
                        imagePath: "trolleybus",
                        transportType: "Троллейбус",
                        transportVariables: "Ост. «Центральный стадион», № 2"
                    )
                ]
            )]
        case .ekaterinburg:
            return [.init(
                id: 14,
                objectIcon: "No",
                objectName: "No",
                timeOfWork: "No",
                objectDescription: "",
                reachInfo: [
                    .init(id: 0, imagePath: "car", transportType: "Такси", transportVariables: "~300 P"),
                    .init(
                        id: 1,
                        imagePath: "bus",
                        transportType: "Автобус",
                        transportVariables: "Ост. «Батурина», № 22, 28, 28а, 89"
                    ),
                    .init(
                        id: 2,
                        imagePath: "underground",
                        transportType: "Метро",
                        transportVariables: "Ст. «Кремлевская»"
                    ),
                    .init(
                        id: 3,
                        imagePath: "trolleybus",
                        transportType: "Троллейбус",
                        transportVariables: "Ост. «Центральный стадион», № 2"
                    )
                ]
            )]
        case .novosibirsk:
            return [.init(
                id: 15,
                objectIcon: "No",
                objectName: "No",
                timeOfWork: "No",
                objectDescription: "",
                reachInfo: [
                    .init(id: 0, imagePath: "car", transportType: "Такси", transportVariables: "~300 P"),
                    .init(
                        id: 1,
                        imagePath: "bus",
                        transportType: "Автобус",
                        transportVariables: "Ост. «Батурина», № 22, 28, 28а, 89"
                    ),
                    .init(
                        id: 2,
                        imagePath: "underground",
                        transportType: "Метро",
                        transportVariables: "Ст. «Кремлевская»"
                    ),
                    .init(
                        id: 3,
                        imagePath: "trolleybus",
                        transportType: "Троллейбус",
                        transportVariables: "Ост. «Центральный стадион», № 2"
                    )
                ]
            )]
        case .yoshkarOla:
            return [.init(
                id: 16,
                objectIcon: "No",
                objectName: "No",
                timeOfWork: "No",
                objectDescription: "",
                reachInfo: [
                    .init(id: 0, imagePath: "car", transportType: "Такси", transportVariables: "~300 P"),
                    .init(
                        id: 1,
                        imagePath: "bus",
                        transportType: "Автобус",
                        transportVariables: "Ост. «Батурина», № 22, 28, 28а, 89"
                    ),
                    .init(
                        id: 2,
                        imagePath: "underground",
                        transportType: "Метро",
                        transportVariables: "Ст. «Кремлевская»"
                    ),
                    .init(
                        id: 3,
                        imagePath: "trolleybus",
                        transportType: "Троллейбус",
                        transportVariables: "Ост. «Центральный стадион», № 2"
                    )
                ]
            )]
        }
    }

    public var cityURL: String {
        switch self {
        case .kazan:
            return baseUrl + "43/kazan/?ll=49.108795%2C55.796289&z=12"
        case .moskow:
            return baseUrl + "geo/moskva/53166393/?ll=37.646930%2C55.725146&z=10.87"
        case .saintP:
            return baseUrl + "geo/sankt_peterburg/53152804/?ll=30.304908%2C59.917952&z=11.13"
        case .novgorod:
            return baseUrl + "geo/nizhniy_novgorod/53105078/?ll=43.833528%2C56.304645&z=11.81"
        case .cheboksary:
            return baseUrl + "geo/cheboksary/53104617/?ll=47.266880%2C56.104037&z=12.72"
        case .ekaterinburg:
            return baseUrl + "geo/yekaterinburg/53166537/?ll=60.475066%2C56.788751&z=11.09"
        case .novosibirsk:
            return baseUrl + "geo/novosibirsk/53118058/?ll=82.956043%2C55.002021&z=11.13"
        case .yoshkarOla:
            return baseUrl + "41/yoshkar-ola/?ll=47.842594%2C56.645599&z=15"
        }
    }
}
