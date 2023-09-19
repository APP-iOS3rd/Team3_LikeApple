//
//  ViewController.swift
//  random
//
//  Created by 노주영 on 2023/09/19.
//

import UIKit

class ViewController: UIViewController {

    let clickButton = UIButton()
    let clearButton = UIButton()
    let addButton = UIButton()
    let nameTextField1 = UITextField()
    let memberCountLabel = UILabel()
    let randomMember = UILabel()
    
    
    var saveArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.uiCreate()
    }
    
    //MARK: 버튼 메소드
    @objc func buttonClick(_ sender: UIButton){
        self.randomMember.text = "~"
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5){
            if self.saveArray.count != 0 {
                self.randomMember.text = "\(self.saveArray.randomElement()!)"
            } else {
                self.randomMember.text = "뽑을 인원이 없습니다"
            }
        }
    }
    
    @objc func buttonClear(_ sender: UIButton){
        self.saveArray.removeAll()
        self.memberCountLabel.text = "\(self.saveArray.count)명"
        self.nameTextField1.text = ""
    }
    
    @objc func buttonAdd(_ sender: UIButton){
        if self.nameTextField1.text != "" {
            self.saveArray.append(self.nameTextField1.text!)
            self.memberCountLabel.text = "\(self.saveArray.count)명"
            self.nameTextField1.text = ""
        }
    }
    
    //MARK: tap 제스쳐
    @objc func hideKeyboard(_ sender: Any){
        self.view.endEditing(true)
    }
    
    //MARK: 화면
    func uiCreate(){
        clickButton.translatesAutoresizingMaskIntoConstraints = false
        clickButton.backgroundColor = UIColor.systemGray5
        clickButton.setTitle("> 랜덤 뽑기 버튼 <", for: .normal)
        clickButton.setTitleColor(UIColor.black, for: .normal)
        clickButton.alpha = 0.7
        clickButton.layer.cornerRadius = 3
        clickButton.layer.borderWidth = 2
        clickButton.layer.borderColor = UIColor.systemGray.cgColor
        clickButton.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
        self.view.addSubview(clickButton)
        //위치
        clickButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        clickButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150).isActive = true
        //크기
        clickButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        clickButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        //1
        nameTextField1.translatesAutoresizingMaskIntoConstraints = false
        nameTextField1.backgroundColor = UIColor.systemGray5
        nameTextField1.placeholder = " ex) 노주영"
        nameTextField1.alpha = 0.7
        nameTextField1.layer.cornerRadius = 3
        nameTextField1.layer.borderWidth = 2
        nameTextField1.layer.borderColor = UIColor.systemGray.cgColor

        self.view.addSubview(nameTextField1)
        nameTextField1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        nameTextField1.topAnchor.constraint(equalTo: clickButton.bottomAnchor, constant: 70).isActive = true
        nameTextField1.widthAnchor.constraint(equalToConstant: 300).isActive = true
        nameTextField1.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
        //추가 버튼
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.backgroundColor = UIColor.systemGray5
        clearButton.setTitle("초기화", for: .normal)
        clearButton.setTitleColor(UIColor.black, for: .normal)
        clearButton.alpha = 0.7
        clearButton.layer.cornerRadius = 3
        clearButton.layer.borderWidth = 2
        clearButton.layer.borderColor = UIColor.systemGray.cgColor
        clearButton.addTarget(self, action: #selector(buttonClear(_:)), for: .touchUpInside)
        self.view.addSubview(clearButton)
        
        //위치
        clearButton.leadingAnchor.constraint(equalTo: self.nameTextField1.leadingAnchor).isActive = true
        clearButton.topAnchor.constraint(equalTo: self.nameTextField1.bottomAnchor, constant: 20).isActive = true
        //크기
        clearButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        clearButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //인원 수 레이블
        memberCountLabel.translatesAutoresizingMaskIntoConstraints = false
        memberCountLabel.backgroundColor = UIColor.systemGray5
        memberCountLabel.text = "\(self.saveArray.count)명"
        memberCountLabel.textColor = UIColor.black
        memberCountLabel.textAlignment = .center
        memberCountLabel.alpha = 0.7
        memberCountLabel.layer.cornerRadius = 3
        memberCountLabel.layer.borderWidth = 2
        memberCountLabel.layer.borderColor = UIColor.systemGray.cgColor
        self.view.addSubview(memberCountLabel)
        
        //위치
        memberCountLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        memberCountLabel.topAnchor.constraint(equalTo: self.nameTextField1.bottomAnchor, constant: 20).isActive = true
        //크기
        memberCountLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
        memberCountLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //추가 버튼
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.backgroundColor = UIColor.systemGray5
        addButton.setTitle("추가", for: .normal)
        addButton.setTitleColor(UIColor.black, for: .normal)
        addButton.alpha = 0.7
        addButton.layer.cornerRadius = 3
        addButton.layer.borderWidth = 2
        addButton.layer.borderColor = UIColor.systemGray.cgColor
        addButton.addTarget(self, action: #selector(buttonAdd(_:)), for: .touchUpInside)
        self.view.addSubview(addButton)
        
        //위치
        addButton.trailingAnchor.constraint(equalTo: self.nameTextField1.trailingAnchor).isActive = true
        addButton.topAnchor.constraint(equalTo: self.nameTextField1.bottomAnchor, constant: 20).isActive = true
        //크기
        addButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        addButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //랜덤으로 뽑은 맴버 레이블
        randomMember.translatesAutoresizingMaskIntoConstraints = false
        randomMember.backgroundColor = UIColor.systemGray5
        randomMember.text = "뽑아주세요"
        randomMember.textColor = UIColor.black
        randomMember.textAlignment = .center
        randomMember.alpha = 0.7
        randomMember.layer.cornerRadius = 3
        randomMember.layer.borderWidth = 2
        randomMember.layer.borderColor = UIColor.systemGray.cgColor
        self.view.addSubview(randomMember)
        //위치
        randomMember.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        randomMember.topAnchor.constraint(equalTo: self.addButton.bottomAnchor, constant: 70).isActive = true
        //크기
        randomMember.widthAnchor.constraint(equalToConstant: 300).isActive = true
        randomMember.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        //탭 제스처
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard(_:)))
               view.addGestureRecognizer(tapGesture)
    }
}

