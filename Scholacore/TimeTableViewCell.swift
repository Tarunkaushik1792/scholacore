//
//  TimeTableViewCell.swift
//  Scholacore
//
//  Created by Tarun kaushik on 16/05/17.
//  Copyright © 2017 Tarun kaushik. All rights reserved.
//

import UIKit

protocol TimeTableCellDelegate:class{
  func timerDidFinished()
    
}

class TimeTableViewCell: UITableViewCell {

    @IBOutlet var teacherImageView: UIView!
    @IBOutlet var subjectLabelView: UILabel!
    @IBOutlet var timingLabelView: UILabel!
    @IBOutlet var dotVIew: UIView!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var timmerLabel: UILabel!
    var progressiveSec = 0.0
    var timer:Timer!
    var lectureINfo:lecture?
    let calender = Calendar.current
    
    weak var delegate:TimeTableCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        dotVIew.layer.cornerRadius = 7.5
        dotVIew.clipsToBounds = true
        dotVIew.isHidden = true
        teacherImageView.layer.cornerRadius = 25
        teacherImageView.clipsToBounds = true
       // subjectLabelView.text = lectureINfo.subject
        progressBar.isHidden = true
        timmerLabel.isHidden = true

        
    }
    
    func setupCell(){
        let now = Date()
        if now > (lectureINfo?.StartTime)! && now < (lectureINfo?.finishTime)!{
            dotVIew.isHidden = false
            progressBar.isHidden = false
            timmerLabel.isHidden = false
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTimerLabel), userInfo: nil, repeats: true)
            timer.fire()
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        let startTime = dateFormatter.string(from: (lectureINfo?.StartTime)!)
        let endTime = dateFormatter.string(from: (lectureINfo?.finishTime)!)
        timingLabelView.text = " \(startTime) to \(endTime)"

    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        timmerLabel.isHidden = true
        dotVIew.isHidden = true
    }
    
    
    func updateTimerLabel(){
        let comp = calender.dateComponents([.hour,.minute,.second], from: Date())
        let hour = comp.hour
        let mins = comp.minute
        let secs = comp.second
        progressiveSec += 5
        guard let lectInfo = lectureINfo else{
        return
        }
        guard let lecthour = lectInfo.hour else{
        return
        }
        guard let lectmin = lectInfo.minute else{
        return
        }
        
        if secs! > 49{
            if hour! - lecthour >= 1{
                let remaMintTOHour = 60 - lectmin
                timmerLabel.text = "\(49 - remaMintTOHour - mins! ):0\(59 - secs!)"
                
            }else{
                let reminmint = 49 + lectmin
             timmerLabel.text = "\(reminmint - mins!):0\(59 - secs!)"
                
            }
        
        }else{
            if hour! - lecthour >= 1{
                let remaMintTOHour = 60 - lectmin
                timmerLabel.text = "\(49 - remaMintTOHour - mins! ):\(59 - secs!)"
                
            }else{
                let reminMint = 49 + lectmin
              timmerLabel.text = "\(reminMint - mins!):\(59 - secs!)"
              
            }
        }
        //let fractionalProgress = Float(progressiveSec/3000.0)
        //progressBar.setProgress(fractionalProgress, animated: true)
        let now = Date()
        if now > (lectureINfo?.finishTime)!{
            timer.invalidate()
            delegate?.timerDidFinished()
        }
        
    }

}
