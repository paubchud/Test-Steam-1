// @description Setup label and click function (for obj_button)

if (!variable_instance_exists(self, "label")) label = "Button";
if (!variable_instance_exists(self, "click_function")) click_function = undefined;
width = 120;
height = 30;

show_debug_message("Button created: "+ label)