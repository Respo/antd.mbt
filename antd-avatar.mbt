///|
// Ant Design Avatar Component
// Avatar 头像组件

pub(all) enum AvatarSize {
  Large
  Default
  Small
} derive(Show)

///|
pub(all) enum AvatarShape {
  Circle
  Square
} derive(Show)

///|
pub fn avatar(
  size? : AvatarSize,
  shape? : AvatarShape,
  src? : String,
  alt? : String,
  icon? : @react.VirtualNode,
  class_name? : String,
  style? : @css.RespoStyle,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  if size is Some(s) {
    let size_str = match s {
      Large => "large"
      Default => "default"
      Small => "small"
    }
    js_props.set("size", @dom.v_to_js_obscure(size_str))
  }
  if shape is Some(sh) {
    let shape_str = match sh {
      Circle => "circle"
      Square => "square"
    }
    js_props.set("shape", @dom.v_to_js_obscure(shape_str))
  }
  if src is Some(src) {
    js_props.set("src", @dom.v_to_js_obscure(src))
  }
  if alt is Some(alt) {
    js_props.set("alt", @dom.v_to_js_obscure(alt))
  }
  if icon is Some(icon) {
    js_props.set("icon", @dom.v_to_js_obscure(icon.to_js_value()))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  let react_children = children.map(fn(child) { child.to_js_value() })
  @react.JsNode(antd_avatar(js_props, react_children))
}

///|
extern "js" fn antd_avatar(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Avatar, props, ...children)
  #| }
