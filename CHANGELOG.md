# 1.8.4

## Feat

- BoxDecoration -> Decoration

# 1.8.3

## Fix

- Fix calculation size on change orientation

# 1.8.2

## Fix

- Weird separator behavior in RTL mode
- Add manage disabled state for each segment
- Add onTapSegment

# 1.8.1

## Feat

- Add default divider color
- Update divider settings
- Remove deprecated settings

# 1.8.0

## Feat

- Add support divider
- Add `DividerSettings` to customize display for divider
- Add `isShowDivider` for show or not divider

# 1.7.5

## Feat

- Add isDisabled

# 1.7.4

## Feat

- Add CustomSegmentSettings for more customization of segments

# 1.7.3

## Fix

- RangeError (end): Invalid value: Not in inclusive range 0..1: 2

# 1.7.2

## Fix

- Change thumb size didn't update when device orientation was change

# 1.7.1

## Feat

- Add CustomSegmentedController

# 1.7.0

## Update pubspec.yaml

- environment:
  sdk: ">=2.17.0 <3.0.0"
  flutter: ">=3.0.0"

# 1.6.1

## Fix

- WidgetsBinding.instance.addPostFrameCallback failed

# 1.6.0

## Feat

- Add dynamic initial value

# 1.5.2

## Breaking changes

- change `innerPadding` - `double` -> `EdgeInsets`

# 1.5.1

## Fix

- Redundant use of Column widget fills space

# 1.5.0

## Breaking changes

- use `decoration` for decoration main panel
- use `thumbDecoration` for decoraton animated panel
- add property `height`
- remove property `backgroundColor`
- remove property `radius`

# 1.4.0

## Breaking changes

- remove property `elevation` -> use `boxShadow` in `thumbDecoration`
- remove property `thumbColor` -> use `color` in `thumbDecoration`
- required `onValueChanged`
- new property `splashColor`
- new property `splashFactory`
- new property `highlightColor`

# 1.3.1

## Feat

- add new property `thumbDecoration` to pass custom BoxDecoration for thumb
- fix rtl transition problem

# 1.3.0

## Feat

- update min sdk and flutter version
- update example

# 1.2.1

## Feat

- add new property `fromMax` gets the largest element, while the rest of the elements get its size
- add new clipBehavior

# 1.1.1

## Fix

- initial value without animation
- added new screen for example
- example null safety

# 1.1.0

- Add new property isStretch
- Stretches CustomSlidingSegmentedControl to full width

# 1.0.0

## Feat

- null safety

# 0.1.1

## Doc

- Update example

# 0.1.0

## Feat

- Update version number

# 0.0.4

## Feat

- Fix InkWell splash
- Fix size animation panel
- Change params name as CupertinoSlidingSegmentedControl

# 0.0.3

## Feat

- Add new param

# 0.0.2

## Feat

- Add new param
- Update radius

## release 15.12.2020
