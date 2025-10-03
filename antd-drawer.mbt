///|
/// Drawer 组件 - 抽屉
/// 屏幕边缘滑出的浮层面板

// ============= Drawer 组件 =============

///|
pub(all) enum DrawerPlacement {
  Top
  Right
  Bottom
  Left
}

///|
impl Show for DrawerPlacement with output(self, logger) {
  match self {
    Top => logger.write_string("top")
    Right => logger.write_string("right")
    Bottom => logger.write_string("bottom")
    Left => logger.write_string("left")
  }
}

///|
pub fn drawer(
  title? : String,
  open? : Bool,
  width? : Int,
  height? : Int,
  placement? : DrawerPlacement,
  closable? : Bool,
  mask_closable? : Bool,
  mask? : Bool,
  keyboard? : Bool,
  push? : Bool,
  class_name? : String,
  style? : @css.RespoStyle,
  on_close? : (@react.DOMEvent) -> Unit,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  if title is Some(title) {
    js_props.set("title", @dom.v_to_js_obscure(title))
  }
  if open is Some(open) {
    js_props.set("open", @dom.v_to_js_obscure(open))
  }
  if width is Some(width) {
    js_props.set("width", @dom.v_to_js_obscure(width))
  }
  if height is Some(height) {
    js_props.set("height", @dom.v_to_js_obscure(height))
  }
  if placement is Some(placement) {
    js_props.set("placement", @dom.v_to_js_obscure(placement.to_string()))
  }
  if closable is Some(closable) {
    js_props.set("closable", @dom.v_to_js_obscure(closable))
  }
  if mask_closable is Some(mask_closable) {
    js_props.set("maskClosable", @dom.v_to_js_obscure(mask_closable))
  }
  if mask is Some(mask) {
    js_props.set("mask", @dom.v_to_js_obscure(mask))
  }
  if keyboard is Some(keyboard) {
    js_props.set("keyboard", @dom.v_to_js_obscure(keyboard))
  }
  if push is Some(push) {
    js_props.set("push", @dom.v_to_js_obscure(push))
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
  @react.JsNode(antd_drawer(js_props, react_children))
}

///|
extern "js" fn antd_drawer(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Drawer, props, ...children)
  #| }