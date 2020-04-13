/*:
 ![Post](post.png)
*/

/*:

 ## Основные компоненты

*/


// Объявите константу city и присвойте ей значение Воронеж

let city = "Воронеж"

// Объявите константу страна и присвойте ей значение Россия

let country = "Россия"

// Объявите переменную zipcode и присвойте ей значение 192168 в качестве строки, а не числа

var zipcode: String = "192168"

// Объявите константу firstName и в качестве значения используйте свое имя

let firstName = "Артемий"

// Объявите константу lastName и в качестве значения используйте свою фамилию

let lastName = "Шабанов"

// Объявите константу fullName, которая будет содержать полное имя на основе ранее созданных констант firstName и lastName

let fullName = firstName + " " + lastName

// Объявите константу temperature содержищию числовое значение температуры воздуха

let temperature: Int = 9

// Используя строковой литерал выведете в консоль сообщение о сегодняшней погоде
// Пример: Температура в городе Санкт-Петербург составит 10°
// Используйте объявленные ранее переменные city и temperature

print("Температура в городе \(city) составит \(temperature)°")

// Создайте массив cities и наполните его городами Воронеж, Москва, Новосибирск, Тверь, Владивосток

var cities = ["Воронеж", "Москва", "Новосибирск", "Тверь", "Владивосток", "Сочи"]

// Измените "Тверь" на "Киров"

cities[3] = "Киров"

// Выведите в консоль названия всех городов

print(cities)

// Создайте словарь temperatures, в котором ключом будет город, а значением температура

var temperatures = ["Воронеж": 9, "Москва": 10, "Новосибирск": 5, "Тверь": 6, "Владивосток": 7, "Киров": 11]

// Получите значение прогноза погоды в городе Киров

temperatures["Сочи"]

// Проитерируйте массив городов cities и выведите в консоль сообщение о погоде в каждом из городов

for city in cities {
    let cityTemperature = temperatures[city] ?? 0
    print("Температура в городе \(city) составит \(cityTemperature)°")
}

// Сделайте тоже самое, только не используя массив cities

for (cityName, cityTemperature) in temperatures {
    print("Температура в городе \(cityName) составит \(cityTemperature)°")
}

// Мы хотим хранить не только температуру, но и состояние погоды создайте словарь modernTemperatures,
// чтобы хранить он содержал не только погоду, но и состояние (ясно, облачно, дождь, гроза и снег)
// в качестве значения использовать кортеж (tuple)

let modernTemperatures = [
    "Воронеж": (9, "ясно"),
    "Москва": (10, "облачно"),
    "Новосибирск": (5, "дождь"),
    "Тверь": (6, "гроза"),
    "Владивосток": (7, "снег"),
    "Киров": (11, "ясно")
]

// Теперь отобразим более детальный прогноз погоды для каждого города
// Пример: Температура в городе Санкт-Петербург составит 10° (дождь)

for (cityName, weather) in modernTemperatures {
    print("Температура в городе \(cityName) составит \(weather.0)° \(weather.1)")
}

// Создайте функцию greet, которая приветствует вас

func greet() {
    print("👋 Привет")
}

// Вызовите эту функцию

greet()

// Добавьте функцию sum, которая принимает два аргумента типа Int и возвращает их сумму

func sum(_ a: Int, and b: Int) -> Int {
    return a + b
}

// С помощью данной функции вычислите сумму 5 и 9

print(sum(5, and: 9))

// Добавьте функцию div, которая принимает два аргумента типа Int и возвращает их частное если делитель равен 0, то возвращаем 0

func div(_ a: Int, and b: Int) -> Int {
    guard b != 0 else {
        return 0
    }
    return a / b
}

// С помощью данной функции вычислите: 1) 10 / 5 2) 5 / 9 3) 123 / 0

div(10, and: 5)
div(5, and: 9)
div(123, and: 0)
/*:

 ## Типы данных, структуры и дополнительные возможности

 */

// Создайте структуру SimpleWeather, которая будет описывать погоду и содержать свойства temperature типа Int и condition типа String

struct SimpleWeather {
    let temperature: Int
    let condition: String
}

// Попробуйте создайте экземпляр структуры

let weather1 = SimpleWeather(temperature: 9, condition: "ясно")

// Создайте класс SimpleCity для хранение информации о городе,
// пока только с названием (постоянное свойство name) и погодой (переменное свойство weather)

class SimpleCity {
    let name: String
    var weather: SimpleWeather?

    init(_ name: String) {
        self.name = name
    }
}

// Попробуйте создать экземаляр нашего класса

let x = SimpleCity("Воронеж")
x.weather = SimpleWeather(temperature: -40, condition: "холодно")

// Неудобно описывать состояние погоды в виде строки, поэтому создадим перечисление WeatherCondition
// и занесем туда значения: ясно, облачно, дождь, гроза и снег

enum WeatherCondition: String {
    case clear = "ясно"
    case cloudy = "облачно"
    case rain = "дождь"
    case thunderstorm = "гроза"
    case snow = "снег"
}

// Теперь, чтобы адаптировать ранее созданные класс и структуру под тип WeatherCondition нам нужно создать новые типы,
// давайте создадим структуру Weather и City, но уже с использованием WeatherCondition для храненения состояния

struct Weather {
    let temperature: Int
    let condition: WeatherCondition
}

class City {
    let name: String
    var weather: Weather?

    init(_ name: String) {
        self.name = name
    }
}

// Создайте массив городов newCities заполнять его явно не очень удачная затея, поэтому используйте для этого,
// словарь modernTemperatures, который мы использовали ранее если состояние не указано явно,
// то по-умолчанию используем WeatherCondition.clear

var newCities = [City]()
for (cityName, weather) in modernTemperatures {
    let city = City(cityName)
    let condition = WeatherCondition(rawValue: weather.1) ?? .clear
    let weather = Weather(temperature: weather.0, condition: condition)
    city.weather = weather
    newCities.append(city)
}

// Выведите прогноз погоды в уже знакомом нам формате, но с использованием newCities.
// Если отсутствует weather, то используем 0 или WeatherCondition.clear в зависимости от типа данных
// Пример: Температура в городе Санкт-Петербург составит 10° (дождь)

for city in newCities {
    let temperature = city.weather?.temperature ?? 0
    let condition = city.weather?.condition ?? WeatherCondition.clear
    print("Температура в городе \(city.name) составит \(temperature)° (\(condition.rawValue))")
}

// Согласитесь, что неправильно в случае отсутствия информации о погоде выводить какие-то значения по-умолчанию.
// Перепишите код выше, с использованием guard и в случае отсутствия информации о погоде выводите сообщение
// "Для города <город> погода неизвестна"

for city in newCities {
    guard let weather = city.weather else {
        print("Для города \(city.name) погода неизвестна")
        continue
    }
    print("Температура в городе \(city.name) составит \(weather.temperature)° (\(weather.condition))")
}

// Создайте расширение WeatherCondition для отображения состояния в виде emoji

extension WeatherCondition {

    var emoji: String {
        switch self {
        case .clear:
            return "☀️"
        case .cloudy:
            return "☁️"
        case .rain:
            return "☔️"
        case .thunderstorm:
            return "⚡️"
        case .snow:
            return "❄️"
        }
    }

}

// Выведите в консоль сводку с использованием emoji для описания состояния.
// Используйте метод расширения

for city in newCities {
    guard let weather = city.weather else {
        print("Для города \(city.name) погода неизвестна")
        continue
    }
    print("Температура в городе \(city.name) составит \(weather.temperature)° \(weather.condition.emoji)")
}

// Создайте протокол WeatherTrackable со свойстом weatherMessage

protocol WeatherTrackable {

    var weatherMessage: String { get }

}

// С помощью расширения реализуйте этот протокол классом City

extension City: WeatherTrackable {

    var weatherMessage: String {
        guard let weather = weather else {
            return "Для города \(name) погода неизвестна"
        }
        return "Температура в городе \(name) составит \(weather.temperature)° \(weather.condition.emoji)"
    }

}

// Выведите в консоль сводку с использованием emoji для описания состояния.
// Используйте свойства расширения

for city in newCities {
    print(city.weatherMessage)
}

/*:

 ## Функциональный тип

*/


// Создайте объект класса City и присвойте ему значение погоды

var vrn = City("Воронеж")
vrn.weather = Weather(temperature: 11, condition: .clear)

// Добавьте возможность ретранслировать сообщение о погоде

typealias Action = (String) -> String

func retranslate(for city: City, retranslation: Action) {
    print(city.weatherMessage)
    print(retranslation(city.weatherMessage))
}

retranslate(for: vrn, retranslation: { (message: String) in
    return message.uppercased()
})

// А теперь в одну строчку

retranslate(for: vrn) { $0.uppercased() }

// Создайте расширение класса City с методами, изменяющими в нем температуру и погодные условия

extension City {

    func change(temperature: Int) -> City {
        if let currentWeather = weather {
            weather = Weather(temperature: temperature, condition: currentWeather.condition)
        }
        return self
    }

    func change(condition: WeatherCondition) -> City {
        if let currentWeather = weather {
            weather = Weather(temperature: currentWeather.temperature, condition: condition)
        }
        return self
    }

}

// Запустите в городе дождь

vrn.change(condition: .rain)

// Сделайте температуру в городе ниже

vrn.change(temperature: 1)

// Измените температуру и погодные условия в городе, и распечатайте их
// Все в одну строчку

print(vrn.change(condition: .snow).change(temperature: -10).weatherMessage)

// Конец)
