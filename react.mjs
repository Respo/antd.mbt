import * as React from "react";
import * as ReactDOMClient from "react-dom/client";
import "@ant-design/v5-patch-for-react-19";

import { Button, FloatButton, Typography } from "antd";
import * as Icon from "@ant-design/icons";

console.log(ReactDOMClient);

window.React = React;
window.ReactDOMClient = ReactDOMClient;
window.AntD = { Button, FloatButton, Typography, Icon };
