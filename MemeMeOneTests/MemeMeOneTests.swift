//
//  ViewControler2Tests.swift
//  MemeMeOneTests
//
//  Created by Fernanda Araújo on 17/09/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Quick
import Nimble

@testable import MemeMeOne

class MemeMeOneTests: QuickSpec {
    override func spec() {
        describe("init") {
            let viewMock = ViewControllerMock()
            
            it("disable shared button on beginning") {
                viewMock.viewDidLoad()
                
                expect(viewMock.sharedButtonEnabled).to(beFalse())
            }
            
            it("disable cancel button on beginning") {
                viewMock.viewDidLoad()
                
                expect(viewMock.cancelButtonClicked).to(beFalse())
            }
            
            it("subscribe from keyboard notifications") {
                viewMock.viewWillAppear(true)
                
                expect(viewMock.isSubscribeToKeyboardNotifications).to(beTrue())
            }
            
            context("plays a song with an effect") {                
                it("choose a picture from album") {
                    viewMock.pickAnImageFromAlbum((Any).self)
                    
                    expect(viewMock.albumButtonClicked).to(beTrue())
                }
                
                it("pick a picture from camera") {
                    viewMock.pickAnImageFromCamera((Any).self)
                    
                    expect(viewMock.cameraButtonClicked).to(beTrue())
                }
                
                it("share image created") {
                    let barButton = UIBarButtonItem()
                    viewMock.shareMemedImage(sender: barButton)
                    
                    expect(viewMock.sharedButtonClicked).to(beTrue())
                }
                
                it("cancel edit meme") {
                    let barButton = UIBarButtonItem()
                    viewMock.cancelEdit(sender: barButton)
                    
                    expect(viewMock.cancelButtonClicked).to(beTrue())
                }
            }
            
            it("unsubscribe from keyboard notifications") {
                viewMock.viewWillDisappear(true)
                
                expect(viewMock.isUnsubscribeFromKeyboardNotifications).to(beTrue())
            }
        }
    }
}


class ViewControllerMock: ViewController {
    var memeImageLoad = false
    var cameraButtonClicked = false
    var albumButtonClicked = false
    var sharedButtonClicked = false
    var sharedButtonEnabled = true
    var cancelButtonClicked = true
    var cancelButtonEnabled = false
    var toolBarVisible = true
    var isSubscribeToKeyboardNotifications = false
    var isUnsubscribeFromKeyboardNotifications = false
    
    override func viewDidLoad() {
        sharedButtonEnabled = false
        cancelButtonClicked = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unsubscribeFromKeyboardNotifications()
    }
    
    override func subscribeToKeyboardNotifications() {
        isSubscribeToKeyboardNotifications = true
    }
    
    override func unsubscribeFromKeyboardNotifications() {
        isUnsubscribeFromKeyboardNotifications = true
    }
    
    override func pickAnImageFromAlbum(_ sender: Any) {
        albumButtonClicked = true
    }
    
    override func pickAnImageFromCamera(_ sender: Any) {
        cameraButtonClicked = true
    }
    
    override func shareMemedImage(sender: UIBarButtonItem) {
        sharedButtonClicked = true
    }
    
    override func cancelEdit(sender: UIBarButtonItem) {
        cancelButtonClicked = true
    }
}
