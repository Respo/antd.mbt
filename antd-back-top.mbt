///|
/// BackTop 组件 - 回到顶部
/// 返回页面顶部的操作按钮

// ============= BackTop 组件 =============

///|
pub fn back_top(
  visibility_height? : Int,
  target? : String,
  duration? : Int,
  class_name? : String,
  style? : @css.RespoStyle,
  on_click? : () -> Unit,
  children? : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  if visibility_height is Some(height) {
    js_props.set("visibilityHeight", @dom.v_to_js_obscure(height))
  }
  if target is Some(target) {
    js_props.set("target", @dom.v_to_js_obscure(target))
  }
  if duration is Some(duration) {
    js_props.set("duration", @dom.v_to_js_obscure(duration))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  if on_click is Some(callback) {
    js_props.set("onClick", @dom.v_to_js_obscure(callback))
  }
  let react_children = match children {
    Some(children) => children.map(fn(child) { child.to_js_value() })
    None => []
  }
  @react.JsNode(antd_back_top(js_props, react_children))
}

///|
extern "js" fn antd_back_top(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.BackTop, props, ...children)
  #| }
