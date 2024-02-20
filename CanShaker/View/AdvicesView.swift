//
//  AdvicesView.swift
//  CanShaker
//
//  Created by Giuseppe Francione on 16/02/24.
//

import SwiftUI

struct AdvicesView: View {
    var body: some View {
        NavigationStack {
            // IGNORE THIS
            Color(uiColor: UIColor.secondarySystemBackground).ignoresSafeArea().overlay {
                VStack {
                        VStack(alignment: .leading) {
                            HStack(alignment: .top) {
                                Image(systemName: "exclamationmark.triangle.fill")
                                Text("Based on your use of the app").bold()
                            }.font(.title2)
                            Text("Too much lorem ipsum. Consider dorime, interimo adapare dorime. Ameno? Ameno, latire. Latiremo.")
                        }
                        .padding(.all, 20)
                        .background {
                            Color.white.clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    
                    
                    VStack {
                        HStack {
                            Color.white.clipShape(RoundedRectangle(cornerRadius: 10)).overlay {
                                VStack {
                                    Image(systemName: "microbe.circle.fill")
                                    Text("Hygiene")
                                }
                            }
                            
                            Color.white.clipShape(RoundedRectangle(cornerRadius: 10)).overlay {
                                VStack {
                                    Image(systemName: "party.popper.fill")
                                    Text("Methods")
                                }
                            }
                        }
                        
                        HStack {
                            Color.white.clipShape(RoundedRectangle(cornerRadius: 10)).overlay {
                                VStack {
                                    Image(systemName: "checkmark.circle.fill")
                                    Text("Do's")
                                }
                            }
                            Color.white.clipShape(RoundedRectangle(cornerRadius: 10)).overlay {
                                VStack {
                                    Image(systemName: "x.circle.fill")
                                    Text("Don'ts")
                                }
                            }
                        }
                    }
                    .padding(.all, 20)
                    .font(.title)
                    Spacer()
                    
                }
                .navigationTitle("Advices")
            }
        }
    }
}

#Preview {
    AdvicesView()
}
