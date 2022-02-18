import SwiftUI

struct ContentView: View {
    @State var dblHeight: Double = 150
    @State var txtHeight: String = ""

    var body: some View {
        VStack {
            Text(String(format: "身長 %5.1f cm", dblHeight))
            Slider(value: $dblHeight, in: 100 ... 200, step: 0.1)
            HStack {
                TextField("キーボード入力", text: $txtHeight, onEditingChanged: { edit in
                    if edit == true {
                        //編集開始
                        txtHeight = ""
                    }
                    else {
                        //編集終了
                    }
                })
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.decimalPad)
                Button(action: {
                    let temp = Double(txtHeight)
                    if temp != nil {
                        if (temp! >= 100.0) && (temp! <= 200.0) {
                            dblHeight = temp!
                            txtHeight = ""
                        }
                        else {
                            txtHeight = "範囲エラー"
                        }
                    }
                    else {
                        txtHeight = "数値エラー"
                    }
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }) {
                    Text("入力完了")
                }
            }
        }
        .padding()
    }
}
