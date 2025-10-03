///|
/// FloatButton 组件 - 悬浮按钮
/// 悬浮在页面上的按钮，用于快速操作

// ============= FloatButton 组件 =============

///|
pub(all) enum FloatButtonType {
  Default
  Primary
} derive(Show)

///|
pub(all) enum FloatButtonShape {
  Circle
  Square
} derive(Show)

///|
pub fn float_button(
  icon? : @react.VirtualNode,
  description? : String,
  tooltip? : String,
  type_? : FloatButtonType,
  shape? : FloatButtonShape,
  href? : String,
  target? : String,
  class_name? : String,
  style? : @css.RespoStyle,
  on_click? : () -> Unit,
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  if icon is Some(icon) {
    js_props.set("icon", @dom.v_to_js_obscure(icon.to_js_value()))
  }
  if description is Some(description) {
    js_props.set("description", @dom.v_to_js_obscure(description))
  }
  if tooltip is Some(tooltip) {
    js_props.set("tooltip", @dom.v_to_js_obscure(tooltip))
  }
  if type_ is Some(t) {
    let type_str = match t {
      Default => "default"
      Primary => "primary"
    }
    js_props.set("type", @dom.v_to_js_obscure(type_str))
  }
  if shape is Some(s) {
    let shape_str = match s {
      Circle => "circle"
      Square => "square"
    }
    js_props.set("shape", @dom.v_to_js_obscure(shape_str))
  }
  if href is Some(href) {
    js_props.set("href", @dom.v_to_js_obscure(href))
  }
  if target is Some(target) {
    js_props.set("target", @dom.v_to_js_obscure(target))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  if on_click is Some(callback) {
    js_props.set("onClick", @dom.v_to_js_obscure(callback))
  }
  @react.JsNode(antd_float_button(js_props, []))
}

///|
pub fn float_button_group(
  trigger? : String,
  open? : Bool,
  class_name? : String,
  style? : @css.RespoStyle,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  if trigger is Some(trigger) {
    js_props.set("trigger", @dom.v_to_js_obscure(trigger))
  }
  if open is Some(open) {
    js_props.set("open", @dom.v_to_js_obscure(open))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  @react.JsNode(
    antd_float_button_group(
      js_props,
      children.map(fn(child) { child.to_js_value() }),
    ),
  )
}

///|
extern "js" fn antd_float_button(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.FloatButton, props, ...children)
  #| }

///|
extern "js" fn antd_float_button_group(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.FloatButton.Group, props, ...children)
  #| }
