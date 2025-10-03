///|
/// Result 组件 - 结果页
/// 用于反馈一系列操作任务的处理结果

// ============= Result 组件 =============

///|
pub(all) enum ResultStatus {
  Success
  Error
  Info
  Warning
  Status404
  Status403
  Status500
} derive(Show)

///|
pub fn result(
  status : ResultStatus,
  title? : String,
  sub_title? : String,
  extra? : Array[@react.VirtualNode],
  class_name? : String,
  style? : @css.RespoStyle,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  let status_str = match status {
    Success => "success"
    Error => "error"
    Info => "info"
    Warning => "warning"
    Status404 => "404"
    Status403 => "403"
    Status500 => "500"
  }
  js_props.set("status", @dom.v_to_js_obscure(status_str))
  if title is Some(title) {
    js_props.set("title", @dom.v_to_js_obscure(title))
  }
  if sub_title is Some(sub_title) {
    js_props.set("subTitle", @dom.v_to_js_obscure(sub_title))
  }
  if extra is Some(extra) {
    let extra_js = extra.map(fn(child) { child.to_js_value() })
    js_props.set("extra", @dom.v_to_js_obscure(extra_js))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  let react_children = children.map(fn(child) { child.to_js_value() })
  @react.JsNode(antd_result(js_props, react_children))
}

///|
extern "js" fn antd_result(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Result, props, ...children)
  #| }
