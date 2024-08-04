import { getRules } from "./rules";
import { configs } from "./org";

import "./rules/001.hi";
import "./rules/002.h";
import "./rules/101.backslash-to-right_control";

const rules = getRules();

configs.profiles[0].complex_modifications.rules = rules;

console.log(JSON.stringify(configs, null, 2));
