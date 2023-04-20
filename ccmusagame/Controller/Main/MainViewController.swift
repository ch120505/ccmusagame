//
//  MainViewController.swift
//  ccmusagame
//
//  Created by Carl Hsieh on 5/21/19.
//  Copyright © 2019 Carl Hsieh. All rights reserved.
//

import UIKit

class GameName: NSObject
{
    //
    //
    //
    
    @IBAction func more_menu(_ sender: UIBarButtonItem)
    {
    }
    
    static let shared: GameName = GameName()
    var ename = "easy"
    var cename = "ceasy"
    var yename = "yeasy"
    
    var hname = "hard"
    var chname = "chard"
    var yhname = "yhard"
    
    var mname = "med"
    var cmname = "cmed"
    var ymname = "ymed"
    
    var cname = "data"
    var item = "item"
    var item1 = "item1"
    var item2 = "item2"
    var item3 = "item3"
 
    var num = 0
    var hnum = 0
    var mnum = 0
    
    var err = 0
    var over = 0
    var btnenable = false
    var anscount = 0 // 答對的數量
    var level = 0
    var ChooseLevel = 1
    var YandNlevel = 1
    var OrgLevel = 0
    var OrgMove = 0
    var Pagelevel = 0
    var minuties: Int  = 0
    var seconds: Int   = 0
    var fractions: Int = 0
    var ErrString = "您好棒啊！答對了"
    var width = 0
    var okans = 0
    var results = 0
    var error = 0
    var ok = 0
    var GameKind = 0
    var currentQuestion = 0
    var correctAnswers  = 0
    var numberOfQuestions = 10
    var item2count = 0;    // 空格數量
    var item2loop = 0
    var isLastQuestion = false
    var isTrue = true
    var isOk = true
    var skip = 0
    var current = 0
    var didselect = 0
    var saveArrayidx = 0
    var savefileidx = 0
    var saveerror = 0
    var myArray:[String] = []
    var myArrayInf:[String] = []
    var myArrayYandN:[String] = []
    var myArrayInfYandN:[String] = []
        
    var bibles = [Bible]()
}
struct State {
  let questions: [Question]
  let numberOfQuestions: Int
  var currentQuestion: Int
  var correctAnswers: Int
  
  init(questions: [Question]) {
    self.questions = questions
    numberOfQuestions = 9 // questions.count
    currentQuestion = 0
    correctAnswers = 0
  }
  
  var isLastQuestion: Bool {
      print("carl numberOfQuestions == current  = \(GameName.shared.numberOfQuestions)  \(GameName.shared.currentQuestion)")
    //  print("Carl GameName.shared.currentQuestion = \(GameName.shared.currentQuestion)")
    return(  GameName.shared.currentQuestion == GameName.shared.numberOfQuestions)
   // return currentQuestion == numberOfQuestions
  }
  
  var question: Question {
      GameName.shared.currentQuestion -= 1
    return questions[currentQuestion]
  }
}
struct Question {
  let title: String
  let isTrue: Bool
}
struct Answer {
    let text: String
    let correct: Bool  // true / false
}

var questions = [("耶穌出生在拿撒勒城。", true),
                 ("含、閃和雅弗是挪亞的三個兒子。", true),
                 ("摩西殺死一個埃及人後逃往米甸。", true),
                 ("在大馬士革的婚禮上，耶穌把水變成了酒。", false),
                 ("上帝派約拿去尼尼微。", true)
].map(Question.init)
//
//  JSON Information
//
struct Bible: Decodable
{
    enum kind: String, Decodable
    {
        case scene
        case sticker
    }
    let Num:String
    let Title: String
    let kind: kind
    let isTrue: Bool
    let Answer: String?
    let Select: String
    let Verse: String?
    let VerseNo: String?
}
struct ScreenSize
{
    static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}


class MainViewController: UIViewController {

    @IBOutlet weak var LoadGif: UIImageView!

    @IBAction func resultsbtn(_ sender: Any) {
        
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "ResCollectionController") as! ResultsViewController
        self.navigationController? .pushViewController(controller, animated:true)
    }
    
    @IBOutlet var helpbtn: UIButton!
    @IBOutlet var infobtn: UIButton!
    @IBOutlet var resultsbtn: UIButton!
    @IBAction func startgame(_ sender: Any)
    {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "StartGame") as! NewGameViewController
        self.navigationController? .pushViewController(controller, animated:true)
    }
    
    @IBAction func helpbtn(_ sender: Any)
    {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "About") as! AboutViewController
        self.navigationController? .pushViewController(controller, animated:true)
    }
    @IBAction func infobtn(_ sender: Any)
    {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "PageMain") as! PageViewController
        self.navigationController? .pushViewController(controller, animated:true)
    }
    @IBOutlet var playgame: UIButton!
  
    let backgroundImageView = UIImageView()
    
   
    lazy var gamebtn: UIButton =
    {
        let btn = UIButton()
    
        if UIDevice.current.userInterfaceIdiom == .pad
        {
             let  config = UIImage.SymbolConfiguration(
             pointSize: 40, weight: .medium, scale: .default)
             let image = UIImage(systemName: "gamecontroller.fill", withConfiguration: config)
            btn.setImage(image, for: .normal)
        }
       else
       {
           let  config = UIImage.SymbolConfiguration(
            pointSize: 20, weight: .medium, scale: .default)
           let image = UIImage(systemName: "gamecontroller.fill", withConfiguration: config)
           btn.setImage(image, for: .normal)
    }
    btn.layer.cornerRadius = 12
    btn.backgroundColor = .clear
    btn.setTitle("遊戲", for: .normal)
    if UIDevice.current.userInterfaceIdiom == .pad
    {
        btn.titleLabel?.font = .systemFont(ofSize: 50, weight: .semibold)
    }
    else
    {
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
    }
    btn.setTitleColor(.white, for: .normal)
    btn.addTarget(self, action: #selector(startgame(_:)), for: .touchUpInside)
    view.addSubview(btn)
    return btn
    }()
    
 
    lazy var infobutton: UIButton =
    {
        let btn = UIButton()
        if UIDevice.current.userInterfaceIdiom == .pad
        {
           let  config = UIImage.SymbolConfiguration(
            pointSize: 40, weight: .medium, scale: .default)
           let image = UIImage(systemName: "dpad.fill", withConfiguration: config)
           btn.setImage(image, for: .normal)
       }
       else
       {
            let  config = UIImage.SymbolConfiguration(
                  pointSize: 20, weight: .medium, scale: .default)
            let image = UIImage(systemName: "dpad.fill", withConfiguration: config)
            btn.setImage(image, for: .normal)
        }
      // btn.backgroundColor = UIColor.red
        btn.layer.cornerRadius = 12
        btn.backgroundColor = .clear
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(infobtn(_:)), for: .touchUpInside)
       view.addSubview(btn)
       return btn
    }()
    
    lazy var helpbutton: UIButton =
    {
        let btn = UIButton()
        if UIDevice.current.userInterfaceIdiom == .pad
        {
           let  config = UIImage.SymbolConfiguration(
            pointSize: 40, weight: .medium, scale: .default)
           let image = UIImage(systemName: "questionmark.circle.fill", withConfiguration: config)
           btn.setImage(image, for: .normal)
       }
       else
       {
            let  config = UIImage.SymbolConfiguration(
                  pointSize: 20, weight: .medium, scale: .default)
            let image = UIImage(systemName: "questionmark.circle.fill", withConfiguration: config)
            btn.setImage(image, for: .normal)
        }
      //  btn.backgroundColor = UIColor.red
        btn.layer.cornerRadius = 12
        btn.backgroundColor = .clear
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(helpbtn(_:)), for: .touchUpInside)
       view.addSubview(btn)
       return btn
    }()
    
    lazy var resultbutton: UIButton =
    {
        let btn = UIButton()
        if UIDevice.current.userInterfaceIdiom == .pad
        {
           let  config = UIImage.SymbolConfiguration(
            pointSize: 40, weight: .medium, scale: .default)
           let image = UIImage(systemName: "trophy.fill", withConfiguration: config)
           btn.setImage(image, for: .normal)
       }
       else
       {
            let  config = UIImage.SymbolConfiguration(
                  pointSize: 20, weight: .medium, scale: .default)
            let image = UIImage(systemName: "trophy.fill", withConfiguration: config)
            btn.setImage(image, for: .normal)
        }
   //     btn.backgroundColor = UIColor.red
        btn.layer.cornerRadius = 12
        btn.backgroundColor = .clear
        btn.setTitleColor(.black, for: .normal)
        btn.addTarget(self, action: #selector(resultsbtn(_:)), for: .touchUpInside)
        view.addSubview(btn)
        return btn
    }()
    lazy var Buttons3: UIStackView = {
      
      let stackView = UIStackView()
      stackView.alignment = .center
      stackView.spacing = 8
      stackView.axis = .horizontal
      stackView.distribution = .fillEqually
      stackView.alignment = .fill
      stackView.translatesAutoresizingMaskIntoConstraints = false
      
      stackView.addArrangedSubview(infobutton)
      stackView.addArrangedSubview(helpbutton)
      stackView.addArrangedSubview(resultbutton)
      view.addSubview(stackView)
      return stackView
    }()
    
    
    override func viewWillAppear(_ animated: Bool)
    {
    //    let screenSize: CGRect = UIScreen.main.bounds

   //     let screenWidth = screenSize.width
    //    let screenHeight = screenSize.height
       
//        print("carl ret Screen width = \(screenWidth), screen height = \(screenHeight)")
  //      SetScreenSize()
    
    }
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        // Get main screen bounds
   //     let screenSize: CGRect = UIScreen.main.bounds

  //      let screenWidth = screenSize.width
   //     let screenHeight = screenSize.height
        //
        // Screen width = 414.0, screen height = 736.0  iphone  8 plus
        // Screen width = 375.0, screen height = 667.0  iphone  8 6s
        // Screen width = 428.0, screen height = 926.0  iphone  14 plus
        
        // 1133.0 Ipad mini
        // 1180.0 iPad (10th gen)
        // 1366.0 iPad 12.9
        // 1024.0 iPad Pro (9.7 inch)
        
    //    print("carl Screen width = \(screenWidth), screen height = \(screenHeight)")
        
        SetScreenSize()
        
    }
    public func SetScreenSize()
    {
        let hmGif = UIImage.gifImageWithName("ezgif11123")
      
        let imageView = UIImageView(image: hmGif)
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            imageView.frame = CGRect(x: 20.0, y: 250.0, width: self.view.frame.size.width - 40, height: 250.0)
        }
        else
        {
            imageView.frame = CGRect(x: 20.0, y: 100.0, width: self.view.frame.size.width - 40, height: 250.0)
        }
        view.addSubview(imageView)
  
        gamebtn.translatesAutoresizingMaskIntoConstraints = false
        gamebtn.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        gamebtn.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true

        if UIDevice.current.userInterfaceIdiom == .pad
        {
            if ScreenSize.SCREEN_MAX_LENGTH == 1366.0
            {
                gamebtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 850).isActive = true
                gamebtn.heightAnchor.constraint(equalToConstant: 120).isActive = true
            }
        
            else
            {
                if ScreenSize.SCREEN_MAX_LENGTH == 1024.0
                {
                    gamebtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 550).isActive = true
                    gamebtn.heightAnchor.constraint(equalToConstant: 120).isActive = true
                }
                else
                {
                    gamebtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 650).isActive = true
                    gamebtn.heightAnchor.constraint(equalToConstant: 100).isActive = true
                }
            }
           
        }
        else
        {
            if ScreenSize.SCREEN_MAX_LENGTH == 667.0  // iPhone 6S
            {
                gamebtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 400).isActive = true
            }
            else
            {
                if ScreenSize.SCREEN_MAX_LENGTH == 736.0  // iPhone 8 Plus
                {
                    gamebtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 500).isActive = true
                  
                }
                else
                {
                    
                    gamebtn.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 550).isActive = true
                  
                }
            }
            gamebtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        }
   
       
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            Buttons3.topAnchor.constraint(equalTo: gamebtn.bottomAnchor, constant: 140).isActive = true
            Buttons3.heightAnchor.constraint(equalToConstant: 80).isActive = true
        }
        else
        {
            //
            //  iPhone 6,
            //
            Buttons3.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            Buttons3.topAnchor.constraint(equalTo: gamebtn.bottomAnchor, constant: 40).isActive = true
            /*
            if ScreenSize.SCREEN_MAX_LENGTH == 667.0
            {
               
                Buttons3.topAnchor.constraint(equalTo: gamebtn.bottomAnchor, constant: 40).isActive = true
            }
            else
            {
                if ScreenSize.SCREEN_MAX_LENGTH == 736.0  // iPhone 8 Plus
                {
                    
                    Buttons3.topAnchor.constraint(equalTo: gamebtn.bottomAnchor, constant: 10).isActive = true
                }
                else
                {
                    //
                    //  iPhone 11, 12, 13, 14
                    //
                  
                    Buttons3.topAnchor.constraint(equalTo: gamebtn.bottomAnchor, constant: 60).isActive = true
                   
                }
              
            } */
           // Buttons3.heightAnchor.constraint(equalToConstant: 60).isActive = true
        }

        Buttons3.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
       //  Buttons3.translatesAutoresizingMaskIntoConstraints = false
        Buttons3.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    
        setBackground()

    }
    private func setBackground()
    {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.image = UIImage(named: "Homepage")
        view.sendSubviewToBack(backgroundImageView)
      
        
    }
}


