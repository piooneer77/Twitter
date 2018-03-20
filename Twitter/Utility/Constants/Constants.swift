//
//  Constants.swift
//  Twitter
//
//  Created by Apple on 3/12/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import Foundation

public let appName = "Twitter"

/// General object of Application Delegate
//let APP_DELEGATE: AppDelegate                   =   UIApplication.shared.delegate as! AppDelegate

/// General object of FileManager
let FILE_MANAGER                                =   FileManager.default

/// General object of Main Bundle
let MAIN_BUNDLE                                 =   Bundle.main

/// General object of Main Thread
let MAIN_THREAD                                 =   Thread.main

/// General object of Main Screen
//let MAIN_SCREEN                                 =   UIScreen.main

/// General object of UserDefaults
let USER_DEFAULTS                               =   UserDefaults.standard

/// General object of UIApplication
//let APPLICATION                                 =   UIApplication.shared

/// General object of Current Device
//let CURRENT_DEVICE                              =   UIDevice.current

/// General object of Current Landuage
let CURRENT_LANGUAGE                            =   NSLocale.current.languageCode

/// General object of Network Activity Indicator
//let NETWORK_ACTIVITY                            =   APPLICATION.isNetworkActivityIndicatorVisible

//let UIViewControllerWithName : (String,String) -> UIViewController? = {storyBoardName,viewControllerID in
//
//    return UIStoryboard(name: storyBoardName, bundle: nil).instantiateViewController(withIdentifier: viewControllerID)
//}

