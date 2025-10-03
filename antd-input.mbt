///|
/// Input 组件 - 输入框
/// 通过鼠标或键盘输入内容，是最基础的表单域的包装

// ============= Input 组件 =============

pub(all) enum InputSize {
  Large
  Middle
  Small
} derive(Show)

///|
pub(all) enum InputStatus {
  Error
  Warning
} derive(Show)

///|
pub fn input(
  value? : String,
  default_value? : String,
  placeholder? : String,
  size? : InputSize,
  status? : InputStatus,
  disabled? : Bool,
  max_length? : Int,
  show_count? : Bool,
  allow_clear? : Bool,
  class_name? : String,
  style? : @css.RespoStyle,
  on_change? : (@react.DOMEvent) -> Unit,
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  if value is Some(value) {
    js_props.set("value", @dom.v_to_js_obscure(value))
  }
  if default_value is Some(default_value) {
    js_props.set("defaultValue", @dom.v_to_js_obscure(default_value))
  }
  if placeholder is Some(placeholder) {
    js_props.set("placeholder", @dom.v_to_js_obscure(placeholder))
  }
  if size is Some(s) {
    let size_str = match s {
      Large => "large"
      Middle => "middle"
      Small => "small"
    }
    js_props.set("size", @dom.v_to_js_obscure(size_str))
  }
  if status is Some(st) {
    let status_str = match st {
      Error => "error"
      Warning => "warning"
    }
    js_props.set("status", @dom.v_to_js_obscure(status_str))
  }
  if disabled is Some(disabled) {
    js_props.set("disabled", @dom.v_to_js_obscure(disabled))
  }
  if max_length is Some(max_length) {
    js_props.set("maxLength", @dom.v_to_js_obscure(max_length))
  }
  if show_count is Some(show_count) {
    js_props.set("showCount", @dom.v_to_js_obscure(show_count))
  }
  if allow_clear is Some(allow_clear) {
    js_props.set("allowClear", @dom.v_to_js_obscure(allow_clear))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  if on_change is Some(on_change) {
    js_props.set("onChange", @dom.v_to_js_obscure(on_change))
  }
  @react.JsNode(antd_input(js_props, []))
}

///|
extern "js" fn antd_input(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Input, props, ...children)
  #| }
