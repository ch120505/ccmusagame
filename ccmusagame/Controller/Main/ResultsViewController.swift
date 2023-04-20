//
//  ResultsViewController.swift
//  ccmusagame
//
//  Created by Carl Hsieh on 7/29/19.
//  Copyright © 2019 Carl Hsieh. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    
    let backgroundImageView = UIImageView()
    var name = ""
    var sname = ""
    var count = 0
    var idx = ""
    var ret = 0
    var all = 0
    var err = 0;
    var over = 0
    var total = 0
    var loop = 0
    var chkerr = 0
    var chkok = 0
    
    var chooseok = 0
    var chooseerr = 0
    var chooseover = 0
    var choosetotal = 0
    
    var yandnok = 0
    var yandnerr = 0
    var yandnover = 0
    var yandntotal = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backgroundImageView.image = UIImage(named: "Yandnbg")
        view.sendSubviewToBack(backgroundImageView)
        let title1chLabel = UILabel()
        title1chLabel.translatesAutoresizingMaskIntoConstraints = false
        title1chLabel.text = "選擇題"
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            title1chLabel.font =  UIFont(name: title1chLabel.font.fontName, size: 36)
        }
        else
        {
            if ScreenSize.SCREEN_MAX_LENGTH == 667.0
            {
                title1chLabel.font =  UIFont(name: title1chLabel.font.fontName, size: 18)
            }
            else
            {
                title1chLabel.font =  UIFont(name: title1chLabel.font.fontName, size: 26)
            }
        }
        title1chLabel.textAlignment = .center
        title1chLabel.textColor = .blue
        title1chLabel.backgroundColor = .clear
        view.addSubview(title1chLabel)
        
        let lmage1 = UIImage(named: "imag1")
        let ok1ImageView:UIImageView = UIImageView()
        ok1ImageView.translatesAutoresizingMaskIntoConstraints = false
        ok1ImageView.contentMode = UIView.ContentMode.scaleAspectFit
        ok1ImageView.frame.size.width = 40
        ok1ImageView.frame.size.height = 40
        ok1ImageView.backgroundColor = .clear
        ok1ImageView.image = lmage1
        view.addSubview(ok1ImageView)
        
        let lmage3 = UIImage(named: "imag3")
        let err1ImageView:UIImageView = UIImageView()
        err1ImageView.translatesAutoresizingMaskIntoConstraints = false
        err1ImageView.contentMode = UIView.ContentMode.scaleAspectFit
        err1ImageView.frame.size.width = 40
        err1ImageView.frame.size.height = 40
        err1ImageView.backgroundColor = .clear
        err1ImageView.image = lmage3
       view.addSubview(err1ImageView)
        
        let lmage2 = UIImage(named: "imag2")
        let wr1ImageView:UIImageView = UIImageView()
        wr1ImageView.translatesAutoresizingMaskIntoConstraints = false
        wr1ImageView.contentMode = UIView.ContentMode.scaleAspectFit
        wr1ImageView.frame.size.width = 40
        wr1ImageView.frame.size.height = 40
        wr1ImageView.backgroundColor = .clear
        wr1ImageView.image = lmage2
       view.addSubview(wr1ImageView)
        
        let ch1Label = UILabel()  // 
        ch1Label.translatesAutoresizingMaskIntoConstraints = false
        ch1Label.text = "全部答對經節:"
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            ch1Label.font =  UIFont(name:  ch1Label.font.fontName, size: 30)
        }
        else
        {
            if ScreenSize.SCREEN_MAX_LENGTH == 667.0
            {
                ch1Label.font =  UIFont(name:  ch1Label.font.fontName, size: 18)
            }
            else
            {
                ch1Label.font =  UIFont(name:  ch1Label.font.fontName, size: 26)
            }
        }
        ch1Label.textAlignment = .left
        ch1Label.backgroundColor = .clear
        view.addSubview(ch1Label)
        
        let ch2Label = UILabel()
        ch2Label.translatesAutoresizingMaskIntoConstraints = false
        ch2Label.text = "答錯經節:"
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            ch2Label.font =  UIFont(name:  ch2Label.font.fontName, size: 30)
        }
        else
        {
            if ScreenSize.SCREEN_MAX_LENGTH == 667.0
            {
                ch2Label.font =  UIFont(name:  ch2Label.font.fontName, size: 18)
            }
            else
            {
                ch2Label.font =  UIFont(name:  ch2Label.font.fontName, size: 26)
            }
        }
        ch2Label.textAlignment = .left
        ch2Label.backgroundColor = .clear
        view.addSubview(ch2Label)
        
        let ch3Label = UILabel()
        ch3Label.translatesAutoresizingMaskIntoConstraints = false
        ch3Label.text = "答錯太多經節:"
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            ch3Label.font =  UIFont(name:  ch3Label.font.fontName, size: 30)
        }
        else
        {
            if ScreenSize.SCREEN_MAX_LENGTH == 667.0
            {
                ch3Label.font =  UIFont(name:  ch3Label.font.fontName, size: 18)
            }
            else
            {
                ch3Label.font =  UIFont(name:  ch3Label.font.fontName, size: 26)
            }
        }
        ch3Label.textAlignment = .left
        ch3Label.backgroundColor = .clear
        view.addSubview(ch3Label)
        
        let ch4Label = UILabel()
        ch4Label.translatesAutoresizingMaskIntoConstraints = false
        ch4Label.text = "尚未完的經節::"
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            ch4Label.font =  UIFont(name:  ch4Label.font.fontName, size: 30)
        }
        else
        {
            if ScreenSize.SCREEN_MAX_LENGTH == 667.0
            {
                ch4Label.font =  UIFont(name:  ch4Label.font.fontName, size: 18)
            }
            else
            {
                ch4Label.font =  UIFont(name:  ch4Label.font.fontName, size: 26)
            }
        }
        ch4Label.textAlignment = .left
        ch4Label.backgroundColor = .clear
        view.addSubview(ch4Label)
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            NSLayoutConstraint.activate([
                title1chLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
                title1chLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:10),
                title1chLabel.heightAnchor.constraint(equalToConstant: 40),
                title1chLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10)
            ])
            
            NSLayoutConstraint.activate([
                ok1ImageView.topAnchor.constraint(equalTo: title1chLabel.topAnchor, constant: 50),
                ok1ImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:5),
                ok1ImageView.heightAnchor.constraint(equalToConstant: 40),
                ok1ImageView.widthAnchor.constraint(equalToConstant: 40),
                ok1ImageView.trailingAnchor.constraint(equalTo: ch1Label.leadingAnchor, constant: 10)
            ])
            
            NSLayoutConstraint.activate([
                ch1Label.topAnchor.constraint(equalTo: title1chLabel.topAnchor, constant: 50),
                ch1Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:100),
                ch1Label.heightAnchor.constraint(equalToConstant: 40),
                ch1Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 100)
            ])
            
            NSLayoutConstraint.activate([
                wr1ImageView.topAnchor.constraint(equalTo: ch1Label.topAnchor, constant: 50),
                wr1ImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:5),
                wr1ImageView.heightAnchor.constraint(equalToConstant: 40),
                wr1ImageView.widthAnchor.constraint(equalToConstant: 40),
                wr1ImageView.trailingAnchor.constraint(equalTo: ch2Label.leadingAnchor, constant: 10)
            ])
            
            NSLayoutConstraint.activate([
                ch2Label.topAnchor.constraint(equalTo: ch1Label.topAnchor, constant: 50),
                ch2Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:100),
                ch2Label.heightAnchor.constraint(equalToConstant: 40),
                ch2Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50)
            ])
            
            NSLayoutConstraint.activate([
                err1ImageView.topAnchor.constraint(equalTo: ch2Label.topAnchor, constant: 50),
                err1ImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:5),
                err1ImageView.heightAnchor.constraint(equalToConstant: 40),
                err1ImageView.widthAnchor.constraint(equalToConstant: 40),
                err1ImageView.trailingAnchor.constraint(equalTo: ch2Label.leadingAnchor, constant: 10)
            ])
            
            NSLayoutConstraint.activate([
                ch3Label.topAnchor.constraint(equalTo: ch2Label.topAnchor, constant: 50),
                ch3Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:100),
                ch3Label.heightAnchor.constraint(equalToConstant: 40),
                ch3Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50)
            ])
            
            NSLayoutConstraint.activate([
                ch4Label.topAnchor.constraint(equalTo: ch3Label.topAnchor, constant: 50),
                ch4Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:100),
                ch4Label.heightAnchor.constraint(equalToConstant: 40),
                ch4Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50)
            ])
            
        }
        else
        {
            if ScreenSize.SCREEN_MAX_LENGTH == 667.0
            {
                NSLayoutConstraint.activate([
                    title1chLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
                    title1chLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:10),
                    title1chLabel.heightAnchor.constraint(equalToConstant: 40),
                    title1chLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10)
                ])
            }
            else
            {
                NSLayoutConstraint.activate([
                    title1chLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
                    title1chLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:10),
                    title1chLabel.heightAnchor.constraint(equalToConstant: 40),
                    title1chLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10)
                ])
            }
            
            NSLayoutConstraint.activate([
                ok1ImageView.topAnchor.constraint(equalTo: title1chLabel.topAnchor, constant: 40),
                ok1ImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:5),
                ok1ImageView.heightAnchor.constraint(equalToConstant: 40),
                ok1ImageView.widthAnchor.constraint(equalToConstant: 40),
                ok1ImageView.trailingAnchor.constraint(equalTo: ch1Label.leadingAnchor, constant: 10)
            ])
            
            NSLayoutConstraint.activate([
                ch1Label.topAnchor.constraint(equalTo: title1chLabel.topAnchor, constant: 40),
                ch1Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:100),
                ch1Label.heightAnchor.constraint(equalToConstant: 40),
                ch1Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 100)
            ])
            
            NSLayoutConstraint.activate([
                wr1ImageView.topAnchor.constraint(equalTo: ch1Label.topAnchor, constant: 40),
                wr1ImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:5),
                wr1ImageView.heightAnchor.constraint(equalToConstant: 40),
                wr1ImageView.widthAnchor.constraint(equalToConstant: 40),
                wr1ImageView.trailingAnchor.constraint(equalTo: ch2Label.leadingAnchor, constant: 10)
            ])
            
            NSLayoutConstraint.activate([
                ch2Label.topAnchor.constraint(equalTo: ch1Label.topAnchor, constant: 40),
                ch2Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:100),
                ch2Label.heightAnchor.constraint(equalToConstant: 40),
                ch2Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50)
            ])
            
            NSLayoutConstraint.activate([
                err1ImageView.topAnchor.constraint(equalTo: ch2Label.topAnchor, constant: 40),
                err1ImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:5),
                err1ImageView.heightAnchor.constraint(equalToConstant: 40),
                err1ImageView.widthAnchor.constraint(equalToConstant: 40),
                err1ImageView.trailingAnchor.constraint(equalTo: ch2Label.leadingAnchor, constant: 10)
            ])
            
            NSLayoutConstraint.activate([
                ch3Label.topAnchor.constraint(equalTo: ch2Label.topAnchor, constant: 40),
                ch3Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:100),
                ch3Label.heightAnchor.constraint(equalToConstant: 40),
                ch3Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50)
            ])
            
            NSLayoutConstraint.activate([
                ch4Label.topAnchor.constraint(equalTo: ch3Label.topAnchor, constant: 40),
                ch4Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:100),
                ch4Label.heightAnchor.constraint(equalToConstant: 40),
                ch4Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50)
            ])
        }
        
        let titleyLabel = UILabel()
        titleyLabel.translatesAutoresizingMaskIntoConstraints = false
        titleyLabel.text = "是非題"
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            titleyLabel.font =  UIFont(name:   titleyLabel.font.fontName, size: 36)
        }
        else
        {
            if ScreenSize.SCREEN_MAX_LENGTH == 667.0
            {
                titleyLabel.font =  UIFont(name:   titleyLabel.font.fontName, size: 18)
            }
            else
            {
                titleyLabel.font =  UIFont(name:   titleyLabel.font.fontName, size: 26)
            }
        }
       
        titleyLabel.textColor = .blue
        titleyLabel.textAlignment = .center
        titleyLabel.backgroundColor = .clear
        view.addSubview(titleyLabel)
        
   
        let yok1ImageView:UIImageView = UIImageView()
        yok1ImageView.translatesAutoresizingMaskIntoConstraints = false
        yok1ImageView.contentMode = UIView.ContentMode.scaleAspectFit
        yok1ImageView.frame.size.width = 40
        yok1ImageView.frame.size.height = 40
        yok1ImageView.backgroundColor = .clear
        yok1ImageView.image = lmage1
        view.addSubview(yok1ImageView)
        
   
        let yerr2ImageView:UIImageView = UIImageView()
        yerr2ImageView.translatesAutoresizingMaskIntoConstraints = false
        yerr2ImageView.contentMode = UIView.ContentMode.scaleAspectFit
        yerr2ImageView.frame.size.width = 40
        yerr2ImageView.frame.size.height = 40
        yerr2ImageView.backgroundColor = .clear
        yerr2ImageView.image = lmage3
        view.addSubview(yerr2ImageView)
        
   
        let ywr2ImageView:UIImageView = UIImageView()
        ywr2ImageView.translatesAutoresizingMaskIntoConstraints = false
        ywr2ImageView.contentMode = UIView.ContentMode.scaleAspectFit
        ywr2ImageView.frame.size.width = 40
        ywr2ImageView.frame.size.height = 40
        ywr2ImageView.backgroundColor = .clear
        ywr2ImageView.image = lmage2
       view.addSubview(ywr2ImageView)
        
        let y1Label = UILabel()  //
        y1Label.translatesAutoresizingMaskIntoConstraints = false
        y1Label.text = "全部答對經節:"
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            y1Label.font =  UIFont(name:  y1Label.font.fontName, size: 30)
        }
        else
        {
            if ScreenSize.SCREEN_MAX_LENGTH == 667.0
            {
                y1Label.font =  UIFont(name:  y1Label.font.fontName, size: 18)
            }
            else
            {
                y1Label.font =  UIFont(name:  y1Label.font.fontName, size: 26)
            }
        }
        y1Label.textAlignment = .left
        y1Label.backgroundColor = .clear
        view.addSubview(y1Label)
        
        let y2Label = UILabel()
        y2Label.translatesAutoresizingMaskIntoConstraints = false
        y2Label.text = "答錯經節:"
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            y2Label.font =  UIFont(name:  y2Label.font.fontName, size: 30)
        }
        else
        {
            if ScreenSize.SCREEN_MAX_LENGTH == 667.0
            {
                y2Label.font =  UIFont(name:  y2Label.font.fontName, size: 18)
            }
            else
            {
                y2Label.font =  UIFont(name:  y2Label.font.fontName, size: 26)
            }
        }
        y2Label.textAlignment = .left
        y2Label.backgroundColor = .clear
        view.addSubview(y2Label)
        
        let y3Label = UILabel()
        y3Label.translatesAutoresizingMaskIntoConstraints = false
        y3Label.text = "答錯太多經節:"
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            y3Label.font =  UIFont(name:  y3Label.font.fontName, size: 30)
        }
        else
        {
            if ScreenSize.SCREEN_MAX_LENGTH == 667.0
            {
                y3Label.font =  UIFont(name:  y3Label.font.fontName, size: 18)
            }
            else
            {
                y3Label.font =  UIFont(name:  y3Label.font.fontName, size: 26)
            }
        }
        y3Label.textAlignment = .left
        y3Label.backgroundColor = .clear
        view.addSubview(y3Label)
        
        let y4Label = UILabel()
        y4Label.translatesAutoresizingMaskIntoConstraints = false
        y4Label.text = "尚未完的經節::"
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            y4Label.font =  UIFont(name:  y4Label.font.fontName, size: 30)
        }
        else
        {
            if ScreenSize.SCREEN_MAX_LENGTH == 667.0
            {
                y4Label.font =  UIFont(name:  y4Label.font.fontName, size: 18)
            }
            else
            {
                y4Label.font =  UIFont(name:  y4Label.font.fontName, size: 26)
            }
        }
        y4Label.textAlignment = .left
        y4Label.backgroundColor = .clear
        view.addSubview(y4Label)
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            NSLayoutConstraint.activate([
                titleyLabel.topAnchor.constraint(equalTo: ch4Label.topAnchor, constant: 50),
                titleyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:10),
                titleyLabel.heightAnchor.constraint(equalToConstant: 40),
                titleyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10)
            ])
            
            NSLayoutConstraint.activate([
                yok1ImageView.topAnchor.constraint(equalTo:  titleyLabel.topAnchor, constant: 50),
                yok1ImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:5),
                yok1ImageView.heightAnchor.constraint(equalToConstant: 40),
                yok1ImageView.widthAnchor.constraint(equalToConstant: 40),
                yok1ImageView.trailingAnchor.constraint(equalTo: y1Label.leadingAnchor, constant: 10)
            ])
            
            NSLayoutConstraint.activate([
                y1Label.topAnchor.constraint(equalTo: titleyLabel.topAnchor, constant: 50),
                y1Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:100),
                y1Label.heightAnchor.constraint(equalToConstant: 40),
                y1Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 100)
            ])
            
            NSLayoutConstraint.activate([
                ywr2ImageView.topAnchor.constraint(equalTo: y1Label.topAnchor, constant: 50),
                ywr2ImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:5),
                ywr2ImageView.heightAnchor.constraint(equalToConstant: 40),
                ywr2ImageView.widthAnchor.constraint(equalToConstant: 40),
                ywr2ImageView.trailingAnchor.constraint(equalTo: y2Label.leadingAnchor, constant: 10)
            ])
            
            NSLayoutConstraint.activate([
                y2Label.topAnchor.constraint(equalTo: y1Label.topAnchor, constant: 50),
                y2Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:100),
                y2Label.heightAnchor.constraint(equalToConstant: 40),
                y2Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50)
            ])
            
            NSLayoutConstraint.activate([
                yerr2ImageView.topAnchor.constraint(equalTo: y2Label.topAnchor, constant: 50),
                yerr2ImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:5),
                yerr2ImageView.heightAnchor.constraint(equalToConstant: 40),
                yerr2ImageView.widthAnchor.constraint(equalToConstant: 40),
                yerr2ImageView.trailingAnchor.constraint(equalTo: y2Label.leadingAnchor, constant: 10)
            ])
            
            NSLayoutConstraint.activate([
                y3Label.topAnchor.constraint(equalTo: y2Label.topAnchor, constant: 50),
                y3Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:100),
                y3Label.heightAnchor.constraint(equalToConstant: 40),
                y3Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50)
            ])
            
            NSLayoutConstraint.activate([
                y4Label.topAnchor.constraint(equalTo: y3Label.topAnchor, constant: 50),
                y4Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:100),
                y4Label.heightAnchor.constraint(equalToConstant: 40),
                y4Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50)
            ])
        }
        else
        {
            NSLayoutConstraint.activate([
                titleyLabel.topAnchor.constraint(equalTo: ch4Label.topAnchor, constant: 40),
                titleyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:10),
                titleyLabel.heightAnchor.constraint(equalToConstant: 40),
                titleyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10)
            ])
            
            NSLayoutConstraint.activate([
                yok1ImageView.topAnchor.constraint(equalTo:  titleyLabel.topAnchor, constant: 40),
                yok1ImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:5),
                yok1ImageView.heightAnchor.constraint(equalToConstant: 40),
                yok1ImageView.widthAnchor.constraint(equalToConstant: 40),
                yok1ImageView.trailingAnchor.constraint(equalTo: y1Label.leadingAnchor, constant: 10)
            ])
            
            NSLayoutConstraint.activate([
                y1Label.topAnchor.constraint(equalTo: titleyLabel.topAnchor, constant: 40),
                y1Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:100),
                y1Label.heightAnchor.constraint(equalToConstant: 40),
                y1Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 100)
            ])
            
            NSLayoutConstraint.activate([
                ywr2ImageView.topAnchor.constraint(equalTo: y1Label.topAnchor, constant: 40),
                ywr2ImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:5),
                ywr2ImageView.heightAnchor.constraint(equalToConstant: 40),
                ywr2ImageView.widthAnchor.constraint(equalToConstant: 40),
                ywr2ImageView.trailingAnchor.constraint(equalTo: y2Label.leadingAnchor, constant: 10)
            ])
            
            NSLayoutConstraint.activate([
                y2Label.topAnchor.constraint(equalTo: y1Label.topAnchor, constant: 40),
                y2Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:100),
                y2Label.heightAnchor.constraint(equalToConstant: 40),
                y2Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50)
            ])
            
            NSLayoutConstraint.activate([
                yerr2ImageView.topAnchor.constraint(equalTo: y2Label.topAnchor, constant: 40),
                yerr2ImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:5),
                yerr2ImageView.heightAnchor.constraint(equalToConstant: 40),
                yerr2ImageView.widthAnchor.constraint(equalToConstant: 40),
                yerr2ImageView.trailingAnchor.constraint(equalTo: y2Label.leadingAnchor, constant: 10)
            ])
            
            NSLayoutConstraint.activate([
                y3Label.topAnchor.constraint(equalTo: y2Label.topAnchor, constant: 40),
                y3Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:100),
                y3Label.heightAnchor.constraint(equalToConstant: 40),
                y3Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50)
            ])
            
            NSLayoutConstraint.activate([
                y4Label.topAnchor.constraint(equalTo: y3Label.topAnchor, constant: 40),
                y4Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:100),
                y4Label.heightAnchor.constraint(equalToConstant: 40),
                y4Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50)
            ])
        }
        
        let titleoLabel = UILabel()
        titleoLabel.translatesAutoresizingMaskIntoConstraints = false
        titleoLabel.text = "填空題"
       
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            titleoLabel.font =  UIFont(name: title1chLabel.font.fontName, size: 36)
        }
        else
        {
            if ScreenSize.SCREEN_MAX_LENGTH == 667.0
            {
                titleoLabel.font =  UIFont(name: title1chLabel.font.fontName, size: 18)
            }
            else
            {
                titleoLabel.font =  UIFont(name: title1chLabel.font.fontName, size: 26)
            }
        }
        titleoLabel.textColor = .blue
        titleoLabel.textAlignment = .center
        titleoLabel.backgroundColor = .clear
        view.addSubview(titleoLabel)
        
    
        let ook1ImageView:UIImageView = UIImageView()
        ook1ImageView.translatesAutoresizingMaskIntoConstraints = false
        ook1ImageView.contentMode = UIView.ContentMode.scaleAspectFit
        ook1ImageView.frame.size.width = 40
        ook1ImageView.frame.size.height = 40
        ook1ImageView.backgroundColor = .clear
        ook1ImageView.image = lmage1
        view.addSubview(ook1ImageView)
        
     
        let oerr2ImageView:UIImageView = UIImageView()
        oerr2ImageView.translatesAutoresizingMaskIntoConstraints = false
        oerr2ImageView.contentMode = UIView.ContentMode.scaleAspectFit
        oerr2ImageView.frame.size.width = 40
        oerr2ImageView.frame.size.height = 40
        oerr2ImageView.backgroundColor = .clear
        oerr2ImageView.image = lmage3
        view.addSubview(oerr2ImageView)
        
   
        let owr2ImageView:UIImageView = UIImageView()
        owr2ImageView.translatesAutoresizingMaskIntoConstraints = false
        owr2ImageView.contentMode = UIView.ContentMode.scaleAspectFit
        owr2ImageView.frame.size.width = 40
        owr2ImageView.frame.size.height = 40
        owr2ImageView.backgroundColor = .clear
        owr2ImageView.image = lmage2
       view.addSubview(owr2ImageView)
        
        let o1Label = UILabel()  //
        o1Label.translatesAutoresizingMaskIntoConstraints = false
        o1Label.text = "全部答對經節:"
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            o1Label.font =  UIFont(name:  o1Label.font.fontName, size: 30)
        }
        else
        {
            if ScreenSize.SCREEN_MAX_LENGTH == 667.0
            {
                o1Label.font =  UIFont(name:  o1Label.font.fontName, size: 18)
            }
            else
            {
                o1Label.font =  UIFont(name:  o1Label.font.fontName, size: 26)
            }
        }
        o1Label.textAlignment = .left
        o1Label.backgroundColor = .clear
        view.addSubview(o1Label)
        
        let o2Label = UILabel()
        o2Label.translatesAutoresizingMaskIntoConstraints = false
        o2Label.text = "答錯經節:"
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            o2Label.font =  UIFont(name:  o2Label.font.fontName, size: 30)
        }
        else
        {
            if ScreenSize.SCREEN_MAX_LENGTH == 667.0
            {
                o2Label.font =  UIFont(name:  o2Label.font.fontName, size: 18)
            }
            else
            {
                o2Label.font =  UIFont(name:  o2Label.font.fontName, size: 26)
            }
        }
        o2Label.textAlignment = .left
        o2Label.backgroundColor = .clear
        view.addSubview(o2Label)
        
        let o3Label = UILabel()
        o3Label.translatesAutoresizingMaskIntoConstraints = false
        o3Label.text = "答錯太多經節:"
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            o3Label.font =  UIFont(name:  o3Label.font.fontName, size: 30)
        }
        else
        {
            if ScreenSize.SCREEN_MAX_LENGTH == 667.0
            {
                o3Label.font =  UIFont(name:  o3Label.font.fontName, size: 18)
            }
            else
            {
                o3Label.font =  UIFont(name:  o3Label.font.fontName, size: 26)
            }
        }
        o3Label.textAlignment = .left
        o3Label.backgroundColor = .clear
        view.addSubview(o3Label)
        
        let o4Label = UILabel()
        o4Label.translatesAutoresizingMaskIntoConstraints = false
        o4Label.text = "尚未完的經節::"
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            o4Label.font =  UIFont(name:  o4Label.font.fontName, size: 30)
        }
        else
        {
            if ScreenSize.SCREEN_MAX_LENGTH == 667.0
            {
                o4Label.font =  UIFont(name:  o4Label.font.fontName, size: 18)
            }
            else
            {
                o4Label.font =  UIFont(name:  o4Label.font.fontName, size: 26)
            }
        }
        o4Label.textAlignment = .left
        o4Label.backgroundColor = .clear
        view.addSubview(o4Label)
        if UIDevice.current.userInterfaceIdiom == .pad
        {
            NSLayoutConstraint.activate([
                titleoLabel.topAnchor.constraint(equalTo: y4Label.topAnchor, constant: 50),
                titleoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:10),
                titleoLabel.heightAnchor.constraint(equalToConstant: 40),
                titleoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10)
            ])
            
            NSLayoutConstraint.activate([
                ook1ImageView.topAnchor.constraint(equalTo:  titleoLabel.topAnchor, constant: 50),
                ook1ImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:5),
                ook1ImageView.heightAnchor.constraint(equalToConstant: 40),
                ook1ImageView.widthAnchor.constraint(equalToConstant: 40),
                ook1ImageView.trailingAnchor.constraint(equalTo: o1Label.leadingAnchor, constant: 10)
            ])
            
            NSLayoutConstraint.activate([
                o1Label.topAnchor.constraint(equalTo: titleoLabel.topAnchor, constant: 50),
                o1Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:100),
                o1Label.heightAnchor.constraint(equalToConstant: 40),
                o1Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 100)
            ])
            
            NSLayoutConstraint.activate([
                owr2ImageView.topAnchor.constraint(equalTo: o1Label.topAnchor, constant: 50),
                owr2ImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:5),
                owr2ImageView.heightAnchor.constraint(equalToConstant: 40),
                owr2ImageView.widthAnchor.constraint(equalToConstant: 40),
                owr2ImageView.trailingAnchor.constraint(equalTo: o2Label.leadingAnchor, constant: 10)
            ])
            
            NSLayoutConstraint.activate([
                o2Label.topAnchor.constraint(equalTo: o1Label.topAnchor, constant: 50),
                o2Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:100),
                o2Label.heightAnchor.constraint(equalToConstant: 40),
                o2Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50)
            ])
            
            NSLayoutConstraint.activate([
                oerr2ImageView.topAnchor.constraint(equalTo: o2Label.topAnchor, constant: 50),
                oerr2ImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:5),
                oerr2ImageView.heightAnchor.constraint(equalToConstant: 40),
                oerr2ImageView.widthAnchor.constraint(equalToConstant: 40),
                oerr2ImageView.trailingAnchor.constraint(equalTo: o2Label.leadingAnchor, constant: 10)
            ])
            
            NSLayoutConstraint.activate([
                o3Label.topAnchor.constraint(equalTo: o2Label.topAnchor, constant: 50),
                o3Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:100),
                o3Label.heightAnchor.constraint(equalToConstant: 40),
                o3Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50)
            ])
            
            NSLayoutConstraint.activate([
                o4Label.topAnchor.constraint(equalTo: o3Label.topAnchor, constant: 50),
                o4Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:100),
                o4Label.heightAnchor.constraint(equalToConstant: 40),
                o4Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50)
            ])
        }
        else
        {
            NSLayoutConstraint.activate([
                titleoLabel.topAnchor.constraint(equalTo: y4Label.topAnchor, constant: 40),
                titleoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:10),
                titleoLabel.heightAnchor.constraint(equalToConstant: 40),
                titleoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10)
            ])
            
            NSLayoutConstraint.activate([
                ook1ImageView.topAnchor.constraint(equalTo:  titleoLabel.topAnchor, constant: 40),
                ook1ImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:5),
                ook1ImageView.heightAnchor.constraint(equalToConstant: 40),
                ook1ImageView.widthAnchor.constraint(equalToConstant: 40),
                ook1ImageView.trailingAnchor.constraint(equalTo: o1Label.leadingAnchor, constant: 10)
            ])
            
            NSLayoutConstraint.activate([
                o1Label.topAnchor.constraint(equalTo: titleoLabel.topAnchor, constant: 40),
                o1Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:100),
                o1Label.heightAnchor.constraint(equalToConstant: 40),
                o1Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 100)
            ])
            
            NSLayoutConstraint.activate([
                owr2ImageView.topAnchor.constraint(equalTo: o1Label.topAnchor, constant: 40),
                owr2ImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:5),
                owr2ImageView.heightAnchor.constraint(equalToConstant: 40),
                owr2ImageView.widthAnchor.constraint(equalToConstant: 40),
                owr2ImageView.trailingAnchor.constraint(equalTo: o2Label.leadingAnchor, constant: 10)
            ])
            
            NSLayoutConstraint.activate([
                o2Label.topAnchor.constraint(equalTo: o1Label.topAnchor, constant: 40),
                o2Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:100),
                o2Label.heightAnchor.constraint(equalToConstant: 40),
                o2Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50)
            ])
            
            NSLayoutConstraint.activate([
                oerr2ImageView.topAnchor.constraint(equalTo: o2Label.topAnchor, constant: 40),
                oerr2ImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:5),
                oerr2ImageView.heightAnchor.constraint(equalToConstant: 40),
                oerr2ImageView.widthAnchor.constraint(equalToConstant: 40),
                oerr2ImageView.trailingAnchor.constraint(equalTo: o2Label.leadingAnchor, constant: 10)
            ])
            
            NSLayoutConstraint.activate([
                o3Label.topAnchor.constraint(equalTo: o2Label.topAnchor, constant: 40),
                o3Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:100),
                o3Label.heightAnchor.constraint(equalToConstant: 40),
                o3Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50)
            ])
            
            NSLayoutConstraint.activate([
                o4Label.topAnchor.constraint(equalTo: o3Label.topAnchor, constant: 40),
                o4Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:100),
                o4Label.heightAnchor.constraint(equalToConstant: 40),
                o4Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 50)
            ])
        }
        
        
  
        // 選擇題
        for index in 0...29
        {
            name = "ce"
            sname = name + String(index) + ".txt"
       
            if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last
            {
                let file = documentsDirectory.appendingPathComponent(sname)
          
                do
                {
                  
                    let fileExists = try file.checkResourceIsReachable()
                    if fileExists
                    {
                        let text = try String(contentsOf: file, encoding: .utf8)
                        let lines = text.split(separator: "\n")
                        
                        for line in lines
                        {
                            if loop ==  0
                            {
                                chkerr = (line as NSString).integerValue
                                loop = 1
                            }
                            else
                            {
                                if loop == 1
                                {
                                    chkok = (line as NSString).integerValue
                              
                                    if chkerr > 3
                                    {
                                        chooseover  += 1
                                    }
                                    else
                                    {
                                        if chkok == 10
                                        {
                                            chooseok  += 1
                                            print("carl ok index \(index) ok \(chooseok)")
                                        }
                                        else
                                        {
                                            chooseerr  += 1
                                        }
                                    }
                                   
                                    loop = 0
                      
                                }
                            }
                        }
                    }
                }
                catch
                {
                    choosetotal += 1
                }
            }
        }
       
        // 是非題
        for index in 0...29
        {
            name = "ye"
            sname = name + String(index) + ".txt"
            if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last
            {
                let file = documentsDirectory.appendingPathComponent(sname)
          
                do
                {
                  
                    let fileExists = try file.checkResourceIsReachable()
                    if fileExists
                    {
                        let text = try String(contentsOf: file, encoding: .utf8)
                        let lines = text.split(separator: "\n")
                        
                        for line in lines
                        {
                            if loop ==  0
                            {
                                chkerr = (line as NSString).integerValue
                            //    print("Carl read \(sname) chkerr = \(chkerr)  idx  \(index)")
                                loop = 1
                            }
                            else
                            {
                                if loop == 1
                                {
                                    chkok = (line as NSString).integerValue
                              
                                    if chkerr > 3
                                    {
                                        yandnover  += 1
                                    }
                                    else
                                    {
                                        if chkok == 10
                                        {
                                            yandnok  += 1
                                        }
                                        else
                                        {
                                            yandnerr  += 1
                                        }
                                    }
                                   
                                    loop = 0
                      
                                }
                            }
                        }
                    }
                }
                catch
                {
                    yandntotal += 1
                }
            }
        }

        //  填空題
        for index in 0...399
        {
           
            name = "h"
            sname = name + String(index) + ".txt"
            if let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last
            {
                let file = documentsDirectory.appendingPathComponent(sname)
                do
                {
                  
                    let fileExists = try file.checkResourceIsReachable()
                    if fileExists
                    {
                        
                        let text = try String(contentsOf: file, encoding: .utf8)
                        ret = (text as NSString).integerValue
                        if ret == 1
                        {
                            all += 1
                        }
                        else
                        {
                            if ret == 2
                            {
                                err += 1
                            }
                            else
                            {
                                if ret == 3
                                {
                                    over += 1
                                }
                            }
                        }
                    }
                }
                catch
                {
                    total += 1
                }
            }
        }
        
        // 選擇題
        ch1Label.text = String("全部答對經節:")  + String(chooseok) + "次"
      
        ch2Label.text = String("答錯經節:")  + String(chooseerr) + "次"
      
        ch3Label.text = String("答錯太多經節:")  + String(chooseover) + "次"
     
        ch4Label.text = String("尚未完的經節:")   +   String(choosetotal) + "次"
        
       // 是非題
        y1Label.text = String("全部答對經節: ")  + String(yandnok) + "次"
       
        y2Label.text = String("答錯經節: ")  + String(yandnerr) + "次"
      
        y3Label.text = String("答錯太多經節:")  + String(yandnover) + "次"
     
        y4Label.text = String("尚未完的經節: ")  +  String(yandntotal) + "次"
  
       // 填空題
        o1Label.text = String("全部答對經節:  ") + String(all) + "次"
      
        o2Label.text = String("答錯經節: ")  + String(err) + "次"
     
        o3Label.text = String("答錯太多經節: ")  + String(over) + "次"
      
        o4Label.text = String("尚未完的經節:") + String(total) + "次"
      
    }
   
}
