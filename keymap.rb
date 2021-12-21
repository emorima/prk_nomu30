# Initialize a Keyboard
kbd = Keyboard.new

# `split=` should happen before `init_pins`
kbd.split = false

# Initialize GPIO assign
#define MATRIX_ROW_PINS { D1, D0, D4 }
#define MATRIX_COL_PINS { C6, D7, E6, B4, F4, F5, F6, F7, B1, B3, B2, B6 }
kbd.init_pins(
  [ 2, 3, 4],
  [ 5, 6, 7, 8, 29, 28, 27, 26, 22, 20, 23, 21 ]
)

# default layer should be added at first
kbd.add_layer :default, %i[
  KC_NO     KC_Q      KC_W      KC_E      KC_R      KC_T      KC_Y      KC_U      KC_I      KC_O      KC_P      KC_BSPACE
  KC_LCTL   KC_A      KC_S      KC_D      KC_F      KC_G      KC_H      KC_J      KC_K      KC_L      KC_ENTER  KC_NO
  KC_LSFT   Z_LALT    X_LGUI    KC_C      V_SYMS    B_FUNC    N_NUMS    KC_M      KC_SPACE
]

kbd.add_layer :nums, %i[
  KC_NO     KC_1      KC_2      KC_3      KC_4      KC_5      KC_6      KC_7      KC_8      KC_9      KC_0      KC_GRV
  KC_TRNS   KC_LBRC   KC_RBRC   KC_SLSH   KC_BSLS   KC_TRNS   KC_MINS   KC_EQL    KC_SCLN   KC_QUOT   KC_TRNS   KC_NO
  KC_TRNS   KC_TRNS   KC_TRNS   KC_TRNS   KC_TRNS   KC_TRNS   KC_TRNS   KC_COMM   KC_DOT
]

kbd.add_layer :syms, %i[
  KC_NO     KC_EXLM   KC_AT     KC_HASH   KC_DLR    KC_PERC   KC_CIRC   KC_AMPR   KC_ASTR   KC_LPRN   KC_RPRN   KC_TILD
  KC_TRNS   KC_LCBR   KC_RCBR   KC_QUES   KC_PIPE   KC_TRNS   KC_UNDS   KC_PLUS   KC_COLN   KC_DQUO   KC_TRNS   KC_NO
  KC_TRNS   KC_LABK   KC_RABK   KC_TRNS   KC_TRNS   KC_TRNS   KC_TRNS   KC_TRNS   KC_TRNS
]

kbd.add_layer :func, %i[
  KC_NO     KC_ESC    KC_F1     KC_F2     KC_F3     KC_F4     KC_F5     KC_F6     KC_F7     KC_F8     KC_F9     KC_F10
  KC_TAB    KC_VOLU   KC_VOLD   KC_MUTE   KC_TRNS   KC_TRNS   KC_LEFT   KC_DOWN   KC_UP     KC_RGHT   RESET     KC_NO
  KC_TRNS   KC_LALT   KC_LGUI   KC_TRNS   KC_TRNS   KC_TRNS   KC_TRNS   KC_TRNS   KC_TRNS
]

kbd.define_mode_key :Z_LALT,  [ :KC_Z,  :KC_LALT, 120, 150 ]
kbd.define_mode_key :X_LGUI,  [ :KC_X,  :KC_LGUI, 120, 150 ]
kbd.define_mode_key :N_NUMS,  [ :KC_N,  :nums,    120, 150 ]
kbd.define_mode_key :V_SYMS,  [ :KC_V,  :syms,    120, 150 ]
kbd.define_mode_key :B_FUNC,  [ :KC_B,  :func,    120, 150 ]

kbd.start!
