import x from "./simple_modifications.json";

const data = x.reduce((s, m) => [...s, ...(m.data ?? [])], []);
const keyCodes = [...new Set(data.filter((d) => !!d.key_code).map((d) => d.key_code))];
const appleVendorKeyboardKeyCode = [
  ...new Set(data.filter((d) => !!d.apple_vendor_keyboard_key_code).map((d) => d.apple_vendor_keyboard_key_code)),
];

console.log({ keyCodes, appleVendorKeyboardKeyCode });
