# Occulus' Modular Folder

## Why do we use it?
Trying to keep up to date with Eris as an upstream while also creating unique modifications to the code results in a mess of merge conflicts that can be impossible to keep up with. By keeping our unique code in this folder, conflicts can be avoided as nothing will overwrite the files that the upstream may modify.

New code should follow the path of the parent code as closely as possible, to make it easier for us to find where things belong!

## Please mark your changes!
All modifications to non-Occulus files should be marked. A simple `//Occulus Edit - reason` will suffice.

## Icons, code, and sounds
Icons are notorious for conflicts. Because of this, ALL NEW ICONS must go in the "zzzz_modular_occulus/icons" folder. There are to be no exceptions to this rule. Sounds rarely cause conflicts, but for the sake of organization they are to go in the "zzzz_modular_occulus/sounds" folder. No exceptions, either. Unless absolutely necessary, code should go in the "zzzz_modular_occulus/code" folder. Small changes outside of the folder should be done with hook-procs. Larger changes should simply mirror the file in the "zzzz_modular_occulus/code" folder.
