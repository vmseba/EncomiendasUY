//
//  MisComprasController.swift
//  EncomiendasUy
//
//  Created by Sebastián Negreira on 31/12/14.
//  Copyright (c) 2014 Sebastián Negreira. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MisComprasController: UITableViewController {
    
    var misCompras : JSON = ""
    var arrCompras = [String]()
    var documento = ""
    var fecha = ""
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.misCompras["gxHiddens"]["nRC_Grd_guias"].intValue
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        switch (section) {
        case 0:
            title = "Compras"
            break;
        default:
            title = ""
            break;
        }
        return title
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        switch(indexPath.section) {
        case 0:
            cell = tableView.dequeueReusableCellWithIdentifier("celdaCompras", forIndexPath: indexPath) as UITableViewCell
            break;
        default:
            println("cagada...")
            break;
        }
        
        var items = split(self.arrCompras[indexPath.item]) {$0 == ","}
        var titulo = items[6].stringByReplacingOccurrencesOfString("\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        var subtitulo = items[2].stringByReplacingOccurrencesOfString("\"", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
        
        cell.textLabel?.text = "\(titulo)"
        cell.detailTextLabel?.text = "\(subtitulo)"
        return cell
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println(" mis compras, ci: \(documento) para el anio: \(fecha)")
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        let parameters = [
            "vCDOCUMEN": documento,
            "vANIO": fecha,
            "BUTTON1": "Confirmar",
            "GXState": "{\"vTODAY_MPAGE_Enabled\":\"0\",\"BOTONAYUDA_MPAGE_Bitmap\":\"Resources/btnAyudaNO.png\",\"BOTONAYUDA_MPAGE_Tooltiptext\":\"\",\"BOTONAYUDA_MPAGE_Enabled\":\"0\",\"CONCEPTO_MPAGE_Link\":\"mailto:infodna@concepto.com.uy\",\"LUCIA_MPAGE_Link\":\"/consultas.htm\",\"BOTONNOTIFICACION_MPAGE_Bitmap\":\"Resources/Transparente.png\",\"BOTONNOTIFICACION_MPAGE_Link\":\"\",\"vVMENSAJE_Enabled\":\"0\",\"_EventName\":\"EENTER.\",\"_EventGridId\":24,\"_EventRowId\":undefined,\"vVMENSAJE\":\"\",\"nRC_Grd_guias\":\"0\",\"nRC_Grd_peqenv\":\"0\",\"CGRUCAGECA\":\"\",\"CGNROMIC\":\"\",\"CGNROCONDN\":\"0\",\"CGNOMCSG\":\"\",\"CGLINEST\":\"\",\"CGCONCONSI\":\"\",\"CGFCHARR\":\"0\",\"RGDEPID\":\"\",\"CGTPOMIC\":\"\",\"CGTPOTRANS\":\"\",\"vCARGAR\":\"N\",\"GX_FocusControl\":\"vCDOCUMEN\",\"GX_AJAX_KEY\":\"C8D61DF33E10826B62C73BEE4278D716\",\"AJAX_SECURITY_TOKEN\":\"C5B7234EF48E8C135A4E90B6BCC2B185DBF58D043E75FDD9E87E593FEDEEB970\",\"GX_CMP_OBJS\":{},\"sCallerURL\":\"https://servicios.aduanas.gub.uy/LuciapubX/hwcantencpostales.aspx\",\"GX_CLI_NAV\":\"true\",\"GX_RES_PROVIDER\":\"GXResourceProvider.aspx\",\"GX_THEME\":\"LuciaX\",\"_MODE\":\"\",\"Mode\":\"\",\"IsModified\":\"1\"}"
            ] as [String: AnyObject]
        
        
        
        Alamofire.request(.POST, "https://servicios.aduanas.gub.uy/LuciapubX/hwcantencpostales.aspx?gxajaxEvt,gx-no-cache=1419964059938", parameters: parameters)
            .responseJSON { (request, response, data, error) in
                //println("req: \(request)")
                //println("--------------------------------------")
                //println("res:  \(response)")
                //println("--------------------------------------")
                //println("data:  \(data)")
                //println("--------------------------------------")
                //println("error \(error)")
                //let compras = JSON(data!)
                self.misCompras = JSON(data!)
                
                var comprasString = self.misCompras["gxHiddens"]["Grd_guiasContainerDataV"].stringValue
                
                comprasString = comprasString.stringByReplacingOccurrencesOfString("[", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
                
                self.arrCompras = split(comprasString) {$0 == "]"}
                
                dispatch_async(dispatch_get_main_queue(), {
                    UIApplication.sharedApplication().networkActivityIndicatorVisible = false
                    self.tableView.reloadData()
                })
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        println("preparando para segue detalle...")
        if let detalleCompras = segue.destinationViewController as? DetalleCompraController {
            var i = self.tableView.indexPathForSelectedRow()?.item
            var item = arrCompras[i!]
            detalleCompras.arrCompra = split(self.arrCompras[i!]) {$0 == ","}
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
