///|
/// FlatButton type enum - Defines the visual style of the flat button
/// Property: type
/// Type: default | primary
/// Default value: default
/// Description: Setting button type
/// - Default: Default flat button appearance
/// - Primary: Primary flat button with emphasis styling
pub(all) enum FlatButtonType {
  /// Default flat button type - standard appearance
  Default
  /// Primary flat button type - used for main actions
  Primary
}

///|
pub impl Default for FlatButtonType with default() -> FlatButtonType {
  Default
}

///|
pub impl Show for FlatButtonType with output(
  self : FlatButtonType,
  logger : &Logger,
) {
  match self {
    Default => logger.write_string("default")
    Primary => logger.write_string("primary")
  }
}

///|
/// FlatButton shape enum - Defines the geometric shape of the flat button
/// Property: shape
/// Type: circle | square
/// Default value: circle
/// Description: Setting button shape
/// - Circle: Circular shape flat button
/// - Square: Square shape flat button
pub(all) enum FlatButtonShape {
  /// Circle flat button shape - circular button
  Circle
  /// Square flat button shape - square button
  Square
}

///|
pub impl Default for FlatButtonShape with default() -> FlatButtonShape {
  Circle
}

///|
pub impl Show for FlatButtonShape with output(
  self : FlatButtonShape,
  logger : &Logger,
) {
  match self {
    Circle => logger.write_string("circle")
    Square => logger.write_string("square")
  }
}

///|
/// FlatButton HTML type enum - Defines the native HTML type attribute of the flat button
/// Property: htmlType
/// Type: submit | reset | button
/// Default value: button
/// Description: Set the original html type of button, see: MDN
/// Version: 5.21.0
/// - Button: Standard button behavior
/// - Submit: Submit form behavior
/// - Reset: Reset form behavior
pub(all) enum FlatButtonHtmlType {
  /// Standard button type - default behavior
  Button
  /// Submit button type - submits form data
  Submit
  /// Reset button type - resets form fields
  Reset
}

///|
pub impl Default for FlatButtonHtmlType with default() -> FlatButtonHtmlType {
  Button
}

///|
pub impl Show for FlatButtonHtmlType with output(
  self : FlatButtonHtmlType,
  logger : &Logger,
) {
  match self {
    Button => logger.write_string("button")
    Submit => logger.write_string("submit")
    Reset => logger.write_string("reset")
  }
}

///|
/// FlatButtonGroup trigger enum - Defines which action can trigger menu open/close
/// Property: trigger
/// Type: click | hover
/// Default value: -
/// Description: Which action can trigger menu open/close
/// - Click: Trigger on click action
/// - Hover: Trigger on hover action
pub(all) enum FlatButtonGroupTrigger {
  /// Click trigger - menu opens/closes on click
  Click
  /// Hover trigger - menu opens/closes on hover
  Hover
}

///|
pub impl Show for FlatButtonGroupTrigger with output(
  self : FlatButtonGroupTrigger,
  logger : &Logger,
) {
  match self {
    Click => logger.write_string("click")
    Hover => logger.write_string("hover")
  }
}

///|
/// FlatButtonGroup placement enum - Defines the menu animation placement
/// Property: placement
/// Type: top | left | right | bottom
/// Default value: top
/// Description: Customize menu animation placement
/// Version: 5.21.0
/// - Top: Menu appears at the top
/// - Left: Menu appears at the left
/// - Right: Menu appears at the right
/// - Bottom: Menu appears at the bottom
pub(all) enum FlatButtonGroupPlacement {
  /// Top placement - menu appears at the top
  Top
  /// Left placement - menu appears at the left
  Left
  /// Right placement - menu appears at the right
  Right
  /// Bottom placement - menu appears at the bottom
  Bottom
}

///|
pub impl Default for FlatButtonGroupPlacement with default() -> FlatButtonGroupPlacement {
  Top
}

///|
pub impl Show for FlatButtonGroupPlacement with output(
  self : FlatButtonGroupPlacement,
  logger : &Logger,
) {
  match self {
    Top => logger.write_string("top")
    Left => logger.write_string("left")
    Right => logger.write_string("right")
    Bottom => logger.write_string("bottom")
  }
}

///|
/// FlatButton component - Creates an Ant Design flat button with various styling options
/// ## Parameters
/// - icon?: VirtualNode - Set the icon component of button
/// - description?: VirtualNode - Text and other content
/// - tooltip?: VirtualNode - The text shown in the tooltip (TooltipProps: 5.25.0)
/// - type_?: FlatButtonType - Setting button type (see FlatButtonType enum)
/// - shape?: FlatButtonShape - Setting button shape (see FlatButtonShape enum)
/// - on_click?: (DOMEvent) -> Unit - Set the handler to handle click event
/// - href?: String - The target of hyperlink
/// - target?: String - Specifies where to display the linked URL
/// - html_type?: FlatButtonHtmlType - Set the original html type of button (see FlatButtonHtmlType enum, version: 5.21.0)
/// - badge?: VirtualNode - Attach Badge to FloatButton (status and other props related are not supported, version: 5.4.0)
pub fn flat_button(
  icon? : @react.VirtualNode,
  description? : @react.VirtualNode,
  tooltip? : @react.VirtualNode,
  type_? : FlatButtonType,
  shape? : FlatButtonShape,
  on_click? : (@react.DOMEvent) -> Unit,
  href? : String,
  target? : String,
  html_type? : FlatButtonHtmlType,
  badge? : @react.VirtualNode,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  if icon is Some(icon) {
    js_props.set("icon", @dom.v_to_js_obscure(icon.to_js_value()))
  }
  if description is Some(description) {
    js_props.set("description", @dom.v_to_js_obscure(description.to_js_value()))
  }
  if tooltip is Some(tooltip) {
    js_props.set("tooltip", @dom.v_to_js_obscure(tooltip.to_js_value()))
  }
  if type_ is Some(type_) {
    js_props.set("type", @dom.v_to_js_obscure(type_.to_string()))
  }
  if shape is Some(shape) {
    js_props.set("shape", @dom.v_to_js_obscure(shape.to_string()))
  }
  if on_click is Some(on_click) {
    js_props.set("onClick", @dom.v_to_js_obscure(on_click))
  }
  if href is Some(href) {
    js_props.set("href", @dom.v_to_js_obscure(href))
  }
  if target is Some(target) {
    js_props.set("target", @dom.v_to_js_obscure(target))
  }
  if html_type is Some(html_type) {
    js_props.set("htmlType", @dom.v_to_js_obscure(html_type.to_string()))
  }
  if badge is Some(badge) {
    js_props.set("badge", @dom.v_to_js_obscure(badge.to_js_value()))
  }
  let react_children = children.map(fn(child) { child.to_js_value() })
  @react.JsNode(antd_flat_button(js_props, react_children))
}

///|
/// FlatButtonGroup component - Creates an Ant Design flat button group with various styling options
/// ## Parameters
/// - shape?: FlatButtonShape - Setting button shape of children (see FlatButtonShape enum)
/// - trigger?: FlatButtonGroupTrigger - Which action can trigger menu open/close (see FlatButtonGroupTrigger enum)
/// - open?: Bool - Whether the menu is visible or not, use it with trigger
/// - close_icon?: VirtualNode - Customize close button icon (default: <CloseOutlined />)
/// - placement?: FlatButtonGroupPlacement - Customize menu animation placement (see FlatButtonGroupPlacement enum, version: 5.21.0)
/// - on_open_change?: (Bool) -> Unit - Callback executed when active menu is changed, use it with trigger
/// - on_click?: (DOMEvent) -> Unit - Set the handler to handle click event (only work in Menu mode, version: 5.3.0)
/// - children: Array[VirtualNode] - Button group content
pub fn flat_button_group(
  shape? : FlatButtonShape,
  trigger? : FlatButtonGroupTrigger,
  open? : Bool,
  close_icon? : @react.VirtualNode,
  placement? : FlatButtonGroupPlacement,
  on_open_change? : (Bool) -> Unit,
  on_click? : (@react.DOMEvent) -> Unit,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  if shape is Some(shape) {
    js_props.set("shape", @dom.v_to_js_obscure(shape.to_string()))
  }
  if trigger is Some(trigger) {
    js_props.set("trigger", @dom.v_to_js_obscure(trigger.to_string()))
  }
  if open is Some(open) {
    js_props.set("open", @dom.v_to_js_obscure(open))
  }
  if close_icon is Some(close_icon) {
    js_props.set("closeIcon", @dom.v_to_js_obscure(close_icon.to_js_value()))
  }
  if placement is Some(placement) {
    js_props.set("placement", @dom.v_to_js_obscure(placement.to_string()))
  }
  if on_open_change is Some(on_open_change) {
    js_props.set("onOpenChange", @dom.v_to_js_obscure(on_open_change))
  }
  if on_click is Some(on_click) {
    js_props.set("onClick", @dom.v_to_js_obscure(on_click))
  }
  let react_children = children.map(fn(child) { child.to_js_value() })
  @react.JsNode(antd_flat_button_group(js_props, react_children))
}

///|
extern "js" fn antd_flat_button(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.FloatButton, props, ...children)
  #| }

///|
extern "js" fn antd_flat_button_group(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.FloatButton.Group, props, ...children)
  #| }
