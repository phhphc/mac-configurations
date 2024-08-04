import { KeyCode, ModifierKeyCode } from "./key_code";
import { Variable } from "./variable";

export type Rule = {
  description: string;
  manipulators: Manipulator[];
};

export type Manipulator = {
  type: "basic";
  from: FromEvent;
  conditions?: Condition[];
  to?: ToEvent[];
  to_if_alone?: ToIfAloneEvent[];
  to_after_key_up?: ToAfterKeyUpEvent[];
  to_delayed_action?: ToDelayedActionEvent;
};

export type Condition = {
  type: "variable_if" | "variable_unless";
} & Variable;

export type FromEvent = {
  key_code?: KeyCode;
  modifiers?: {
    mandatory?: ModifierKeyCode[];
    optional?: ("any" | ModifierKeyCode)[];
  };
};

export type ToEvent =
  | {
      key_code: KeyCode;
      modifiers?: ModifierKeyCode[];
      lazy?: boolean;
    }
  | { set_variable: Variable };

export type ToIfAloneEvent = {
  key_code: KeyCode;
};

export type ToAfterKeyUpEvent =
  | {
      key_code: KeyCode;
    }
  | {
      set_variable: Variable;
    };

export type ToDelayedActionEvent = {
  to_if_canceled?: ToEvent[];
  to_if_invoked?: ToEvent[];
};
