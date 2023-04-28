/*
3D Logo (Wall Decoration)

Example Octocat Logo copyright (c) GitHub.
See usage guidelines: https://github.com/logos

Read the README for detailed instructions!
*/


// A Prusa MINI fits 180x180. Adjust for your printer if you want bigger.
// The logo height (mm)
output_height = 179;

// Output thickness (mm)
thickness = 40;

// Position for the nail hole on the back, based on 100x100 plane
hanger_hole_center = [50, 90];

// See README for detailed instructions.
// SVG logo filename
logo_path="github-mark.svg";

// SVGs use an arbitrary height and width.
// Look for it near the beginning of the SVG (when viewed as a text file).
// Put the larger dimension here.
// Adjust this to match the SVG dimensions
svg_size=98;

// END Params.


/**
 * Generates a 3D logo
 */
module logo(height=100) {
  linear_extrude(thickness) {
    scale([height / 100, height / 100]) {
      // SVG uses coordinates from top-left but OpenSCAD used traditional x, y, z.
      // The rotate/translate adjust the coordinate system to orient correctly.
      translate([svg_size/2, svg_size/2, 0]) import(logo_path, center=true);
    }
  }
}

/**
 * Generates a 3D "hanger hole" for hanging on a nail or hook.
 * Note that this module creates a 3D volume that can be removed from another
 * (e.g. with difference).
 */
module hanger_hole() {
  translate([0, 0, 1]) {
    hull() {
      cylinder(h=2, r = 3, $fn=30);
      translate([0, 5, 0]) cylinder(h=2, r=3, $fn=30);
    }
  }
  hull() {
    cylinder(h=1.001, r=1.5, $fn=20);
    translate([0, 5, 0]) cylinder(h=1.001, r=1.5, $fn=20);
  }
  cylinder(h=1.001, r=3, $fn=30);
}

// Assemble it!
difference() {
  logo(output_height);
  
  translate([
    output_height * hanger_hole_center.x / 100,
    output_height * hanger_hole_center.y / 100,
    0
  ]) {
    hanger_hole();
  }
}
