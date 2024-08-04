import { Rule, ToAfterKeyUpEvent, ToEvent } from "../types/rule";
import { addRules } from "../rules";
import { disableModify, enableModify } from "../consts/variable_states";


const rules: Rule[] = [
  {
    description: "Enter set `do_modify_action` to `1` when pressed, Enter if alone",
    manipulators: [
      {
        type: "basic",
        from: {
          key_code: "return_or_enter",
          modifiers: { optional: ["any"] },
        },
        to: [enableModify],
        to_after_key_up: [disableModify],
        to_if_alone: [
          {
            key_code: "return_or_enter",
          },
        ],
      },
      {
        type: "basic",
        from: {
          key_code: "caps_lock",
          modifiers: { optional: ["any"] },
        },
        to: [enableModify],
        to_after_key_up: [disableModify],
        to_if_alone: [
          {
            key_code: "escape",
          },
        ],
      },
    ],
  },
];

addRules(rules);
