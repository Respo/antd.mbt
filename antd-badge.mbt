///|
/// Badge 组件 - 徽标数
/// 图标右上角的圆形徽标数字

// ============= Badge 组件 =============

pub(all) enum BadgeStatus {
  Success
  Processing
  Default
  Error
  Warning
} derive(Show)

///|
pub fn badge(
  count? : Int,
  dot? : Bool,
  show_zero? : Bool,
  status? : BadgeStatus,
  text? : String,
  title? : String,
  class_name? : String,
  style? : @css.RespoStyle,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  if count is Some(count) {
    js_props.set("count", @dom.v_to_js_obscure(count))
  }
  if dot is Some(dot) {
    js_props.set("dot", @dom.v_to_js_obscure(dot))
  }
  if show_zero is Some(show_zero) {
    js_props.set("showZero", @dom.v_to_js_obscure(show_zero))
  }
  if status is Some(st) {
    let status_str = match st {
      Success => "success"
      Processing => "processing"
      Default => "default"
      Error => "error"
      Warning => "warning"
    }
    js_props.set("status", @dom.v_to_js_obscure(status_str))
  }
  if text is Some(text) {
    js_props.set("text", @dom.v_to_js_obscure(text))
  }
  if title is Some(title) {
    js_props.set("title", @dom.v_to_js_obscure(title))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  let react_children = children.map(fn(child) { child.to_js_value() })
  @react.JsNode(antd_badge(js_props, react_children))
}

///|
extern "js" fn antd_badge(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Badge, props, ...children)
  #| }
