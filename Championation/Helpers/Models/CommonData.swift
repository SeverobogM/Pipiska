//
//  CommonData.swift
//  Ninja Football
//
//  Created by Ramazan Abdulaev on 16.11.2022.
//

import UIKit



enum Textes {
    
    static let score: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "score" : "очков"
    
    static let yourScore: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Your score" : "Ваш счет"
    
    static let tapToStart: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Tap to Start" : "Нажмите чтобы начать"
    
    static let goToMenu: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Go to menu" : "Вернуться в меню"
    
    static let startGame: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Start game" : "Начать игру"
    
    static let teams: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Teams" : "Команды"
    
    static let matches: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Matches" : "Матчи"
    
    static let pastMatches: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Past" : "Прошедшие"
    
    static let upcomingMatches: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Upcoming" : "Предстоящие"
    
    static let favorites: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Favorites" : "Избранное"
    
    static let players: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Players" : "Игроки"
    
    static let transfer: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Transfer" : "Трансфер"
    
    static let history: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "History" : "История"
    
    static let youWin: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "You win!\n+1333" : "Вы выйграли!\n+1333"
    static let youLoose: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "You loose!\n-1333" : "Вы проиграли!\n-1333"
    static let youWaitin: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Wait" : "Ожидание"
    
    static let statistic: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Statistic" : "Статистика"
    static let goals: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Goals" : "Голы"
    static let corners: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Corners" : "Угловые"
    static let attacks: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Attacks" : "Атаки"
    static let redCards: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Red cards" : "Красные карточки"
    static let yellowCards: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Yellow cards" : "Желтые карточки"
    
    static let foul: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Foul" : "Фол"
    static let points: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Points" : "Очки"
    static let freeThrows: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Free throws" : "Штрафные броски"
    static let freeThrowsP: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Free throws%" : "Штрафные броски%"
    
    static let club: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Club" : "Клуб"
    static let cost: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Cost" : "Стоимость"
    static let name: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Name" : "Имя"
    static let positon: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Positon" : "Позиция"
    static let growth: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Growth" : "Рост"
    static let weight: String = LocalizationSystem.sharedInstance.getLanguage() == "en" ? "Weight" : "Вес"
   
    static let rulesEn: String = "The player controls the football goal and must catch the ball - for every 10 balls caught the player receives 10 points and later the player can use these points on the betting screen as in-game currency, if the ball flies out of the field of play - the ball is not caught"
    
    static let rulesRu: String = "Игрок управляет футбольными воротами и должен поймать мяч - за каждые 10 пойманных мячей игрок получает 10 очков, и позже игрок может использовать эти очки на экране ставок в качестве внутриигровой валюты, если мяч вылетает за пределы игрового поля - мяч не пойман"
    
    static let details: String = """
    What is squash?
    
    Progenitors
    Similar in rules to tennis and badminton, squash is derived from "jeux de pomme" - an ancient ball game. One day in the mid-19th century, two students of the prestigious Harrow School in London stood with racquets, waiting for a fellow student, with whom they were going to play a game of J-ball. To avoid boredom, the young men decided to throw a leather ball against the school wall and hit it with rackets. That's how squash came into being.

    This new sport has its name after it began to use a soft and hollow inside a rubber ball, which literally squashed (in English "squashed") when hitting the wall.

    Own rules of the game
    In 1883, the first squash court appeared in Oxford, which was the starting point for the spread of squash as a sport. Its popularity began to grow after the publication of rules and harmonization of standards for the courts in 1911.

    The first national federation - Squash and Racquet Association - was established in England in 1928, and in 1930 tournaments were held British Open. Women joined this prestigious competition in 1950, when the sport entered the professional level.

    Squash spreads around the world

    The International Squash and Racquet Association was founded in 1967 and has seven members, including England and several Commonwealth countries such as Australia, Pakistan, India and South Africa. The World Squash Federation was formed in 1993, with 150 countries and over 18 million players worldwide.

    The French Squash Federation was split from the French Tennis Federation in 1980. Today it has 30,000 licensed members, a third of whom are women, and 250,000 players, as well as 206 affiliated clubs and 803 courts.

    World Championship competitors Gregory Gauthier (No. 1 in 2017) and Camille Serme (No. 5 in 2018) have put France at the top of the world rankings alongside Egypt, which currently dominates the world rankings.

    After three failed attempts, squash finally stands a good chance of becoming an Olympic sport at the 2024 Paris Games.

    On the squash court
    Although squash is usually played one-on-one, it can also be played in doubles on regular or special courts. You can also play in threes, alternating on the court: the first pair play one-on-one, then a third player joins in to compete against the winner of the first round. It's a great way to save energy and play against different opponents!

    Some pro tournaments are played in some of the most unlikely venues. The Al-Arham International Night Tournament is held in Cairo at the foot of the pyramids and the Tournament of Champions is staged at Grand Central Station Square in New York City. For this, a special glass-walled court is erected, so that spectators in the stands and on TV screens can watch the matches.

    Squash rules
    Players take turns hitting the ball, which must hit the front wall after a direct hit or a bounce off the floor. Matches may consist of three or five games of 11 points each. As in tennis, the ball may bounce off the floor only once before being hit with the racket, flying shots are allowed.

    The ball must be played in the space between the top line (4.57m high) and the tee line at the bottom of the front wall (48cm high). If the ball touches or goes beyond these lines, it enters the touch area.

    Which player serves the ball first is decided by a toss.

    After serving or striking the ball, a player must leave room for his opponent to return the kick. If a player stands too close to his opponent and prevents him from playing (not enough space to effectively and safely hit the ball with the racket) or if he is between the ball and the front wall (no man's land), the opponent has the right not to kick the ball.

    Let in squash
    A serve is replayed if an opponent unwittingly interferes without making it impossible to hit the ball. In disputed situations, the referee decides. If the referee is not on the court, the players decide the dispute by themselves, using the rules of courtesy.

    Stroke in squash
    This situation occurs when a player fails to hit the ball because an opponent accidentally or deliberately obstructs them from hitting the ball.

    The benefits of squash
    Squash is recognised as a great way to de-stress: it's an intense sport that's both fun and physically demanding. Play squash at an amateur level or compete and collect medals and wins!

    While playing, the athlete gets cardio exercise and trains the muscles to increase their endurance, speed and flexibility. This sport is energy-intensive, burns a lot of calories and is ideal for those who want to lose weight or tone all the muscles in the body.

    But it is not enough to be physically fit to play well. The key to winning a squash match is good strategy and extreme concentration, so players need to use their mental abilities as well.

    And of course, you can't forget about having fun on the court!

    Is squash suitable for you?
    Squash can be played by anyone from a three year old child to a pensioner.

    Squash is a safe and injury free sport, which keeps you fit, healthy, and flexible. It is particularly recommended for people who are looking for a way to cope with the stresses of everyday life. If you are looking for a sport that is physically demanding but also fun and strategically interesting, squash is for you!

    As with any sport, it's worth checking with your doctor before you begin and making sure you don't have any counter-indications (heart problems first and foremost).

    How do I choose my squash equipment?
    Racket

    Looking for a squash racquet to suit your needs?
    A little technical information will help you make the right choice.

    Weight
    Heavier aluminium racquets (145 to 170g) offer better hitting stability and better durability, which fits the needs of beginners. While lighter (110 to 145g) and more manoeuvrable graphite racquets allow more advanced players to serve curved balls, and meet their ball control and power needs.

    Balance
    The lighter the racquet's head, the easier it is to hit and the more maneuverable the racquet. At the same time, a racquet with a heavier head allows for more hitting power.

    Head size
    Open racquets or racquets with one-piece construction and a wide head give more power to the hitter, while racquets with a 'closed head' make for a neater and more accurate shot.

    Squash
    ball The squash ball has a diameter of 39.5 to 40.5 mm and weighs between 23 to 25 g. It consists of two halves and is made from hollow rubber. There are five different categories of squash balls (marked with coloured dots), each corresponding to a player's skill level.

    Two yellow dots: a slow, low-rebound ball, used by advanced and professional players.

    One yellow dot: also a rather slow, low rebound ball for advanced players.

    White dot: medium speed ball with medium bounce for intermediate players.

    Red dot: high speed and rebound ball for occasional players.

    Blue dot: A very fast ball with high rebound, ideal for beginners.

    Goggles for squash.
    Safety goggles are mandatory for training and competition when a player is under 19 years of age. Players over the age of 19 are not required to wear goggles, but it is highly recommended. The main hazard associated with playing squash is hitting the ball in the eye, so be careful and keep safety in mind!


    Good luck learning a new sport!
"""
    
}

class CommonData {
    
    static let shared = CommonData()
    
    private init() {}
    
    let categoryId = 164
    let sportId = 26
     
    let getTransferUrl: (() -> URL?) = {
        let str = "https://api.sofascore.com/api/v1/transfer?page=1&sort=transferDate"
        let url = URL(string: str)
        return url
    }
    
    let getPlayerImageUrl: ((String) -> URL?) = { id in
        let str = "https://api.sofascore.com/api/v1/player/\(id)/image"
        let url = URL(string: str)
        return url
    }
    
    let getTeamImageUrl: ((String) -> URL?) = { id in
        let str = "https://api.sofascore.com/api/v1/team/\(id)/image"
        let url = URL(string: str)
        return url
    }
    
    let getLeagueImageUrl: ((String) -> URL?) = { id in
        let str = "https://api.sofascore.com/api/v1/unique-tournament/\(id)/image"
        let url = URL(string: str)
        return url
    }
    
    let getPlayersUrl: ((String) -> URL?) = { id in
        let str = "https://api.sofascore.com/api/v1/team/\(id)/players"
        let url = URL(string: str)
        return url
    }
    
    let getStatisticUrl: ((String) -> URL?) = { id in
        let str = "https://api.sofascore.com/api/v1/event/\(id)/statistics"
        let url = URL(string: str)
        return url
    }
    
    func getDate(from timeStamp: Double, with format: String) -> String {
        let date = Date(timeIntervalSince1970: timeStamp)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
    
    func getBacgroundImage() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backgroundMain")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    func getRuLangImage() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(
            named: LocalizationSystem.sharedInstance.getLanguage() == "en" ? "ruLangSelected" : "ruLangUnselected"
        )
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    func getUsaLangImage() -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(
            named: LocalizationSystem.sharedInstance.getLanguage() == "en" ? "usaLangSelected" : "usaLangUnselected"
        )
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    

    
    func getTodayDate() -> Date {
        let now = Calendar.current.dateComponents(in: .current, from: Date())
        let today = DateComponents(year: now.year, month: now.month, day: now.day)
        let dateToday = Calendar.current.date(from: today)!
        return dateToday
    }
    
    func getTomorrowDate() -> Date {
        let now = Calendar.current.dateComponents(in: .current, from: Date())
        let tomorrow = DateComponents(year: now.year, month: now.month, day: now.day! + 1)
        let dateTomorrow = Calendar.current.date(from: tomorrow)!
        return dateTomorrow
    }
    
    func getYesterdayDate() -> Date {
        let now = Calendar.current.dateComponents(in: .current, from: Date())
        let tomorrow = DateComponents(year: now.year, month: now.month, day: now.day! - 1)
        let dateTomorrow = Calendar.current.date(from: tomorrow)!
        return dateTomorrow
    }
    
}
