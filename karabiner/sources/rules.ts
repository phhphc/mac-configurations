import { Rule } from "./types/rule";

const rules: Rule[] = [];

export const addRules = (news: Rule[]) => rules.push(...news);
export const getRules = () => rules;
