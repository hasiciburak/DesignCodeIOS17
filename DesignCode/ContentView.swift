import SwiftUI

struct ContentView: View {
    @State var isTapped = false
    @State var time = Date.now
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var isActive = false
    @State var downloading = false
    
    struct AnimationValues {
        var position = CGPoint(x: 0, y: 0)
        var scale = 1.0
        var opacity = 0.0
    }
    
    var body: some View {
        ZStack {
            Image(.image1)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: isTapped ? 600 : 300)
                .frame(width: isTapped ? 393 : 360)
                .cornerRadius(isTapped ? 0 : 20)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .strokeBorder(linearGradient)
                        .opacity(isTapped ? 0 : 1)
                )
                .offset(y: isTapped ? -200 : 0)
                .phaseAnimator([1, 2], trigger: isTapped, content: { content, phase in
                    content.blur(radius: phase == 2 ? 100 : 0)
                })
            
            Circle()
                .fill(.thinMaterial)
                .frame(width: 100)
                .overlay(Circle().stroke(.secondary))
                .overlay(Image(systemName: "photo")
                    .font(.largeTitle)
                )
                .keyframeAnimator(initialValue: AnimationValues(), trigger: downloading) { content, value in
                    content.offset(x: value.position.x, y: value.position.y)
                        .scaleEffect(CGSize(width: 1.0, height: 1.0))
                        .opacity(value.opacity)
                } keyframes: { _ in
                    // Code will here
                    KeyframeTrack(\.position) {
                        SpringKeyframe(CGPoint(x: 100, y: -100), duration: 0.5, spring: .bouncy)
                        CubicKeyframe(CGPoint(x: 400, y: 1000), duration: 0.5)
                    }
                    KeyframeTrack(\.scale) {
                        CubicKeyframe(1.2, duration: 0.5)
                        CubicKeyframe(1, duration: 0.5)
                    }
                    KeyframeTrack(\.opacity) {
                        CubicKeyframe(1, duration: 0.3)
                    }
                }
            
            content
                .padding(20.0)
                .background(.regularMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .strokeBorder(linearGradient)
                )
                .cornerRadius(20.0)
                .padding(40)
                .offset(y: isTapped ? 220 : 80)
            
            play
                .frame(width: isTapped ? 220 : 50)
                .foregroundStyle(ShaderLibrary.angledFill(
                    .float(10),
                    .float(10),
                    .color(.white)
                ))
                .foregroundStyle(.primary, .white)
                .font(.largeTitle)
                .padding(20)
                .background(.ultraThinMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .strokeBorder(linearGradient)
                )
                .cornerRadius(20)
                .offset(y: isTapped ? 40 : -44)
                .phaseAnimator([1, 1.1], trigger: isTapped) { content, phase in
                    content.scaleEffect(phase)
                } animation: { phase in
                    switch phase {
                    case 1: .bouncy
                    case 1.1: .easeOut
                    default: .easeOut
                    }
                }
        }
        .frame(maxWidth: 400)
        .dynamicTypeSize(.xSmall ... .xLarge)
    }
    
    var linearGradient: LinearGradient {
        LinearGradient(colors: [.clear, .primary.opacity(0.3), .clear], startPoint: .topLeading, endPoint: .bottomTrailing)
    }
    
    var content: some View {
        VStack(alignment: .center) {
            Text("modern architecture, an isometric tiny house, cute illustration, minimalist, vector art, night view")
                .font(.subheadline)
            HStack(spacing: 8.0) {
                VStack(alignment: .leading) {
                    Text("Size")
                        .foregroundColor(.secondary)
                    Text("1024x1024")
                }
                .font(.subheadline)
                .fontWeight(.semibold)
                Divider()
                VStack(alignment: .leading) {
                    Text("Type")
                        .foregroundColor(.secondary)
                    Text("Upscale")
                }
                .font(.subheadline)
                .fontWeight(.semibold)
                
                Divider()
                
                VStack(alignment: .leading) {
                    Text("Date")
                        .foregroundColor(.secondary)
                    Text("Today 5:19")
                }
                .font(.subheadline)
                .fontWeight(.semibold)
            }
            .frame(height: 44.0)
            
            HStack {
                HStack {
                    Image(systemName: "ellipsis")
                        .symbolEffect(.pulse)
                    Divider()
                    Image(systemName: "sparkle.magnifyingglass")
                        .symbolEffect(.scale.up, isActive: isActive)
                    Divider()
                    Image(systemName: "face.smiling")
                        .symbolEffect(.appear, isActive: isActive)
                }
                .padding()
                .frame(height: 44)
                .overlay(
                    UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 0, bottomLeading: 20, bottomTrailing: 0, topTrailing: 20))
                        .strokeBorder(linearGradient)
                )
                .offset(x: -20, y: 20)
                
                Spacer()
                
                Image(systemName: "square.and.arrow.down")
                    .padding()
                    .frame(height: 44)
                    .overlay(
                        UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 20, bottomLeading: 0, bottomTrailing: 20, topTrailing: 0))
                            .strokeBorder(linearGradient)
                    )
                    .offset(x: 20, y: 20)
                    .symbolEffect(.bounce, value: downloading)
                    .onTapGesture {
                        downloading.toggle()
                    }
            }
        }
    }
    
    var play: some View {
        HStack(spacing: 30) {
            Image(systemName: "wand.and.rays")
                .frame(width: 44)
                .symbolEffect(.variableColor.iterative.reversing, options: .speed(3))
                .symbolEffect(.bounce, value: isTapped)
                .opacity(isTapped ? 1 : 0)
                .blur(radius: isTapped ? 0 : 20)
            Image(systemName: isTapped ? "pause.fill" : "play.fill")
                .frame(width: 44)
                .contentTransition(.symbolEffect(.replace))
                .onTapGesture {
                    withAnimation(.bouncy) {
                        isTapped.toggle()
                    }
                }
            Image(systemName: "bell.and.waves.left.and.right.fill")
                .frame(width: 44)
                .symbolEffect(.bounce, options: .speed(3).repeat(3), value: isTapped)
                .opacity(isTapped ? 1 : 0)
                .blur(radius: isTapped ? 0 : 20)
                .onReceive(timer) { value in
                    time = value
                    isActive.toggle()
                }
        }
    }
}

#Preview {
    ContentView()
}
