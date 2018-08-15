//
//  ViewController.swift
//  CalendarView
//
//  Created by Paul Ortiz on 8/15/18.
//  Copyright © 2018 Paul Ortiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var calendarView: UICollectionView!
    let months = [["1","2","3","4","5","6","7","8","9","10","11","12","13",
                   "14","15","16","17","18","19","20","21","22","23","24",
                   "25","26","27","28","29","30"],
                  ["1","2","3","4","5","6","7","8","9","10","11","12","13",
                   "14","15","16","17","18","19","20","21","22","23","24",
                   "25","26","27","28","29","30"],
                  ["1","2","3","4","5","6","7","8","9","10","11","12","13",
                   "14","15","16","17","18","19","20","21","22","23","24",
                   "25","26","27","28","29","30"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        calendarView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        calendarView.delegate = self
        calendarView.dataSource = self
        calendarView.register(CalendarCell.self, forCellWithReuseIdentifier: "id")
        calendarView.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "header")
        calendarView.backgroundColor = .white
        view.addSubview(calendarView)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
        let label = UILabel()
        label.frame.size = CGSize(width: 200, height: 50)
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "Sample"
        return view
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 0, 0, 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.frame.size.width
        return CGSize(width: collectionViewWidth/7, height: 80)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return months.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return months[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell!
        let day = months[indexPath.section][indexPath.item]
        if let calendarCell = collectionView.dequeueReusableCell(withReuseIdentifier: "id", for: indexPath) as? CalendarCell {
            calendarCell.label.text = day
            calendarCell.layer.borderColor = UIColor.black.cgColor
            calendarCell.layer.borderWidth = 1
            cell = calendarCell
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
}

