This is an improved version of Aldebaran Robotics mt9m114 camera driver.
It adds features that were requested by the B-Human team.


=== Note ===
The datasheets of the mt9m114 chip are protected by an NDA.
Therefore I am not allowed to document inner workings of the
mt9m114 in this document or the source code comments.
Sorry about that.

=== Changes ===

* Fixed a bug that caused gain, brightness, exposure time, contrast, saturation
  and sharpness to get stuck after a driver restart. Note: This bug might still
  exist for other variables.

* White balance can be set manually if auto white balance is turned off.

* Hue can be set manually.

* Added a command to enable/disable the fade-to-black feature. (The annoying feature
  that makes a dark image completely black).

* Corrected/Changed min and max values for several commands.

* Commands wait until the value has actually been set by the camera chip before they return.

* Some under-the-hood changes to improve debugging.

=== How to Build ===
(1) Download latest Aldebaran Kernel from github.
(2) Copy driver into drivers/media/video.
(3) Extract .config from NAO and place it in the kernel's root directory.
(3) make ARCH=i386 (use the same gcc version that was used to build the kernel)
(4) Copy driver to NAO /lib/modules/2.6.33.9-rt31-aldebaran-rt/kernel/drivers/media/video/
(5) Restart NAO.

=== Available V4L2 Commands ===

V4L2_CID_BRIGHTNESS:
Range: [0 .. 255]
Default: 55
Description: Set brightness in auto exposure mode.

V4L2_CID_CONTRAST:
Range: [16 .. 64] (Fixed point number: 16 = 0.5, 64 = 2.0)
Default: 32
Description: Controls contrast enhancement and noise reduction values.

V4L2_CID_SATURATION:
Range: [0 .. 255]
Default: 128
Description: Zero means gray-scale, values > 128 result in a boosted saturation.
  
V4L2_CID_HUE:
Range: [-22° .. 22°]
Default: 0
Description: Hue rotation. Not all values are possible depending on camera internals. The camera chip will clip to the nearest possible number.

V4L2_CID_VFLIP:
Range: Boolean
Default: 0
Description: Vertical flip

V4L2_CID_HFLIP:
Range: Boolean
Default: 0
Description: Horizontal flip

V4L2_CID_SHARPNESS:
Range: [0 .. 7] and -7
Default: 0
Description: Relative adjustment to the applied sharpness.
             Set to -7 to ensure that no sharpness is applied.

V4L2_CID_EXPOSURE_AUTO:
Range: Boolean
Default: 1
Description: Auto exposure feature. Automatically controls gain
             and exposure.

V4L2_CID_AUTO_WHITE_BALANCE:
Range: Boolean
Default: 1
Description: Auto white balance feature.

V4L2_CID_GAIN:
Range: [0 .. 255]
Default: 32
Description: The amount of gain that is applied if auto exposure 
             is disabled. 32 = 1x gain.

V4L2_CID_EXPOSURE:
Range: [0 .. 512]
Default: 0
Description: The absolute exposure time if auto exposure is disabled.

V4L2_CID_DO_WHITE_BALANCE:
Range: [2700 .. 6500] ° Kelvin
Default: 6500
Description: White balance color temperature. Ignored if auto white balance
             is enabled.

V4L2_CID_BACKLIGHT_COMPENSATION:
Range: [0 .. 4]
Default: 1
Description: -

V4L2_MT9M114_FADE_TO_BLACK (V4L2_CID_PRIVATE_BASE):
Range: Boolean
Default: 1
Description: Enable/disable fade-to-black feature.


=== Known Bugs ===
Feel free to fix any of the following bugs :-)

* The NAO still crashes when you try to get both images in HD. This is probably 
  not a camera driver bug.

