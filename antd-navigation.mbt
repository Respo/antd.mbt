// Navigation Components for Ant Design
// 导航组件：Anchor, Breadcrumb, Dropdown, Menu, Pagination, Steps, Tabs

// ============= Breadcrumb 组件 =============

///|
pub(all) struct BreadcrumbItem {
  title : String
  href : String?
  class_name : String?
} derive(Show)

///|
pub fn BreadcrumbItem::new(
  title : String,
  href : String?,
  class_name : String?,
) -> BreadcrumbItem {
  { title, href, class_name }
}

///|
pub fn breadcrumb(
  items : Array[BreadcrumbItem],
  separator? : String,
  class_name? : String,
  style? : @css.RespoStyle,
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()

  // 转换 items 为 JavaScript 对象数组
  let js_items = items.map(fn(item) {
    let item_obj = @dom.new_js_object()
    item_obj.set("title", @dom.v_to_js_obscure(item.title))
    if item.href is Some(href) {
      item_obj.set("href", @dom.v_to_js_obscure(href))
    }
    if item.class_name is Some(class_name) {
      item_obj.set("className", @dom.v_to_js_obscure(class_name))
    }
    item_obj
  })
  js_props.set("items", @dom.v_to_js_obscure(js_items))
  if separator is Some(separator) {
    js_props.set("separator", @dom.v_to_js_obscure(separator))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  @react.JsNode(antd_breadcrumb(js_props, []))
}

// ============= Menu 组件 =============

///|
pub(all) enum MenuMode {
  Vertical
  Horizontal
  Inline
} derive(Show)

///|
pub(all) enum MenuTheme {
  Light
  Dark
} derive(Show)

///|
pub(all) struct MenuItem {
  key : String
  label : String
  disabled : Bool?
  icon : @react.VirtualNode?
}

///|
pub fn MenuItem::new(
  key : String,
  label : String,
  disabled : Bool?,
  icon : @react.VirtualNode?,
) -> MenuItem {
  { key, label, disabled, icon }
}

///|
pub fn menu(
  items : Array[MenuItem],
  mode? : MenuMode,
  theme? : MenuTheme,
  default_selected_keys? : Array[String],
  selected_keys? : Array[String],
  class_name? : String,
  style? : @css.RespoStyle,
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()

  // 转换 items 为 JavaScript 对象数组
  let js_items = items.map(fn(item) {
    let item_obj = @dom.new_js_object()
    item_obj.set("key", @dom.v_to_js_obscure(item.key))
    item_obj.set("label", @dom.v_to_js_obscure(item.label))
    if item.disabled is Some(disabled) {
      item_obj.set("disabled", @dom.v_to_js_obscure(disabled))
    }
    if item.icon is Some(icon) {
      item_obj.set("icon", @dom.v_to_js_obscure(icon.to_js_value()))
    }
    item_obj
  })
  js_props.set("items", @dom.v_to_js_obscure(js_items))
  if mode is Some(m) {
    let mode_str = match m {
      Vertical => "vertical"
      Horizontal => "horizontal"
      Inline => "inline"
    }
    js_props.set("mode", @dom.v_to_js_obscure(mode_str))
  }
  if theme is Some(t) {
    let theme_str = match t {
      Light => "light"
      Dark => "dark"
    }
    js_props.set("theme", @dom.v_to_js_obscure(theme_str))
  }
  if default_selected_keys is Some(keys) {
    js_props.set("defaultSelectedKeys", @dom.v_to_js_obscure(keys))
  }
  if selected_keys is Some(keys) {
    js_props.set("selectedKeys", @dom.v_to_js_obscure(keys))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  @react.JsNode(antd_menu(js_props, []))
}

// ============= Steps 组件 =============

///|
pub(all) enum StepsDirection {
  Horizontal
  Vertical
} derive(Show)

///|
pub(all) enum StepsSize {
  Default
  Small
} derive(Show)

///|
pub(all) enum StepsStatus {
  Wait
  Process
  Finish
  Error
} derive(Show)

///|
pub fn steps(
  current? : Int,
  direction? : StepsDirection,
  size? : StepsSize,
  status? : StepsStatus,
  class_name? : String,
  style? : @css.RespoStyle,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  if current is Some(current) {
    js_props.set("current", @dom.v_to_js_obscure(current))
  }
  if direction is Some(d) {
    let direction_str = match d {
      Horizontal => "horizontal"
      Vertical => "vertical"
    }
    js_props.set("direction", @dom.v_to_js_obscure(direction_str))
  }
  if size is Some(s) {
    let size_str = match s {
      Default => "default"
      Small => "small"
    }
    js_props.set("size", @dom.v_to_js_obscure(size_str))
  }
  if status is Some(st) {
    let status_str = match st {
      Wait => "wait"
      Process => "process"
      Finish => "finish"
      Error => "error"
    }
    js_props.set("status", @dom.v_to_js_obscure(status_str))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  let react_children = children.map(fn(child) { child.to_js_value() })
  @react.JsNode(antd_steps(js_props, react_children))
}

///|
pub fn steps_step(
  title : String,
  description? : String,
  disabled? : Bool,
  icon? : @react.VirtualNode,
  status? : StepsStatus,
  class_name? : String,
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  js_props.set("title", @dom.v_to_js_obscure(title))
  if description is Some(description) {
    js_props.set("description", @dom.v_to_js_obscure(description))
  }
  if disabled is Some(disabled) {
    js_props.set("disabled", @dom.v_to_js_obscure(disabled))
  }
  if icon is Some(icon) {
    js_props.set("icon", @dom.v_to_js_obscure(icon.to_js_value()))
  }
  if status is Some(st) {
    let status_str = match st {
      Wait => "wait"
      Process => "process"
      Finish => "finish"
      Error => "error"
    }
    js_props.set("status", @dom.v_to_js_obscure(status_str))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  @react.JsNode(antd_steps_step(js_props, []))
}

// ============= 外部函数定义 =============

///|
extern "js" fn antd_breadcrumb(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Breadcrumb, props, ...children)
  #| }

///|
extern "js" fn antd_menu(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Menu, props, ...children)
  #| }

///|
extern "js" fn antd_steps(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Steps, props, ...children)
  #| }

///|
extern "js" fn antd_steps_step(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Steps.Step, props, ...children)
  #| }
