struct ItemDetailView: View {
    var item: Item
    
    var body: some View {
        VStack {
            if let data = item.imageData, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .padding()
            }
            Text(item.name)
                .font(.largeTitle)
                .padding()
        }
        .navigationTitle(item.name)
    }
}