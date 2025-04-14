import { KeyCode, ModifierKeyCode } from "../types/key_code";

type Key = { key_code: KeyCode; modifiers?: ModifierKeyCode[] };

export const lock_screen: Key = { key_code: "f20", modifiers: ["left_control"] };
export const toggle_clipboard: Key = { key_code: "f20", modifiers: ["left_shift"] };
export const toggle_editor: Key = { key_code: "f20", modifiers: ["left_option"] };
export const toggle_iterm: Key = { key_code: "f20" };

export const window_almost_maximize: Key = { key_code: "f13", modifiers: ["left_control", "left_option"] };
export const window_maximize: Key = { key_code: "f13", modifiers: ["left_shift", "left_option"] };
export const window_next_display: Key = { key_code: "f13", modifiers: ["left_shift", "left_control"] };
export const window_reasonable_size: Key = { key_code: "f13", modifiers: ["left_shift", "left_command"] };
export const window_toggle_fullscreen: Key = { key_code: "f13", modifiers: ["left_option", "left_command"] };
