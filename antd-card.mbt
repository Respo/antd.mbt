///|
/// Card 组件 - 卡片
/// 通用卡片容器

// ============= Card 组件 =============

pub(all) enum CardSize {
  Default
  Small
} derive(Show)

///|
pub fn card(
  title? : String,
  extra? : @react.VirtualNode,
  bordered? : Bool,
  hoverable? : Bool,
  loading? : Bool,
  size? : CardSize,
  class_name? : String,
  style? : @css.RespoStyle,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  if title is Some(title) {
    js_props.set("title", @dom.v_to_js_obscure(title))
  }
  if extra is Some(extra) {
    js_props.set("extra", @dom.v_to_js_obscure(extra.to_js_value()))
  }
  if bordered is Some(bordered) {
    js_props.set("bordered", @dom.v_to_js_obscure(bordered))
  }
  if hoverable is Some(hoverable) {
    js_props.set("hoverable", @dom.v_to_js_obscure(hoverable))
  }
  if loading is Some(loading) {
    js_props.set("loading", @dom.v_to_js_obscure(loading))
  }
  if size is Some(s) {
    let size_str = match s {
      Default => "default"
      Small => "small"
    }
    js_props.set("size", @dom.v_to_js_obscure(size_str))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  let react_children = children.map(fn(child) { child.to_js_value() })
  @react.JsNode(antd_card(js_props, react_children))
}

///|
extern "js" fn antd_card(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Card, props, ...children)
  #| }
