import { Condition, ToEvent } from "../types/rule";

export const ifModifyAction: Condition[] = [
  { type: "variable_if", name: "modify_action", value: true },
  { type: "variable_unless", name: "with_hyper", value: true },
  { type: "variable_unless", name: "window_management", value: true },
];

export const ifWithHyper: Condition[] = [{ type: "variable_if", name: "with_hyper", value: true }];

export const ifWindowManagement: Condition[] = [{ type: "variable_if", name: "window_management", value: true }];

export const enableModify: ToEvent = {
  set_variable: {
    name: "modify_action",
    value: true,
  },
};

export const disableModify: ToEvent = {
  set_variable: {
    name: "modify_action",
    value: false,
  },
};

export const enableWindowManagement: ToEvent = {
  set_variable: {
    name: "window_management",
      value: true,
  },
}

export const disableWindowManagement: ToEvent = {
  set_variable: {
    name: "window_management",
    value: false,
  },
}
