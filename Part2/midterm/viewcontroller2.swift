//
//  viewcontroller2.swift
//  midterm
//
//  Created by Fernie on 4/10/19.
//  Copyright © 2019 Poopnose. All rights reserved.
//

import UIKit


class ViewController2: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var score = 0
    var word = [mycollection]()
    var groups = [[mycollection]]()
    var leaders = 0
    var leadercell = mycollection()
    var location = 0
    var order = 0
    var timer : Timer?
    var counter = 0
    var setnum = 1
    
    @IBOutlet weak var winning: UILabel!
    
    @IBOutlet weak var hint: UILabel!
    
    @IBOutlet weak var maxscore: UILabel!
    
    @IBOutlet weak var time: UILabel!
    
    @IBOutlet weak var secondhint: UILabel!
    
    
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    
    var hintss = ["musical instrament", "12 make a foot", "credit ____", "color of fire", "__ or don't", "flightless bird", "has milk inside"]
    var shintss = ["large and has keys", "____ forward", "square and cardboard", "embarrassed people turn ___", "__ it", "long necks", "grows on tall trees"]
    
    var items2 = ["P 1 0 l", "I 2 1 l", "A 1 0 f", "N 1 0 f", "O 1 0 f", "*", "N 2 0 f", "*", "*", "*", "*", "C 3 2 l", "A 3 0 f", "R 4 3 l", "D 3 0 f", "*", "H 2 0 f", "*", "E 4 0 f", "*", "*", "*", "*", "D 5 4 l", "O 5 0 f"]
    var items = ["P 1 0 l", "I 2 1 l", "A 1 0 f", "N 1 0 f", "O 1 0 f","*","*","*","*","*","*","*","*",
                 
                 "*","N 2 0 f","*","*","*","*","*","*","*","*","*","*","*",
                 
                 "*","C 3 2 l", "A 3 0 f", "R 4 3 l", "D 3 0 f","*","*","*","*","*","*","*","*",
                 
                 "*","H 2 0 f", "*", "E 4 0 f","*","*","*","*","*","*","*","*","*",
                 
                 "*","*","*","D 5 4 l", "O 6 5 l","*","*","*","*","*","*","*","*",
                 
                 
                 "*","*","*","*","S 6 0 f","*","*","*","*","*","*","*","*",
                 
                 "*","*","*","*","T 6 0 f","*","*","*","*","*","*","*","*",
                 
                 "*","*","*","*","R 6 0 f","*","*","*","*","*","*","*","*",
                 
                 "*","*","*","*","C 7 6 l","O 7 0 f","C 7 0 f","O 7 0 f","N 7 0 f","U 7 0 f","T 7 0 f","*","*",
                 
                 "*","*","*","*","H 6 0 f","*","*","*","*","*","*","*","*",
                 
                 
                 "*","*","*","*","*","*","*","*","*","*","*","*","*",
                 
                 "*","*","*","*","*","*","*","*","*","*","*","*","*",
                 
                 "*","*","*","*","*","*","*","*","*","*","*","*","*",
                 
                 
                 ]
    
    @IBOutlet weak var buttons: CustomButton!
    @IBOutlet weak var buttons2: CustomButton!
    @IBOutlet weak var buttons3: CustomButton!
    @IBOutlet weak var buttons4: CustomButton!
    @IBOutlet weak var buttons5: CustomButton!
    @IBOutlet weak var buttons6: CustomButton!
    @IBOutlet weak var buttons7: CustomButton!
    
    @IBOutlet weak var buttons8: CustomButton!
    @IBOutlet weak var buttons9: CustomButton!
    
    @IBOutlet weak var buttons10: CustomButton!
    
    
    @IBOutlet var allbuttons: [CustomButton]!
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! mycollection
        
        
        let wordarry = self.items[indexPath.item].components(separatedBy: " ")
        print (wordarry)
        if (self.items[indexPath.item] == "*"){
            
        }
       
        else{
            // Use the outlet in our custom class to get a reference to the UILabel in the cell
            cell.myLabel.text = ""
            cell.correct = wordarry[0]
            cell.group = Int(wordarry[1])!
            cell.groupsub = Int(wordarry[2])!
            if(wordarry[3] == "l"){
                cell.leader = true
                leaders = leaders + 1
                cell.myIDL.text = String(leaders)
                
            }
            cell.IDval = setnum
            setnum = setnum + 1
            //groups[cell.group].append(cell)
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 4
            cell.backgroundColor = UIColor.white // make cell more visible in our example project
            
        }
        if(self.items.count == indexPath.item + 1){
            
            
        }
        //
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        print(self.items[indexPath.item])
        
        let cell = collectionView.cellForItem(at: indexPath)
        //cell?.backgroundColor = UIColor.red
        
        let cell2 = collectionView.cellForItem(at: indexPath) as! mycollection
        
        print(cell2.correct)
        print(cell2.group)
        //all white
        for x in groups{
            for y in x{
                if !y.answered{
                y.backgroundColor = UIColor.white
            }
            }
        }
        //reset location
        location = 0
        disable()
        //make word if leader selected
        word.removeAll()
        if (cell2.leader == true && cell2.answered == false){
            enable()
            cell2.select = true
            leadercell = cell2
            for cell3 in collectionView.visibleCells{
                let temp3 = cell3 as! mycollection
            
                if cell2.group == temp3.group || cell2.group == temp3.groupsub{
                    word.append(temp3)
                    print(temp3.correct)
                }
                //sort
                word = word.sorted(by: { $0.IDval < $1.IDval})
            
                
                //print(temp3.group)
            }
            //add word to group if not in group
            if !groups.contains(word){
                groups.append(word)
            }
            //let location based in word
            location = word.firstIndex(of: cell2)!
            
            //select word
            for wo in word{
                print(wo.answered)
                if wo.leader == true && wo.group == leadercell.group{
                    wo.backgroundColor = UIColor.cyan
                }
                else{
                    if !wo.answered{
                    wo.backgroundColor = UIColor.yellow
                }
                }
            }
            //set hint
            hint.text = hintss[cell2.group - 1]
            secondhint.text = shintss[cell2.group - 1]
            
            if(!secondhint.isHidden){
                
                maxscore.text = String(Int(maxscore.text!)! - 5)
            }
            //set buttons
            var wordholder = word
            for butt in allbuttons{
                if wordholder.isEmpty{
                    wordholder = word
                }
                    let ran = wordholder.randomElement()
                    butt.setTitle(ran?.correct, for: .normal)
                    wordholder.remove(at: wordholder.firstIndex(of: ran!)!)
                
            }
        
        }
        
        
        
    }
    func deselect(all: [mycollection]){
        for a in all{
            
        }
    }
    // change background color when user touches cell

//testing button click
    @IBAction func click(_ sender: UIButton) {
        print(sender.currentTitle!)
        print(location)
        //back to yellow
        reYell(myword: word)
    
        if !word[location].answered{
            word[location].myLabel.text = sender.currentTitle
        
        location = location + 1
        //ending check
        if location == word.count{
            location = 0
            word[location].backgroundColor = UIColor.cyan
        }
        
        else{
            word[location].backgroundColor = UIColor.cyan
            }
        if checker(word: word){
            disable()
            score = 0
            for w in word{
                if w.group == leadercell.group{
                w.answered = true
                w.backgroundColor = UIColor.green
                
            }
                score = score + 10
            }
            maxscore.text = String(Int(maxscore.text!)! + score)
        }
            if win(word: groups){
                winning.isHidden = false
                let all = winning.text! + String(Int(maxscore.text!)! - Int(time.text!)!)
                winning.text = all
            }
        }
        else{
            location = location + 1
        }
        
    }
    func checker(word: [mycollection]) -> Bool{
        var outcome = true
        for letter in word{
         
            if letter.correct != letter.myLabel.text{
                outcome = false
            }
        
        }
        return outcome
    }
    func win(word: [[mycollection]]) -> Bool{
        var temp = true
        for x in word{
            for y in x{
                if y.answered == false{
                    temp = false
                }
            }
        }
        return temp
    }
    func reYell(myword:[mycollection]){
        for w in myword{
            if !w.answered{
            w.backgroundColor = UIColor.yellow
                
            }
            
        }
    }
    func disable(){
        for button in allbuttons{
            button.isEnabled = false
        }
    }
    func enable(){
        for button in allbuttons{
            button.isEnabled = true
        }
    }
    
    @IBAction func killTimer(_ sender: AnyObject) {
        timer?.invalidate()
        timer = nil
    }
    
    @objc func prozessTimer() {
        counter += 1
        //print("This is a second ", counter)
        time.text = String(counter)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval:1, target:self, selector:#selector(prozessTimer), userInfo: nil, repeats: true)
        
    }
    
    
    @IBAction func sechint(_ sender: Any) {
        if secondhint.isHidden == true{
        secondhint.isHidden = false
        }
        else{
            secondhint.isHidden = true
        }
    }
}
