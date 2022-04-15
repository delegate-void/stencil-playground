Shader "01/X-Ray (Chamber)"
{
    Properties
    {
        [IntRange] _StencilIDToWrite ("Stencil ID (Write)", Range(0, 255)) = 0
        [MaterialEnum(Off,0,Front,1,Back,2)] _Cull("Cull", Int) = 2
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" "Queue" = "Geometry" "RenderPipeline" = "UniversalPipeline" }

        Pass
        {
            Stencil
            {
                 Ref [_StencilIDToWrite]
                 Comp Always
                 Pass Replace
                 Fail Keep
            }
            
            Cull [_Cull]
            Blend Zero One
        }
    }
}
