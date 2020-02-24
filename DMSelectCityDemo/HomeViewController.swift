//
//  HomeViewController.swift
//  DMSelectCityDemo
//
//  Created by Gamin on 2020/2/23.
//  Copyright © 2020 gamin.com. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var selectCityBut: UIButton!
    @IBOutlet weak var picIV: UIImageView!
    @IBOutlet weak var picBut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "首页";
        loadPictureAction(path: "https://dss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=657915244,3179044488&fm=26&gp=0.jpg");
    }

    @IBAction func tapCityListAction(_ sender: Any) {
        let cityList = CityListViewController();
        cityList.selectBlock = { [weak self] (selectModel: CityListModel) -> () in
            if (!selectModel.isEqual(nil)) {
                self?.selectCityBut.setTitle("选择了" + (selectModel.location ?? ""), for: .normal);
            }
        }
        navigationController?.pushViewController(cityList, animated: true);
    }
    
    func loadPictureAction(path: String) -> () {
        picIV.sd_setImage(with: URL(string: path), placeholderImage: UIImage(named: "lty1.jpg"), options: .retryFailed) { (image , error, _, _) in

        }
        
        picBut.sd_setImage(with: URL(string: path), for: .normal, placeholderImage: UIImage(named: "lty1.jpg"), options: .retryFailed) { (image, error, _, _) in
            
        }
    }
    
}
