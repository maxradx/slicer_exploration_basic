# slicer_exploration_basic
Basic examples of customization capabilities in 3DSlicer in order to perform semi-automated/manual correction segmentation more efficiently on medical images for research purposes.

## Requirements
1. 3DSlicer [Download 3D slicer](https://download.slicer.org).
2. Enable developer mode (Edit > Application Settings > Developer > Check Enable developer mode and QT testing. Slicer will restart. 
3. Clone (or download) this repository



## Important Notes
1. Latest versions of 3DSlicer may have some problems for running correctly. For example, after having installed SlicerJupyter on Slicer version 5.6.2, the 3DSlicer app crashed each time at opening (this has been solved by installing an older version of slicer such as version 5.2.2).
2. Make sure to have no folder(s) and/or file(s) starting with a number in their name since it may cause troubleshooting while running python scripts. Never put one or more space in the title of a folder and/or a name (you can do underscore instead _. Example of an appropriate pathname: /Users/maximebouthillier/gitmax/code/jacques/ICH_SEGMENTER_V2/moncode/readme.txt).
3. Double check that the path in your 3DSlicer application are functional since you may experience troubleshooting if else. You may find a testing script here.AJOUTER
4. Thoses examples provided have been executed on :
- MacOS 14.4.1 Sonoma on M2 Apple Silicon Valley Chip;
- 3DSlicer version 5.2.2

## Examples provided 
Each example could be further improved according to users' wishes.
1. Navigate (next/previous) trough images loaded from a data folder and opening the last viewed image at 3DSlicer restart. To note that a PushButton can be configured to load the last seen images: here, we show an automated method to open the last volume loaded in 3DSlicer at next startup (in the script, it is possible to adapt the new loaded volume at startup to be the next volume to be loaded);
3. Write in an external file from clicking a GUI push button in 3DSlicer.

Demonstration video of example 1 can be found here.(A AJOUTER)
Demonstration video of example 2 can be found here.(A AJOUTER)

## Analysis
Résumé of some exploreations performed on 3DSlicer platform : is it worth to use as a software for massive segmentations in different datasets (instead of fsleyes for instance).
Advantages: 
•	Customizable GUI;
•	Capabilities for running python scripts and easily manage them;
•	More user friendly for annotation and customization than fsleyes;
•	Multiple extensions easily accessibles;
•	Lot of development and possibility to include MONAI tools.
Limitations:
•	Uses an integrated version of Qt to Slicer, which makes debugging difficult (open-source version of Qt is not well supported);
•	Installation can be a mess, especially for redirecting paths;
•	Most recent versions do not fully support useful extensions (e.g. SlicerJupyter).
With the aims of performing segmentation accurately and efficiently, it is useful from a user perspective to load the image(or the next one) that the user was on lastly before re-opening the app used for segmentation. 3DSlicers offers the possibility to run an automated python script at startup. Related to the SCT-manua_correction script developed by Neuropoly, it seems very realistic to incorporate and execute such a script in the 3DSlicer environment, that would enable iteration across cases after completing segmentation for a given volume.
In brief, 3DSlicer may be useful for massive segmentations of datasets since it allows creation/customization of GUI/Software preprocessing/iteration trough cases while minimizing user interaction.

MB 2024-04-24 14h50.



   



