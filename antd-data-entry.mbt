///|
// Ant Design Data Entry Components
// 数据录入组件：用于收集用户输入的各种表单控件

// ============= Input 组件 =============

pub(all) enum InputSize {
  Large
  Middle
  Small
} derive(Show)

pub(all) enum InputStatus {
  Error
  Warning
} derive(Show)

pub fn input(
  value? : String,
  default_value? : String,
  placeholder? : String,
  size? : InputSize,
  status? : InputStatus,
  disabled? : Bool,
  max_length? : Int,
  show_count? : Bool,
  allow_clear? : Bool,
  class_name? : String,
  style? : @css.RespoStyle,
  on_change? : (@react.DOMEvent) -> Unit,
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  if value is Some(value) {
    js_props.set("value", @dom.v_to_js_obscure(value))
  }
  if default_value is Some(default_value) {
    js_props.set("defaultValue", @dom.v_to_js_obscure(default_value))
  }
  if placeholder is Some(placeholder) {
    js_props.set("placeholder", @dom.v_to_js_obscure(placeholder))
  }
  if size is Some(s) {
    let size_str = match s {
      Large => "large"
      Middle => "middle"
      Small => "small"
    }
    js_props.set("size", @dom.v_to_js_obscure(size_str))
  }
  if status is Some(st) {
    let status_str = match st {
      Error => "error"
      Warning => "warning"
    }
    js_props.set("status", @dom.v_to_js_obscure(status_str))
  }
  if disabled is Some(disabled) {
    js_props.set("disabled", @dom.v_to_js_obscure(disabled))
  }
  if max_length is Some(max_length) {
    js_props.set("maxLength", @dom.v_to_js_obscure(max_length))
  }
  if show_count is Some(show_count) {
    js_props.set("showCount", @dom.v_to_js_obscure(show_count))
  }
  if allow_clear is Some(allow_clear) {
    js_props.set("allowClear", @dom.v_to_js_obscure(allow_clear))
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
  @react.JsNode(antd_input(js_props, []))
}

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
  let react_children = children.map(fn(child) { child.to_js_value() })
  @react.JsNode(antd_checkbox(js_props, react_children))
}

// ============= Radio 组件 =============

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
  let react_children = children.map(fn(child) { child.to_js_value() })
  @react.JsNode(antd_radio(js_props, react_children))
}

pub(all) enum RadioGroupDirection {
  Horizontal
  Vertical
} derive(Show)

pub struct RadioOption {
  label : String
  value : String
  disabled : Bool?
}

pub fn RadioOption::new(label : String, value : String, disabled : Bool?) -> RadioOption {
  { label, value, disabled }
}

pub fn radio_group(
  options : Array[RadioOption],
  value? : String,
  default_value? : String,
  disabled? : Bool,
  direction? : RadioGroupDirection,
  size? : InputSize,
  class_name? : String,
  style? : @css.RespoStyle,
  on_change? : (@react.DOMEvent) -> Unit,
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
  if size is Some(s) {
    let size_str = match s {
      Large => "large"
      Middle => "middle"
      Small => "small"
    }
    js_props.set("size", @dom.v_to_js_obscure(size_str))
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
  @react.JsNode(antd_radio_group(js_props, []))
}

// ============= Switch 组件 =============

pub(all) enum SwitchSize {
  Default
  Small
} derive(Show)

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
    js_props.set("checkedChildren", @dom.v_to_js_obscure(checked_children.to_js_value()))
  }
  if un_checked_children is Some(un_checked_children) {
    js_props.set("unCheckedChildren", @dom.v_to_js_obscure(un_checked_children.to_js_value()))
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

// ============= 外部函数定义 =============

///|
extern "js" fn antd_input(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Input, props, ...children)
  #| }

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

///|
extern "js" fn antd_switch(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Switch, props, ...children)
  #| }