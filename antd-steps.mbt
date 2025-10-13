///|
/// Steps 组件 - 步骤条
/// 引导用户按照流程完成任务的导航条

// ============= Steps 组件 =============

///|
pub(all) enum StepsDirection {
  Horizontal
  Vertical
} derive(Show)

///|
pub(all) enum StepsSize {
  Default
  Small
} derive(Show)

///|
pub(all) enum StepsStatus {
  Wait
  Process
  Finish
  Error
} derive(Show)

///|
pub fn steps(
  current? : Int,
  direction? : StepsDirection,
  size? : StepsSize,
  status? : StepsStatus,
  class_name? : String,
  style? : @css.RespoStyle,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  if current is Some(current) {
    js_props.set("current", @dom.v_to_js_obscure(current))
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
      Default => "default"
      Small => "small"
    }
    js_props.set("size", @dom.v_to_js_obscure(size_str))
  }
  if status is Some(st) {
    let status_str = match st {
      Wait => "wait"
      Process => "process"
      Finish => "finish"
      Error => "error"
    }
    js_props.set("status", @dom.v_to_js_obscure(status_str))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  @react.JsNode(
    antd_steps(js_props, children.map(fn(child) { child.to_js_value() })),
  )
}

///|
pub fn steps_step(
  title : String,
  description? : String,
  icon? : @react.VirtualNode,
  status? : StepsStatus,
  disabled? : Bool,
  class_name? : String,
  style? : @css.RespoStyle,
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  js_props.set("title", @dom.v_to_js_obscure(title))
  if description is Some(description) {
    js_props.set("description", @dom.v_to_js_obscure(description))
  }
  if icon is Some(icon) {
    js_props.set("icon", @dom.v_to_js_obscure(icon.to_js_value()))
  }
  if status is Some(st) {
    let status_str = match st {
      Wait => "wait"
      Process => "process"
      Finish => "finish"
      Error => "error"
    }
    js_props.set("status", @dom.v_to_js_obscure(status_str))
  }
  if disabled is Some(disabled) {
    js_props.set("disabled", @dom.v_to_js_obscure(disabled))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  @react.JsNode(antd_steps_step(js_props, []))
}

///|
extern "js" fn antd_steps(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Steps, props, ...children)
  #| }

///|
extern "js" fn antd_steps_step(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Steps.Step, props, ...children)
  #| }
