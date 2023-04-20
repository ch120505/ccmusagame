//
//  NewGameViewController.swift
//  ccmusagame
//
//  Created by Carl Hsieh on 5/21/19.
//  Copyright © 2019 Carl Hsieh. All rights reserved.
//

import UIKit

class NewGameViewController: UIViewController
{
    
    @IBOutlet weak var Choose: UIButton!
    @IBOutlet weak var YandN: UIButton!
    @IBOutlet weak var VeryHardButton: UIButton!
    @IBOutlet weak var LoadLevelgif: UIImageView!
    let backgroundImageView = UIImageView()
 
    
    @IBAction func ActYandN(_ sender: Any)
    {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "YandN") as! YandNViewController
        self.navigationController? .pushViewController(controller, animated:true)
    }
    @IBAction func ActChoose(_ sender: Any)
    {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "Choose") as! ChooseViewController
        self.navigationController? .pushViewController(controller, animated:true)
    }
  
    @IBAction func ActVhard(_ sender: Any)
    {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "GTableViewController") as! GTableViewController
        self.navigationController? .pushViewController(controller, animated:true)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let hmGif = UIImage.gifImageWithName("newgames")
      
        let imageView = UIImageView(image: hmGif)
      
        
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            if ScreenSize.SCREEN_MAX_LENGTH ==  1366.0
            {
                imageView.frame = CGRect(x: 20.0, y: 350.0, width: self.view.frame.size.width - 40,
                                         height: 250.0)
            }
            else
            {
                imageView.frame = CGRect(x: 20.0, y: 250.0, width: self.view.frame.size.width - 40,
                                         height: 250.0)
            }
        }
        else
        {
            if ScreenSize.SCREEN_MAX_LENGTH == 926.0
            {
                imageView.frame = CGRect(x: 20.0, y: 200.0, width: self.view.frame.size.width - 40, height: 250.0)
            }
            else
            {
                imageView.frame = CGRect(x: 20.0, y: 100.0, width: self.view.frame.size.width - 40, height: 250.0)
            }
        }
        view.addSubview(imageView)
  
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.image = UIImage(named: "newgame")
        view.sendSubviewToBack(backgroundImageView)
        
        let yandnbtn = UIButton()
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            let  config = UIImage.SymbolConfiguration(
                pointSize: 40, weight: .medium, scale: .default)
            let image = UIImage(systemName: "multiply.circle.fill", withConfiguration: config)
            yandnbtn.setImage(image, for: .normal)
        }
        else
        {
            let  config = UIImage.SymbolConfiguration(
                pointSize: 20, weight: .medium, scale: .default)
            let image = UIImage(systemName: "multiply.circle.fill", withConfiguration: config)
            yandnbtn.setImage(image, for: .normal)
        }
        // 是非
        // multiply.circle.fill
        yandnbtn.setTitle("是非", for: .normal)
        
        yandnbtn.layer.cornerRadius = 12
        yandnbtn.backgroundColor = .clear
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            yandnbtn.titleLabel?.font = .systemFont(ofSize: 50, weight: .semibold)
        }
        else
        {
            yandnbtn.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        }
        yandnbtn.setTitleColor(.white, for: .normal)
        yandnbtn.addTarget(self, action: #selector(ActYandN(_:)), for: .touchUpInside)
        view.addSubview(yandnbtn)
        
        let choosebtn = UIButton()
        if UIDevice.current.userInterfaceIdiom == .pad
        {
           let  config = UIImage.SymbolConfiguration(
                pointSize: 40, weight: .medium, scale: .default)
            let image = UIImage(systemName: "list.bullet.circle.fill", withConfiguration: config)
            choosebtn.setImage(image, for: .normal)
        }
        else
        {
           let  config = UIImage.SymbolConfiguration(
                pointSize: 20, weight: .medium, scale: .default)
            let image = UIImage(systemName: "list.bullet.circle.fill", withConfiguration: config)
            choosebtn.setImage(image, for: .normal)
        }
        // 選擇
        // list.bullet.circle.fill
        
        choosebtn.layer.cornerRadius = 12
        choosebtn.backgroundColor = .clear
        choosebtn.setTitle("選擇", for: .normal)
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            choosebtn.titleLabel?.font = .systemFont(ofSize: 50, weight: .semibold)
        }
        else
        {
            choosebtn.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        }
        choosebtn.addTarget(self, action: #selector(ActChoose(_:)), for: .touchUpInside)
        view.addSubview(choosebtn)
        
        let orgbtn = UIButton()
       if UIDevice.current.userInterfaceIdiom == .pad
        {
           let  config = UIImage.SymbolConfiguration(
                pointSize: 40, weight: .medium, scale: .default)
            let image = UIImage(systemName: "square.and.pencil.circle.fill", withConfiguration: config)
            orgbtn.setImage(image, for: .normal)
        }
        else
        {
           let  config = UIImage.SymbolConfiguration(
                pointSize: 20, weight: .medium, scale: .default)
            let image = UIImage(systemName: "square.and.pencil.circle.fill", withConfiguration: config)
            orgbtn.setImage(image, for: .normal)
        }
       // 填空
        // square.and.pencil.circle.fill
        orgbtn.addTarget(self, action: #selector(ActVhard(_:)), for: .touchUpInside)
        orgbtn.layer.cornerRadius = 12
        orgbtn.backgroundColor = .clear
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            orgbtn.titleLabel?.font = .systemFont(ofSize: 50, weight: .semibold)
        }
        else
        {
            orgbtn.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        }
        orgbtn.setTitle("填空", for: .normal)
        view.addSubview(orgbtn)
        
        let  Buttons3 = UIStackView()
        Buttons3.alignment = .center
        Buttons3.spacing = 4
        Buttons3.axis = .horizontal
        Buttons3.distribution = .fillEqually
        Buttons3.alignment = .fill
        Buttons3.translatesAutoresizingMaskIntoConstraints = false
        Buttons3.addArrangedSubview(yandnbtn)
        Buttons3.addArrangedSubview(choosebtn)
        Buttons3.addArrangedSubview(orgbtn)
        view.addSubview( Buttons3)
     
        
         if UIDevice.current.userInterfaceIdiom == .pad
         {
             if ScreenSize.SCREEN_MAX_LENGTH == 1366.0
             {
                 Buttons3.heightAnchor.constraint(equalToConstant: 80).isActive = true
                 Buttons3.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 850).isActive = true
             }
             else
             {
                 if ScreenSize.SCREEN_MAX_LENGTH == 1024.0
                 {
                     Buttons3.heightAnchor.constraint(equalToConstant: 80).isActive = true
                     Buttons3.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 750).isActive = true
                 }
                 else
                 {
                     // 1133.0
                     // 1180.0
                     Buttons3.heightAnchor.constraint(equalToConstant: 80).isActive = true
                     Buttons3.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 800).isActive = true
                     
                 }
             }
          
         }
         else
         {
             
            if ScreenSize.SCREEN_MAX_LENGTH == 667.0
             {
               
                Buttons3.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 500).isActive = true
             }
             else
             {
                 if ScreenSize.SCREEN_MAX_LENGTH == 736.0  // iPhone 8 Plus
                 {
                     Buttons3.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 550).isActive = true
                  
                 }
                 else
                 {    // iPhone 11, 12, 14
                     Buttons3.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 650).isActive = true
                  
                 }
             }
             Buttons3.heightAnchor.constraint(equalToConstant: 60).isActive = true
         }
        Buttons3.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        Buttons3.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        Buttons3.translatesAutoresizingMaskIntoConstraints = false
        Buttons3.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true

    }
  
}
