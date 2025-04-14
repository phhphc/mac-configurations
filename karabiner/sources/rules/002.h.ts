import { Manipulator, Rule } from "../types/rule";
import { addRules } from "../rules";
import { KeyCode } from "../types/key_code";
import {
  lock_screen,
  toggle_clipboard,
  toggle_editor,
  toggle_iterm,
  window_almost_maximize,
  window_maximize,
  window_next_display,
  window_reasonable_size,
  window_toggle_fullscreen,
} from "../consts/composite_key";
import {
  disableWindowManagement,
  enableWindowManagement,
  ifModifyAction,
  ifWindowManagement,
  ifWithHyper,
} from "../consts/variable_states";

const rules: Rule[] = [
  {
    description: "h j k l to arrow key, u to caps_lock",
    manipulators: [
      {
        type: "basic",
        conditions: ifModifyAction,
        from: { key_code: "l", modifiers: { optional: ["any"] } },
        to: [
          {
            key_code: "right_arrow",
          },
        ],
      },
      {
        type: "basic",
        conditions: ifModifyAction,
        from: { key_code: "h", modifiers: { optional: ["any"] } },
        to: [
          {
            key_code: "left_arrow",
          },
        ],
      },
      {
        type: "basic",
        conditions: ifModifyAction,
        from: { key_code: "j", modifiers: { optional: ["any"] } },
        to: [
          {
            key_code: "down_arrow",
          },
        ],
      },
      {
        type: "basic",
        conditions: ifModifyAction,
        from: { key_code: "k", modifiers: { optional: ["any"] } },
        to: [
          {
            key_code: "up_arrow",
          },
        ],
      },
      {
        type: "basic",
        conditions: ifModifyAction,
        from: { key_code: "u", modifiers: { optional: ["caps_lock"] } },
        to: [{ key_code: "caps_lock" }],
      },
    ],
  },
];

addRules(rules);

const rr: Rule[] = [
  {
    description: "iterm, clipboard, editor",
    manipulators: [
      {
        type: "basic",
        conditions: ifModifyAction,
        from: {
          key_code: "t",
        },
        to: [toggle_iterm],
      },
      {
        type: "basic",
        conditions: ifModifyAction,
        from: {
          key_code: "c",
        },
        to: [toggle_clipboard],
      },
      {
        type: "basic",
        conditions: ifModifyAction,
        from: {
          key_code: "v",
        },
        to: [toggle_editor],
      },
      {
        type: "basic",
        conditions: ifModifyAction,
        from: { key_code: "slash" },
        to: [lock_screen],
      },
      {
        type: "basic",
        conditions: ifModifyAction,
        from: { key_code: "period" },
        to: [{ key_code: "mission_control" }],
      },
    ],
  },
];

addRules(rr);

const r1: Rule[] = [
  {
    description:
      "B to Backspace, D to Delete, A to Home, E to End, U to PageUp, Y to PageDown (when `do_modify_action` is 1)",
    manipulators: [
      {
        conditions: ifModifyAction,
        from: {
          key_code: "b",
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "delete_or_backspace",
          },
        ],
        type: "basic",
      },
      {
        conditions: ifModifyAction,
        from: {
          key_code: "d",
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "delete_forward",
          },
        ],
        type: "basic",
      },
      {
        conditions: ifModifyAction,
        from: {
          key_code: "a",
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "home",
          },
        ],
        type: "basic",
      },
      {
        conditions: ifModifyAction,
        from: {
          key_code: "e",
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "end",
          },
        ],
        type: "basic",
      },
      {
        conditions: ifModifyAction,
        from: {
          key_code: "u",
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "page_up",
          },
        ],
        type: "basic",
      },
      {
        conditions: ifModifyAction,
        from: {
          key_code: "y",
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "page_down",
          },
        ],
        type: "basic",
      },
    ],
  },
];

addRules(r1);

const r2: Rule[] = [
  {
    description: "[1234567890-=] to [F1-F12] (when `do_modify_action` is 1)",
    manipulators: [
      {
        conditions: ifModifyAction,
        from: {
          key_code: "1",
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "f1",
          },
        ],
        type: "basic",
      },
      {
        conditions: ifModifyAction,
        from: {
          key_code: "2",
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "f2",
          },
        ],
        type: "basic",
      },
      {
        conditions: ifModifyAction,
        from: {
          key_code: "3",
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "f3",
          },
        ],
        type: "basic",
      },
      {
        conditions: ifModifyAction,
        from: {
          key_code: "4",
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "f4",
          },
        ],
        type: "basic",
      },
      {
        conditions: ifModifyAction,
        from: {
          key_code: "5",
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "f5",
          },
        ],
        type: "basic",
      },
      {
        conditions: ifModifyAction,
        from: {
          key_code: "6",
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "f6",
          },
        ],
        type: "basic",
      },
      {
        conditions: ifModifyAction,
        from: {
          key_code: "7",
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "f7",
          },
        ],
        type: "basic",
      },
      {
        conditions: ifModifyAction,
        from: {
          key_code: "8",
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "f8",
          },
        ],
        type: "basic",
      },
      {
        conditions: ifModifyAction,
        from: {
          key_code: "9",
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "f9",
          },
        ],
        type: "basic",
      },
      {
        conditions: ifModifyAction,
        from: {
          key_code: "0",
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "f10",
          },
        ],
        type: "basic",
      },
      {
        conditions: ifModifyAction,
        from: {
          key_code: "hyphen",
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "f11",
          },
        ],
        type: "basic",
      },
      {
        conditions: ifModifyAction,
        from: {
          key_code: "equal_sign",
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: "f12",
          },
        ],
        type: "basic",
      },
    ],
  },
];

addRules(r2);

const r3: Rule[] = [
  {
    description: "i to change input source when modify is true",
    manipulators: [
      {
        type: "basic",
        conditions: ifModifyAction,
        from: {
          key_code: "i",
        },
        to: [{ key_code: "spacebar", modifiers: ["left_control", "left_shift"] }],
      },
    ],
  },
];

addRules(r3);

const r4: Rule[] = [
  {
    description: "O[A-Z] to Hyper+[A-Z] (manualy map to open app) (when `do_modify_action` is 1)",
    manipulators: [
      "a",
      "b",
      "c",
      "d",
      "e",
      "f",
      "g",
      "h",
      "i",
      "j",
      "k",
      "l",
      "m",
      "n",
      "o",
      "p",
      "q",
      "r",
      "s",
      "t",
      "u",
      "v",
      "w",
      "x",
      "y",
      "z",
    ].map(
      (c): Manipulator => ({
        conditions: ifWithHyper,
        from: {
          key_code: c as KeyCode,
          modifiers: {
            optional: ["any"],
          },
        },
        to: [
          {
            key_code: c as KeyCode,
            modifiers: ["left_option", "left_control", "left_shift", "left_command"],
          },
        ],
        type: "basic",
      }),
    ),
  },
  {
    description: "ola",
    manipulators: [
      {
        type: "basic",
        conditions: ifModifyAction,
        from: {
          key_code: "o",
        },
        to: [
          {
            set_variable: {
              name: "with_hyper",
              value: true,
            },
          },
        ],
        to_delayed_action: {
          to_if_canceled: [
            {
              set_variable: {
                name: "with_hyper",
                value: false,
              },
            },
          ],
          to_if_invoked: [
            {
              set_variable: {
                name: "with_hyper",
                value: false,
              },
            },
          ],
        },
      },
    ],
  },
];

addRules(r4);

const r5: Rule[] = [
  {
    description:
      "W[H,J,K,L,N,P,M,R,A,C,F] to unused key (manualy map to window management) (when `do_modify_action` is 1)",
    manipulators: [
      {
        conditions: ifWindowManagement,
        from: {
          key_code: "h",
        },
        to: [
          {
            key_code: "f13",
          },
        ],
        type: "basic",
      },
      {
        conditions: ifWindowManagement,
        from: {
          key_code: "j",
        },
        to: [
          {
            key_code: "f13",
            modifiers: ["left_shift"],
          },
        ],
        type: "basic",
      },
      {
        conditions: ifWindowManagement,
        from: {
          key_code: "k",
        },
        to: [
          {
            key_code: "f13",
            modifiers: ["left_control"],
          },
        ],
        type: "basic",
      },
      {
        conditions: ifWindowManagement,
        from: {
          key_code: "l",
        },
        to: [
          {
            key_code: "f13",
            modifiers: ["left_option"],
          },
        ],
        type: "basic",
      },
      {
        conditions: ifWindowManagement,
        from: {
          key_code: "p",
        },
        to: [
          {
            key_code: "f13",
            modifiers: ["left_command"],
          },
        ],
        type: "basic",
      },
      {
        conditions: ifWindowManagement,
        from: {
          key_code: "n",
        },
        to: [window_next_display],
        type: "basic",
      },
      {
        conditions: ifWindowManagement,
        from: {
          key_code: "m",
        },
        to: [window_maximize],
        type: "basic",
      },
      {
        conditions: ifWindowManagement,
        from: {
          key_code: "r",
        },
        to: [window_reasonable_size],
        type: "basic",
      },
      {
        conditions: ifWindowManagement,
        from: {
          key_code: "a",
        },
        to: [window_almost_maximize],
        type: "basic",
      },
      {
        conditions: ifWindowManagement,
        from: {
          key_code: "c",
        },
        to: [
          {
            key_code: "f13",
            modifiers: ["left_control", "left_command"],
          },
        ],
        type: "basic",
      },
      {
        conditions: ifWindowManagement,
        from: {
          key_code: "f",
        },
        to: [window_toggle_fullscreen],
        type: "basic",
      },
      {
        conditions: ifModifyAction,
        from: {
          key_code: "w",
        },
        to: [enableWindowManagement],
        to_delayed_action: {
          to_if_canceled: [disableWindowManagement],
          to_if_invoked: [disableWindowManagement],
        },
        type: "basic",
      },
    ],
  },
];

addRules(r5);
