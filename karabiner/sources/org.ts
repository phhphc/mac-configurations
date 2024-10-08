export const configs = {
  global: {
    ask_for_confirmation_before_quitting: true,
    check_for_updates_on_startup: true,
    show_in_menu_bar: false,
    show_profile_name_in_menu_bar: false,
    unsafe_ui: false,
  },
  profiles: [
    {
      complex_modifications: {
        parameters: {
          "basic.simultaneous_threshold_milliseconds": 0,
          "basic.to_delayed_action_delay_milliseconds": 1000,
          "basic.to_if_alone_timeout_milliseconds": 1000,
          "basic.to_if_held_down_threshold_milliseconds": 500,
          "mouse_motion_to_scroll.speed": 100,
        },
        rules: [
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
          {
            description: "Enter set `do_modify_action` to `1` when pressed, Enter if alone",
            manipulators: [
              {
                from: {
                  key_code: "return_or_enter",
                },
                to: [
                  {
                    set_variable: {
                      name: "do_modify_action",
                      value: 1,
                    },
                  },
                ],
                to_after_key_up: [
                  {
                    set_variable: {
                      name: "do_modify_action",
                      value: 0,
                    },
                  },
                ],
                to_if_alone: [
                  {
                    key_code: "return_or_enter",
                    repeat: true,
                  },
                ],
                type: "basic",
              },
            ],
          },
          {
            description: "CapsLock set `do_modify_action` to `1` when pressed, Esc if press alone",
            manipulators: [
              {
                from: {
                  key_code: "caps_lock",
                  modifiers: {
                    optional: ["any"],
                  },
                },
                to: [
                  {
                    set_variable: {
                      name: "do_modify_action",
                      value: 1,
                    },
                  },
                ],
                to_after_key_up: [
                  {
                    set_variable: {
                      name: "do_modify_action",
                      value: 0,
                    },
                  },
                ],
                to_if_alone: [
                  {
                    key_code: "escape",
                  },
                ],
                type: "basic",
              },
            ],
          },
          {
            description: "H,J,K,L to arrow keys (when `do_modify_action` is `1`)",
            manipulators: [
              {
                conditions: [
                  {
                    name: "do_modify_action",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "j",
                  modifiers: {
                    optional: ["any"],
                  },
                },
                to: [
                  {
                    key_code: "down_arrow",
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "do_modify_action",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "k",
                  modifiers: {
                    optional: ["any"],
                  },
                },
                to: [
                  {
                    key_code: "up_arrow",
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "do_modify_action",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "h",
                  modifiers: {
                    optional: ["any"],
                  },
                },
                to: [
                  {
                    key_code: "left_arrow",
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "do_modify_action",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "l",
                  modifiers: {
                    optional: ["any"],
                  },
                },
                to: [
                  {
                    key_code: "right_arrow",
                  },
                ],
                type: "basic",
              },
            ],
          },
          {
            description:
              "B to Backspace, D to Delete, A to Home, E to End, U to PageUp, Y to PageDown (when `do_modify_action` is 1)",
            manipulators: [
              {
                conditions: [
                  {
                    name: "do_modify_action",
                    type: "variable_if",
                    value: 1,
                  },
                ],
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
                conditions: [
                  {
                    name: "do_modify_action",
                    type: "variable_if",
                    value: 1,
                  },
                ],
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
                conditions: [
                  {
                    name: "do_modify_action",
                    type: "variable_if",
                    value: 1,
                  },
                ],
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
                conditions: [
                  {
                    name: "do_modify_action",
                    type: "variable_if",
                    value: 1,
                  },
                ],
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
                conditions: [
                  {
                    name: "do_modify_action",
                    type: "variable_if",
                    value: 1,
                  },
                ],
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
                conditions: [
                  {
                    name: "do_modify_action",
                    type: "variable_if",
                    value: 1,
                  },
                ],
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
          {
            description: "[1234567890-=] to [F1-F12] (when `do_modify_action` is 1)",
            manipulators: [
              {
                conditions: [
                  {
                    name: "do_modify_action",
                    type: "variable_if",
                    value: 1,
                  },
                ],
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
                conditions: [
                  {
                    name: "do_modify_action",
                    type: "variable_if",
                    value: 1,
                  },
                ],
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
                conditions: [
                  {
                    name: "do_modify_action",
                    type: "variable_if",
                    value: 1,
                  },
                ],
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
                conditions: [
                  {
                    name: "do_modify_action",
                    type: "variable_if",
                    value: 1,
                  },
                ],
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
                conditions: [
                  {
                    name: "do_modify_action",
                    type: "variable_if",
                    value: 1,
                  },
                ],
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
                conditions: [
                  {
                    name: "do_modify_action",
                    type: "variable_if",
                    value: 1,
                  },
                ],
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
                conditions: [
                  {
                    name: "do_modify_action",
                    type: "variable_if",
                    value: 1,
                  },
                ],
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
                conditions: [
                  {
                    name: "do_modify_action",
                    type: "variable_if",
                    value: 1,
                  },
                ],
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
                conditions: [
                  {
                    name: "do_modify_action",
                    type: "variable_if",
                    value: 1,
                  },
                ],
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
                conditions: [
                  {
                    name: "do_modify_action",
                    type: "variable_if",
                    value: 1,
                  },
                ],
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
                conditions: [
                  {
                    name: "do_modify_action",
                    type: "variable_if",
                    value: 1,
                  },
                ],
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
                conditions: [
                  {
                    name: "do_modify_action",
                    type: "variable_if",
                    value: 1,
                  },
                ],
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
          {
            description: "T to F20 (manualy map to iTerm2 shortcut) (when `do_modify_action` is 1)",
            manipulators: [
              {
                conditions: [
                  {
                    name: "do_modify_action",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "t",
                  modifiers: {
                    optional: ["any"],
                  },
                },
                to: [
                  {
                    key_code: "f20",
                  },
                ],
                type: "basic",
              },
            ],
          },
          {
            description:
              "W[H,J,K,L,N,P,M,R,A,C,F] to unused key (manualy map to window management) (when `do_modify_action` is 1)",
            manipulators: [
              {
                conditions: [
                  {
                    name: "window_management",
                    type: "variable_if",
                    value: 1,
                  },
                ],
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
                conditions: [
                  {
                    name: "window_management",
                    type: "variable_if",
                    value: 1,
                  },
                ],
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
                conditions: [
                  {
                    name: "window_management",
                    type: "variable_if",
                    value: 1,
                  },
                ],
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
                conditions: [
                  {
                    name: "window_management",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "l",
                },
                to: [
                  {
                    key_code: "f13",
                    modifiers: ["left_alt"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "window_management",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "p",
                },
                to: [
                  {
                    key_code: "f13",
                    modifiers: ["left_gui"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "window_management",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "n",
                },
                to: [
                  {
                    key_code: "f13",
                    modifiers: ["left_shift", "left_control"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "window_management",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "m",
                },
                to: [
                  {
                    key_code: "f13",
                    modifiers: ["left_shift", "left_alt"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "window_management",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "r",
                },
                to: [
                  {
                    key_code: "f13",
                    modifiers: ["left_shift", "left_gui"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "window_management",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "a",
                },
                to: [
                  {
                    key_code: "f13",
                    modifiers: ["left_control", "left_alt"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "window_management",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "c",
                },
                to: [
                  {
                    key_code: "f13",
                    modifiers: ["left_control", "left_gui"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "window_management",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "f",
                },
                to: [
                  {
                    key_code: "f13",
                    modifiers: ["left_alt", "left_gui"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "do_modify_action",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "w",
                },
                to: [
                  {
                    set_variable: {
                      name: "do_modify_action",
                      value: 0,
                    },
                  },
                  {
                    set_variable: {
                      name: "window_management",
                      value: 1,
                    },
                  },
                ],
                to_delayed_action: {
                  to_if_canceled: [
                    {
                      set_variable: {
                        name: "window_management",
                        value: 0,
                      },
                    },
                  ],
                  to_if_invoked: [
                    {
                      set_variable: {
                        name: "window_management",
                        value: 0,
                      },
                    },
                  ],
                },
                type: "basic",
              },
            ],
          },
          {
            description: "O[A-Z] to Hyper+[A-Z] (manualy map to open app) (when `do_modify_action` is 1)",
            manipulators: [
              {
                conditions: [
                  {
                    name: "with_hyper_modified",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "a",
                },
                to: [
                  {
                    key_code: "a",
                    modifiers: ["left_shift", "left_control", "left_alt", "left_gui"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "with_hyper_modified",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "b",
                },
                to: [
                  {
                    key_code: "b",
                    modifiers: ["left_shift", "left_control", "left_alt", "left_gui"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "with_hyper_modified",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "c",
                },
                to: [
                  {
                    key_code: "c",
                    modifiers: ["left_shift", "left_control", "left_alt", "left_gui"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "with_hyper_modified",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "d",
                },
                to: [
                  {
                    key_code: "d",
                    modifiers: ["left_shift", "left_control", "left_alt", "left_gui"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "with_hyper_modified",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "e",
                },
                to: [
                  {
                    key_code: "e",
                    modifiers: ["left_shift", "left_control", "left_alt", "left_gui"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "with_hyper_modified",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "f",
                },
                to: [
                  {
                    key_code: "f",
                    modifiers: ["left_shift", "left_control", "left_alt", "left_gui"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "with_hyper_modified",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "g",
                },
                to: [
                  {
                    key_code: "g",
                    modifiers: ["left_shift", "left_control", "left_alt", "left_gui"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "with_hyper_modified",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "h",
                },
                to: [
                  {
                    key_code: "h",
                    modifiers: ["left_shift", "left_control", "left_alt", "left_gui"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "with_hyper_modified",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "i",
                },
                to: [
                  {
                    key_code: "i",
                    modifiers: ["left_shift", "left_control", "left_alt", "left_gui"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "with_hyper_modified",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "j",
                },
                to: [
                  {
                    key_code: "j",
                    modifiers: ["left_shift", "left_control", "left_alt", "left_gui"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "with_hyper_modified",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "k",
                },
                to: [
                  {
                    key_code: "k",
                    modifiers: ["left_shift", "left_control", "left_alt", "left_gui"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "with_hyper_modified",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "l",
                },
                to: [
                  {
                    key_code: "l",
                    modifiers: ["left_shift", "left_control", "left_alt", "left_gui"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "with_hyper_modified",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "m",
                },
                to: [
                  {
                    key_code: "m",
                    modifiers: ["left_shift", "left_control", "left_alt", "left_gui"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "with_hyper_modified",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "n",
                },
                to: [
                  {
                    key_code: "n",
                    modifiers: ["left_shift", "left_control", "left_alt", "left_gui"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "with_hyper_modified",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "o",
                },
                to: [
                  {
                    key_code: "o",
                    modifiers: ["left_shift", "left_control", "left_alt", "left_gui"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "with_hyper_modified",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "p",
                },
                to: [
                  {
                    key_code: "p",
                    modifiers: ["left_shift", "left_control", "left_alt", "left_gui"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "with_hyper_modified",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "q",
                },
                to: [
                  {
                    key_code: "q",
                    modifiers: ["left_shift", "left_control", "left_alt", "left_gui"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "with_hyper_modified",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "r",
                },
                to: [
                  {
                    key_code: "r",
                    modifiers: ["left_shift", "left_control", "left_alt", "left_gui"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "with_hyper_modified",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "s",
                },
                to: [
                  {
                    key_code: "s",
                    modifiers: ["left_shift", "left_control", "left_alt", "left_gui"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "with_hyper_modified",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "t",
                },
                to: [
                  {
                    key_code: "t",
                    modifiers: ["left_shift", "left_control", "left_alt", "left_gui"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "with_hyper_modified",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "u",
                },
                to: [
                  {
                    key_code: "u",
                    modifiers: ["left_shift", "left_control", "left_alt", "left_gui"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "with_hyper_modified",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "v",
                },
                to: [
                  {
                    key_code: "v",
                    modifiers: ["left_shift", "left_control", "left_alt", "left_gui"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "with_hyper_modified",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "w",
                },
                to: [
                  {
                    key_code: "w",
                    modifiers: ["left_shift", "left_control", "left_alt", "left_gui"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "with_hyper_modified",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "x",
                },
                to: [
                  {
                    key_code: "x",
                    modifiers: ["left_shift", "left_control", "left_alt", "left_gui"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "with_hyper_modified",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "y",
                },
                to: [
                  {
                    key_code: "y",
                    modifiers: ["left_shift", "left_control", "left_alt", "left_gui"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "with_hyper_modified",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "z",
                },
                to: [
                  {
                    key_code: "z",
                    modifiers: ["left_shift", "left_control", "left_alt", "left_gui"],
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "do_modify_action",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "o",
                },
                to: [
                  {
                    set_variable: {
                      name: "do_modify_action",
                      value: 0,
                    },
                  },
                  {
                    set_variable: {
                      name: "with_hyper_modified",
                      value: 1,
                    },
                  },
                ],
                to_delayed_action: {
                  to_if_canceled: [
                    {
                      set_variable: {
                        name: "with_hyper_modified",
                        value: 0,
                      },
                    },
                  ],
                  to_if_invoked: [
                    {
                      set_variable: {
                        name: "with_hyper_modified",
                        value: 0,
                      },
                    },
                  ],
                },
                type: "basic",
              },
            ],
          },
          {
            description: "I[A,V] to change input source language (when `do_modify_action` is 1)",
            manipulators: [
              {
                conditions: [
                  {
                    name: "do_modify_input_source",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "a",
                },
                to: [
                  {
                    select_input_source: {
                      language: "^en$",
                    },
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "do_modify_input_source",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "v",
                },
                to: [
                  {
                    select_input_source: {
                      language: "^vi$",
                    },
                  },
                ],
                type: "basic",
              },
              {
                conditions: [
                  {
                    name: "do_modify_action",
                    type: "variable_if",
                    value: 1,
                  },
                ],
                from: {
                  key_code: "i",
                },
                to: [
                  {
                    set_variable: {
                      name: "do_modify_action",
                      value: 0,
                    },
                  },
                  {
                    set_variable: {
                      name: "do_modify_input_source",
                      value: 1,
                    },
                  },
                ],
                to_delayed_action: {
                  to_if_canceled: [
                    {
                      set_variable: {
                        name: "do_modify_input_source",
                        value: 0,
                      },
                    },
                  ],
                  to_if_invoked: [
                    {
                      set_variable: {
                        name: "do_modify_input_source",
                        value: 0,
                      },
                    },
                  ],
                },
                type: "basic",
              },
            ],
          },
        ],
      },
      devices: [
        {
          disable_built_in_keyboard_if_exists: false,
          fn_function_keys: [],
          game_pad_swap_sticks: false,
          identifiers: {
            is_game_pad: false,
            is_keyboard: true,
            is_pointing_device: false,
            product_id: 833,
            vendor_id: 1452,
          },
          ignore: false,
          manipulate_caps_lock_led: true,
          mouse_flip_horizontal_wheel: false,
          mouse_flip_vertical_wheel: false,
          mouse_flip_x: false,
          mouse_flip_y: false,
          mouse_swap_wheels: false,
          mouse_swap_xy: false,
          simple_modifications: [],
          treat_as_built_in_keyboard: false,
        },
        {
          disable_built_in_keyboard_if_exists: false,
          fn_function_keys: [],
          game_pad_swap_sticks: false,
          identifiers: {
            is_game_pad: false,
            is_keyboard: false,
            is_pointing_device: true,
            product_id: 833,
            vendor_id: 1452,
          },
          ignore: true,
          manipulate_caps_lock_led: false,
          mouse_flip_horizontal_wheel: false,
          mouse_flip_vertical_wheel: false,
          mouse_flip_x: false,
          mouse_flip_y: false,
          mouse_swap_wheels: false,
          mouse_swap_xy: false,
          simple_modifications: [],
          treat_as_built_in_keyboard: false,
        },
        {
          disable_built_in_keyboard_if_exists: false,
          fn_function_keys: [],
          game_pad_swap_sticks: false,
          identifiers: {
            is_game_pad: false,
            is_keyboard: true,
            is_pointing_device: false,
            product_id: 34304,
            vendor_id: 1452,
          },
          ignore: false,
          manipulate_caps_lock_led: true,
          mouse_flip_horizontal_wheel: false,
          mouse_flip_vertical_wheel: false,
          mouse_flip_x: false,
          mouse_flip_y: false,
          mouse_swap_wheels: false,
          mouse_swap_xy: false,
          simple_modifications: [],
          treat_as_built_in_keyboard: false,
        },
        {
          disable_built_in_keyboard_if_exists: false,
          fn_function_keys: [],
          game_pad_swap_sticks: false,
          identifiers: {
            is_game_pad: false,
            is_keyboard: false,
            is_pointing_device: true,
            product_id: 45106,
            vendor_id: 1133,
          },
          ignore: true,
          manipulate_caps_lock_led: false,
          mouse_flip_horizontal_wheel: false,
          mouse_flip_vertical_wheel: false,
          mouse_flip_x: false,
          mouse_flip_y: false,
          mouse_swap_wheels: false,
          mouse_swap_xy: false,
          simple_modifications: [],
          treat_as_built_in_keyboard: false,
        },
        {
          disable_built_in_keyboard_if_exists: false,
          fn_function_keys: [],
          game_pad_swap_sticks: false,
          identifiers: {
            is_game_pad: false,
            is_keyboard: true,
            is_pointing_device: true,
            product_id: 9248,
            vendor_id: 9639,
          },
          ignore: false,
          manipulate_caps_lock_led: true,
          mouse_flip_horizontal_wheel: false,
          mouse_flip_vertical_wheel: false,
          mouse_flip_x: false,
          mouse_flip_y: false,
          mouse_swap_wheels: false,
          mouse_swap_xy: false,
          simple_modifications: [],
          treat_as_built_in_keyboard: false,
        },
        {
          disable_built_in_keyboard_if_exists: false,
          fn_function_keys: [],
          game_pad_swap_sticks: false,
          identifiers: {
            is_game_pad: false,
            is_keyboard: false,
            is_pointing_device: true,
            product_id: 50498,
            vendor_id: 1133,
          },
          ignore: true,
          manipulate_caps_lock_led: false,
          mouse_flip_horizontal_wheel: false,
          mouse_flip_vertical_wheel: false,
          mouse_flip_x: false,
          mouse_flip_y: false,
          mouse_swap_wheels: false,
          mouse_swap_xy: false,
          simple_modifications: [],
          treat_as_built_in_keyboard: false,
        },
      ],
      fn_function_keys: [
        {
          from: {
            key_code: "f1",
          },
          to: [
            {
              consumer_key_code: "display_brightness_decrement",
            },
          ],
        },
        {
          from: {
            key_code: "f2",
          },
          to: [
            {
              consumer_key_code: "display_brightness_increment",
            },
          ],
        },
        {
          from: {
            key_code: "f3",
          },
          to: [
            {
              apple_vendor_keyboard_key_code: "mission_control",
            },
          ],
        },
        {
          from: {
            key_code: "f4",
          },
          to: [
            {
              apple_vendor_keyboard_key_code: "spotlight",
            },
          ],
        },
        {
          from: {
            key_code: "f5",
          },
          to: [
            {
              consumer_key_code: "dictation",
            },
          ],
        },
        {
          from: {
            key_code: "f6",
          },
          to: [
            {
              key_code: "f6",
            },
          ],
        },
        {
          from: {
            key_code: "f7",
          },
          to: [
            {
              consumer_key_code: "rewind",
            },
          ],
        },
        {
          from: {
            key_code: "f8",
          },
          to: [
            {
              consumer_key_code: "play_or_pause",
            },
          ],
        },
        {
          from: {
            key_code: "f9",
          },
          to: [
            {
              consumer_key_code: "fast_forward",
            },
          ],
        },
        {
          from: {
            key_code: "f10",
          },
          to: [
            {
              consumer_key_code: "mute",
            },
          ],
        },
        {
          from: {
            key_code: "f11",
          },
          to: [
            {
              consumer_key_code: "volume_decrement",
            },
          ],
        },
        {
          from: {
            key_code: "f12",
          },
          to: [
            {
              consumer_key_code: "volume_increment",
            },
          ],
        },
      ],
      name: "Default profile",
      parameters: {
        delay_milliseconds_before_open_device: 1000,
      },
      selected: true,
      simple_modifications: [],
      virtual_hid_keyboard: {
        country_code: 0,
        indicate_sticky_modifier_keys_state: true,
        mouse_key_xy_scale: 100,
      },
    },
  ],
};
