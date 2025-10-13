///|
/// Affix 组件 - 固钉
/// 将页面元素钉在可视范围，常用于侧边菜单和按钮组

// ============= Affix 组件 =============

///|
pub fn affix(
  offset_top? : Int,
  offset_bottom? : Int,
  target? : String,
  class_name? : String,
  style? : @css.RespoStyle,
  on_change? : (Bool) -> Unit,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  if offset_top is Some(offset) {
    js_props.set("offsetTop", @dom.v_to_js_obscure(offset))
  }
  if offset_bottom is Some(offset) {
    js_props.set("offsetBottom", @dom.v_to_js_obscure(offset))
  }
  if target is Some(target) {
    js_props.set("target", @dom.v_to_js_obscure(target))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  if on_change is Some(callback) {
    js_props.set("onChange", @dom.v_to_js_obscure(callback))
  }
  @react.JsNode(
    antd_affix(js_props, children.map(fn(child) { child.to_js_value() })),
  )
}

///|
extern "js" fn antd_affix(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Affix, props, ...children)
  #| }
