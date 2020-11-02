package config

modules sht21: _I2C_MODULE & {
  array_len: len(_i2c_conf)
}

modules sht21 fields "\(k)_present": _INT8 & _HTTP & {
  default: 0
} for k, v in _i2c_conf

modules sht21 fields "\(k)_temp": _INT8 & _HTTP & {
  default: 0
  helper: "SHT21 temperature on port #\(k+1)"
} for k, v in _i2c_conf

modules sht21 fields "\(k)_humi": _INT8 & _HTTP & {
  default: 0
  helper: "SHT21 humidity on port #\(k+1)"
} for k, v in _i2c_conf
