//
//  DetalleCompraController.swift
//  EncomiendasUy
//
//  Created by Sebastián Negreira on 31/12/14.
//  Copyright (c) 2014 Sebastián Negreira. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DetalleCompraController : UITableViewController {
    
    @IBOutlet weak var labelNombreDestinatario: UILabel!
    
    @IBOutlet weak var labelConsignatario: UILabel!
    
    @IBOutlet weak var labelFecharribo: UILabel!
    
    @IBOutlet weak var labelManifiesto: UILabel!
    
    @IBOutlet weak var labelDeposito: UILabel!
    
    @IBOutlet weak var labelDNA: UILabel!
    
    @IBOutlet weak var labelEstado: UILabel!
    
    @IBOutlet weak var labelNombreCourier: UILabel!
    
    @IBOutlet weak var labelRut: UILabel!
    
    
    var arrCompra = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("estoy en detalle de compra...")
        labelNombreDestinatario.text = arrCompra[6].stringByReplacingOccurrencesOfString("\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        labelConsignatario.text = arrCompra[5].stringByReplacingOccurrencesOfString("\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        labelFecharribo.text = arrCompra[2].stringByReplacingOccurrencesOfString("\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        labelManifiesto.text = arrCompra[0].stringByReplacingOccurrencesOfString("\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        labelDeposito.text = arrCompra[1].stringByReplacingOccurrencesOfString("\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        labelDNA.text = arrCompra[3].stringByReplacingOccurrencesOfString("\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        labelEstado.text = arrCompra[4].stringByReplacingOccurrencesOfString("\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        labelNombreCourier.text = arrCompra[8].stringByReplacingOccurrencesOfString("\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        labelRut.text = arrCompra[7].stringByReplacingOccurrencesOfString("\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

