//
//  DetailViewController.swift
//  LondonLandmarks
//
//  Created by Halil Özel on 21.07.2019.
//  Copyright © 2019 Halil Özel. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailDescription: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var detailMapView: MKMapView!
    
    var sentData1 : String!
    var sentData2 : String!
    var sentData3 : String!
    var sentData4 : String!
    var sentData5 : String!
    var sentData6 : String!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.title = sentData1
        
        detailTitle.text = sentData1
        detailDescription.text = sentData2
        detailImage.image = UIImage(named: sentData3)
        detailTextView.text =  sentData4
        
        let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        let region = MKCoordinateRegion(center: CLLocationCoordinate2DMake(Double(sentData5)!, Double(sentData6)!), span: span)
        
        detailMapView.setRegion(region, animated: true)
        
        let pinLocation : CLLocationCoordinate2D = CLLocationCoordinate2DMake(Double(sentData5)!, Double(sentData6)!)
        
        let pinAnn = MKPointAnnotation()
        pinAnn.coordinate = pinLocation
        pinAnn.title = sentData1
        pinAnn.subtitle = sentData2
        
        self.detailMapView.addAnnotation(pinAnn)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func directions(_ sender: Any) {
        
        UIApplication.shared.open(URL(string: "http://maps.apple.com/maps?daddr=\(Double(sentData5)!),\(Double(sentData6)!)")!, options: [:], completionHandler: nil)
        
        
    }
    
}
