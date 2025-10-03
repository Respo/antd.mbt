///|
typealias @react.VirtualNode

///|
fnalias @css.respo_style

///|
struct ContainerProps {} derive(Default)

///|
impl @react.JsValueTrait for ContainerProps with to_value(_self) -> @react.JsValue {
  @react.JsObject::new().to_value()
}

///|
impl @react.JsValueTrait for ContainerProps with from_value(
  _value : @react.JsValue,
) -> ContainerProps {
  ContainerProps::default()
}

///|
fn comp_container(_v : ContainerProps) -> VirtualNode {
  let (counter, set_counter) = @react.use_state(0.0.to_float())
  @react.use_effect_once(fn() { println("comp_container mounted") })
  @react.div(
    id="container",
    style=respo_style(color=Blue, font_family="Arial", padding=10.0 |> Px),
    [
      @react.div(class_list=[style_counter], [
        @react.Fragment([@react.Text("Demo: ")]),
        @react.Text("Counter \{counter}"),
        @antd.button(
          type_=Primary,
          on_click=fn(_) {
            println("clicked button")
            set_counter(counter + 1.0)
          },
          [@react.Text("Click me")],
        ),
        @antd.flat_button(
          type_=Primary,
          icon=@react.Text("🚀"),
          tooltip=@react.Text("Flat Button Tooltip"),
          on_click=fn(_) {
            println("clicked flat button")
            set_counter(counter + 0.5)
          },
          [@react.Text("Flat...")],
        ),
        @antd.flat_button_group(shape=Circle, trigger=Click, [
          @antd.flat_button(icon=@react.Text("📝"), [@react.Text("Edit")]),
          @antd.flat_button(icon=@react.Text("💾"), [@react.Text("Save")]),
        ]),
        @react.div(style=respo_style(margin_top=20.0 |> Px), [
          @react.Text("Icon Examples...: "),
          @antd.icon(icon_type=Home, []),
          @antd.icon(icon_type=User, spin=true, []),
          @antd.icon(icon_type=Setting, rotate=45, []),
          @antd.icon(icon_type=Heart, two_tone_color="#eb2f96", []),
        ]),
        @react.div(style=respo_style(margin_top=20.0 |> Px), [
          @antd.typography_title(level=Level1, [
            @react.Text("Typography Title H1"),
          ]),
          @antd.typography_title(level=Level2, type_=Secondary, [
            @react.Text("Typography Title H2 Secondary"),
          ]),
          @antd.typography_title(level=Level3, mark=true, [
            @react.Text("Typography Title H3 with Mark"),
          ]),
          @antd.typography_text([@react.Text("This is a normal text.")]),
          @antd.typography_text(type_=Success, strong=true, [
            @react.Text("This is a success strong text."),
          ]),
          @antd.typography_text(type_=Warning, italic=true, [
            @react.Text("This is a warning italic text."),
          ]),
          @antd.typography_text(type_=Danger, underline=true, [
            @react.Text("This is a danger underlined text."),
          ]),
          @antd.typography_text(code=true, [
            @react.Text("console.log('Hello World')"),
          ]),
          @antd.typography_paragraph([
            @react.Text("This is a paragraph with multiple lines. "),
            @antd.typography_text(strong=true, [@react.Text("Bold text ")]),
            @react.Text("and "),
            @antd.typography_text(italic=true, [@react.Text("italic text ")]),
            @react.Text("mixed together."),
          ]),
          @antd.typography_paragraph(mark=true, [
            @react.Text("This is a marked paragraph."),
          ]),
        ]),
      ]),
    ],
  )
}

///|
fn main {
  let window = @dom.window()
  let doc = window.document()
  let body = doc.body()
  let props = ContainerProps::default()
  @react.render(@react.component(comp_container, props, []), body)
  println("loaded")
}

///|
let style_counter : String = @react.static_style([
  ("&", respo_style(margin_bottom=20.0 |> Px, padding=10.0 |> Px)),
])
