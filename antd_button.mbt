///|
/// Button type enum - Defines the visual style and behavior of the button
/// Property: type
/// Type: primary | dashed | link | text | default
/// Default value: default
/// Description: Syntactic sugar. Set button type. Will follow variant & color if provided
/// - Primary: Primary button with emphasis styling
/// - Dashed: Button with dashed border
/// - Link: Button styled as a link
/// - Text: Button with text-only styling
/// - Default: Standard button appearance
pub(all) enum ButtonType {
  /// Primary button type - used for main actions
  Primary
  /// Dashed button type - button with dashed border
  Dashed
  /// Link button type - renders as a link
  Link
  /// Text button type - renders as plain text
  Text
  /// Default button type - standard button appearance
  Default
}

///|
pub impl Default for ButtonType with default() -> ButtonType {
  Default
}

///|
pub impl Show for ButtonType with output(self : ButtonType, logger : &Logger) {
  match self {
    Primary => logger.write_string("primary")
    Dashed => logger.write_string("dashed")
    Link => logger.write_string("link")
    Text => logger.write_string("text")
    Default => logger.write_string("default")
  }
}

///|
/// Preset color enum - Predefined color options for buttons
/// Available since version 5.23.0
pub(all) enum PresetColor {
  /// Blue preset color
  Blue
  /// Purple preset color
  Purple
  /// Cyan preset color
  Cyan
  /// Green preset color
  Green
  /// Magenta preset color
  Magenta
  /// Pink preset color
  Pink
  /// Red preset color
  Red
  /// Orange preset color
  Orange
  /// Yellow preset color
  Yellow
  /// Volcano preset color
  Volcano
  /// Geek blue preset color
  Geekblue
  /// Lime preset color
  Lime
  /// Gold preset color
  Gold
}

///|
pub impl Show for PresetColor with output(self : PresetColor, logger : &Logger) {
  match self {
    Blue => logger.write_string("blue")
    Purple => logger.write_string("purple")
    Cyan => logger.write_string("cyan")
    Green => logger.write_string("green")
    Magenta => logger.write_string("magenta")
    Pink => logger.write_string("pink")
    Red => logger.write_string("red")
    Orange => logger.write_string("orange")
    Yellow => logger.write_string("yellow")
    Volcano => logger.write_string("volcano")
    Geekblue => logger.write_string("geekblue")
    Lime => logger.write_string("lime")
    Gold => logger.write_string("gold")
  }
}

///|
/// Button color enum - Defines the color scheme of the button
/// Property: color
/// Type: default | primary | danger | PresetColors
/// Default value: -
/// Description: Set button color
/// Version: default, primary and danger: 5.21.0, PresetColors: 5.23.0
/// - Default: Default color scheme
/// - Primary: Primary color scheme
/// - Danger: Danger/error color scheme
/// - Preset: Uses preset color from PresetColor enum
pub(all) enum ButtonColor {
  /// Default button color
  Default
  /// Primary button color
  Primary
  /// Danger button color - indicates dangerous actions
  Danger
  /// Preset color option - uses predefined color palette
  Preset(PresetColor)
}

///|
pub impl Show for ButtonColor with output(self : ButtonColor, logger : &Logger) {
  match self {
    Default => logger.write_string("default")
    Primary => logger.write_string("primary")
    Danger => logger.write_string("danger")
    Preset(color) => logger.write_string(color.to_string())
  }
}

///|
/// Button HTML type enum - Defines the native HTML type attribute of the button
/// Property: htmlType
/// Type: submit | reset | button
/// Default value: button
/// Description: Set the original html type of button, see: MDN
/// - Button: Standard button behavior
/// - Submit: Submit form behavior
/// - Reset: Reset form behavior
pub(all) enum ButtonHtmlType {
  /// Standard button type - default behavior
  Button
  /// Submit button type - submits form data
  Submit
  /// Reset button type - resets form fields
  Reset
}

///|
pub impl Show for ButtonHtmlType with output(
  self : ButtonHtmlType,
  logger : &Logger,
) {
  match self {
    Button => logger.write_string("button")
    Submit => logger.write_string("submit")
    Reset => logger.write_string("reset")
  }
}

///|
/// Button icon position enum - Defines the position of the icon relative to the button text
/// Property: iconPosition
/// Type: start | end
/// Default value: start
/// Description: Set the icon position of button
/// Version: 5.17.0
/// - Start: Icon positioned at the start (left in LTR)
/// - End: Icon positioned at the end (right in LTR)
pub(all) enum ButtonIconPosition {
  /// Icon positioned at the start (left side)
  Start
  /// Icon positioned at the end (right side)
  End
}

///|
pub impl Show for ButtonIconPosition with output(
  self : ButtonIconPosition,
  logger : &Logger,
) {
  match self {
    Start => logger.write_string("start")
    End => logger.write_string("end")
  }
}

///|
/// Button shape enum - Defines the geometric shape of the button
/// Property: shape
/// Type: default | circle | round
/// Default value: default
/// Description: Can be used to set button shape
/// - Default: Standard rectangular shape
/// - Circle: Circular shape (equal width and height)
/// - Round: Rounded corners
pub(all) enum ButtonShape {
  /// Default button shape - standard rectangular shape
  Default
  /// Circle button shape - circular button
  Circle
  /// Round button shape - rounded corners
  Round
}

///|
pub impl Show for ButtonShape with output(self : ButtonShape, logger : &Logger) {
  match self {
    Default => logger.write_string("default")
    Circle => logger.write_string("circle")
    Round => logger.write_string("round")
  }
}

///|
/// Button size enum - Defines the size of the button
/// Property: size
/// Type: large | middle | small
/// Default value: middle
/// Description: Set the size of button
/// - Large: Large button size
/// - Middle: Medium button size (default)
/// - Small: Small button size
pub(all) enum ButtonSize {
  /// Large button size
  Large
  /// Middle button size - default size
  Middle
  /// Small button size
  Small
}

///|
pub impl Show for ButtonSize with output(self : ButtonSize, logger : &Logger) {
  match self {
    Large => logger.write_string("large")
    Middle => logger.write_string("middle")
    Small => logger.write_string("small")
  }
}

///|
/// Button variant enum - Defines the visual variant style of the button
/// Property: variant
/// Type: outlined | dashed | solid | filled | text | link
/// Default value: -
/// Description: Set button variant
/// Version: 5.21.0
/// - Solid: Solid filled button
/// - Outlined: Button with outline border
/// - Dashed: Button with dashed border
/// - Filled: Filled button variant
/// - Text: Text-only button
/// - Link: Link-styled button
pub(all) enum ButtonVariant {
  /// Solid button variant - filled background
  Solid
  /// Outlined button variant - border only
  Outlined
  /// Dashed button variant - dashed border
  Dashed
  /// Filled button variant - completely filled
  Filled
  /// Text button variant - text only, no background or border
  Text
  /// Link button variant - appears as a link
  Link
}

///|
pub impl Show for ButtonVariant with output(
  self : ButtonVariant,
  logger : &Logger,
) {
  match self {
    Solid => logger.write_string("solid")
    Outlined => logger.write_string("outlined")
    Dashed => logger.write_string("dashed")
    Filled => logger.write_string("filled")
    Text => logger.write_string("text")
    Link => logger.write_string("link")
  }
}

///|
/// Button component - Creates an Ant Design button with various styling options
/// ## Parameters
/// - type_: ButtonType - Button type (see ButtonType enum)
/// - auto_insert_space?: Bool - Add space between Chinese characters (default: true, version: 5.17.0)
/// - block?: Bool - Fit button width to parent width (default: false)
/// - class_names?: HashMap[String, String] - Semantic DOM class names (version: 5.4.0)
/// - color?: ButtonColor - Button color scheme (see ButtonColor enum)
/// - danger?: Bool - Set danger status, follows color if provided (default: false)
/// - disabled?: Bool - Disabled state (default: false)
/// - ghost?: Bool - Transparent background with inverted colors (default: false)
/// - href?: String - Redirect URL for link button
/// - html_type?: ButtonHtmlType - Native HTML type (see ButtonHtmlType enum)
/// - icon?: VirtualNode - Icon component for the button
/// - icon_position?: ButtonIconPosition - Icon position (see ButtonIconPosition enum)
/// - loading?: Bool - Loading state with optional delay and custom icon (default: false, icon version: 5.23.0)
/// - shape?: ButtonShape - Button shape (see ButtonShape enum)
/// - size?: ButtonSize - Button size (see ButtonSize enum)
/// - styles?: HashMap[String, RespoStyle] - Semantic DOM styles (version: 5.4.0)
/// - target?: String - Link target attribute, works with href
/// - on_click?: (DOMEvent) -> Unit - Click event handler
/// - variant?: ButtonVariant - Button variant (see ButtonVariant enum)
/// - children: Array[VirtualNode] - Button content
pub fn button(
  type_? : ButtonType,
  auto_insert_space? : Bool,
  block? : Bool,
  class_names? : @hashmap.HashMap[String, String],
  color? : ButtonColor,
  danger? : Bool,
  disabled? : Bool,
  ghost? : Bool,
  href? : String,
  html_type? : ButtonHtmlType,
  icon? : @react.VirtualNode,
  icon_position? : ButtonIconPosition,
  loading? : Bool,
  shape? : ButtonShape,
  size? : ButtonSize,
  styles? : @hashmap.HashMap[String, @css.RespoStyle],
  target? : String,
  on_click? : (@react.DOMEvent) -> Unit,
  variant? : ButtonVariant,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()
  if auto_insert_space is Some(auto_insert_space) {
    js_props.set("autoInsertSpace", @dom.v_to_js_obscure(auto_insert_space))
  }
  if block is Some(block) {
    js_props.set("block", @dom.v_to_js_obscure(block))
  }
  if class_names is Some(class_names) {
    let obj = @dom.new_js_object()
    for key, value in class_names {
      obj.set(key, @dom.v_to_js_obscure(value))
    }
    js_props.set("className", @dom.v_to_js_obscure(obj))
  }
  if color is Some(color) {
    js_props.set("color", @dom.v_to_js_obscure(color.to_string()))
  }
  if danger is Some(danger) {
    js_props.set("danger", @dom.v_to_js_obscure(danger))
  }
  if disabled is Some(disabled) {
    js_props.set("disabled", @dom.v_to_js_obscure(disabled))
  }
  if type_ is Some(type_) {
    js_props.set("type", @dom.v_to_js_obscure(type_.to_string()))
  }
  if on_click is Some(on_click) {
    js_props.set("onClick", @dom.v_to_js_obscure(on_click))
  }
  if ghost is Some(ghost) {
    js_props.set("ghost", @dom.v_to_js_obscure(ghost))
  }
  if href is Some(href) {
    js_props.set("href", @dom.v_to_js_obscure(href))
  }
  if html_type is Some(html_type) {
    js_props.set("htmlType", @dom.v_to_js_obscure(html_type.to_string()))
  }
  if icon is Some(icon) {
    js_props.set("icon", @dom.v_to_js_obscure(icon.to_js_value()))
  }
  if icon_position is Some(icon_position) {
    js_props.set(
      "iconPosition",
      @dom.v_to_js_obscure(icon_position.to_string()),
    )
  }
  if loading is Some(loading) {
    js_props.set("loading", @dom.v_to_js_obscure(loading))
  }
  if shape is Some(shape) {
    js_props.set("shape", @dom.v_to_js_obscure(shape.to_string()))
  }
  if size is Some(size) {
    js_props.set("size", @dom.v_to_js_obscure(size.to_string()))
  }
  if styles is Some(styles) {
    let obj = @dom.new_js_object()
    for key, value in styles {
      obj.set(
        key,
        @dom.v_to_js_obscure(@react.convert_style_to_js_object(value)),
      )
    }
    js_props.set("styles", @dom.v_to_js_obscure(obj))
  }
  if target is Some(target) {
    js_props.set("target", @dom.v_to_js_obscure(target))
  }
  if variant is Some(variant) {
    js_props.set("variant", @dom.v_to_js_obscure(variant.to_string()))
  }
  let react_children = children.map(fn(child) { child.to_js_value() })
  JsNode(antd_button(js_props, react_children))
}

///|
extern "js" fn antd_button(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Button, props, ...children)
  #| }
