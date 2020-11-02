package config

_motor_conf: [...]

modules motor: _MODULE & {
  array_len: len(_motor_conf)
  init_priority: 90
}

modules motor fields "\(k)_duty": _INT8 & _HTTP_RW & {
  default: 0
  write_cb: true
} for k, v in _motor_conf

modules motor fields "\(k)_gpio": _INT8 & _NVS & _HTTP_RW & {
  nvs key: "M_\(k)_IO"
  default: v.gpio
} for k, v in _motor_conf

modules motor fields "\(k)_frequency": _UINT16 & _NVS & _HTTP_RW & {
  nvs key: "M_\(k)_HZ"
  default: 40000
  write_cb: true
} for k, v in _motor_conf
