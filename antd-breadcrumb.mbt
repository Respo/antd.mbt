///|
/// Breadcrumb 组件 - 面包屑
/// 显示当前页面在系统层级结构中的位置，并能向上返回

// ============= Breadcrumb 组件 =============

///|
pub(all) struct BreadcrumbItem {
  title : String
  href : String?
  class_name : String?
} derive(Show)

///|
pub fn BreadcrumbItem::new(
  title : String,
  href : String?,
  class_name : String?,
) -> BreadcrumbItem {
  { title, href, class_name }
}

///|
pub fn breadcrumb(
  items : Array[BreadcrumbItem],
  separator? : String,
  class_name? : String,
  style? : @css.RespoStyle,
) -> @react.VirtualNode {
  let js_props = @dom.new_js_object()

  // 转换 items 为 JavaScript 对象数组
  let js_items = items.map(fn(item) {
    let item_obj = @dom.new_js_object()
    item_obj.set("title", @dom.v_to_js_obscure(item.title))
    if item.href is Some(href) {
      item_obj.set("href", @dom.v_to_js_obscure(href))
    }
    if item.class_name is Some(class_name) {
      item_obj.set("className", @dom.v_to_js_obscure(class_name))
    }
    item_obj
  })
  js_props.set("items", @dom.v_to_js_obscure(js_items))
  if separator is Some(separator) {
    js_props.set("separator", @dom.v_to_js_obscure(separator))
  }
  if class_name is Some(class_name) {
    js_props.set("className", @dom.v_to_js_obscure(class_name))
  }
  if style is Some(style) {
    js_props.set("style", @dom.v_to_js_obscure(style))
  }
  @react.JsNode(antd_breadcrumb(js_props, []))
}

///|
extern "js" fn antd_breadcrumb(
  props : @dom.JsObjectObscure,
  children : Array[@react.JsValue],
) -> @react.JsValue =
  #| (props, children) => {
  #|   return window.React.createElement(window.AntD.Breadcrumb, props, ...children)
  #| }
