//
//  AddNewCeleb.swift
//  CelebrityWikiApp
//
//  Created by 한수빈 on 11/2/23.
//
import SwiftUI

struct AddNewCeleb: View {
    //@StateObject var celebStore: CelebStore
    //@Binding var path: NavigationPath       // <- 이전화면으로 돌아갈 수 있도록 내비게이션 경로 전달받음
    
    @State private var name: String = ""
    @State private var description: String = ""
    @State private var imageName: String = ""
    @State private var detailLink: String = ""
    //@State private var showingImagePicker = false
    //@State private var inputImage: UIImage?
    
    var body: some View {
        Form {
            Section {
                Image("karina")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                DataInput(title: "Name", userInput: $name)
                DataInput(title: "Description", userInput: $description)
                DataInput(title: "ImageName", userInput: $imageName)
                DataInput(title: "Link", userInput: $detailLink)
                
            } header: {
                Text("Celebrity Details")
                
            }
            Button(action: addNewCeleb) {
                Text("Add Celebrity")
            }
        }
        
    }
    struct DataInput : View {
        
        var title: String
        @Binding var userInput: String
        
        var body: some View {
            VStack(alignment: HorizontalAlignment.leading) {
                Text(title)
                    .font(.headline)
                TextField("Enter \(title)", text: $userInput)
                    .textFieldStyle( RoundedBorderTextFieldStyle() )
            }
            .padding()
        }
    }
    
    func addNewCeleb(){
        
    }
    /*func addNewCeleb() {
        // 프로젝트 간략화를 위해 사진 라이브러리에서 사진을 가져오지 않고 기존 이미지를 재사용
        let newCeleb = Celeb(id: UUID().uuidString, id: id, name: name, description: description, , imageName: "karina", detailLink: detailLink)

        carStore.cars.append(newCeleb)

        // 셀럽 추가 후 내비게이션 경로에서 현재 뷰를 스택에서 꺼내고 이전 뷰로 돌아감
        path.removeLast()
    }
    func loadImage() {
        //이미지 로드 코드
    }
     */
}
    
#Preview {
    AddNewCeleb()
}
/*
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage
    @Environment(\.presentationMode) var presentationMode

    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }

            parent.presentationMode.wrappedValue.dismiss()
        }
    }
}
*/
