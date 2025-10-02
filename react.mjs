import * as React from "react";
import * as ReactDOMClient from "react-dom/client";
import "@ant-design/v5-patch-for-react-19";

import { Button } from "antd";

console.log(ReactDOMClient);

window.React = React;
window.ReactDOMClient = ReactDOMClient;
window.AntD = { Button };
