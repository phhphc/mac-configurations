export type ModifyAction =
  | {
      name: "modify_action";
      value: boolean;
    }
  | {
      name: "with_hyper";
      value: boolean;
    }
  | {
      name: "window_management";
      value: boolean;
    };

export type Variable = ModifyAction;
