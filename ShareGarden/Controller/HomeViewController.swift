//
//  HomeViewController.swift
//  ShareGarden
//
//  Created by chaleroux on 27/01/2022.
//

import Foundation
import UIKit
import MapKit

class HomeViewController: UIViewController, MKMapViewDelegate {
 
    //MARK: Proprieties

    @IBOutlet weak var mainTableView: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var heightSizeConstant: NSLayoutConstraint!
    @IBOutlet weak var buttonToCenter: UIBarButtonItem!
    @IBOutlet var tableView: UITableView!
    
    let screenSize: CGFloat = UIScreen.main.bounds.height
    let paddingForMap: CGFloat = 24
    let mapCenter: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude:43.48, longitude: 1.36)
    let mapSpan: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 4.220029628061177, longitudeDelta: 8.239689658662229)
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        //On dit a la view: mapView que le delegue qui va recevoir les infornations del a vue est ViewController mais pour parler de l'instance de la classe ViewController on utilise self
        //voici deux exemple: le premier est faux car on fait appel a la classe directement et non a linstance de la classe (self)

        //mapView.delegate = ViewController
        mapView.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        
        mapView.translatesAutoresizingMaskIntoConstraints = false

        setupUI()
    }
    
    //MARK: Methods
    
    func setupUI() {
        
        let calculForSizedOfDevise: CGFloat = screenSize / 2.5
        
        mapView.frame.size.height = calculForSizedOfDevise
        heightSizeConstant.constant = calculForSizedOfDevise
        
        mapView.region.center  = mapCenter
        mapView.region.span =  mapSpan
        
        mainTableView.separatorColor = .black
        
    }
    
    //MARK: UITableViewDelegate
    

    
 
//
    
    
    //MARK: IBActions
    @IBAction func buttonToCenterTapped(_ sender: Any) {
        
        mapView.region.center  = mapCenter
        mapView.region.span = mapSpan
        
    }
}
    
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

    
extension HomeViewController: UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 10
    }
    
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
  
        cell.backgroundColor = .white
         
        return cell
        
    }
    
    
}
