package config

_led_conf: [...]

modules led: _MODULE & {
  array_len: len(_led_conf)
  init_priority: 90
}

modules led fields "\(k)_duty": _INT8 & _NVS & _HTTP_RW & {
  nvs key: "L_\(k)_D"
  default: 0
  write_cb: true
} for k, v in _led_conf

modules led fields "\(k)_gpio": _INT8 & _NVS & _HTTP_RW & {
  nvs key: "L_\(k)_IO"
  default: v.gpio
} for k, v in _led_conf
