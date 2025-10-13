///|
/// Modal 组件 - 对话框
/// 模态对话框，在浮层中显示，引导用户进行相关操作

// ============= Modal 组件 =============

///|
pub fn modal(
  title? : String,
  open? : Bool,
  ok_text? : String,
  cancel_text? : String,
  width? : Int,
  centered? : Bool,
  mask_closable? : Bool,
  class_name? : String,
  style? : @css.RespoStyle,
  on_ok? : (@react.DOMEvent) -> Unit,
  on_cancel? : (@react.DOMEvent) -> Unit,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  if title is Some(title) {
    js_props.set("title", @dom.v_to_js_obscure(title))
  }
  if open is Some(open) {
    js_props.set("open", @dom.v_to_js_obscure(open))
  }
  if ok_text is Some(ok_text) {
    js_props.set("okText", @dom.v_to_js_obscure(ok_text))
  }
  if cancel_text is Some(cancel_text) {
    js_props.set("cancelText", @dom.v_to_js_obscure(cancel_text))
  }
  if width is Some(width) {
    js_props.set("width", @dom.v_to_js_obscure(width))
  }
  if centered is Some(centered) {
    js_props.set("centered", @dom.v_to_js_obscure(centered))
  }
  if mask_closable is Some(mask_closable) {
    js_props.set("maskClosable", @dom.v_to_js_obscure(mask_closable))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  if on_ok is Some(on_ok) {
    js_props.set("onOk", @dom.v_to_js_obscure(on_ok))
  }
  if on_cancel is Some(on_cancel) {
    js_props.set("onCancel", @dom.v_to_js_obscure(on_cancel))
  }
  let react_children = children.map(fn(child) { child.to_js_value() })
  @react.JsNode(antd_modal(js_props, react_children))
}

///|
extern "js" fn antd_modal(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Modal, props, ...children)
  #| }
