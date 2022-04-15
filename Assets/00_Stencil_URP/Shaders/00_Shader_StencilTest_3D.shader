Shader "00/StencilTest (3D)"
{
    Properties
    {
        [IntRange] _StencilID ("Stencil ID", Range(0, 255)) = 0
		[IntRange] _ReadMask ("Read Mask", Range(0, 255)) = 0
		[IntRange] _WriteMask ("Write Mask", Range(0, 255)) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" "Queue" = "Geometry" "RenderPipeline" = "UniversalPipeline" }

        Pass
        {
            Blend Zero One
            ZWrite Off
            Cull Off
            
            Stencil
            {
                 Ref [_StencilID]
                 ReadMask [_ReadMask]
                 WriteMask [_WriteMask]
                 Comp Equal
                 Pass Replace
                 Fail Keep
            }
        }
    }
}
