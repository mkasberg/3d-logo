# Print **ANY** Logo in 3D

This [OpenSCAD](https://openscad.org/) file can be used to print **any** logo in
3D. This makes great wall art!

I've included the GitHub logo as a sample. The copyright for the GitHub logo
belongs to GitHub, but this usage is allowed by their [logo usage
guidelines](https://github.com/logos).

## Customization Instructions

1. Download an SVG of the logo you want to use. <github-mark.svg> is an example
SVG of the GitHub logo.
2. Use [PathToPoints](https://shinao.github.io/PathToPoints/) (or any similar
tool) to extract an array of points from the SVG. You may need to use a text
editor to adjust the format. <github-logo-points.txt> is an example of what you
need.
3. Copy and paste the points into the <3D-Logo.scad> file. The format is an
array of 2D points, where each point is itself an array containing an [x, y]
pair.
4. Adjust other params (height, thickness, hanger hole) as desired.
5. Use [OpenSCAD](https://openscad.org/) to produce an STL file.

## Printer Settings

- Most logos should print well in PLA or PETG.
- As little as 5% infill should work.
- No supports needed.
- Print without a skirt on a small print beds (Prusa MINI).

## Alternative Approach

**Can't find an SVG with a good path?**

If you're finding it difficult to extract a path from an SVG, you can create the
path manually. This works very well for geometric logos but can work for any
logo if you use enough points.

1. Import the logo into an image editor like the [GIMP](https://www.gimp.org/).
2. Adjust the canvas size to 100x100. (Avoid distorting the logo while scaling
it. You might need a combination of the scale tool and the resize canvas tool.)
3. Use the measurement tools from your image editor to manually create a list of
points for the perimeter of the shape you want.

----

GitHub Logo SVG obtained from <https://github.com/logos>. The copyright for the
logo belongs to GitHub. See [GitHub logo usage
guidelines](https://github.com/logos).

