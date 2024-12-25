//创建基础Tabs标签页
@Entry
@Component
struct Index {
  build() {
    Tabs() {
      TabContent() {
        Text('探索内容') // 有且只能一个子组件
      }
      .tabBar('探索') // 配置导航

      TabContent() {
        Text('趋势内容') // 有且只能一个子组件
      }
      .tabBar('趋势')

      TabContent() {
        Text('热点内容') // 有且只能一个子组件
      }
      .tabBar('热点')

      TabContent() {
        Text('个人中心内容') // 有且只能一个子组件
      }
      .tabBar('个人中心')
    }
  }
}

///////////////////////////////////////////////////////////////
//配置Tabs导航属性
@Entry
@Component
struct Index {
  build() {
    Tabs({
      barPosition: BarPosition.Start // 导航位置
    })
    {
      TabContent() {
        Text('探索内容')
      }
      .tabBar('探索')

      TabContent() {
        Text('趋势内容')
      }
      .tabBar('趋势')

      TabContent() {
        Text('热点内容')
      }
      .tabBar('热点')

      TabContent() {
        Text('个人中心内容')
      }
      .tabBar('个人中心')
    }
    .vertical(false) // 调整导航水平或垂直
    .scrollable(false) // 是否开启手势滑动
    .animationDuration(0) // 点击滑动的动画时间
  }
}


////////////////////////////////////////////
//使用ForEach动态生成Tabs
@Entry
@Component
struct Index {
  titles: string[] = [
    '探索', '趋势', '热点', '科技', '娱乐',
    '体育', '教育', '健康', '财经', '旅游'
  ]

  build() {
    Tabs() {
      ForEach(this.titles, (item: string, index) =&gt; {
        TabContent() {
          Text(`${item}内容`)
        }
        .tabBar(item)
      })
    }
    .barMode(BarMode.Scrollable) // 实现滚动导航栏
  }
}

///////////////////////////////////////////////////////////
//自定义Tabs样式
@Entry
@Component
struct Index {
  @Builder
  myBuilder(title: string, img: ResourceStr) {
    Column() {
      Image(img)
        .width(30)
      Text(title)
    }
  }

  build() {
    Tabs({
      barPosition: BarPosition.End
    })
    {
      TabContent() {
        Text('消息中心内容')
      }
      .tabBar(this.myBuilder('消息中心', $r('app.media.ic_tabbar_icon_1')))

      TabContent() {
        Text('设置中心内容')
      }
      .tabBar(this.myBuilder('设置中心', $r('app.media.ic_tabbar_icon_2')))
    }
  }
}

///////////////////////////////////////////
//管理Tabs激活状态
@Entry
@Component
struct Index {
  @State selectedIndex: number = 0

  @Builder
  myBuilder(itemIndex: number, title: string, img: ResourceStr, selImg: ResourceStr) {
    Column() {
      Image(itemIndex == this.selectedIndex ? selImg : img)
        .width(30)
      Text(title)
        .fontColor(itemIndex == this.selectedIndex ? Color.Red : Color.Black)
    }
  }

  build() {
    Tabs()
    {
      TabContent() {
        Text('消息中心内容')
      }
      .tabBar(this.myBuilder(0, '消息中心', $r('app.media.ic_tabbar_icon_1'), $r('app.media.ic_tabbar_icon_1_selected')))

      TabContent() {
        Text('设置中心内容')
      }
      .tabBar(this.myBuilder(1, '设置中心', $r('app.media.ic_tabbar_icon_2'), $r('app.media.ic_tabbar_icon_2_selected')))
    }
    .onChange((index: number) =&gt; {
      this.selectedIndex = index
    })
    .animationDuration(0)
    .scrollable(false)
  }
}

//添加特殊形状的Tab
@Entry
@Component
struct Index {
  @State selectedIndex: number = 0

  @Builder
  myBuilder(itemIndex: number, title: string, img: ResourceStr, selImg: ResourceStr) {
    Column() {
      Image(itemIndex == this.selectedIndex ? selImg : img)
        .width(30)
      Text(title)
        .fontColor(itemIndex == this.selectedIndex ? Color.Red : Color.Black)
    }
  }

  @Builder
  centerBuilder() {
    Image($r('app.media.ic_special_icon'))
      .width(40)
      .margin({ bottom: 10 })
  }

  build() {
    Tabs()
    {
      TabContent() {
        Text('首页内容')
      }
      .tabBar(this.myBuilder(0, '首页', $r('app.media.ic_tabbar_icon_0'), $r('app.media.ic_tabbar_icon_0_selected')))

      TabContent() {
        Text('分类内容')
      }
      .tabBar(this.myBuilder(1, '分类', $r('app.media.ic_tabbar_icon_1'), $r('app.media.ic_tabbar_icon_1_selected')))

      TabContent() {
        Text('活动内容')
      }
      .tabBar(this.centerBuilder())

      TabContent() {
        Text('购物车内容')
      }
      .tabBar(this.myBuilder(3, '购物车', $r('app.media.ic_tabbar_icon_2'), $r('app.media.ic_tabbar_icon_2_selected')))

      TabContent() {
        Text('个人中心内容')
      }
      .tabBar(this.myBuilder(4, '个人中心', $r('app.media.ic_tabbar_icon_3'), $r('app.media.ic_tabbar_icon_3_selected')))
    }
    .onChange((index: number) =&gt; {
      this.selectedIndex = index
    })
    .animationDuration(0)
    .scrollable(false)
  }
}

