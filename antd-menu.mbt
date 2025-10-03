///|
/// Menu 组件 - 导航菜单
/// 为页面和功能提供导航的菜单列表

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

///|
extern "js" fn antd_menu(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Menu, props, ...children)
  #| }
