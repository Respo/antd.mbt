///|
/// Checkbox 和 Radio 组件 - 复选框和单选框
/// 在一组可选项中进行多选或单选

// ============= Checkbox 组件 =============

pub fn checkbox(
  checked? : Bool,
  default_checked? : Bool,
  disabled? : Bool,
  indeterminate? : Bool,
  class_name? : String,
  style? : @css.RespoStyle,
  on_change? : (@react.DOMEvent) -> Unit,
  children : Array[@react.VirtualNode],
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
  if indeterminate is Some(indeterminate) {
    js_props.set("indeterminate", @dom.v_to_js_obscure(indeterminate))
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
  let children_js = children.map(fn(child) { child.to_js_value() })
  @react.JsNode(antd_checkbox(js_props, children_js))
}

// ============= Radio 组件 =============

///|
pub fn radio(
  checked? : Bool,
  default_checked? : Bool,
  disabled? : Bool,
  value? : String,
  class_name? : String,
  style? : @css.RespoStyle,
  on_change? : (@react.DOMEvent) -> Unit,
  children : Array[@react.VirtualNode],
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
  if value is Some(value) {
    js_props.set("value", @dom.v_to_js_obscure(value))
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
  let children_js = children.map(fn(child) { child.to_js_value() })
  @react.JsNode(antd_radio(js_props, children_js))
}

// ============= RadioGroup 组件 =============

///|
pub(all) enum RadioGroupDirection {
  Horizontal
  Vertical
} derive(Show)

///|
pub struct RadioOption {
  label : String
  value : String
  disabled : Bool?
}

///|
pub fn RadioOption::new(
  label : String,
  value : String,
  disabled : Bool?,
) -> RadioOption {
  { label, value, disabled }
}

///|
pub fn radio_group(
  options : Array[RadioOption],
  value? : String,
  default_value? : String,
  disabled? : Bool,
  direction? : RadioGroupDirection,
  class_name? : String,
  style? : @css.RespoStyle,
  on_change? : (@react.DOMEvent) -> Unit,
  children? : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()

  // 转换 options 为 JavaScript 对象数组
  let js_options = options.map(fn(option) {
    let option_obj = @dom.new_js_object()
    option_obj.set("label", @dom.v_to_js_obscure(option.label))
    option_obj.set("value", @dom.v_to_js_obscure(option.value))
    if option.disabled is Some(disabled) {
      option_obj.set("disabled", @dom.v_to_js_obscure(disabled))
    }
    option_obj
  })
  js_props.set("options", @dom.v_to_js_obscure(js_options))
  if value is Some(value) {
    js_props.set("value", @dom.v_to_js_obscure(value))
  }
  if default_value is Some(default_value) {
    js_props.set("defaultValue", @dom.v_to_js_obscure(default_value))
  }
  if disabled is Some(disabled) {
    js_props.set("disabled", @dom.v_to_js_obscure(disabled))
  }
  if direction is Some(d) {
    let direction_str = match d {
      Horizontal => "horizontal"
      Vertical => "vertical"
    }
    js_props.set("direction", @dom.v_to_js_obscure(direction_str))
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
  let children_js = match children {
    Some(children) => children.map(fn(child) { child.to_js_value() })
    None => []
  }
  @react.JsNode(antd_radio_group(js_props, children_js))
}

// ============= 外部函数定义 =============

///|
extern "js" fn antd_checkbox(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Checkbox, props, ...children)
  #| }

///|
extern "js" fn antd_radio(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Radio, props, ...children)
  #| }

///|
extern "js" fn antd_radio_group(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Radio.Group, props, ...children)
  #| }
