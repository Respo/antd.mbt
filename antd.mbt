///|
pub(all) enum ButtonType {
  Primary
  Dashed
  Link
  Text
  Default
}

///|
pub impl Default for ButtonType with default() -> ButtonType {
  Default
}

///|
pub impl Show for ButtonType with output(self : ButtonType, logger : &Logger) {
  match self {
    Primary => logger.write_string("primary")
    Dashed => logger.write_string("dashed")
    Link => logger.write_string("link")
    Text => logger.write_string("text")
    Default => logger.write_string("default")
  }
}

///|
pub fn button(
  type_? : ButtonType,
  on_click? : (@react.DOMEvent) -> Unit,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  if type_ is Some(type_) {
    js_props.set("type", @dom.v_to_js_obscure(type_.to_string()))
  }
  if on_click is Some(on_click) {
    js_props.set("onClick", @dom.v_to_js_obscure(on_click))
  }
  let react_children = children.map(fn(child) { child.to_js_value() })
  JsNode(antd_button(js_props, react_children))
}

///|
extern "js" fn antd_button(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Button, props, ...children)
  #| }
