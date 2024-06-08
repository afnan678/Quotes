//
//  MusicPlyerViewController.swift
//  Quotes
//
//  Created by apple on 09/12/2023.
//

import UIKit
import AVFoundation

class MusicPlyerViewController: UIViewController {
    
    var audioPlayer: AVAudioPlayer!
    var timer: Timer!
    var totalTime: Int!
    var timer2 = ""
    var cellToUpdateIndex: IndexPath?
    var musiclist = ["Carefree","There-are-Sunshine","Walking-Home","Evening-Improvisation","Memories-of-Spring","Place-Like-Heaven","keys-of-moon-white-petals","Sunset-Landscape"]

    
    

    
    
    @IBOutlet weak var tbMusicView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
//
        }

 
    @IBAction func backButton(_ sender: Any) {
        //        Mark:- Move Back To the Home View
        
        self.navigationController?.popViewController(animated: true)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        pauseMusic()
        
    }
    
    
    func setupAudioPlayer(name: String) {
            if let audioPath = Bundle.main.path(forResource: name, ofType: "mp3") {
                let audioURL = URL(fileURLWithPath: audioPath)
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: audioURL)
                    audioPlayer.delegate = self
                    audioPlayer.prepareToPlay()
                    totalTime = Int(audioPlayer.duration)
                } catch {
                    print("Error loading audio file: \(error.localizedDescription)")
                }
            } else {
                print("Audio file not found.")
            }
        }
    
        @IBAction func playButtonTapped(_ sender: UIButton) {
            if !audioPlayer.isPlaying {
                audioPlayer.play()
                startTimer()
            }
        }

        @IBAction func pauseButtonTapped(_ sender: UIButton) {
            if audioPlayer.isPlaying {
                audioPlayer.pause()
                stopTimer()
            }
        }
    func formattedTotalDuration() -> String {
        let totalDuration = Int(audioPlayer.duration)
        let minutes = totalDuration / 60
        let seconds = totalDuration % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }

    

        func startTimer() {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
        }

        func stopTimer() {
            timer.invalidate()
        }

        @objc func updateTimeLabel() {
            if audioPlayer.isPlaying {
                totalTime -= 1
                let minutes = totalTime / 60
                let seconds = totalTime % 60
//                currentTimeLabel.text = String(format: "%02d:%02d", minutes, seconds)
                print(String(format: "%02d:%02d", minutes, seconds))
                
//                cellToUpdateIndex = IndexPath(row: 0, section: 0) // Update with your desired index path
                  
                  // Check if the index path is valid and visible
                  if let indexPath = cellToUpdateIndex, let cell = tbMusicView.cellForRow(at: indexPath) as? MusicTableViewCell {
                      // Update the label content in the specific cell
                       // Replace this with your own logic to update the label
                      cell.timerLBL.text = String(format: "%02d:%02d", minutes, seconds)
                  }
                
                if totalTime == 0 {
                    stopTimer()
                }
            }
        }
    }


extension MusicPlyerViewController: AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        stopTimer()
//        currentTimeLabel.text = "00:00"
        
    }
    func playmusic()
    {
        if !audioPlayer.isPlaying {
            audioPlayer.play()
            startTimer()
        }
    }
    
    func pauseMusic()
    {
        if audioPlayer.isPlaying {
            audioPlayer.pause()
            stopTimer()
        }
    }
}






extension MusicPlyerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musiclist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellMusic = 
        tbMusicView.dequeueReusableCell(withIdentifier: "cellMusicPlayer", for: indexPath) as! MusicTableViewCell
        cellMusic.mainCellView.layer.cornerRadius = 20
        cellMusic.mainCellView.layer.borderWidth = 2.0
        cellMusic.mainCellView.layer.borderColor = UIColor.white.cgColor
        setupAudioPlayer(name: musiclist[indexPath.row])
        cellMusic.timerLBL.text = formattedTotalDuration()
        cellMusic.TitleLBL.text = "Peaceful Music - clam, \(musiclist[indexPath.row]) -relaxing"
        cellMusic.images.image = UIImage(named: "\(musiclist[indexPath.row])")
        cellMusic.buttonTappedCallback = { [self] in
            setupAudioPlayer(name: musiclist[indexPath.row])
            if cellMusic.musicBtn.imageView?.image == UIImage(named: "Play")
            {
                cellMusic.musicBtn.setImage(UIImage(named: "Pause"), for: .normal)
                cellToUpdateIndex = indexPath
                playmusic()
            }
            else
            {
                cellMusic.musicBtn.setImage(UIImage(named: "Play"), for: .normal)
                pauseMusic()
            }
         }
        return cellMusic
    }
}
