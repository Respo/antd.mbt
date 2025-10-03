///|
typealias @react.VirtualNode

///|
fnalias @css.respo_style

///|
struct ContainerProps {} derive(Default)

///|
impl @react.JsValueTrait for ContainerProps with to_value(_self) -> @react.JsValue {
  @react.JsObject::new().to_value()
}

///|
impl @react.JsValueTrait for ContainerProps with from_value(
  _value : @react.JsValue,
) -> ContainerProps {
  ContainerProps::default()
}

// 页面类型枚举

///|
enum PageType {
  Overview
  General
  Layout
  Navigation
  DataEntry
  DataDisplay
  Feedback
  Other
}

// 主容器组件

///|
fn comp_container(_v : ContainerProps) -> VirtualNode {
  let (current_page, set_current_page) = @react.use_state(PageType::Overview)
  @react.use_effect_once(fn() { println("Ant Design Component Library loaded") })
  @react.div(style=respo_style(display=Flex), [
    // 侧边栏
    @react.div(style=respo_style(width=Px(250.0), padding=Px(0.0)), [
      @react.div(style=respo_style(padding=Px(16.0), text_align=Center), [
        @antd.typography_title(level=Level3, [Text("Ant Design")]),
        @antd.typography_text([Text("MoonBit Components")]),
      ]),
      @antd.menu(
        [
          @antd.MenuItem::{
            key: "overview",
            label: "📋 Overview",
            disabled: None,
            icon: None,
          },
          @antd.MenuItem::{
            key: "general",
            label: "🔧 General",
            disabled: None,
            icon: None,
          },
          @antd.MenuItem::{
            key: "layout",
            label: "📐 Layout",
            disabled: None,
            icon: None,
          },
          @antd.MenuItem::{
            key: "navigation",
            label: "🧭 Navigation",
            disabled: None,
            icon: None,
          },
          @antd.MenuItem::{
            key: "data-entry",
            label: "📝 Data Entry",
            disabled: None,
            icon: None,
          },
          @antd.MenuItem::{
            key: "data-display",
            label: "📊 Data Display",
            disabled: None,
            icon: None,
          },
          @antd.MenuItem::{
            key: "feedback",
            label: "💬 Feedback",
            disabled: None,
            icon: None,
          },
          @antd.MenuItem::{
            key: "other",
            label: "🔗 Other",
            disabled: None,
            icon: None,
          },
        ],
        mode=@antd.MenuMode::Vertical,
        theme=@antd.MenuTheme::Dark,
        default_selected_keys=["overview"],
        on_select=fn(key) {
          let page_type = match key {
            "overview" => PageType::Overview
            "general" => PageType::General
            "layout" => PageType::Layout
            "navigation" => PageType::Navigation
            "data-entry" => PageType::DataEntry
            "data-display" => PageType::DataDisplay
            "feedback" => PageType::Feedback
            "other" => PageType::Other
            _ => PageType::Overview
          }
          set_current_page(page_type)
        },
      ),
    ]),
    // 主内容区域
    @react.div(
      style=respo_style(flex=1.0, display=Flex, flex_direction=Column),
      [
        @react.div(
          style=respo_style(
            background_color=White,
            padding=Px(16.0),
            box_shadow="0 2px 8px rgba(0,0,0,0.1)",
          ),
          [
            @antd.typography_title(level=Level2, [
              Text(get_page_title(current_page)),
            ]),
          ],
        ),
        @react.div(
          style=respo_style(
            margin=Px(24.0),
            padding=Px(24.0),
            background_color=White,
            flex=1.0,
          ),
          [render_page_content(current_page)],
        ),
      ],
    ),
  ])
}

// 获取页面标题

///|
fn get_page_title(page : PageType) -> String {
  match page {
    Overview => "组件概览"
    General => "通用组件"
    Layout => "布局组件"
    Navigation => "导航组件"
    DataEntry => "数据录入组件"
    DataDisplay => "数据展示组件"
    Feedback => "反馈组件"
    Other => "其他组件"
  }
}

// 渲染页面内容

///|
fn render_page_content(page : PageType) -> VirtualNode {
  match page {
    Overview => render_overview_page()
    General => render_general_page()
    Layout => render_layout_page()
    Navigation => render_navigation_page()
    DataEntry => render_data_entry_page()
    DataDisplay => render_data_display_page()
    Feedback => @react.component(render_feedback_page, FeedbackPageProps::default(), [])
    Other => render_other_page()
  }
}

// 概览页面

///|
fn render_overview_page() -> VirtualNode {
  @react.div([
    @antd.typography_paragraph([
      Text(
        "欢迎使用 Ant Design MoonBit 组件库！这是一个基于 MoonBit 语言实现的 Ant Design 组件库。",
      ),
    ]),
    @antd.divider([]),
    @antd.typography_title(level=Level3, [Text("实现状态")]),
    @antd.typography_paragraph([
      Text(
        "目前已实现 25 个组件，还有 46 个组件待实现。完成度：35.2%",
      ),
    ]),
    @antd.typography_title(level=Level4, [Text("已实现组件")]),
    @antd.typography_text([
      Text(
        "Button, Icon, Typography, Divider, Flex, Space, Layout, Breadcrumb, Menu, Steps, Input, Checkbox, Radio, Switch, Avatar, Badge, Card, Tag, Tooltip, Alert, Progress, Spin, Affix, App, ConfigProvider, FloatButton, BackTop",
      ),
    ]),
  ])
}

// 通用组件页面

///|
fn render_general_page() -> VirtualNode {
  @react.div([
    @antd.typography_title(level=Level3, [Text("Button 按钮")]),
    @antd.space([
      @antd.button([Text("Default")]),
      @antd.button(type_=Primary, [Text("Primary")]),
      @antd.button(type_=Dashed, [Text("Dashed")]),
      @antd.button(type_=Text, [Text("Text")]),
      @antd.button(type_=Link, [Text("Link")]),
    ]),
    @antd.divider([]),
    @antd.typography_title(level=Level3, [Text("Icon 图标")]),
    @antd.space([
      @antd.icon(icon_type=Home, []),
      @antd.icon(icon_type=User, []),
      @antd.icon(icon_type=Setting, []),
      @antd.icon(icon_type=Heart, []),
    ]),
    @antd.divider([]),
    @antd.typography_title(level=Level3, [Text("Typography 排版")]),
    @antd.typography_title(level=Level1, [Text("h1. Ant Design")]),
    @antd.typography_title(level=Level2, [Text("h2. Ant Design")]),
    @antd.typography_title(level=Level3, [Text("h3. Ant Design")]),
    @antd.typography_text([Text("Ant Design (default)")]),
    @antd.typography_text(type_=Secondary, [Text("Ant Design (secondary)")]),
    @antd.typography_text(type_=Success, [Text("Ant Design (success)")]),
    @antd.typography_text(type_=Warning, [Text("Ant Design (warning)")]),
    @antd.typography_text(type_=Danger, [Text("Ant Design (danger)")]),
  ])
}

// 布局组件页面

///|
fn render_layout_page() -> VirtualNode {
  @react.div([
    @antd.typography_title(level=Level3, [Text("Divider 分割线")]),
    @antd.typography_text([
      Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
    ]),
    @antd.divider([]),
    @antd.typography_text([
      Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
    ]),
    @antd.divider(dashed=true, [Text("With Text")]),
    @antd.typography_text([
      Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit."),
    ]),
    @antd.divider([]),
    @antd.typography_title(level=Level3, [Text("Space 间距")]),
    @antd.space([
      @antd.button([Text("Button 1")]),
      @antd.button([Text("Button 2")]),
      @antd.button([Text("Button 3")]),
    ]),
    @antd.divider([]),
    @antd.typography_title(level=Level3, [Text("Flex 弹性布局")]),
    @antd.flex(gap=@antd.FlexGap::Middle, [
      @antd.button([Text("Flex Item 1")]),
      @antd.button([Text("Flex Item 2")]),
      @antd.button([Text("Flex Item 3")]),
    ]),
  ])
}

// 导航组件页面

///|
fn render_navigation_page() -> VirtualNode {
  @react.div([
    @antd.typography_title(level=Level3, [Text("Breadcrumb 面包屑")]),
    @antd.breadcrumb([
      @antd.BreadcrumbItem::{ title: "Home", href: None, class_name: None },
      @antd.BreadcrumbItem::{
        title: "Application Center",
        href: None,
        class_name: None,
      },
      @antd.BreadcrumbItem::{
        title: "Application List",
        href: None,
        class_name: None,
      },
      @antd.BreadcrumbItem::{
        title: "An Application",
        href: None,
        class_name: None,
      },
    ]),
    @antd.divider([]),
    @antd.typography_title(level=Level3, [Text("Menu 导航菜单")]),
    @antd.menu(
      [
        @antd.MenuItem::{
          key: "1",
          label: "Navigation One",
          disabled: None,
          icon: None,
        },
        @antd.MenuItem::{
          key: "2",
          label: "Navigation Two",
          disabled: None,
          icon: None,
        },
        @antd.MenuItem::{
          key: "3",
          label: "Navigation Three",
          disabled: None,
          icon: None,
        },
      ],
      mode=@antd.MenuMode::Horizontal,
    ),
    @antd.divider([]),
    @antd.typography_title(level=Level3, [Text("Steps 步骤条")]),
    @antd.steps(current=1, [
      @antd.steps_step("Finished", description="This is a description."),
      @antd.steps_step("In Progress", description="This is a description."),
      @antd.steps_step("Waiting", description="This is a description."),
    ]),
  ])
}

// 数据录入组件页面

///|
fn render_data_entry_page() -> VirtualNode {
  @react.div([
    @antd.typography_title(level=Level3, [Text("Input 输入框")]),
    @antd.input(placeholder="Basic usage"),
    @antd.divider([]),
    @antd.typography_title(level=Level3, [Text("Checkbox 多选框")]),
    @antd.checkbox(default_checked=true, [Text("Checkbox")]),
    @antd.divider([]),
    @antd.typography_title(level=Level3, [Text("Radio 单选框")]),
    @antd.radio_group(
      [
        @antd.RadioOption::new("Apple", "apple", None),
        @antd.RadioOption::new("Pear", "pear", None),
        @antd.RadioOption::new("Orange", "orange", None),
      ],
      default_value="apple",
    ),
    @antd.divider([]),
    @antd.typography_title(level=Level3, [Text("Switch 开关")]),
    @antd.switch(default_checked=true),
  ])
}

// 数据展示组件页面

///|
fn render_data_display_page() -> VirtualNode {
  @react.div([
    @antd.typography_title(level=Level3, [Text("Avatar 头像")]),
    @antd.space([@antd.avatar([Text("U")]), @antd.avatar([Text("USER")])]),
    @antd.divider([]),
    @antd.typography_title(level=Level3, [Text("Badge 徽标数")]),
    @antd.space([
      @antd.badge(count=5, [@antd.avatar([Text("A")])]),
      @antd.badge(dot=true, [@antd.avatar([Text("B")])]),
    ]),
    @antd.divider([]),
    @antd.typography_title(level=Level3, [Text("Card 卡片")]),
    @antd.card(title="Card Title", [
      Text("Card content goes here. This is a sample card component."),
    ]),
    @antd.divider([]),
    @antd.typography_title(level=Level3, [Text("Tag 标签")]),
    @antd.space([
      @antd.tag([Text("Success")]),
      @antd.tag([Text("Error")]),
      @antd.tag([Text("Warning")]),
    ]),
    @antd.divider([]),
    @antd.typography_title(level=Level3, [Text("Tooltip 文字提示")]),
    @antd.tooltip("This is a tooltip", [Text("Hover me for tooltip")]),
  ])
}

// 反馈组件页面

///|
struct FeedbackPageProps {
  
} derive(Default)

impl @react.JsValueTrait for FeedbackPageProps with to_value(_self) -> @react.JsValue {
  @react.JsObject::new().to_value()
}

///|
impl @react.JsValueTrait for FeedbackPageProps with from_value(
  _value : @react.JsValue,
) -> FeedbackPageProps {
  FeedbackPageProps::default()
}

///|
fn render_feedback_page(props : FeedbackPageProps) -> VirtualNode {
  let (modal_open, set_modal_open) = @react.use_state(false)
  let (drawer_open, set_drawer_open) = @react.use_state(false)
  
  @react.div([
    @antd.typography_title(level=Level3, [Text("Alert 警告提示")]),
    @antd.alert("This is an info alert"),
    @antd.divider([]),
    
    @antd.typography_title(level=Level3, [Text("Modal 对话框")]),
    @antd.button(
      type_=Primary,
      on_click=fn(_) { set_modal_open(true) },
      [Text("打开 Modal")]
    ),
    @antd.modal(
      title="Basic Modal",
      open=modal_open,
      on_ok=fn(_) { set_modal_open(false) },
      on_cancel=fn(_) { set_modal_open(false) },
      [Text("这是一个基本的 Modal 对话框示例。")]
    ),
    @antd.divider([]),
    
    @antd.typography_title(level=Level3, [Text("Drawer 抽屉")]),
    @antd.button(
      type_=Primary,
      on_click=fn(_) { set_drawer_open(true) },
      [Text("打开 Drawer")]
    ),
    @antd.drawer(
      title="Basic Drawer",
      open=drawer_open,
      on_close=fn(_) { set_drawer_open(false) },
      [Text("这是一个基本的 Drawer 抽屉示例。")]
    ),
    @antd.divider([]),
    
    @antd.typography_title(level=Level3, [Text("Progress 进度条")]),
    @antd.progress(50),
    @antd.divider([]),
    @antd.typography_title(level=Level3, [Text("Spin 加载中")]),
    @antd.spin([Text("Loading content...")]),
  ])
}

// 其他组件页面

///|
fn render_other_page() -> VirtualNode {
  @react.div([
    @antd.typography_title(level=Level3, [Text("Affix 固钉")]),
    @antd.typography_text([Text("Affix component implemented")]),
    @antd.divider([]),
    @antd.typography_title(level=Level3, [Text("App 包裹组件")]),
    @antd.typography_text([Text("App component implemented")]),
    @antd.divider([]),
    @antd.typography_title(level=Level3, [
      Text("ConfigProvider 全局化配置"),
    ]),
    @antd.typography_text([Text("ConfigProvider component implemented")]),
    @antd.divider([]),
    @antd.typography_title(level=Level3, [Text("FloatButton 悬浮按钮")]),
    @antd.typography_text([Text("FloatButton component implemented")]),
    @antd.divider([]),
    @antd.typography_title(level=Level3, [Text("BackTop 回到顶部")]),
    @antd.typography_text([Text("BackTop component implemented")]),
  ])
}

///|
fn main {
  let window = @dom.window()
  let doc = window.document()
  let body = doc.body()
  let props = ContainerProps::default()
  @react.render(@react.component(comp_container, props, []), body)
  println("loaded")
}

///|
let style_counter : String = @react.static_style([
  ("&", respo_style(margin_bottom=20.0 |> Px, padding=10.0 |> Px)),
])
