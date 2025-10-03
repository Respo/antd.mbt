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
        @react.div(style=respo_style(margin_top=20.0 |> Px), [
          @antd.typography_title(level=Level3, [
            @react.Text("Layout Components"),
          ]),
          @antd.divider(dashed=true, []),
          @antd.typography_text([@react.Text("Divider with dashed style")]),
          @antd.divider([@react.Text("Simple Divider")]),
          @antd.flex(gap=@antd.FlexGap::Middle, [
            @antd.button([@react.Text("Button 1")]),
            @antd.button([@react.Text("Button 2")]),
            @antd.button([@react.Text("Button 3")]),
          ]),
          @antd.space([
            @antd.typography_text([@react.Text("Space component")]),
            @antd.button([@react.Text("Spaced Button 1")]),
            @antd.button([@react.Text("Spaced Button 2")]),
          ]),
          @antd.layout([
            @antd.layout_header([@react.Text("Header")]),
            @antd.layout_content([@react.Text("Content Area")]),
            @antd.layout_footer([@react.Text("Footer")]),
          ]),
        ]),
        @react.div(style=respo_style(margin_top=20.0 |> Px), [
          @antd.typography_title(level=Level3, [
            @react.Text("Navigation Components"),
          ]),
          @antd.divider(dashed=true, []),
          @antd.breadcrumb([
            @antd.BreadcrumbItem::{
              title: "Home",
              href: None,
              class_name: None,
            },
            @antd.BreadcrumbItem::{
              title: "Application Center",
              href: None,
              class_name: None,
            },
            @antd.BreadcrumbItem::{
              title: "Application List",
              href: None,
              class_name: None,
            },
            @antd.BreadcrumbItem::{
              title: "An Application",
              href: None,
              class_name: None,
            },
          ]),
          @react.div(style=respo_style(margin_top=16.0 |> Px), [
            @antd.menu(
              [
                @antd.MenuItem::{
                  key: "1",
                  label: "Navigation One",
                  disabled: None,
                  icon: None,
                },
                @antd.MenuItem::{
                  key: "2",
                  label: "Navigation Two",
                  disabled: None,
                  icon: None,
                },
                @antd.MenuItem::{
                  key: "3",
                  label: "Navigation Three",
                  disabled: None,
                  icon: None,
                },
              ],
              mode=@antd.MenuMode::Horizontal,
              default_selected_keys=["1"],
            ),
          ]),
          @react.div(style=respo_style(margin_top=16.0 |> Px), [
            @antd.steps(current=1, [
              @antd.steps_step("Finished", description="This is a description."),
              @antd.steps_step(
                "In Progress",
                description="This is a description.",
              ),
              @antd.steps_step("Waiting", description="This is a description."),
            ]),
          ]),
          @react.div(style=respo_style(margin_top=16.0 |> Px), [
            @antd.typography_title(level=@antd.TitleLevel::Level3, [@react.Text("Data Entry Components")]),
            @react.div(style=respo_style(margin_bottom=16.0 |> Px), [
              @react.Text("Input: "),
              @antd.input(
                placeholder="Basic usage",
              ),
            ]),
            @react.div(style=respo_style(margin_bottom=16.0 |> Px), [
              @antd.checkbox(
                default_checked=true,
                [@react.Text("Checkbox")],
              ),
            ]),
            @react.div(style=respo_style(margin_bottom=16.0 |> Px), [
              @antd.radio(
                default_checked=true,
                value="radio1",
                [@react.Text("Radio")],
              ),
            ]),
            @react.div(style=respo_style(margin_bottom=16.0 |> Px), [
              @react.Text("Radio Group: "),
              @antd.radio_group(
                [
                  @antd.RadioOption::new("Apple", "apple", None),
                  @antd.RadioOption::new("Pear", "pear", None),
                  @antd.RadioOption::new("Orange", "orange", Some(true)),
                ],
                default_value="apple",
              ),
            ]),
            @react.div(style=respo_style(margin_bottom=16.0 |> Px), [
              @react.Text("Switch: "),
              @antd.switch(
                default_checked=true,
              ),
            ]),
          ]),
          @react.div(style=respo_style(margin_top=16.0 |> Px), [
            @antd.typography_title(level=@antd.TitleLevel::Level3, [@react.Text("Data Display Components")]),
            @react.div(style=respo_style(margin_bottom=16.0 |> Px), [
              @react.Text("Avatar: "),
              @antd.avatar([@react.Text("U")]),
              @react.Text(" "),
              @antd.avatar([@react.Text("USER")]),
            ]),
            @react.div(style=respo_style(margin_bottom=16.0 |> Px), [
              @react.Text("Badge: "),
              @antd.badge(
                count=5,
                [@antd.avatar([@react.Text("A")])],
              ),
              @react.Text(" "),
              @antd.badge(
                dot=true,
                [@antd.avatar([@react.Text("B")])],
              ),
            ]),
            @react.div(style=respo_style(margin_bottom=16.0 |> Px), [
              @antd.card(
                title="Card Title",
                [@react.Text("Card content goes here. This is a sample card component.")],
              ),
            ]),
            @react.div(style=respo_style(margin_bottom=16.0 |> Px), [
              @react.Text("Tags: "),
              @antd.tag([@react.Text("Success")]),
              @react.Text(" "),
              @antd.tag([@react.Text("Error")]),
              @react.Text(" "),
              @antd.tag([@react.Text("Warning")]),
            ]),
            @react.div(style=respo_style(margin_bottom=16.0 |> Px), [
            @antd.tooltip(
              "This is a tooltip",
              [@react.Text("Hover me for tooltip")],
            ),
          ]),
          @react.div(style=respo_style(margin_top=16.0 |> Px), [
             @antd.typography_title(level=@antd.TitleLevel::Level3, [@react.Text("Feedback Components")]),
             @react.div(style=respo_style(margin_bottom=16.0 |> Px), [
               @antd.alert("This is an info alert"),
             ]),
             @react.div(style=respo_style(margin_bottom=16.0 |> Px), [
               @antd.progress(50),
             ]),
             @react.div(style=respo_style(margin_bottom=16.0 |> Px), [
               @antd.spin([@react.Text("Loading content...")]),
             ]),
           ]),
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
