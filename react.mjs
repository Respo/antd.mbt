import * as React from "react";
import * as ReactDOMClient from "react-dom/client";
import "@ant-design/v5-patch-for-react-19";

import { 
  Button, FloatButton, Typography, Divider, Flex, Space, Layout, Breadcrumb, Menu, Steps,
  Input, Checkbox, Radio, Switch,
  Avatar, Badge, Card, Tag, Tooltip,
  Alert, Modal, Drawer, Progress, Spin, Result
} from "antd";
import * as Icon from "@ant-design/icons";

console.log(ReactDOMClient);

window.React = React;
window.ReactDOMClient = ReactDOMClient;
window.AntD = { 
  Button, FloatButton, Typography, Divider, Flex, Space, Layout, Breadcrumb, Menu, Steps,
  Input, Checkbox, Radio, Switch,
  Avatar, Badge, Card, Tag, Tooltip,
  Alert, Modal, Drawer, Progress, Spin, Result,
  Icon 
};
