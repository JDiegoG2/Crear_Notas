//
//  HomeViewController.swift
//  lista de notas
//
//  Created by Diego Gatica Arevalo on 1/07/22.
//

import UIKit

var notas = [String]()

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    // Añadiendo Notas
    @IBAction func agregarNota(sender: AnyObject){
       //Creamos el UIAlertController
       let alerta = UIAlertController(title: "Nueva Tarea",
         message: "Añade una nueva tarea",
         preferredStyle: .alert)

       let guardarNota = UIAlertAction(title: "Guardar",
         style: .default,
         handler: { (action:UIAlertAction) -> Void in

           //Guarda el texto en array notas y recarga el tableView
           let textField = alerta.textFields!.first
           notas.append(textField!.text!)
           self.tableView.reloadData()
       })


       let cancelarAccion = UIAlertAction(title: "Cancelar",
         style: .default) { (action: UIAlertAction) -> Void in
       }

       //Añadimos el TextField al UIAlertController
       alerta.addTextField {
         (textField: UITextField) -> Void in
       }

       //Añadimos las dos UIAlertAction que hemos creado al UIAlertController
       alerta.addAction(guardarNota)
       alerta.addAction(cancelarAccion)

     //Lanzamos el UIAlertController
     present(alerta,
       animated: true,
       completion: nil)
     }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "listaNotaCell")


    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notas.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listaNotaCell")
        cell!.textLabel?.text = notas[indexPath.row]
        return cell!
    }


}
