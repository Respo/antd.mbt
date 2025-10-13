///|
/// Typography text type enum - Defines the semantic type of text
/// Property: type
/// Type: secondary | success | warning | danger
/// Default value: -
/// Description: Text type for semantic styling
pub(all) enum TypographyType {
  /// Secondary text type - muted/secondary styling
  Secondary
  /// Success text type - success state styling
  Success
  /// Warning text type - warning state styling
  Warning
  /// Danger text type - danger/error state styling
  Danger
}

///|
pub impl Show for TypographyType with output(
  self : TypographyType,
  logger : &Logger,
) {
  match self {
    Secondary => logger.write_string("secondary")
    Success => logger.write_string("success")
    Warning => logger.write_string("warning")
    Danger => logger.write_string("danger")
  }
}

///|
/// Typography title level enum - Defines the heading level
/// Property: level
/// Type: 1 | 2 | 3 | 4 | 5
/// Default value: 1
/// Description: Heading level, equivalent to h1, h2, h3, h4, h5
pub(all) enum TitleLevel {
  /// Level 1 - h1 heading
  Level1
  /// Level 2 - h2 heading
  Level2
  /// Level 3 - h3 heading
  Level3
  /// Level 4 - h4 heading
  Level4
  /// Level 5 - h5 heading
  Level5
}

///|
pub impl Default for TitleLevel with default() -> TitleLevel {
  Level1
}

///|
pub impl Show for TitleLevel with output(self : TitleLevel, logger : &Logger) {
  match self {
    Level1 => logger.write_string("1")
    Level2 => logger.write_string("2")
    Level3 => logger.write_string("3")
    Level4 => logger.write_string("4")
    Level5 => logger.write_string("5")
  }
}

///|
/// Typography.Text component function
/// Creates a Typography.Text component with specified properties
/// 
/// ## Parameters
/// - code: Add code styling
/// - copyable: Whether copyable, can be customized when object
/// - delete: Add strikethrough styling
/// - disabled: Disable text
/// - editable: Whether editable, can control editing when object
/// - ellipsis: Auto overflow ellipsis
/// - keyboard: Add keyboard styling
/// - mark: Add mark styling
/// - on_click: Click callback
/// - strong: Whether bold
/// - italic: Whether italic
/// - type_: Text type
/// - underline: Add underline styling
/// - class_name: CSS class name
/// - style: Inline styles
/// - children: Child elements
pub fn typography_text(
  code? : Bool,
  copyable? : Bool,
  delete? : Bool,
  disabled? : Bool,
  editable? : Bool,
  ellipsis? : Bool,
  keyboard? : Bool,
  mark? : Bool,
  on_click? : (@react.DOMEvent) -> Unit,
  strong? : Bool,
  italic? : Bool,
  type_? : TypographyType,
  underline? : Bool,
  class_name? : String,
  style? : @css.RespoStyle,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()

  // Set boolean properties
  if code is Some(code) {
    js_props.set("code", @dom.v_to_js_obscure(code))
  }
  if copyable is Some(copyable) {
    js_props.set("copyable", @dom.v_to_js_obscure(copyable))
  }
  if delete is Some(delete) {
    js_props.set("delete", @dom.v_to_js_obscure(delete))
  }
  if disabled is Some(disabled) {
    js_props.set("disabled", @dom.v_to_js_obscure(disabled))
  }
  if editable is Some(editable) {
    js_props.set("editable", @dom.v_to_js_obscure(editable))
  }
  if ellipsis is Some(ellipsis) {
    js_props.set("ellipsis", @dom.v_to_js_obscure(ellipsis))
  }
  if keyboard is Some(keyboard) {
    js_props.set("keyboard", @dom.v_to_js_obscure(keyboard))
  }
  if mark is Some(mark) {
    js_props.set("mark", @dom.v_to_js_obscure(mark))
  }
  if strong is Some(strong) {
    js_props.set("strong", @dom.v_to_js_obscure(strong))
  }
  if italic is Some(italic) {
    js_props.set("italic", @dom.v_to_js_obscure(italic))
  }
  if underline is Some(underline) {
    js_props.set("underline", @dom.v_to_js_obscure(underline))
  }

  // Set type property
  if type_ is Some(type_) {
    js_props.set("type", @dom.v_to_js_obscure(type_.to_string()))
  }

  // Set className and style
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }

  // Set onClick handler
  if on_click is Some(on_click) {
    js_props.set("onClick", @dom.v_to_js_obscure(on_click))
  }
  let react_children = children.map(fn(child) { child.to_js_value() })
  @react.JsNode(antd_typography_text(js_props, react_children))
}

///|
extern "js" fn antd_typography_text(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Typography.Text, props, ...children)
  #| }

///|
/// Typography.Title component function
/// Creates a Typography.Title component with specified properties
/// 
/// ## Parameters
/// - code: Add code styling
/// - copyable: Whether copyable, can be customized when object
/// - delete: Add strikethrough styling
/// - disabled: Disable text
/// - editable: Whether editable, can control editing when object
/// - ellipsis: Auto overflow ellipsis
/// - level: Heading level (1-5)
/// - mark: Add mark styling
/// - on_click: Click callback
/// - italic: Whether italic
/// - type_: Text type
/// - underline: Add underline styling
/// - class_name: CSS class name
/// - style: Inline styles
/// - children: Child elements
pub fn typography_title(
  code? : Bool,
  copyable? : Bool,
  delete? : Bool,
  disabled? : Bool,
  editable? : Bool,
  ellipsis? : Bool,
  level? : TitleLevel,
  mark? : Bool,
  on_click? : (@react.DOMEvent) -> Unit,
  italic? : Bool,
  type_? : TypographyType,
  underline? : Bool,
  class_name? : String,
  style? : @css.RespoStyle,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()

  // Set boolean properties
  if code is Some(code) {
    js_props.set("code", @dom.v_to_js_obscure(code))
  }
  if copyable is Some(copyable) {
    js_props.set("copyable", @dom.v_to_js_obscure(copyable))
  }
  if delete is Some(delete) {
    js_props.set("delete", @dom.v_to_js_obscure(delete))
  }
  if disabled is Some(disabled) {
    js_props.set("disabled", @dom.v_to_js_obscure(disabled))
  }
  if editable is Some(editable) {
    js_props.set("editable", @dom.v_to_js_obscure(editable))
  }
  if ellipsis is Some(ellipsis) {
    js_props.set("ellipsis", @dom.v_to_js_obscure(ellipsis))
  }
  if mark is Some(mark) {
    js_props.set("mark", @dom.v_to_js_obscure(mark))
  }
  if italic is Some(italic) {
    js_props.set("italic", @dom.v_to_js_obscure(italic))
  }
  if underline is Some(underline) {
    js_props.set("underline", @dom.v_to_js_obscure(underline))
  }

  // Set level property
  if level is Some(level) {
    let level_num = match level {
      Level1 => 1
      Level2 => 2
      Level3 => 3
      Level4 => 4
      Level5 => 5
    }
    js_props.set("level", @dom.v_to_js_obscure(level_num))
  }

  // Set type property
  if type_ is Some(type_) {
    js_props.set("type", @dom.v_to_js_obscure(type_.to_string()))
  }

  // Set className and style
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }

  // Set onClick handler
  if on_click is Some(on_click) {
    js_props.set("onClick", @dom.v_to_js_obscure(on_click))
  }
  let react_children = children.map(fn(child) { child.to_js_value() })
  @react.JsNode(antd_typography_title(js_props, react_children))
}

///|
extern "js" fn antd_typography_title(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Typography.Title, props, ...children)
  #| }

///|
/// Typography.Paragraph component function
/// Creates a Typography.Paragraph component with specified properties
/// 
/// ## Parameters
/// - code: Add code styling
/// - copyable: Whether copyable, can be customized when object
/// - delete: Add strikethrough styling
/// - disabled: Disable text
/// - editable: Whether editable, can control editing when object
/// - ellipsis: Auto overflow ellipsis
/// - mark: Add mark styling
/// - on_click: Click callback
/// - strong: Whether bold
/// - italic: Whether italic
/// - type_: Text type
/// - underline: Add underline styling
/// - class_name: CSS class name
/// - style: Inline styles
/// - children: Child elements
pub fn typography_paragraph(
  code? : Bool,
  copyable? : Bool,
  delete? : Bool,
  disabled? : Bool,
  editable? : Bool,
  ellipsis? : Bool,
  mark? : Bool,
  on_click? : (@react.DOMEvent) -> Unit,
  strong? : Bool,
  italic? : Bool,
  type_? : TypographyType,
  underline? : Bool,
  class_name? : String,
  style? : @css.RespoStyle,
  children : Array[@react.VirtualNode],
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()

  // Set boolean properties
  if code is Some(code) {
    js_props.set("code", @dom.v_to_js_obscure(code))
  }
  if copyable is Some(copyable) {
    js_props.set("copyable", @dom.v_to_js_obscure(copyable))
  }
  if delete is Some(delete) {
    js_props.set("delete", @dom.v_to_js_obscure(delete))
  }
  if disabled is Some(disabled) {
    js_props.set("disabled", @dom.v_to_js_obscure(disabled))
  }
  if editable is Some(editable) {
    js_props.set("editable", @dom.v_to_js_obscure(editable))
  }
  if ellipsis is Some(ellipsis) {
    js_props.set("ellipsis", @dom.v_to_js_obscure(ellipsis))
  }
  if mark is Some(mark) {
    js_props.set("mark", @dom.v_to_js_obscure(mark))
  }
  if strong is Some(strong) {
    js_props.set("strong", @dom.v_to_js_obscure(strong))
  }
  if italic is Some(italic) {
    js_props.set("italic", @dom.v_to_js_obscure(italic))
  }
  if underline is Some(underline) {
    js_props.set("underline", @dom.v_to_js_obscure(underline))
  }

  // Set type property
  if type_ is Some(type_) {
    js_props.set("type", @dom.v_to_js_obscure(type_.to_string()))
  }

  // Set className and style
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }

  // Set onClick handler
  if on_click is Some(on_click) {
    js_props.set("onClick", @dom.v_to_js_obscure(on_click))
  }
  let react_children = children.map(fn(child) { child.to_js_value() })
  @react.JsNode(antd_typography_paragraph(js_props, react_children))
}

///|
extern "js" fn antd_typography_paragraph(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Typography.Paragraph, props, ...children)
  #| }
