///|
/// App 组件 - 应用包裹器
/// 提供全局配置和上下文，包括消息、通知、模态框等全局方法

// ============= App 组件 =============

///|
pub fn app(
  class_name? : String,
  style? : @css.RespoStyle,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  @react.JsNode(
    antd_app(js_props, children.map(fn(child) { child.to_js_value() })),
  )
}

///|
extern "js" fn antd_app(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.App, props, ...children)
  #| }
