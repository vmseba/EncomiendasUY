//
//  ConsultaController.swift
//  EncomiendasUy
//
//  Created by Sebastián Negreira on 31/12/14.
//  Copyright (c) 2014 Sebastián Negreira. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ConsultaController: UITableViewController {
    
    
    @IBOutlet weak var documento: UITextField!
    
    @IBOutlet weak var fecha: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func consultar(sender: AnyObject) {
        println("consultar mis compras, ci: \(documento.text) para el anio: \(fecha.text)")
        performSegueWithIdentifier("listadoCompras", sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("preparando para segue...")
        let listadoCompras = segue.destinationViewController as MisComprasController
        listadoCompras.documento = documento.text
        listadoCompras.fecha = fecha.text
        
    }
    
    
}


