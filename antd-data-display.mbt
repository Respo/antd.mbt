///|
// Ant Design Data Display Components
// 数据展示组件：用于展示和呈现数据的各种组件

// ============= Avatar 组件 =============

pub(all) enum AvatarSize {
  Large
  Default
  Small
} derive(Show)

pub(all) enum AvatarShape {
  Circle
  Square
} derive(Show)

pub fn avatar(
  size? : AvatarSize,
  shape? : AvatarShape,
  src? : String,
  alt? : String,
  icon? : @react.VirtualNode,
  class_name? : String,
  style? : @css.RespoStyle,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  if size is Some(s) {
    let size_str = match s {
      Large => "large"
      Default => "default"
      Small => "small"
    }
    js_props.set("size", @dom.v_to_js_obscure(size_str))
  }
  if shape is Some(sh) {
    let shape_str = match sh {
      Circle => "circle"
      Square => "square"
    }
    js_props.set("shape", @dom.v_to_js_obscure(shape_str))
  }
  if src is Some(src) {
    js_props.set("src", @dom.v_to_js_obscure(src))
  }
  if alt is Some(alt) {
    js_props.set("alt", @dom.v_to_js_obscure(alt))
  }
  if icon is Some(icon) {
    js_props.set("icon", @dom.v_to_js_obscure(icon.to_js_value()))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  let react_children = children.map(fn(child) { child.to_js_value() })
  @react.JsNode(antd_avatar(js_props, react_children))
}

// ============= Badge 组件 =============

pub(all) enum BadgeStatus {
  Success
  Processing
  Default
  Error
  Warning
} derive(Show)

pub fn badge(
  count? : Int,
  dot? : Bool,
  show_zero? : Bool,
  status? : BadgeStatus,
  text? : String,
  title? : String,
  class_name? : String,
  style? : @css.RespoStyle,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  if count is Some(count) {
    js_props.set("count", @dom.v_to_js_obscure(count))
  }
  if dot is Some(dot) {
    js_props.set("dot", @dom.v_to_js_obscure(dot))
  }
  if show_zero is Some(show_zero) {
    js_props.set("showZero", @dom.v_to_js_obscure(show_zero))
  }
  if status is Some(st) {
    let status_str = match st {
      Success => "success"
      Processing => "processing"
      Default => "default"
      Error => "error"
      Warning => "warning"
    }
    js_props.set("status", @dom.v_to_js_obscure(status_str))
  }
  if text is Some(text) {
    js_props.set("text", @dom.v_to_js_obscure(text))
  }
  if title is Some(title) {
    js_props.set("title", @dom.v_to_js_obscure(title))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  let react_children = children.map(fn(child) { child.to_js_value() })
  @react.JsNode(antd_badge(js_props, react_children))
}

// ============= Card 组件 =============

pub(all) enum CardSize {
  Default
  Small
} derive(Show)

pub fn card(
  title? : String,
  extra? : @react.VirtualNode,
  bordered? : Bool,
  hoverable? : Bool,
  loading? : Bool,
  size? : CardSize,
  class_name? : String,
  style? : @css.RespoStyle,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  if title is Some(title) {
    js_props.set("title", @dom.v_to_js_obscure(title))
  }
  if extra is Some(extra) {
    js_props.set("extra", @dom.v_to_js_obscure(extra.to_js_value()))
  }
  if bordered is Some(bordered) {
    js_props.set("bordered", @dom.v_to_js_obscure(bordered))
  }
  if hoverable is Some(hoverable) {
    js_props.set("hoverable", @dom.v_to_js_obscure(hoverable))
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
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  let react_children = children.map(fn(child) { child.to_js_value() })
  @react.JsNode(antd_card(js_props, react_children))
}

// ============= Tag 组件 =============

pub(all) enum TagColor {
  Default
  Success
  Processing
  Error
  Warning
} derive(Show)

pub fn tag(
  color? : TagColor,
  closable? : Bool,
  class_name? : String,
  style? : @css.RespoStyle,
  on_close? : (@react.DOMEvent) -> Unit,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  if color is Some(c) {
    let color_str = match c {
      Default => "default"
      Success => "success"
      Processing => "processing"
      Error => "error"
      Warning => "warning"
    }
    js_props.set("color", @dom.v_to_js_obscure(color_str))
  }
  if closable is Some(closable) {
    js_props.set("closable", @dom.v_to_js_obscure(closable))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  if on_close is Some(on_close) {
    js_props.set("onClose", @dom.v_to_js_obscure(on_close))
  }
  let react_children = children.map(fn(child) { child.to_js_value() })
  @react.JsNode(antd_tag(js_props, react_children))
}

// ============= Tooltip 组件 =============

pub(all) enum TooltipPlacement {
  Top
  Left
  Right
  Bottom
  TopLeft
  TopRight
  BottomLeft
  BottomRight
  LeftTop
  LeftBottom
  RightTop
  RightBottom
} derive(Show)

pub fn tooltip(
  title : String,
  placement? : TooltipPlacement,
  class_name? : String,
  style? : @css.RespoStyle,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  js_props.set("title", @dom.v_to_js_obscure(title))
  if placement is Some(p) {
    let placement_str = match p {
      Top => "top"
      Left => "left"
      Right => "right"
      Bottom => "bottom"
      TopLeft => "topLeft"
      TopRight => "topRight"
      BottomLeft => "bottomLeft"
      BottomRight => "bottomRight"
      LeftTop => "leftTop"
      LeftBottom => "leftBottom"
      RightTop => "rightTop"
      RightBottom => "rightBottom"
    }
    js_props.set("placement", @dom.v_to_js_obscure(placement_str))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  let react_children = children.map(fn(child) { child.to_js_value() })
  @react.JsNode(antd_tooltip(js_props, react_children))
}

// ============= 外部函数定义 =============

///|
extern "js" fn antd_avatar(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Avatar, props, ...children)
  #| }

///|
extern "js" fn antd_badge(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Badge, props, ...children)
  #| }

///|
extern "js" fn antd_card(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Card, props, ...children)
  #| }

///|
extern "js" fn antd_tag(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Tag, props, ...children)
  #| }

///|
extern "js" fn antd_tooltip(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Tooltip, props, ...children)
  #| }