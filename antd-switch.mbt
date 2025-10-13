///|
/// Switch 组件 - 开关
/// 开关选择器

// ============= Switch 组件 =============

pub(all) enum SwitchSize {
  Default
  Small
} derive(Show)

///|
pub fn switch(
  checked? : Bool,
  default_checked? : Bool,
  disabled? : Bool,
  loading? : Bool,
  size? : SwitchSize,
  checked_children? : @react.VirtualNode,
  un_checked_children? : @react.VirtualNode,
  class_name? : String,
  style? : @css.RespoStyle,
  on_change? : (@react.DOMEvent) -> Unit,
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  if checked is Some(checked) {
    js_props.set("checked", @dom.v_to_js_obscure(checked))
  }
  if default_checked is Some(default_checked) {
    js_props.set("defaultChecked", @dom.v_to_js_obscure(default_checked))
  }
  if disabled is Some(disabled) {
    js_props.set("disabled", @dom.v_to_js_obscure(disabled))
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
  if checked_children is Some(checked_children) {
    js_props.set(
      "checkedChildren",
      @dom.v_to_js_obscure(checked_children.to_js_value()),
    )
  }
  if un_checked_children is Some(un_checked_children) {
    js_props.set(
      "unCheckedChildren",
      @dom.v_to_js_obscure(un_checked_children.to_js_value()),
    )
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  if on_change is Some(on_change) {
    js_props.set("onChange", @dom.v_to_js_obscure(on_change))
  }
  @react.JsNode(antd_switch(js_props, []))
}

///|
extern "js" fn antd_switch(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Switch, props, ...children)
  #| }
