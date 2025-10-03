///|
/// ConfigProvider 组件 - 全局配置提供者
/// 为组件提供统一的全局化配置

// ============= ConfigProvider 组件 =============

///|
pub(all) enum ConfigDirection {
  Ltr
  Rtl
} derive(Show)

///|
pub(all) enum ConfigSize {
  Small
  Middle
  Large
} derive(Show)

///|
pub fn config_provider(
  locale? : String,
  direction? : ConfigDirection,
  theme? : @dom.JsObjectObscure,
  component_size? : ConfigSize,
  prefix_cls? : String,
  class_name? : String,
  style? : @css.RespoStyle,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  if locale is Some(locale) {
    js_props.set("locale", @dom.v_to_js_obscure(locale))
  }
  if direction is Some(dir) {
    let direction_str = match dir {
      Ltr => "ltr"
      Rtl => "rtl"
    }
    js_props.set("direction", @dom.v_to_js_obscure(direction_str))
  }
  if theme is Some(theme) {
    js_props.set("theme", @dom.v_to_js_obscure(theme))
  }
  if component_size is Some(size) {
    let size_str = match size {
      Small => "small"
      Middle => "middle"
      Large => "large"
    }
    js_props.set("componentSize", @dom.v_to_js_obscure(size_str))
  }
  if prefix_cls is Some(prefix) {
    js_props.set("prefixCls", @dom.v_to_js_obscure(prefix))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  @react.JsNode(
    antd_config_provider(
      js_props,
      children.map(fn(child) { child.to_js_value() }),
    ),
  )
}

///|
extern "js" fn antd_config_provider(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.ConfigProvider, props, ...children)
  #| }
