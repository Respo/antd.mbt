///|
// Ant Design Feedback Components
// 反馈组件：用于向用户提供反馈信息的各种组件

// ============= Alert 组件 =============

pub(all) enum AlertType {
  Success
  Info
  Warning
  Error
} derive(Show)

///|
pub fn alert(
  message : String,
  alert_type? : AlertType,
  description? : String,
  closable? : Bool,
  show_icon? : Bool,
  class_name? : String,
  style? : @css.RespoStyle,
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  js_props.set("message", @dom.v_to_js_obscure(message))
  if alert_type is Some(t) {
    let type_str = match t {
      Success => "success"
      Info => "info"
      Warning => "warning"
      Error => "error"
    }
    js_props.set("type", @dom.v_to_js_obscure(type_str))
  }
  if description is Some(desc) {
    js_props.set("description", @dom.v_to_js_obscure(desc))
  }
  if closable is Some(closable) {
    js_props.set("closable", @dom.v_to_js_obscure(closable))
  }
  if show_icon is Some(show_icon) {
    js_props.set("showIcon", @dom.v_to_js_obscure(show_icon))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  @react.JsNode(antd_alert(js_props, []))
}

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

// ============= Progress 组件 =============

///|
pub(all) enum ProgressType {
  Line
  Circle
  Dashboard
} derive(Show)

///|
pub(all) enum ProgressStatus {
  Success
  Exception
  Normal
  Active
} derive(Show)

///|
pub fn progress(
  percent : Int,
  progress_type? : ProgressType,
  status? : ProgressStatus,
  show_info? : Bool,
  stroke_color? : String,
  trail_color? : String,
  class_name? : String,
  style? : @css.RespoStyle,
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  js_props.set("percent", @dom.v_to_js_obscure(percent))
  if progress_type is Some(t) {
    let type_str = match t {
      Line => "line"
      Circle => "circle"
      Dashboard => "dashboard"
    }
    js_props.set("type", @dom.v_to_js_obscure(type_str))
  }
  if status is Some(s) {
    let status_str = match s {
      Success => "success"
      Exception => "exception"
      Normal => "normal"
      Active => "active"
    }
    js_props.set("status", @dom.v_to_js_obscure(status_str))
  }
  if show_info is Some(show_info) {
    js_props.set("showInfo", @dom.v_to_js_obscure(show_info))
  }
  if stroke_color is Some(stroke_color) {
    js_props.set("strokeColor", @dom.v_to_js_obscure(stroke_color))
  }
  if trail_color is Some(trail_color) {
    js_props.set("trailColor", @dom.v_to_js_obscure(trail_color))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  @react.JsNode(antd_progress(js_props, []))
}

// ============= Spin 组件 =============

///|
pub(all) enum SpinSize {
  Small
  Default
  Large
} derive(Show)

///|
pub fn spin(
  spinning? : Bool,
  size? : SpinSize,
  tip? : String,
  delay? : Int,
  class_name? : String,
  style? : @css.RespoStyle,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  if spinning is Some(spinning) {
    js_props.set("spinning", @dom.v_to_js_obscure(spinning))
  }
  if size is Some(s) {
    let size_str = match s {
      Small => "small"
      Default => "default"
      Large => "large"
    }
    js_props.set("size", @dom.v_to_js_obscure(size_str))
  }
  if tip is Some(tip) {
    js_props.set("tip", @dom.v_to_js_obscure(tip))
  }
  if delay is Some(delay) {
    js_props.set("delay", @dom.v_to_js_obscure(delay))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  let react_children = children.map(fn(child) { child.to_js_value() })
  @react.JsNode(antd_spin(js_props, react_children))
}

// ============= Result 组件 =============

///|
pub(all) enum ResultStatus {
  Success
  Error
  Info
  Warning
  Status404
  Status403
  Status500
} derive(Show)

///|
pub fn result(
  status : ResultStatus,
  title? : String,
  sub_title? : String,
  extra? : Array[@react.VirtualNode],
  class_name? : String,
  style? : @css.RespoStyle,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  let status_str = match status {
    Success => "success"
    Error => "error"
    Info => "info"
    Warning => "warning"
    Status404 => "404"
    Status403 => "403"
    Status500 => "500"
  }
  js_props.set("status", @dom.v_to_js_obscure(status_str))
  if title is Some(title) {
    js_props.set("title", @dom.v_to_js_obscure(title))
  }
  if sub_title is Some(sub_title) {
    js_props.set("subTitle", @dom.v_to_js_obscure(sub_title))
  }
  if extra is Some(extra) {
    let extra_js = extra.map(fn(child) { child.to_js_value() })
    js_props.set("extra", @dom.v_to_js_obscure(extra_js))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  let react_children = children.map(fn(child) { child.to_js_value() })
  @react.JsNode(antd_result(js_props, react_children))
}

// ============= 外部函数定义 =============

///|
extern "js" fn antd_alert(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Alert, props, ...children)
  #| }

///|
extern "js" fn antd_modal(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Modal, props, ...children)
  #| }

///|
extern "js" fn antd_progress(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Progress, props, ...children)
  #| }

///|
extern "js" fn antd_spin(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Spin, props, ...children)
  #| }

///|
extern "js" fn antd_result(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Result, props, ...children)
  #| }
