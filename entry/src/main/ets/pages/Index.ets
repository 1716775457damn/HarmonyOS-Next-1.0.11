@Entry
@Component
struct Index {
  @State selectedIndex: number = 0
  
  @Builder
  TabBuilder(title: string, index: number) {
    Column() {
      Text(title)
        .fontColor(this.selectedIndex === index ? '#007DFF' : '#666666')
        .fontSize(16)
        .fontWeight(this.selectedIndex === index ? 500 : 400)
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Tabs() {
      TabContent() {
        Text('首页内容')
          .fontSize(16)
          .width('100%')
          .textAlign(TextAlign.Center)
      }
      .tabBar(this.TabBuilder('首页', 0))

      TabContent() {
        Text('分类内容')
          .fontSize(16)
          .width('100%')
          .textAlign(TextAlign.Center)
      }
      .tabBar(this.TabBuilder('分类', 1))

      TabContent() {
        Text('活动内容')
          .fontSize(16)
          .width('100%')
          .textAlign(TextAlign.Center)
      }
      .tabBar(this.TabBuilder('活动', 2))

      TabContent() {
        Text('购物车内容')
          .fontSize(16)
          .width('100%')
          .textAlign(TextAlign.Center)
      }
      .tabBar(this.TabBuilder('购物车', 3))

      TabContent() {
        Text('我的')
          .fontSize(16)
          .width('100%')
          .textAlign(TextAlign.Center)
      }
      .tabBar(this.TabBuilder('我的', 4))
    }
    .onChange((index: number) => {
      this.selectedIndex = index
    })
    .width('100%')
    .backgroundColor('#F5F5F5')
    .barHeight(50)
    .barMode(BarMode.Fixed)
    .barWidth('100%')
    .animationDuration(0)
    .scrollable(false)
  }
}

