//
//  RecordViewController.swift
//  C#
//
//  Created by Henrique de Abreu Amitay on 16/07/15.
//  Copyright (c) 2015 Kevin Ferreira Silva. All rights reserved.
//

import UIKit
import Darwin


class RecordViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, LoadViewControllerDelegate{
    
    //CollectionViewController
    @IBOutlet weak var collectionManager: UICollectionView!

    //Cell data
    var tableData: [String]? = []
    
    var cellArray: [CollectionViewCell] = []
    
    var notas: [Nota]? = []

    //Piano keys
    @IBOutlet weak var C2key: PianoKey?
    @IBOutlet weak var C2akey: PianoKey?
    @IBOutlet weak var D2key: PianoKey?
    @IBOutlet weak var D2akey: PianoKey?
    @IBOutlet weak var E2key: PianoKey?
    @IBOutlet weak var F2key: PianoKey?
    @IBOutlet weak var F2akey: PianoKey?
    @IBOutlet weak var G2key: PianoKey?
    @IBOutlet weak var A2key: PianoKey?
    @IBOutlet weak var A2akey: PianoKey?
    @IBOutlet weak var B2key: PianoKey?
    @IBOutlet weak var G2akey: PianoKey?
    
    //Note count
    var noteCount : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionManager.reloadData()
        self.collectionManager.dataSource = self
        self.collectionManager.delegate = self
//        self.collectionManager.backgroundColor = UIColor(patternImage: UIImage(named: "sheet")!)
        
        //Start the engine and the Piano
        PianoAudioController.sharedInstance.startEngine()
        setKeys()
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        let insets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return insets
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return CGFloat(0)
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return CGFloat(0)
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let size = CGSize(width: 51, height: 150)
        return size
    }
    
    
    func setKeys()
    {
        //Seta os sons de cada tecla
        self.C2key!.setKeyNote(0)
        self.C2akey!.setKeyNote(1)
        self.D2key!.setKeyNote(2)
        self.D2akey!.setKeyNote(3)
        self.E2key!.setKeyNote(4)
        self.F2key!.setKeyNote(5)
        self.F2akey!.setKeyNote(6)
        self.G2key!.setKeyNote(7)
        self.G2akey!.setKeyNote(8)
        self.A2key!.setKeyNote(9)
        self.A2akey!.setKeyNote(10)
        self.B2key!.setKeyNote(11)
        
        //Linka as teclas com as views
        C2key?.outerView = self
        C2akey?.outerView = self
        D2key?.outerView = self
        D2akey?.outerView = self
        E2key?.outerView = self
        F2key?.outerView = self
        F2akey?.outerView = self
        G2key?.outerView = self
        G2akey?.outerView = self
        A2key?.outerView = self
        A2akey?.outerView = self
        B2key?.outerView = self

    }
    
    func addNote(nota : Int, duracao: Float)
    {
//        NSLog("\(nota)")
        //Com base no tempo que o usuario apertou a nota, selecionamos a imagem que sera adicionada na partitura
        var simboloDuracao: String
        
        //Persistencia de dados
        var note:Nota = Nota()
        note.simbolo = nota
        note.som = nota
        note.tempo = duracao*1000 //Saves time in milliseconds (duracao is in seconds)
        notas!.append(note)
        
        //A duracao nos da qual nota escolher
        //TO DO: Mudar apos a challenge para que fique conceitualmente correto
        //TO DO: Implementar conjuncao com a classe Nota, para que fique mais simples
        if(duracao <= 0.5)
        {
            note.simbolo = 13
            simboloDuracao = "colcheia"
        }
        else{
            if(duracao <= 1.5)
            {
                note.simbolo = 14
                simboloDuracao = "seminima"
            }
            else{
                if(duracao <= 2.5)
                {
                    note.simbolo = 15
                    simboloDuracao = "semibreve"
                }
                else
                {
                    note.simbolo = 15
                    simboloDuracao = "breve"
                }
            }
        }

        //Adiciona a nota ao tableData (vetor de notas) e recarrega a view
        tableData?.append(simboloDuracao)
        self.collectionManager.reloadData()
        var item = collectionView(collectionManager, numberOfItemsInSection: 0) - 1
        var lastItemIndex = NSIndexPath(forItem: item, inSection: 0)
        self.collectionManager?.scrollToItemAtIndexPath(lastItemIndex, atScrollPosition: UICollectionViewScrollPosition.Top, animated: false)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let qtty = notas?.count
        {
            return qtty
        }
        else
        {
            return 0
        }
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionViewCell
//        NSLog("\(tableData)")
//        cell.setupCellwithString(self.tableData![indexPath.item])
        cell.setupCellWithNote(notas![indexPath.item])
//        if(cell.noteName != "clave_sol"){
//        cell.transform = CGAffineTransformMakeScale(0.5, 0.5)
//        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        println("Cell \(indexPath.row) selected")
    }
    
    @IBAction func save(sender: AnyObject) {
        var teste = "Teste".dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
        var ibagem = UIImage(named: "clave_sol");
//<<<<<<< Updated upstream
        var notaOrderedSet = NSOrderedSet(array: notas!)
        PartituraServices.criarPartitura("Myself", nome: "A Partitura", qtdCompassos: 0, ritmo: 0, tempos: teste!, image: UIImagePNGRepresentation(ibagem), notas: notaOrderedSet)
//=======
        var notaArray : NSOrderedSet? = NSOrderedSet(array: notas!)
        //PartituraServices.criarPartitura("Myself", nome: "A Partitura", qtdCompassos: NSNumber(int: 0), ritmo: NSNumber(int: 0), tempos: NSNumber(int: 0), image: UIImagePNGRepresentation(ibagem)!, notas: notaArray)
//>>>>>>> Stashed changes
    }
    
    @IBAction func load(sender: AnyObject) {
        self.collectionManager.reloadData()
        performSegueWithIdentifier("defaultLoader", sender: self)
    }
    
    func startWithPartiture(partitura : Partitura)
    {
        tableData = ["clave_sol"]
        notas = []
        self.collectionManager.reloadData()
        for nota in partitura.notas.array{
            self.addNote(Int(nota.som), duracao: Float(nota.tempo))
            self.collectionManager.reloadData()
        }
    }
    
    func loadSelectedPartiture(partitura: Partitura)
    {
        tableData = ["clave_sol"]
        notas = []
        self.collectionManager.reloadData()
        for nota in partitura.notas.array{
            self.addNote(Int(nota.som), duracao: Float(nota.tempo))
            self.collectionManager.reloadData()
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        if (segue.identifier == "defaultLoader")
        {
            var destination = segue.destinationViewController as! LoadViewController
            destination.delegate = self
        }
    }
    
    @IBAction func play(sender: AnyObject) {
        for nota in notas!{
            Piano.sharedInstance.playNote(Int(nota.som))
            
            //Highlight da imagem, para dar feedback ao usuario

            //Inicializa o timer
            usleep(useconds_t(nota.tempo.floatValue * 1000)) //As tempo is in milliseconds and usleep receives microsecs, we multiply it by 1000
            Piano.sharedInstance.stopPlayingNote(Int(nota.som))
            NSLog("\(nota.tempo)")
            
        }
        
    }
    @IBAction func new(sender: AnyObject) {
        tableData = ["clave_sol"]
        notas = []
        self.collectionManager.reloadData()
        
    }
}
