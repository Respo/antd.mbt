// Layout 分类组件绑定

// Divider 组件

///|
pub(all) enum DividerType {
  Horizontal
  Vertical
} derive(Show)

///|
pub(all) enum DividerOrientation {
  Left
  Right
  Center
} derive(Show)

///|
pub fn divider(
  dashed? : Bool,
  orientation? : DividerOrientation,
  orientation_margin? : String,
  plain? : Bool,
  type_? : DividerType,
  class_name? : String,
  style? : @css.RespoStyle,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  if dashed is Some(dashed) {
    js_props.set("dashed", @dom.v_to_js_obscure(dashed))
  } else {
    js_props.set("dashed", @dom.v_to_js_obscure(false))
  }
  if orientation is Some(orientation) {
    js_props.set("orientation", @dom.v_to_js_obscure(orientation.to_string()))
  }
  if orientation_margin is Some(orientation_margin) {
    js_props.set("orientationMargin", @dom.v_to_js_obscure(orientation_margin))
  }
  if plain is Some(plain) {
    js_props.set("plain", @dom.v_to_js_obscure(plain))
  } else {
    js_props.set("plain", @dom.v_to_js_obscure(false))
  }
  if type_ is Some(type_) {
    js_props.set("type", @dom.v_to_js_obscure(type_.to_string()))
  } else {
    js_props.set("type", @dom.v_to_js_obscure("horizontal"))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  let react_children = children.map(fn(child) { child.to_js_value() })
  @react.JsNode(antd_divider(js_props, react_children))
}

///|
extern "js" fn antd_divider(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Divider, props, ...children)
  #| }

// Flex 组件

///|
pub(all) enum FlexJustify {
  FlexStart
  FlexEnd
  Center
  SpaceBetween
  SpaceAround
  SpaceEvenly
} derive(Show)

///|
pub(all) enum FlexAlign {
  FlexStart
  FlexEnd
  Center
  Stretch
  Baseline
} derive(Show)

///|
pub(all) enum FlexWrap {
  NoWrap
  Wrap
  WrapReverse
} derive(Show)

///|
pub(all) enum FlexValue {
  None
  Auto
  Initial
  Inherit
  Custom(String) // 支持自定义 flex 值，如 "1", "0 1 auto" 等
} derive(Show)

///|
pub(all) enum FlexGap {
  Small
  Middle
  Large
  Custom(String) // 支持自定义间距值，如 "16px", "1rem" 等
} derive(Show)

///|
pub fn flex(
  vertical? : Bool,
  wrap? : FlexWrap,
  justify? : FlexJustify,
  align? : FlexAlign,
  flex? : FlexValue,
  gap? : FlexGap,
  class_name? : String,
  style? : @css.RespoStyle,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  if vertical is Some(vertical) {
    js_props.set("vertical", @dom.v_to_js_obscure(vertical))
  } else {
    js_props.set("vertical", @dom.v_to_js_obscure(false))
  }
  if wrap is Some(wrap) {
    js_props.set(
      "wrap",
      @dom.v_to_js_obscure(wrap.to_string().replace(old="_", new="-")),
    )
  }
  if justify is Some(justify) {
    js_props.set(
      "justify",
      @dom.v_to_js_obscure(justify.to_string().replace(old="_", new="-")),
    )
  }
  if align is Some(align) {
    js_props.set(
      "align",
      @dom.v_to_js_obscure(align.to_string().replace(old="_", new="-")),
    )
  }
  if flex is Some(flex) {
    let flex_value = match flex {
      FlexValue::None => "none"
      FlexValue::Auto => "auto"
      FlexValue::Initial => "initial"
      FlexValue::Inherit => "inherit"
      FlexValue::Custom(value) => value
    }
    js_props.set("flex", @dom.v_to_js_obscure(flex_value))
  }
  if gap is Some(gap) {
    let gap_value = match gap {
      FlexGap::Small => "small"
      FlexGap::Middle => "middle"
      FlexGap::Large => "large"
      FlexGap::Custom(value) => value
    }
    js_props.set("gap", @dom.v_to_js_obscure(gap_value))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  let react_children = children.map(fn(child) { child.to_js_value() })
  @react.JsNode(antd_flex(js_props, react_children))
}

///|
extern "js" fn antd_flex(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Flex, props, ...children)
  #| }

// Space 组件

///|
pub(all) enum SpaceDirection {
  Horizontal
  Vertical
} derive(Show)

///|
pub(all) enum SpaceSize {
  Small
  Middle
  Large
  Custom(String)
} derive(Show)

///|
pub fn space(
  direction? : SpaceDirection,
  size? : SpaceSize,
  align? : FlexAlign,
  wrap? : Bool,
  split? : @react.VirtualNode,
  class_name? : String,
  style? : @css.RespoStyle,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  if direction is Some(direction) {
    js_props.set("direction", @dom.v_to_js_obscure(direction.to_string()))
  } else {
    js_props.set("direction", @dom.v_to_js_obscure("horizontal"))
  }
  if size is Some(size) {
    match size {
      Small => js_props.set("size", @dom.v_to_js_obscure("small"))
      Middle => js_props.set("size", @dom.v_to_js_obscure("middle"))
      Large => js_props.set("size", @dom.v_to_js_obscure("large"))
      Custom(s) => js_props.set("size", @dom.v_to_js_obscure(s))
    }
  } else {
    js_props.set("size", @dom.v_to_js_obscure("middle"))
  }
  if align is Some(align) {
    js_props.set(
      "align",
      @dom.v_to_js_obscure(align.to_string().replace(old="_", new="-")),
    )
  }
  if wrap is Some(wrap) {
    js_props.set("wrap", @dom.v_to_js_obscure(wrap))
  } else {
    js_props.set("wrap", @dom.v_to_js_obscure(false))
  }
  if split is Some(split) {
    js_props.set("split", @dom.v_to_js_obscure(split.to_js_value()))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  let react_children = children.map(fn(child) { child.to_js_value() })
  @react.JsNode(antd_space(js_props, react_children))
}

///|
extern "js" fn antd_space(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Space, props, ...children)
  #| }

// Layout 组件

///|
pub fn layout(
  has_sider? : Bool,
  class_name? : String,
  style? : @css.RespoStyle,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  if has_sider is Some(has_sider) {
    js_props.set("hasSider", @dom.v_to_js_obscure(has_sider))
  } else {
    js_props.set("hasSider", @dom.v_to_js_obscure(false))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  let react_children = children.map(fn(child) { child.to_js_value() })
  @react.JsNode(antd_layout(js_props, react_children))
}

///|
extern "js" fn antd_layout(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Layout, props, ...children)
  #| }

// Layout.Header 组件

///|
pub fn layout_header(
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
  let react_children = children.map(fn(child) { child.to_js_value() })
  @react.JsNode(antd_layout_header(js_props, react_children))
}

///|
extern "js" fn antd_layout_header(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Layout.Header, props, ...children)
  #| }

// Layout.Content 组件

///|
pub fn layout_content(
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
  let react_children = children.map(fn(child) { child.to_js_value() })
  @react.JsNode(antd_layout_content(js_props, react_children))
}

///|
extern "js" fn antd_layout_content(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Layout.Content, props, ...children)
  #| }

// Layout.Footer 组件

///|
pub fn layout_footer(
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
  let react_children = children.map(fn(child) { child.to_js_value() })
  @react.JsNode(antd_layout_footer(js_props, react_children))
}

///|
extern "js" fn antd_layout_footer(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Layout.Footer, props, ...children)
  #| }
