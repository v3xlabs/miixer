<p align="center">
  <img src="./docs/pcb-angled.png" width="350" title="MIIXER">
</p>

# MIIXER

An open-hardware midi controller with esp32-s3, 4 linear faders, 8 keyswitches.

> [!NOTE]
> This is a work in progress.

## Technical Specs

- **Processor**: esp32-s3
- **Inputs**
  - 4 linear potentiometers 600mm
  - 8 Cherry MX Switches
- **ICs**
  - [PCF8574T](https://jlcpcb.com/api/file/downloadByFileSystemAccessId/8624297452529963008) - I2C IO Expander
  - [ADS1115IDGS](https://jlcpcb.com/api/file/downloadByFileSystemAccessId/8624297452529963008) - I2C ADC Expander
  - [AP2127K-3.3](https://www.diodes.com/assets/Datasheets/AP2127.pdf) - 5v to 3.3v LDO
  - [USBLC6-2SC6](https://www.st.com/resource/en/datasheet/usblc6-2.pdf) - ESD Protection
- **Connectivity**:
  - USB-C (Power, Data & Flash)
  - Wifi & BLE

## Photos

See the [docs](docs) folder for the rendered schematics, PCBs, and 3D renders.

<p align="center">
  <img src="./docs/pcb-front.png" width="350" title="Front of MIIXER">
  <img src="./docs/pcb-back.png" width="350" alt="Back of MIIXER">
</p>

## ESPHome Compatability

Due to the fact that this devices uses common off-the-shelf I2C ICs and is esp32-c3 based, you can easily use it with ESPHome.

```yaml
i2c:
  sda: GPIO8
  scl: GPIO9
  scan: true      # verify both 0x48 and your PCF8574 show up

# ADC
ads1115:
  - address: 0x48
    update_interval: 5s
  sensors:
    - multiplexer: A0
      name: "ADS1115 A0"

# GPIO expander
pcf8574:
  - id: expander
    address: 0x20   # set via A2/A1/A0 ties
binary_sensor:
  - platform: pcf8574
    pcf8574: expander
    pin: P0
    name: "Switch 1"
    # etc
```
