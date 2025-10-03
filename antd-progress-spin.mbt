///|
/// Progress & Spin 组件 - 进度条和加载中
/// 展示操作的当前进度和加载状态

// ============= Progress 组件 =============

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

// ============= 外部函数定义 =============

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
