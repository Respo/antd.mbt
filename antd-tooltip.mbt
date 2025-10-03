///|
/// Tooltip 组件 - 文字提示
/// 简单的文字提示气泡框

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

///|
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

///|
extern "js" fn antd_tooltip(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Tooltip, props, ...children)
  #| }
