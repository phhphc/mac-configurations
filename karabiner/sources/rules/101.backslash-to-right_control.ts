import { Rule } from "../types/rule";
import { addRules } from "../rules";

const rules: Rule[] = [
  {
    description: "Backslash to Ctrl, Backslash if alone",
    manipulators: [
      {
        from: {
          key_code: "backslash",
        },
        to: [
          {
            key_code: "right_control",
            lazy: true,
          },
        ],
        to_if_alone: [
          {
            key_code: "backslash",
          },
        ],
        type: "basic",
      },
    ],
  },
];

addRules(rules);
