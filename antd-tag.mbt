///|
/// Tag 组件 - 标签
/// 进行标记和分类的小标签

// ============= Tag 组件 =============

pub(all) enum TagColor {
  Default
  Success
  Processing
  Error
  Warning
} derive(Show)

///|
pub fn tag(
  color? : TagColor,
  closable? : Bool,
  class_name? : String,
  style? : @css.RespoStyle,
  on_close? : (@react.DOMEvent) -> Unit,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  if color is Some(c) {
    let color_str = match c {
      Default => "default"
      Success => "success"
      Processing => "processing"
      Error => "error"
      Warning => "warning"
    }
    js_props.set("color", @dom.v_to_js_obscure(color_str))
  }
  if closable is Some(closable) {
    js_props.set("closable", @dom.v_to_js_obscure(closable))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  if on_close is Some(on_close) {
    js_props.set("onClose", @dom.v_to_js_obscure(on_close))
  }
  let react_children = children.map(fn(child) { child.to_js_value() })
  @react.JsNode(antd_tag(js_props, react_children))
}

///|
extern "js" fn antd_tag(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Tag, props, ...children)
  #| }
