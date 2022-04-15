# Stencil Playground

This is a simple project to test various usages of stencil buffers in Unity.

## 00 - URP & Stencils

This example tests the capabilities of the **Render Objects** renderer feature in the context of stencil buffers. 

### Preview

https://user-images.githubusercontent.com/64726414/163601742-f6a6f8b3-ff10-4b1b-b2f4-efcbfd6e9d79.mp4

### Approach

Using custom render passes, it's possible to separate rendered content and to pinpoint where to render it using stencil buffers.

- Opaque pass: renders all content that isn't part of the painting and initialises the stencil buffer for further usage
- Painting environment pass: renders all content that is exclusively displayed on the canvas of the painting
- Painting metaplane pass: renders all objects that should be part of the painting but also extend to the world space

### Notes

- Unity's procedural skybox causes some artefacts in the scene view, consider turning it off in this particular view

## 01 - Selective Rendering (Classic)

This example tests the capabilities of stencil buffers when only used in a single forward pass.

### Preview

https://user-images.githubusercontent.com/64726414/163602600-7cc25980-c3c3-4e02-9447-827db26b2b56.mp4

### Approach

Elements that are used as X-Ray chambers have 2 additional materials to their primary material.
1. Setup material: writes a custom value to the stencil buffer, front facecs are culled
2. Reset material: resets the stencil buffer, back faces are culled
This approach ensures (there is still one depth issue that needs to be resolved) that only objects inside the chamber receive the X-Ray treatment.

Subjects that can be x-rayed, have require 3 materials:
1. Main material: used for normal rendering, only renders when the value in the stencil is 0
2. Back face material: used for X-Ray rendering; only renders when the stencil value equals a custom value; back faces only
3. Front face material: used for X-Ray rendering; only renders when the stencil value equals a custom value; front faces only


