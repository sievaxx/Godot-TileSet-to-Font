# Godot-TileSet-to-Font
A small script for converting 4.x tilesets to fonts

Usage:  
Create a TileSet resource and load in your font texture as an Atlas.  
(This works best if your source font file is a fixed grid.)  
Add a Physics Layer and a Custom Data layer with one entry called `"character"`, setting its type to String.
![image](https://user-images.githubusercontent.com/21314708/194452595-8c8a14b6-4fbb-4866-8f05-5e2295b73bd7.png)

You can load multiple font sizes in, each as a seperate atlas, to one TileSet.
![image](https://user-images.githubusercontent.com/21314708/194452944-0c60932f-8934-4679-a125-01582e4a5f8b.png)

Make each character you'd like to put in your font into a tile.
![image](https://user-images.githubusercontent.com/21314708/194452407-0262aa31-32cb-449c-807c-a536ffcab936.png)  

If you want your font to have variable width characters, add a collision polygon to your character.  
As of right now, only the second vertex in the first collision shape is used.  
(This is for an aesthetics reason so you can see the width of the character in the preview)  
Move the second vertex to match the width of the character. You should include spacing if required.
![image](https://user-images.githubusercontent.com/21314708/194453184-265a2c1a-bba3-4a11-a44b-e738be90bcd7.png)

In the custom data layer, set the character field to match the tiles character, or whatever character you want.  
This lets you set any unicode character to mean any glyph, allowing for extra tiles for icons and emoji.
![image](https://user-images.githubusercontent.com/21314708/194453726-9719a20f-2d82-4ee3-8440-5ef209cdfaa4.png)

Add the FontCreator script to a node in your scene tree. Load in the TileSet into the Tiles property.
Set the path you want to save the font to, or select a Resource to override it with.
![image](https://user-images.githubusercontent.com/21314708/194454008-36ff9924-b4ae-467a-a0c2-b8cafe25557a.png)

The FontPage resource contains the values you tweak between eaach font size.  
![image](https://user-images.githubusercontent.com/21314708/194454453-2c4a1947-970e-4368-98e4-a3dde0a22ff3.png)

TileSet index is the Atlas ID for this font page
![image](https://user-images.githubusercontent.com/21314708/194462816-156ad663-5458-415d-9d95-1e2f3dff3167.png)

Font Size is the size value you set in your Theme to access this font page.  
Make it match your Fixed Size unless you're doing something funky.

Fixed Size is the actual Glyph Size in terms of its space in the font image.

Ascent and Descent are kinda hard to understand values, they set the vertical height and distance between each new line.
![descent_example](https://user-images.githubusercontent.com/21314708/194462141-48b83466-002a-44e0-b5a6-8ae9dae8e886.gif)

Height is for Vertical fonts, just set it to match your Fixed Size if you're making a normal horizontal font.

Once you're done with your options, Run the scene that contains the node with the FontCreator script on it, and it will do its process.

