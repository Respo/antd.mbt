///|
/// Alert 组件 - 警告提示
/// 警告提示，展现需要关注的信息

// ============= Alert 组件 =============

pub(all) enum AlertType {
  Success
  Info
  Warning
  Error
} derive(Show)

///|
pub fn alert(
  message : String,
  alert_type? : AlertType,
  description? : String,
  closable? : Bool,
  show_icon? : Bool,
  class_name? : String,
  style? : @css.RespoStyle,
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  js_props.set("message", @dom.v_to_js_obscure(message))
  if alert_type is Some(t) {
    let type_str = match t {
      Success => "success"
      Info => "info"
      Warning => "warning"
      Error => "error"
    }
    js_props.set("type", @dom.v_to_js_obscure(type_str))
  }
  if description is Some(desc) {
    js_props.set("description", @dom.v_to_js_obscure(desc))
  }
  if closable is Some(closable) {
    js_props.set("closable", @dom.v_to_js_obscure(closable))
  }
  if show_icon is Some(show_icon) {
    js_props.set("showIcon", @dom.v_to_js_obscure(show_icon))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  @react.JsNode(antd_alert(js_props, []))
}

///|
extern "js" fn antd_alert(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Alert, props, ...children)
  #| }
