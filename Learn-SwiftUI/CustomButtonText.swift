//
//  CustomButtonText.swift
//  Learn-SwiftUI
//
//  Created by Daniel Kimani on 06/05/2022.
//

import SwiftUI
	
struct CustomButtonText: View {
    var buttonText:String
    var buttonForegroundColor:Color
    var buttonBackGroundColor:Color
    var buttonRadius:CGFloat
    var buttonWidth:CGFloat
    var buttonHeight:CGFloat
    
    var body: some View {
        Text(buttonText)
            .frame(width: buttonWidth, height: buttonHeight)
            .foregroundColor(.blue)
            .background(buttonBackGroundColor)
            .font(.system(size: 20, weight: .bold, design: .rounded))
            .cornerRadius(buttonRadius)
    }
}

struct CustomButtonText_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonText(
            buttonText: "Change Day Time",
            buttonForegroundColor:.blue,
            buttonBackGroundColor: .white,
            buttonRadius: 10,
            buttonWidth: 280,
            buttonHeight: 50
        )
    }
}
